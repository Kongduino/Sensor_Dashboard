#tag Module
Protected Module Module1
	#tag Method, Flags = &h0
		Sub SetupSensorFolder()
		  // The session folder and its event log (next to the app), then the database (SensorData.OpenDatabase) and the session
		  Dim fg, fi As FolderItem
		  Dim sessionID As String = System.Random.UUID(False)
		  fg = New FolderItem("Session_" + sessionID)
		  If Not fg.Exists Then fg.CreateFolder()
		  fi = fg.Child("Event_Log.txt")
		  If fi.Exists Then fi.Remove()
		  EventLogTOS = TextOutputStream.Create(fi)
		  
		  // The database lives next to the settings file (SettingsFile), in the application data folder:
		  // ~/Library/Application Support/Sensor_Dashboard on macOS. /tmp, used before, is emptied at restart
		  MyFolder = SpecialFolder.ApplicationData.Child("Sensor_Dashboard")
		  If Not MyFolder.Exists Then MyFolder.CreateFolder()
		  MySensordbFI = MyFolder.Child("records.sqlite")
		  // One-time move: bring over a database still in /tmp/Sensor_Dashboard (versions before October 2026).
		  // Only when that folder exists: on Linux and Windows, New FolderItem raises an exception for a path
		  // whose folder doesn't exist
		  Dim oldDB As FolderItem
		  If Not MySensordbFI.Exists Then
		    Try
		      Dim oldFolder As New FolderItem("/tmp/Sensor_Dashboard", FolderItem.PathModes.Native)
		      If oldFolder.Exists And oldFolder.IsFolder Then oldDB = oldFolder.Child("records.sqlite")
		    Catch eOld As RuntimeException
		      oldDB = Nil // no such folder, or no /tmp (Windows)
		    End Try
		  End If
		  If oldDB <> Nil And oldDB.Exists Then
		    Try
		      oldDB.CopyTo(MyFolder)
		      LogEvents "SetupSensorFolder", "Database copied from " + oldDB.NativePath + " to " + MySensordbFI.NativePath
		    Catch e As IOException
		      LogEvents "SetupSensorFolder", "Couldn't copy the database from /tmp: " + e.Message
		    End Try
		  End If
		  
		  Dim problem As String
		  If Not OpenDatabase(MySensordbFI, problem) Then
		    MessageBox(problem)
		    Quit()
		  End If
		  StartSession(sessionID)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExportPositions(track As PositionTrack, map As MapView, fg As FolderItem, prefix As String)
		  // The positions shown on a Map tab (earlier sessions included): <prefix>_positions.csv, a GPX 1.1 track
		  // <prefix>_positions.gpx (SensorData writes both) and the map <prefix>_Map.png
		  Try
		    WritePositionsCSV(track, fg.Child(prefix + "_positions.csv"))
		    WritePositionsGPX(track, fg.Child(prefix + "_positions.gpx"), prefix)
		    Dim p As Picture = map.ToPicture
		    p.Save(fg.Child(prefix + "_Map.png"), Picture.Formats.PNG, 100)
		    LogEvents "ExportPositions", Str(track.Count) + " position(s) exported as " + prefix + "_positions.csv / .gpx / _Map.png"
		  Catch e As IOException
		    LogEvents "ExportPositions", "Couldn't write the position files: " + e.Message
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StyleChart(c As SensorChart, title As String, valueFormat As String, bars As Boolean = False)
		  // Clears a chart and sets its title. The look itself is in SensorChart; valueFormat and bars are kept for
		  // the callers (SensorChart picks the decimals from the axis steps, and each series says whether it is a bar)
		  c.RemoveAllLabels
		  c.RemoveAllDatasets
		  c.Title = title
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddDataSource(type As String, source As String)
		  If DataSources = Nil Then DataSources = New Dictionary
		  
		  DataSources.Value(type) = source
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExportMQTT(w As MQTTwindow)
		  // Exports this window's feed: every stored MQTT row (logType 2, all sessions) from its gateway, to
		  // Session_<id>/MQTT_<gateway>.csv (see WriteTelemetryCSV) plus the four charts as PNG
		  Dim nodeArg As Int64 = -1
		  Dim fileName As String = w.FeedID
		  If w.NodeFilterNum <> 0 Then // a feed of one node: its readings only, named node_via_gateway
		    nodeArg = NodeNumber(w.NodeFilterNum)
		    Dim h As String = "00000000" + Hex(w.NodeFilterNum)
		    fileName = h.RightBytes(8).Lowercase + "_via_" + w.FeedID
		  End If
		  Dim rs As RowSet = TelemetryRows(2, nodeArg, HexValue(w.FeedID))
		  If rs = Nil Then Return
		  If rs.RowCount = 0 And w.Track.Count = 0 Then
		    LogEvents "ExportMQTT", "Nothing to export yet for " + "!" + w.FeedID
		    MessageBox "Nothing to export yet for " + "!" + w.FeedID + ": no telemetry or position stored."
		    Return
		  End If
		  
		  Dim fg As New FolderItem("Session_" + MySessionID)
		  If Not fg.Exists Then fg.CreateFolder()
		  Dim written() As String
		  If w.Track.Count > 0 Then
		    ExportPositions(w.Track, w.PositionMap, fg, "MQTT_" + fileName)
		    written.Add "MQTT_" + fileName + "_positions.csv / .gpx / _Map.png"
		  End If
		  If rs.RowCount = 0 Then
		    ReportExport(fg, written)
		    Return
		  End If
		  Dim fi As FolderItem = fg.Child("MQTT_" + fileName + ".csv")
		  WriteTelemetryCSV(rs, fi, "node", True)
		  written.AddAt(0, fi.Name + " and the chart images")
		  ReportExport(fg, written)
		  
		  Dim p As Picture
		  p = w.TempChart.ToPicture
		  p.Save(fg.Child("MQTT_" + fileName + "_Temperature.png"), Picture.Formats.PNG, 100)
		  p = w.RHChart.ToPicture
		  p.Save(fg.Child("MQTT_" + fileName + "_Humidity.png"), Picture.Formats.PNG, 100)
		  p = w.HPaChart.ToPicture
		  p.Save(fg.Child("MQTT_" + fileName + "_Pressure.png"), Picture.Formats.PNG, 100)
		  p = w.SNRSSIchart.ToPicture
		  p.Save(fg.Child("MQTT_" + fileName + "_RSSISNR.png"), Picture.Formats.PNG, 100)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExportAQI(w As M5AQIwindow)
		  // Exports this window's device: every stored AQI row (logType 1, all sessions) of the device, to
		  // Session_<id>/AQI_<device>.csv (see WriteTelemetryCSV) plus the five charts as PNG
		  Dim rs As RowSet = TelemetryRows(1, HexValue(w.MyID), -1)
		  If rs = Nil Then Return
		  If rs.RowCount = 0 Then
		    LogEvents "ExportAQI", "Nothing to export yet for " + w.MyID
		    MessageBox "Nothing to export yet for " + w.MyID + ": no reading stored."
		    Return
		  End If
		  
		  Dim fg As New FolderItem("Session_" + MySessionID)
		  If Not fg.Exists Then fg.CreateFolder()
		  Dim fi As FolderItem = fg.Child("AQI_" + w.MyID + ".csv")
		  WriteTelemetryCSV(rs, fi, "device", False)
		  LogEvents "ExportAQI", "Exported successfuly file " + fi.NativePath
		  MessageBox "Exported successfuly file " + fi.NativePath
		  
		  Dim p As Picture
		  p = w.TemperatureChart.ToPicture
		  p.Save(fg.Child("AQI_" + w.MyID + "_Temperature.png"), Picture.Formats.PNG, 100)
		  p = w.HumidityChart.ToPicture
		  p.Save(fg.Child("AQI_" + w.MyID + "_Humidity.png"), Picture.Formats.PNG, 100)
		  p = w.CO2Chart.ToPicture
		  p.Save(fg.Child("AQI_" + w.MyID + "_CO2.png"), Picture.Formats.PNG, 100)
		  p = w.VOCChart.ToPicture
		  p.Save(fg.Child("AQI_" + w.MyID + "_VOC.png"), Picture.Formats.PNG, 100)
		  p = w.PMchart.ToPicture
		  p.Save(fg.Child("AQI_" + w.MyID + "_PM.png"), Picture.Formats.PNG, 100)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExportDevice(w As MeshtasticWindow)
		  // Exports this window's node: every stored row of logType 3 (Meshtastic device, all sessions) of the node, to
		  // Session_<id>/DEV_<node>.csv (see WriteTelemetryCSV) plus the three charts as PNG
		  Dim rs As RowSet = TelemetryRows(3, HexValue(w.FeedID), -1)
		  If rs = Nil Then Return
		  If rs.RowCount = 0 And w.Track.Count = 0 Then
		    LogEvents "ExportDevice", "Nothing to export yet for " + "!" + w.FeedID
		    MessageBox "Nothing to export yet for " + "!" + w.FeedID + ": no sensor reading or position stored."
		    Return
		  End If
		  
		  Dim fg As New FolderItem("Session_" + MySessionID)
		  If Not fg.Exists Then fg.CreateFolder()
		  Dim written() As String
		  If w.Track.Count > 0 Then
		    ExportPositions(w.Track, w.PositionMap, fg, "DEV_" + w.FeedID)
		    written.Add "DEV_" + w.FeedID + "_positions.csv / .gpx / _Map.png"
		  End If
		  If rs.RowCount = 0 Then
		    ReportExport(fg, written)
		    Return
		  End If
		  Dim fi As FolderItem = fg.Child("DEV_" + w.FeedID + ".csv")
		  WriteTelemetryCSV(rs, fi, "node", False)
		  written.AddAt(0, fi.Name + " and the chart images")
		  ReportExport(fg, written)
		  
		  Dim p As Picture
		  p = w.TempChart.ToPicture
		  p.Save(fg.Child("DEV_" + w.FeedID + "_Temperature.png"), Picture.Formats.PNG, 100)
		  p = w.RHChart.ToPicture
		  p.Save(fg.Child("DEV_" + w.FeedID + "_Humidity.png"), Picture.Formats.PNG, 100)
		  p = w.HPaChart.ToPicture
		  p.Save(fg.Child("DEV_" + w.FeedID + "_Pressure.png"), Picture.Formats.PNG, 100)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveSourceRow(kind As String, index As Integer)
		  // A source window closed: its row goes, and the window indexes after it (column 2) move down by one.
		  // Done only if the Setup window is open: naming SetupWindow would otherwise create it again (when quitting)
		  For i As Integer = 0 To App.WindowCount - 1
		    If App.WindowAt(i) IsA SetupWindow Then
		      SetupWindow(App.WindowAt(i)).RemoveSourceRow(kind, index)
		      Return
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SettingsFile() As FolderItem
		  // ~/Library/Application Support/Sensor_Dashboard/settings.json on macOS (the user's application data
		  // folder elsewhere): outside the project, so the setup fields' values never end up in the repository
		  Try
		    Dim folder As FolderItem = SpecialFolder.ApplicationData.Child("Sensor_Dashboard")
		    If Not folder.Exists Then folder.CreateFolder
		    Return folder.Child("settings.json")
		  Catch e As RuntimeException
		    Return Nil
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FitControlsForLinux(w As DesktopWindow)
		  // Linux (GTK) draws text fields, menus and buttons taller than the macOS sizes the windows are laid out
		  // with, and cuts their text otherwise: there, each one is made at least kLinuxFieldHeight high (labels and
		  // checkboxes kLinuxLabelHeight), growing evenly up and down so rows stay aligned. Nothing changes elsewhere
		  #If TargetLinux Then
		    For i As Integer = 0 To w.ControlCount - 1
		      Dim c As Object = w.ControlAt(i)
		      If c IsA DesktopUIControl Then
		        Dim u As DesktopUIControl = DesktopUIControl(c)
		        Dim target As Integer
		        If u IsA DesktopTextField Or u IsA DesktopPopupMenu Or u IsA DesktopComboBox Or u IsA DesktopButton Then
		          target = kLinuxFieldHeight
		        ElseIf u IsA DesktopCheckBox Or u IsA DesktopLabel Then
		          target = kLinuxLabelHeight
		        End If
		        If target > u.Height Then
		          u.Top = u.Top - (target - u.Height) \ 2
		          u.Height = target
		        End If
		      End If
		    Next
		  #Else
		    #Pragma Unused w
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReportExport(fg As FolderItem, written() As String)
		  // One message for everything an export wrote
		  LogEvents "Export", "Exported to " + fg.NativePath + ": " + Join(written, ", ")
		  MessageBox "Exported to " + fg.NativePath + ":" + EndOfLine + EndOfLine + Join(written, EndOfLine)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DataSources As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		MyAQIwindows() As M5AQIwindow
	#tag EndProperty

	#tag Property, Flags = &h0
		MyFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		MyMeshtasticWindows() As MeshtasticWindow
	#tag EndProperty

	#tag Property, Flags = &h0
		MyMQTTwindows() As MQTTwindow
	#tag EndProperty

	#tag Property, Flags = &h0
		MySensordbFI As FolderItem
	#tag EndProperty



	#tag Constant, Name = kLinuxFieldHeight, Type = Double, Dynamic = False, Default = \"30", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kLinuxLabelHeight, Type = Double, Dynamic = False, Default = \"26", Scope = Private
	#tag EndConstant


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
			InitialValue="-2147483648"
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
			Name="MySensordb"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="SQLiteDatabase"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MySessionID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MySessionNum"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
