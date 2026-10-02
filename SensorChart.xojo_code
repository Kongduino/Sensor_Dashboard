#tag Class
Protected Class SensorChart
Inherits DesktopCanvas
	#tag Event
		Sub MouseExit()
		  mHover = -1
		  Refresh(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(x As Integer, y As Integer)
		  // The sample under the mouse, shown with a guide line and a box (see DrawHover)
		  Dim n As Integer = SeriesLength
		  Dim hoverIndex As Integer = -1
		  If n > 0 And x >= mPlotLeft - 10 And x <= mPlotRight + 10 Then
		    // The nearest sample (they aren't evenly spaced on a time axis)
		    Dim best As Double = 1e9
		    For i As Integer = 0 To n - 1
		      Dim distance As Double = Abs(x - XForIndex(i))
		      If distance < best Then
		        best = distance
		        hoverIndex = i
		      End If
		    Next
		  End If
		  If hoverIndex <> mHover Then
		    mHover = hoverIndex
		    Refresh(False)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  DrawChart(g, g.Width, g.Height)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddDataset(s As SensorSeries)
		  mSeries.Add s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddDatasets(ParamArray series() As SensorSeries)
		  For Each s As SensorSeries In series
		    mSeries.Add s
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddTimes(times() As Double)
		  // The window's own array of sample times (seconds, one per sample): kept by reference, never modified here.
		  // With it, the X axis is a time axis
		  mTimes = times
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddLabels(labels() As String)
		  // The window's own label array (one per sample): kept by reference, never modified here
		  mLabels = labels
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawChart(g As Graphics, w As Double, h As Double)
		  // The whole chart: background, title, legend, axes and grid, the series, the hover box
		  Dim dark As Boolean = Color.IsDarkMode
		  Dim textColor As Color = If(dark, &cCED4DA, &c495057)
		  Dim gridColor As Color = If(dark, &c3A3A3A, &cE9ECEF)
		  g.AntiAliased = True
		  g.DrawingColor = If(dark, &c1E1E1E, &cFFFFFF)
		  g.FillRectangle(0, 0, w, h)
		  
		  // Title
		  g.Bold = True
		  g.FontSize = 15
		  g.DrawingColor = If(dark, &cF1F3F5, &c212529)
		  g.DrawText(Title, (w - g.TextWidth(Title)) / 2, 12 + g.FontAscent)
		  g.Bold = False
		  
		  // Legend: a coloured dash and the name of each series, centred
		  g.FontSize = 12
		  Dim legendY As Double = 44
		  Dim legendWidth As Double
		  For Each s As SensorSeries In mSeries
		    legendWidth = legendWidth + 22 + g.TextWidth(s.Label) + 18
		  Next
		  Dim lx As Double = (w - legendWidth + 18) / 2
		  For Each s As SensorSeries In mSeries
		    g.DrawingColor = ChartColor(s.Kind)
		    g.FillRoundRectangle(lx, legendY + 4, 16, 6, 3, 3)
		    g.DrawingColor = textColor
		    g.DrawText(s.Label, lx + 22, legendY + g.FontAscent)
		    lx = lx + 22 + g.TextWidth(s.Label) + 18
		  Next
		  
		  Dim n As Integer = SeriesLength
		  If n = 0 Then
		    g.DrawingColor = textColor
		    g.FontSize = 13
		    Dim waiting As String = "Waiting for the first reading…"
		    g.DrawText(waiting, (w - g.TextWidth(waiting)) / 2, h / 2)
		    Return
		  End If
		  
		  // Y axis: round ticks covering the data (bars start at 0)
		  Dim lo, hi As Double
		  DataRange(lo, hi)
		  Dim stepSize As Double = NiceStep((hi - lo) / 5)
		  Dim first As Double = Floor(lo / stepSize) * stepSize
		  Dim last As Double = Ceiling(hi / stepSize) * stepSize
		  If last - first < stepSize Then last = first + stepSize
		  mAxisLow = first
		  mAxisHigh = last
		  // As many decimals as the step needs: 0.25 needs 2, 0.2 needs 1, 5 needs 0
		  Dim decimals As Integer
		  While decimals < 6 And Abs(stepSize * 10 ^ decimals - Round(stepSize * 10 ^ decimals)) > 1e-6
		    decimals = decimals + 1
		  Wend
		  Dim fmt As String = "0"
		  If decimals > 0 Then
		    fmt = "0."
		    For d As Integer = 1 To decimals
		      fmt = fmt + "0"
		    Next
		  End If
		  mValueFormat = fmt
		  Dim unit As String
		  If mSeries.Count > 0 Then unit = mSeries(0).Suffix
		  
		  g.FontSize = 11
		  Dim labelWidth As Double
		  Dim v As Double = first
		  While v <= last + stepSize / 2
		    labelWidth = Max(labelWidth, g.TextWidth(Format(v, fmt) + unit))
		    v = v + stepSize
		  Wend
		  mPlotLeft = 16 + labelWidth + 8
		  mPlotRight = w - 24
		  mPlotTop = 76
		  mPlotBottom = h - 34
		  
		  // Grid lines and Y labels
		  v = first
		  While v <= last + stepSize / 2
		    Dim y As Double = YForValue(v)
		    g.DrawingColor = gridColor
		    g.DrawLine(mPlotLeft, y, mPlotRight, y)
		    g.DrawingColor = textColor
		    Dim t As String = Format(v, fmt) + unit
		    g.DrawText(t, mPlotLeft - 8 - g.TextWidth(t), y + g.FontAscent / 2 - 1)
		    v = v + stepSize
		  Wend
		  
		  // X labels under their samples, skipping those that would overlap; the latest is always shown
		  g.DrawingColor = textColor
		  Dim lastLabel As String = LabelAt(n - 1)
		  Dim lastLeft As Double = XForIndex(n - 1) - g.TextWidth(lastLabel) / 2
		  Dim usedRight As Double = -1e9
		  For i As Integer = 0 To n - 2
		    Dim xLabel As String = LabelAt(i)
		    Dim labelLeft As Double = XForIndex(i) - g.TextWidth(xLabel) / 2
		    Dim labelRight As Double = labelLeft + g.TextWidth(xLabel)
		    If labelLeft >= usedRight + 14 And labelRight <= lastLeft - 14 Then
		      g.DrawText(xLabel, labelLeft, mPlotBottom + 8 + g.FontAscent)
		      usedRight = labelRight
		    End If
		  Next
		  g.DrawText(lastLabel, lastLeft, mPlotBottom + 8 + g.FontAscent)
		  
		  // The series
		  Dim barCount As Integer
		  For Each s As SensorSeries In mSeries
		    If s.IsBar Then barCount = barCount + 1
		  Next
		  Dim barIndex As Integer
		  For Each s As SensorSeries In mSeries
		    If s.IsBar Then
		      DrawBars(g, s, barIndex, barCount)
		      barIndex = barIndex + 1
		    Else
		      DrawLine(g, s)
		    End If
		  Next
		  
		  If mHover >= 0 And mHover < n Then DrawHover(g, w)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawBars(g As Graphics, s As SensorSeries, barIndex As Integer, barCount As Integer)
		  // Rounded bars from the axis bottom (0 for bars), side by side when there are several series
		  Dim groupW As Double = GroupWidth
		  Dim barWidth As Double = Max(2.0, groupW / Max(1, barCount) - 2)
		  Dim baseY As Double = YForValue(Max(0.0, mAxisLow))
		  g.DrawingColor = ChartColor(s.Kind)
		  For i As Integer = 0 To s.Values.LastIndex
		    Dim x As Double = XForIndex(i) - groupW / 2 + barIndex * (barWidth + 2)
		    Dim y As Double = YForValue(s.Values(i))
		    Dim barTop As Double = Min(y, baseY)
		    Dim barHeight As Double = Max(1.0, Abs(baseY - y))
		    g.FillRoundRectangle(x, barTop, barWidth, barHeight, Min(8.0, barWidth / 2), Min(8.0, barWidth / 2))
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawHover(g As Graphics, w As Double)
		  // A guide line at the sample under the mouse, and a box with its time and values
		  Dim dark As Boolean = Color.IsDarkMode
		  Dim x As Double = XForIndex(mHover)
		  g.DrawingColor = If(dark, &c6C757D, &cADB5BD)
		  g.DrawLine(x, mPlotTop, x, mPlotBottom)
		  
		  Dim lines() As String
		  lines.Add LabelAt(mHover)
		  For Each s As SensorSeries In mSeries
		    If mHover <= s.Values.LastIndex Then
		      lines.Add s.Label + ":  " + Format(s.Values(mHover), mValueFormat + "0") + s.Suffix
		    End If
		  Next
		  g.FontSize = 12
		  Dim boxWidth As Double
		  For Each t As String In lines
		    boxWidth = Max(boxWidth, g.TextWidth(t))
		  Next
		  boxWidth = boxWidth + 20
		  Dim lineHeight As Double = g.FontAscent + 6
		  Dim boxHeight As Double = lines.Count * lineHeight + 10
		  Dim bx As Double = x + 12
		  If bx + boxWidth > w - 8 Then bx = x - 12 - boxWidth
		  Dim by As Double = mPlotTop + 8
		  g.DrawingColor = If(dark, &cF1F3F5, &c212529)
		  g.FillRoundRectangle(bx, by, boxWidth, boxHeight, 10, 10)
		  For i As Integer = 0 To lines.LastIndex
		    g.DrawingColor = If(dark, &c212529, &cFFFFFF)
		    g.Bold = (i = 0)
		    g.DrawText(lines(i), bx + 10, by + 5 + i * lineHeight + g.FontAscent)
		  Next
		  g.Bold = False
		  
		  // The points of the hovered sample, larger
		  For Each s As SensorSeries In mSeries
		    If Not s.IsBar And mHover <= s.Values.LastIndex Then
		      Dim y As Double = YForValue(s.Values(mHover))
		      g.DrawingColor = If(dark, &c1E1E1E, &cFFFFFF)
		      g.FillOval(x - 6, y - 6, 12, 12)
		      g.DrawingColor = ChartColor(s.Kind)
		      g.FillOval(x - 4, y - 4, 8, 8)
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawLine(g As Graphics, s As SensorSeries)
		  // The line, a soft gradient under it, and points while there are few samples
		  If s.Values.Count = 0 Then Return
		  Dim c As Color = ChartColor(s.Kind)
		  Dim line As New GraphicsPath
		  Dim area As New GraphicsPath
		  For i As Integer = 0 To s.Values.LastIndex
		    Dim x As Double = XForIndex(i)
		    Dim y As Double = YForValue(s.Values(i))
		    If i = 0 Then
		      line.MoveToPoint(x, y)
		      area.MoveToPoint(x, mPlotBottom)
		    Else
		      line.AddLineToPoint(x, y)
		    End If
		    area.AddLineToPoint(x, y)
		  Next
		  area.AddLineToPoint(XForIndex(s.Values.LastIndex), mPlotBottom)
		  
		  If s.Filled And s.Values.Count > 1 Then
		    Dim stops() As Pair
		    stops.Add 0.0 : Color.RGB(c.Red, c.Green, c.Blue, 150)
		    stops.Add 1.0 : Color.RGB(c.Red, c.Green, c.Blue, 245)
		    g.Brush = New LinearGradientBrush(New Point(0, mPlotTop), New Point(0, mPlotBottom), stops)
		    g.FillPath(area)
		    g.Brush = Nil
		  End If
		  
		  g.DrawingColor = c
		  g.PenSize = 2
		  If s.Values.Count > 1 Then g.DrawPath(line)
		  g.PenSize = 1
		  
		  If s.Values.Count <= 40 Then
		    Dim dark As Boolean = Color.IsDarkMode
		    For j As Integer = 0 To s.Values.LastIndex
		      Dim px As Double = XForIndex(j)
		      Dim py As Double = YForValue(s.Values(j))
		      g.DrawingColor = c
		      g.FillOval(px - 3.5, py - 3.5, 7, 7)
		      g.DrawingColor = If(dark, &c1E1E1E, &cFFFFFF)
		      g.FillOval(px - 1.5, py - 1.5, 3, 3)
		    Next
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DataRange(ByRef lo As Double, ByRef hi As Double)
		  // The lowest and highest value of all series, with a little room; bars include 0
		  Dim any As Boolean
		  Dim hasBars As Boolean
		  For Each s As SensorSeries In mSeries
		    If s.IsBar Then hasBars = True
		    For Each v As Double In s.Values
		      If Not any Then
		        lo = v
		        hi = v
		        any = True
		      Else
		        lo = Min(lo, v)
		        hi = Max(hi, v)
		      End If
		    Next
		  Next
		  If hasBars Then
		    lo = Min(lo, 0.0)
		    hi = Max(hi, 0.0)
		    hi = hi + (hi - lo) * 0.1
		  Else
		    Dim room As Double = (hi - lo) * 0.15
		    If room = 0 Then room = Max(Abs(hi) * 0.01, 0.5) // a flat series: a small band around it
		    lo = lo - room
		    hi = hi + room
		  End If
		  If hi <= lo Then hi = lo + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GroupWidth() As Double
		  // The width of one sample's bars: 70 % of the space to its nearest neighbour (on a time axis, the
		  // smallest gap), between 4 and 60 pixels
		  Dim n As Integer = SeriesLength
		  Dim space As Double = SlotWidth
		  If UseTime Then
		    For i As Integer = 1 To n - 1
		      space = Min(space, XForIndex(i) - XForIndex(i - 1))
		    Next
		  End If
		  Return Min(60.0, Max(4.0, space * 0.7))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LabelAt(i As Integer) As String
		  If i >= 0 And i <= mLabels.LastIndex Then Return mLabels(i)
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function NiceStep(rough As Double) As Double
		  // 1, 2, 2.5 or 5 times a power of ten, at least rough
		  If rough <= 0 Then Return 1
		  Dim magnitude As Double = 10 ^ Floor(Log(rough) / Log(10))
		  Dim f As Double = rough / magnitude
		  If f <= 1 Then Return magnitude
		  If f <= 2 Then Return 2 * magnitude
		  If f <= 2.5 Then Return 2.5 * magnitude
		  If f <= 5 Then Return 5 * magnitude
		  Return 10 * magnitude
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllDatasets()
		  Dim none() As SensorSeries
		  mSeries = none
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllLabels()
		  // Drops the reference only: the window's array is left alone
		  Dim none() As String
		  mLabels = none
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SeriesLength() As Integer
		  // The number of samples: the longest series
		  Dim n As Integer
		  For Each s As SensorSeries In mSeries
		    n = Max(n, s.Values.Count)
		  Next
		  Return n
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SlotWidth() As Double
		  // The horizontal space of one sample
		  Dim n As Integer = SeriesLength
		  If n <= 0 Then Return mPlotRight - mPlotLeft
		  Return (mPlotRight - mPlotLeft) / n
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToPicture() As Picture
		  // The chart as a picture at twice the size (for exports)
		  Dim p As New Picture(Width * 2, Height * 2)
		  p.Graphics.ScaleX = 2
		  p.Graphics.ScaleY = 2
		  DrawChart(p.Graphics, Width, Height)
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UseTime() As Boolean
		  // A time axis when there is one time per sample, and they span some time
		  Dim n As Integer = SeriesLength
		  Return n >= 2 And mTimes.Count = n And mTimes(n - 1) > mTimes(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function XForIndex(i As Integer) As Double
		  // With times (AddTimes): placed by time, so gaps keep their real width. Without: centred in equal slots
		  If UseTime Then
		    Dim t0 As Double = mTimes(0)
		    Dim t1 As Double = mTimes(SeriesLength - 1)
		    Dim pad As Double = Min(24.0, (mPlotRight - mPlotLeft) / 4)
		    Return mPlotLeft + pad + (mTimes(i) - t0) / (t1 - t0) * (mPlotRight - mPlotLeft - 2 * pad)
		  End If
		  Return mPlotLeft + (i + 0.5) * SlotWidth
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function YForValue(v As Double) As Double
		  If mAxisHigh <= mAxisLow Then Return mPlotBottom
		  Return mPlotBottom - (v - mAxisLow) / (mAxisHigh - mAxisLow) * (mPlotBottom - mPlotTop)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Title As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAxisHigh As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAxisLow As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHover As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLabels() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlotBottom As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlotLeft As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlotRight As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlotTop As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSeries() As SensorSeries
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTimes() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mValueFormat As String = "0.0"
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
