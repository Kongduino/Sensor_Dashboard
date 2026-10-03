#tag Class
Protected Class SensorChart
Inherits DesktopCanvas
	#tag Event
		Sub MouseExit()
		  If Painter().ClearHover() Then Refresh(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(x As Integer, y As Integer)
		  // The sample under the mouse (see ChartPainter.HoverAt)
		  If Painter().HoverAt(x) Then Refresh(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Painter().Title = Title
		  Painter().Paint(g, g.Width, g.Height)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddDataset(s As SensorSeries)
		  Painter().AddDataset(s)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddDatasets(ParamArray series() As SensorSeries)
		  For Each s As SensorSeries In series
		    Painter().AddDataset(s)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddLabels(labels() As String)
		  // The window's own label array (one per sample): kept by reference, never modified
		  Painter().AddLabels(labels)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddTimes(times() As Double)
		  // The window's own array of sample times (seconds, one per sample): kept by reference. With it, the X axis is a
		  // time axis
		  Painter().AddTimes(times)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Painter() As ChartPainter
		  // The chart itself (Shared/ChartPainter); this control only shows it and follows the mouse
		  If mPainter = Nil Then mPainter = New ChartPainter
		  Return mPainter
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllDatasets()
		  Painter().RemoveAllDatasets()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllLabels()
		  Painter().RemoveAllLabels()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToPicture() As Picture
		  // The chart as a picture at twice the size (for exports)
		  Painter().Title = Title
		  Return Painter().ToPicture(Width, Height)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Title As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPainter As ChartPainter
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
