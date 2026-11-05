#tag Module
Protected Module BatteryCurve
	#tag Note, Name = About
		Battery discharge curves from Meshtastic device metrics (DeviceMetrics voltage and battery_level), shared by the
		desktop and Android apps. The readings are stored in the telemetry table like the other telemetry, as logType 4
		(from an MQTT feed) or 5 (from a node's own link), so the sensor charts, history and exports don't see them.

		A curve is one discharge run of a node on its battery, under a steady load: from the full charge to the last
		reading before the node went silent. Readings on external power (battery_level above 100) are left out. The
		voltages are smoothed (a running median), the time of the run stands for the charge left (100% at the start, 0% at
		the end, linear in time), and the voltage at 100, 90 ... 0% gives the 11 values of a firmware variant's OCV_ARRAY
		(millivolts, never rising). The 0% value is the last reading, where the node shut down: it is not extrapolated.
	#tag EndNote


	#tag Method, Flags = &h0
		Function BatteryNodes() As RowSet
		  // The nodes with stored device metrics: fromID, readings (their count) and last (the latest time), latest first
		  Dim cmd As String = "select fromID, count(distinct timestamp) as readings, max(timestamp) as last from telemetry " + _
		  "where logType in (4, 5) group by fromID order by last desc;"
		  Try
		    Return MySensordb.SelectSQL(cmd)
		  Catch e As DatabaseException
		    LogEvents("BatteryNodes", "Database error: " + e.Message)
		    Return Nil
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BatteryRows(fromID As Int64) As RowSet
		  // Every stored device metrics reading of a node (all sessions, MQTT and own link), oldest first, once per time
		  Dim cmd As String = "select timestamp, payload from telemetry where logType in (4, 5) and fromID=" + Format(fromID, "0") + _
		  " group by timestamp order by timestamp;"
		  Try
		    Return MySensordb.SelectSQL(cmd)
		  Catch e As DatabaseException
		    LogEvents("BatteryRows", "Database error: " + e.Message)
		    Return Nil
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurveMillivolts(times() As Integer, smooth() As Double, first As Integer, last As Integer) As Integer()
		  // The voltage at 100, 90 ... 0% of the run first..last (indexes into times / smooth), in millivolts: 11 values,
		  // each no higher than the one before. Linear between readings
		  Dim mv() As Integer
		  If first < 0 Or last <= first Or last > times.LastIndex Then Return mv
		  Dim t0 As Double = times(first)
		  Dim t1 As Double = times(last)
		  Dim j As Integer = first
		  For k As Integer = 0 To 10
		    Dim t As Double = t0 + (((t1 - t0) * k) / 10)
		    While j < last And times(j + 1) < t
		      j = j + 1
		    Wend
		    Dim v As Double
		    If j >= last Then
		      v = smooth(last)
		    Else
		      Dim span As Double = times(j + 1) - times(j)
		      Dim f As Double = 0
		      If span > 0 Then f = (t - times(j)) / span
		      If f < 0 Then f = 0
		      If f > 1 Then f = 1
		      v = smooth(j) + ((smooth(j + 1) - smooth(j)) * f)
		    End If
		    Dim m As Integer = Round(v * 1000)
		    If k > 0 Then
		      If m > mv(k - 1) Then m = mv(k - 1)
		    End If
		    mv.Add(m)
		  Next
		  Return mv
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindRun(times() As Integer, smooth() As Double, ByRef first As Integer, ByRef last As Integer) As Boolean
		  // The latest discharge run: the readings since the last gap longer than RunGap, from the highest (smoothed)
		  // voltage, the full charge (the latest one when it stays there), to the last reading. False when there is no run
		  // of at least kMinReadings readings
		  first = -1
		  last = -1
		  If times.Count < kMinReadings Then Return False
		  Dim gap As Integer = RunGap(times)
		  last = times.LastIndex
		  Dim segStart As Integer = last
		  While segStart > 0
		    If (times(segStart) - times(segStart - 1)) > gap Then Exit
		    segStart = segStart - 1
		  Wend
		  first = segStart
		  For i As Integer = segStart To last
		    If smooth(i) >= smooth(first) Then first = i
		  Next
		  Return (last - first + 1) >= kMinReadings
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenericMillivolts() As Integer()
		  // The firmware's default Li-ion table (src/power.h), for comparison
		  Dim mv() As Integer
		  Dim sep As String = " "
		  Dim parts() As String = kGenericOCV.Split(sep)
		  For Each p As String In parts
		    mv.Add(p.ToInteger)
		  Next
		  Return mv
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDeviceMetrics(payload As JSONItem) As Boolean
		  // True for a DeviceMetrics payload: it always has voltage and air_util_tx (environment readings may have a
		  // voltage, never air_util_tx)
		  If payload = Nil Then Return False
		  Return payload.HasKey("voltage") And payload.HasKey("air_util_tx")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadReadings(fromID As Int64, times() As Integer, volts() As Double)
		  // The node's battery readings, oldest first: times (seconds since 1970) and volts. Readings on external power
		  // (battery_level above 100) and without a voltage (no battery measurement) are left out
		  times.RemoveAll()
		  volts.RemoveAll()
		  Dim rs As RowSet = BatteryRows(fromID)
		  If rs = Nil Then Return
		  While Not rs.AfterLastRow
		    Dim pl As JSONItem
		    If ParseStoredPayload(rs.Column("payload").StringValue, pl) Then
		      Dim v As Double = pl.Lookup("voltage", 0).DoubleValue
		      Dim level As Integer = pl.Lookup("battery_level", 0).IntegerValue
		      If v > 0 And level <= 100 Then
		        times.Add(rs.Column("timestamp").IntegerValue)
		        volts.Add(v)
		      End If
		    End If
		    rs.MoveToNextRow()
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OCVDefine(mv() As Integer) As String
		  // The line for a firmware variant.h: #define OCV_ARRAY 4190, 4050, ...
		  Dim parts() As String
		  For Each m As Integer In mv
		    parts.Add(Str(m))
		  Next
		  Dim sep As String = ", "
		  Return "#define OCV_ARRAY " + String.FromArray(parts, sep)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PercentAt(times() As Integer, first As Integer, last As Integer, i As Integer) As Double
		  // The charge left at reading i of the run first..last, from its time: 100 at first, 0 at last
		  If last <= first Then Return 0
		  Dim span As Double = times(last) - times(first)
		  If span <= 0 Then Return 0
		  Return (100 * (times(last) - times(i))) / span
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RunGap(times() As Integer) As Integer
		  // The longest silence inside a run, in seconds: 5 times the usual interval between readings (the median), at
		  // least 10 minutes. A longer one ends a run (the node was off, or on external power)
		  Dim gaps() As Integer
		  For i As Integer = 1 To times.LastIndex
		    gaps.Add(times(i) - times(i - 1))
		  Next
		  If gaps.Count = 0 Then Return kMinGap
		  gaps.Sort()
		  Dim usual As Integer = gaps(gaps.Count \ 2)
		  Return Max(kMinGap, usual * 5)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Smoothed(volts() As Double, width As Integer) As Double()
		  // A running median of width readings (fewer at both ends): one ADC reading off by a few hundredths moves nothing
		  Dim result() As Double
		  Dim half As Integer = width \ 2
		  For i As Integer = 0 To volts.LastIndex
		    Dim win() As Double
		    Dim lo As Integer = Max(0, i - half)
		    Dim hi As Integer = Min(volts.LastIndex, i + half)
		    For j As Integer = lo To hi
		      win.Add(volts(j))
		    Next
		    win.Sort()
		    result.Add(win(win.Count \ 2))
		  Next
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VoltsAtPercent(mv() As Integer, percent As Double) As Double
		  // The voltage a curve (11 millivolt values, for 100, 90 ... 0%) gives at percent, linear between its values
		  If mv.Count < 11 Then Return 0
		  Dim k As Double = (100 - percent) / 10
		  If k < 0 Then k = 0
		  If k > 10 Then k = 10
		  Dim i As Integer = Floor(k)
		  If i > 9 Then i = 9
		  Dim f As Double = k - i
		  Return (mv(i) + ((mv(i + 1) - mv(i)) * f)) / 1000
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteBatteryCSV(times() As Integer, volts() As Double, smooth() As Double, first As Integer, last As Integer, f As FolderItem)
		  // The run first..last as ";"-separated text, one row per reading: time, voltage as measured, smoothed, charge left
		  If f.Exists Then f.Remove()
		  Dim tos As TextOutputStream = TextOutputStream.Create(f)
		  tos.WriteLine("timestamp;voltage;smoothed;percent")
		  Dim sep As String = ";"
		  For i As Integer = first To last
		    Dim t() As String
		    Dim dt As New DateTime(times(i))
		    t.Add(dt.SQLDateTime)
		    t.Add(FormatValue(volts(i), "0.000"))
		    t.Add(FormatValue(smooth(i), "0.000"))
		    t.Add(FormatValue(PercentAt(times, first, last, i), "0.0"))
		    tos.WriteLine(String.FromArray(t, sep))
		  Next
		  tos.Close()
		End Sub
	#tag EndMethod


	#tag Constant, Name = kGenericOCV, Type = String, Dynamic = False, Default = \"4190 4050 3990 3890 3800 3720 3630 3530 3420 3300 3100", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMinGap, Type = Double, Dynamic = False, Default = \"600", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMinReadings, Type = Double, Dynamic = False, Default = \"12", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSmoothWidth, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Module
#tag EndModule
