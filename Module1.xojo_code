#tag Module
Protected Module Module1
	#tag Method, Flags = &h0
		Sub AddDataSource(type As String, source As String)
		  If DataSources = Nil Then DataSources = New Dictionary
		  
		  DataSources.Value(type) = source
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExportMQTT(w As MQTTwindow)
		  // Exports this window's feed: the session's MQTT rows (logType 2) from its gateway, to
		  // Session_<id>/MQTT_<gateway>.csv (see WriteTelemetryCSV) plus the four charts as PNG
		  Dim cond As String = " AND logType=2 AND senderID=" + Format(Val("&H" + w.FeedID), "0")
		  Dim fileName As String = w.FeedID
		  If w.NodeFilterNum <> 0 Then // a feed of one node: its readings only, named node_via_gateway
		    cond = cond + " AND fromID=" + Format(w.NodeFilterNum, "0")
		    Dim h As String = "00000000" + Hex(w.NodeFilterNum)
		    fileName = h.RightBytes(8).Lowercase + "_via_" + w.FeedID
		  End If
		  Dim cmd As String = "select * from telemetry where sessionID=" + Str(MySessionNum) + cond + " ORDER BY timestamp;"
		  LogEvents "ExportMQTT", cmd
		  Dim rs As RowSet = MySensordb.SelectSQL(cmd)
		  If rs.RowCount = 0 And w.Track.Count = 0 Then
		    LogEvents "ExportMQTT", "Nothing to export yet for " + "!" + w.FeedID
		    MessageBox "Nothing to export yet for " + "!" + w.FeedID + ": no telemetry or position received in this session."
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
		Sub LogEvents(origin As String, txt As String)
		  Dim d As DateTime = DateTime.Now()
		  Dim s As String
		  s = Format(d.Hour, "00") + ":" +  Format(d.Minute, "00") + _
		  ":" + Format(d.Second, "00") + Chr(9) + origin + Chr(9) + txt
		  
		  EventLogTOS.WriteLine(s)
		  EventLogTOS.Flush()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LogTelemetry(logType As Integer, fromID As String, senderID As String, TS As String, payload As String, rssi As Double, snr As Double, sessionID As Integer)
		  Dim cmd, pl As String
		  Dim rs As Integer
		  rs = rssi
		  
		  pl = payload.ReplaceAllBytes("""", "'")
		  
		  cmd = "INSERT INTO telemetry(logType, sessionID, timestamp, fromID, senderID, rssi, snr, payload)" + _
		  " VALUES (" + Str(logType) + ", " + Str(sessionID) + ", " + TS + ", " + fromID + ", " + _
		  senderID + ", " + Format(rs, "-0") + ", " + Format(snr, "-0.00") + ", """ + pl + """);"
		  
		  LogEvents "LogTelemetry", cmd
		  MySensordb.ExecuteSQL(cmd)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetupSensorFolder()
		  Dim fg, fi As FolderItem
		  Dim title As String
		  MySessionID = System.Random.UUID(False)
		  title = "Session_" + MySessionID
		  fg = New FolderItem(title)
		  If Not fg.Exists Then fg.CreateFolder()
		  fi = fg.Child("Event_Log.txt")
		  If fi.Exists Then fi.Remove()
		  EventLogTOS = TextOutputStream.Create(fi)
		  
		  Dim tos As TextOutputStream
		  
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
		  If Not MySensordbFI.Exists Then
		    LogEvents "SetupSensorFolder",  "Creating db!"
		    MySensordb  = New SQLiteDatabase
		    MySensordb.DatabaseFile = MySensordbFI
		    Dim s, t() As String
		    t = kSqliteCommand.SplitBytes(EndOfLine)
		    Try
		      MySensordb.CreateDatabase
		    Catch error As IOException
		      MessageBox("The database could not be created: " + error.Message)
		      LogEvents "SetupSensorFolder", "The database could not be created: " + error.Message
		      Quit()
		    Catch error As DatabaseException
		      MessageBox("Database error:" + EndOfLine + EndOfLine + error.Message)
		      LogEvents "SetupSensorFolder", "Database error: " + error.Message
		      Quit()
		    End Try
		    For Each s in t
		      Try
		        MySensordb.ExecuteSQL(s)
		      Catch error As DatabaseException
		        MessageBox("Database error:" + EndOfLine + EndOfLine + error.Message) + _
		        EndOfLine + EndOfLine + s
		        LogEvents "SetupSensorFolder", "Database error: " + error.Message + _
		        ". " + s 
		        Quit()
		      End Try
		    Next
		  Else
		    Try
		      MySensordb  = New SQLiteDatabase
		      MySensordb.DatabaseFile = MySensordbFI
		      MySensordb.Connect()
		    Catch error As IOException
		      MessageBox("The database exists but could not be connected to:" + _
		      EndOfLine + EndOfLine + error.Message)
		      LogEvents "SetupSensorFolder", "The database exists but could not be connected to: " + _
		      error.Message
		      Quit()
		    End Try
		    LogEvents "SetupSensorFolder", "Connected to db!"
		  End If
		  // Source types (the table is created with 1 and 2; 3 is added to older databases too)
		  MySensordb.ExecuteSQL("INSERT OR IGNORE INTO logtypes(id, typeName) VALUES (3, 'Meshtastic device');")
		  // GPS positions of Meshtastic nodes (MQTT feeds and devices), for the Map tabs
		  MySensordb.ExecuteSQL("CREATE TABLE IF NOT EXISTS positions(posID INTEGER PRIMARY KEY, sessionID INTEGER, " + _
		  "timestamp INTEGER, fromID INTEGER, senderID INTEGER, latitude REAL, longitude REAL, altitude INTEGER, " + _
		  "precisionBits INTEGER, sats INTEGER, rssi INTEGER, snr REAL);")
		  // rssi / snr came later: added to a table created before them (an error just means they are there)
		  For Each col As String In Array("rssi INTEGER", "snr REAL")
		    Try
		      MySensordb.ExecuteSQL("ALTER TABLE positions ADD COLUMN " + col + ";")
		    Catch eCol As DatabaseException
		    End Try
		  Next
		  
		  Dim dt As DateTime = DateTime.Now()
		  Dim cmd As String
		  cmd = "INSERT INTO sessions(fullID, timestamp) VALUES (""" + _
		  MySessionID + """, " + Format(dt.SecondsFrom1970, "00000000") + ");"
		  LogEvents "MQTTwindow Setup", cmd
		  MySensordb.ExecuteSQL(cmd)
		  dim rs As RowSet
		  rs = MySensordb.SelectSQL("SELECT sessionID from sessions where fullID='"+MySessionID+"'")
		  MySessionNum = rs.ColumnAt(0).IntegerValue
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseAQIResponse(content As String, w As M5AQIwindow, ByRef problem As String) As Boolean
		  // One answer of https://ezdata2.m5stack.com/api/v2/<device id>/dataMacByKey/raw:
		  // {"code":200, "data":{"value":"<escaped JSON>", "updateTime":"<seconds>", ...}}
		  // Fills w.Values (the decoded value: sen55, scd40, rtc, profile), w.updateTime, w.nickname and w.periodicity.
		  // False, with problem set, if any part is missing (this replaces curl + AirQ_json_parse.py)
		  Dim js As JSONItem
		  Try
		    js = New JSONItem(content)
		  Catch e As JSONException
		    problem = "the answer is not JSON (" + e.Message + ")"
		    Return False
		  End Try
		  
		  Dim data As JSONItem = js.Lookup("data", Nil)
		  If data = Nil Then
		    problem = "no 'data' node (code " + js.Lookup("code", "?").StringValue + ", " + js.Lookup("msg", "").StringValue + ")"
		    Return False
		  End If
		  
		  Dim v As Variant = data.Lookup("value", Nil)
		  Dim values As JSONItem
		  If v IsA JSONItem Then
		    values = v // already an object (dataType "object")
		  ElseIf v.Type = Variant.TypeString Then
		    values = DecodeAQIValue(v.StringValue)
		  End If
		  If values = Nil Then
		    problem = "no readable 'value' node"
		    Return False
		  End If
		  
		  Dim updated As String = data.Lookup("updateTime", "").StringValue
		  If updated = "" Then
		    problem = "no 'updateTime' node"
		    Return False
		  End If
		  
		  Dim profile As JSONItem = values.Lookup("profile", Nil)
		  Dim rtc As JSONItem = values.Lookup("rtc", Nil)
		  If profile = Nil Or rtc = Nil Then
		    problem = "no 'profile' or 'rtc' node"
		    Return False
		  End If
		  If values.Lookup("sen55", Nil) = Nil Or values.Lookup("scd40", Nil) = Nil Then
		    problem = "no 'sen55' or 'scd40' node"
		    Return False
		  End If
		  
		  Dim nick As String = profile.Lookup("nickname", "").StringValue
		  If nick = "" Then
		    problem = "no nickname"
		    Return False
		  End If
		  Dim interval As Integer = rtc.Lookup("sleep_interval", -1).IntegerValue
		  If interval <= 0 Then
		    problem = "no sleep_interval"
		    Return False
		  End If
		  
		  w.Values = values
		  w.updateTime = updated
		  w.nickname = nick
		  w.periodicity = interval
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DecodeAQIValue(value As String) As JSONItem
		  // data.value is a JSON object written as a string, possibly escaped once more ({\"sen55\":...}).
		  // Same three tries as parse_escaped_json in the former AirQ_json_parse.py. Nil if none works
		  Try
		    Return New JSONItem(value)
		  Catch e1 As JSONException
		  End Try
		  
		  // Unescape one layer: read the text as the content of a JSON string
		  Try
		    Dim wrapper As New JSONItem("[""" + value + """]")
		    Return New JSONItem(wrapper.ValueAt(0).StringValue)
		  Catch e2 As JSONException
		  End Try
		  
		  // Last resort: only unescape the quotes
		  Try
		    Return New JSONItem(value.ReplaceAll("\""", """"))
		  Catch e3 As JSONException
		  End Try
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MeanOf(values() As Double) As Double
		  // Average of all the samples, 0 when there are none yet
		  If values.Count = 0 Then Return 0
		  Dim total As Double
		  For Each v As Double In values
		    total = total + v
		  Next
		  Return total / values.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseChannelKeys(keys As String, names() As String, psks() As String, ByRef fallback As String, ByRef problem As String) As Boolean
		  // The Keys field of an MQTT feed: "Channel=PSK" entries separated by ";" (or ","), PSK as the Meshtastic
		  // app shows it (base64, e.g. AQ==) or any format MeshParsePSK takes. An entry with no channel name is the
		  // key for every other channel (like --psk of the former script). Empty field: AQ== for every channel.
		  // Fills names/psks and fallback; False, with problem set, if an entry can't be used
		  names.RemoveAll
		  psks.RemoveAll
		  fallback = "AQ=="
		  problem = ""
		  Dim entries() As String = keys.ReplaceAll(",", ";").Split(";")
		  For Each rawEntry As String In entries
		    Dim entry As String = rawEntry.Trim
		    If entry = "" Then Continue
		    Dim name As String = ""
		    Dim psk As String = entry
		    Dim eq As Integer = entry.IndexOf("=")
		    // base64 keys end with "=": a "=" only counts as the separator if a key follows it
		    If eq > 0 Then
		      Dim tail As String = entry.Middle(eq + 1).Trim
		      If tail.ReplaceAll("=", "") <> "" Then
		        name = entry.Left(eq).Trim
		        psk = tail
		      End If
		    End If
		    Dim pskBytes As String
		    If Not MeshParsePSK(psk, pskBytes) Then
		      problem = """" + psk + """ is not a key (base64 as in the Meshtastic app, or hex)"
		      Return False
		    End If
		    Dim n As Integer = pskBytes.Bytes
		    If n <> 0 And n <> 1 And n <> 16 And n <> 32 Then
		      problem = """" + psk + """ is " + Str(n) + " bytes long: a channel key has 1, 16 or 32 bytes"
		      Return False
		    End If
		    If name = "" Then
		      fallback = psk
		    Else
		      names.Add name
		      psks.Add psk
		    End If
		  Next
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExportAQI(w As M5AQIwindow)
		  // Exports this window's device: the session's AQI rows (logType 1) of the device, to
		  // Session_<id>/AQI_<device>.csv (see WriteTelemetryCSV) plus the five charts as PNG
		  Dim cmd As String = "select * from telemetry where sessionID=" + Str(MySessionNum) + _
		  " AND logType=1 AND fromID=" + Format(Val("&H" + w.MyID), "0") + " ORDER BY timestamp;"
		  LogEvents "ExportAQI", cmd
		  Dim rs As RowSet = MySensordb.SelectSQL(cmd)
		  If rs.RowCount = 0 Then
		    LogEvents "ExportAQI", "Nothing to export yet for " + w.MyID
		    MessageBox "Nothing to export yet for " + w.MyID + ": no reading received in this session."
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
		  // Exports this window's node: the session's rows of logType 3 (Meshtastic device) of the node, to
		  // Session_<id>/DEV_<node>.csv (see WriteTelemetryCSV) plus the three charts as PNG
		  Dim cmd As String = "select * from telemetry where sessionID=" + Str(MySessionNum) + _
		  " AND logType=3 AND fromID=" + Format(Val("&H" + w.FeedID), "0") + " ORDER BY timestamp;"
		  LogEvents "ExportDevice", cmd
		  Dim rs As RowSet = MySensordb.SelectSQL(cmd)
		  If rs.RowCount = 0 And w.Track.Count = 0 Then
		    LogEvents "ExportDevice", "Nothing to export yet for " + "!" + w.FeedID
		    MessageBox "Nothing to export yet for " + "!" + w.FeedID + ": no sensor reading or position received in this session."
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

	#tag Method, Flags = &h21
		Private Function RowPayload(rs As RowSet) As JSONItem
		  // The payload of the current row (stored with ' for "), an empty object if it can't be read
		  Try
		    Return New JSONItem(rs.Column("payload").StringValue.ReplaceAllBytes("'", """"))
		  Catch e As JSONException
		    Return New JSONItem
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SourceID(num As Int64, kind As String) As String
		  // "node": !aabbccdd (8 lowercase hex digits); "device": an M5Stack id, 12 uppercase hex digits
		  Dim h As String
		  If kind = "device" Then
		    h = "000000000000" + Hex(num)
		    Return h.RightBytes(12).Uppercase
		  End If
		  h = "00000000" + Hex(num)
		  Return "!" + h.RightBytes(8).Lowercase
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteTelemetryCSV(rs As RowSet, fi As FolderItem, idColumn As String, withRadio As Boolean)
		  // The CSV of every export, so they all look the same: ";"-separated, one row per reading, oldest first.
		  // Columns: timestamp, the source (idColumn: "node" as !aabbccdd, or "device" as 12 hex digits), for MQTT
		  // the gateway, rssi and snr, then one column per payload key, over all rows (a key missing from a row,
		  // or a radio value the packet didn't have, is an empty cell)
		  Dim keys() As String
		  rs.MoveToFirstRow
		  While Not rs.AfterLastRow
		    Dim pl As JSONItem = RowPayload(rs)
		    For Each k As String In pl.Keys
		      If keys.IndexOf(k) < 0 Then keys.Add k
		    Next
		    rs.MoveToNextRow
		  Wend
		  
		  If fi.Exists Then fi.Remove
		  Dim tos As TextOutputStream = TextOutputStream.Create(fi)
		  Dim t() As String
		  t.Add "timestamp"
		  t.Add idColumn
		  If withRadio Then
		    t.Add "gateway"
		    t.Add "rssi"
		    t.Add "snr"
		  End If
		  For Each k As String In keys
		    t.Add k
		  Next
		  tos.WriteLine Join(t, ";")
		  
		  rs.MoveToFirstRow
		  While Not rs.AfterLastRow
		    t.RemoveAll
		    Dim dt As New DateTime(rs.Column("timestamp").IntegerValue)
		    t.Add dt.SQLDateTime
		    t.Add SourceID(rs.Column("fromID").Int64Value, idColumn)
		    If withRadio Then
		      t.Add SourceID(rs.Column("senderID").Int64Value, "node")
		      If rs.Column("rssi").IntegerValue = -255 Then
		        t.Add ""
		      Else
		        t.Add rs.Column("rssi").StringValue
		      End If
		      If rs.Column("snr").DoubleValue = -255 Then
		        t.Add ""
		      Else
		        t.Add Format(rs.Column("snr").DoubleValue, "-0.00")
		      End If
		    End If
		    Dim rowPL As JSONItem = RowPayload(rs)
		    For Each k As String In keys
		      If rowPL.HasKey(k) Then
		        t.Add Format(rowPL.Value(k).DoubleValue, "-0.00")
		      Else
		        t.Add ""
		      End If
		    Next
		    tos.WriteLine Join(t, ";")
		    rs.MoveToNextRow
		  Wend
		  tos.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HistoryRows(logType As Integer, fromID As Int64, senderID As Int64, before As Int64 = 0) As RowSet
		  // The latest stored readings of a source, from every session, oldest first: at most 100 (what the charts
		  // keep). fromID / senderID of -1 match any; before > 0 keeps only readings older than that time. A reading
		  // stored twice (the same timestamp in two sessions) comes once
		  Dim cond As String = "logType=" + Str(logType)
		  If fromID >= 0 Then cond = cond + " AND fromID=" + Format(fromID, "0")
		  If senderID >= 0 Then cond = cond + " AND senderID=" + Format(senderID, "0")
		  If before > 0 Then cond = cond + " AND timestamp<" + Format(before, "0")
		  Dim cmd As String = "select * from (select timestamp, payload, rssi, snr from telemetry where " + cond + _
		  " group by timestamp order by timestamp desc limit 100) order by timestamp;"
		  LogEvents "HistoryRows", cmd
		  Try
		    Return MySensordb.SelectSQL(cmd)
		  Catch e As DatabaseException
		    LogEvents "HistoryRows", "Database error: " + e.Message
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

	#tag Method, Flags = &h0
		Sub LogPosition(fromID As Int64, senderID As Int64, ts As Integer, lat As Double, lon As Double, alt As Integer, precision As Integer, sats As Integer, rssi As Integer = -255, snr As Double = -255)
		  // One position in the positions table (fromID: the node, senderID: the gateway or connected node;
		  // rssi / snr as the gateway or connected node received it, -255 when unknown, e.g. its own packets)
		  Dim cmd As String = "INSERT INTO positions(sessionID, timestamp, fromID, senderID, latitude, longitude, altitude, precisionBits, sats, rssi, snr) VALUES (" + _
		  Str(MySessionNum) + ", " + Str(ts) + ", " + Format(fromID, "0") + ", " + Format(senderID, "0") + ", " + _
		  Format(lat, "-0.0000000") + ", " + Format(lon, "-0.0000000") + ", " + Str(alt) + ", " + Str(precision) + ", " + Str(sats) + ", " + _
		  Str(rssi) + ", " + Format(snr, "-0.00") + ");"
		  LogEvents "LogPosition", cmd
		  Try
		    MySensordb.ExecuteSQL(cmd)
		  Catch e As DatabaseException
		    LogEvents "LogPosition", "Database error: " + e.Message
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParsePosition(js As JSONItem, ByRef ts As Integer, ByRef lat As Double, ByRef lon As Double, ByRef alt As Integer, ByRef precision As Integer, ByRef sats As Integer) As Boolean
		  // A "position" packet as converter JSON (payload: latitude_i / longitude_i in 1e-7 degrees, altitude, time,
		  // precision_bits, sats_in_view). False when it holds no valid fix (0 / 0, or out of range)
		  If js.Lookup("type", "").StringValue <> "position" Then Return False
		  Dim payload As JSONItem = js.Lookup("payload", Nil)
		  If payload = Nil Then Return False
		  Dim latI As Int64 = payload.Lookup("latitude_i", 0).Int64Value
		  Dim lonI As Int64 = payload.Lookup("longitude_i", 0).Int64Value
		  If latI = 0 And lonI = 0 Then Return False // no fix
		  lat = latI / 1e7
		  lon = lonI / 1e7
		  If Abs(lat) > 90 Or Abs(lon) > 180 Then Return False
		  alt = payload.Lookup("altitude", 0).IntegerValue
		  precision = payload.Lookup("precision_bits", 32).IntegerValue
		  sats = payload.Lookup("sats_in_view", 0).IntegerValue
		  // The fix's own time when the node has one, else when the packet was received, else now
		  ts = payload.Lookup("time", 0).IntegerValue
		  If ts <= 0 Then ts = js.Lookup("timestamp", 0).IntegerValue
		  If ts <= 0 Then ts = DateTime.Now.SecondsFrom1970
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PositionRows(fromID As Int64) As RowSet
		  // The node's latest stored positions (every session, at most PositionTrack.kMaxPositions), oldest first;
		  // a position stored twice (the same time) comes once
		  Dim cmd As String = "select * from (select timestamp, latitude, longitude, altitude, precisionBits, sats, rssi, snr from positions " + _
		  "where fromID=" + Format(fromID, "0") + " group by timestamp order by timestamp desc limit 500) order by timestamp;"
		  Try
		    Return MySensordb.SelectSQL(cmd)
		  Catch e As DatabaseException
		    LogEvents "PositionRows", "Database error: " + e.Message
		    Return Nil
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExportPositions(track As PositionTrack, map As MapView, fg As FolderItem, prefix As String)
		  // The positions shown on a Map tab (earlier sessions included): <prefix>_positions.csv, a GPX 1.1 track
		  // <prefix>_positions.gpx (opens in GPX viewers, Google Earth, OsmAnd...) and the map <prefix>_Map.png
		  Dim t() As String
		  Try
		    Dim f As FolderItem = fg.Child(prefix + "_positions.csv")
		    If f.Exists Then f.Remove
		    Dim tos As TextOutputStream = TextOutputStream.Create(f)
		    tos.WriteLine "timestamp;latitude;longitude;altitude;precision_bits;sats;rssi;snr"
		    For i As Integer = 0 To track.Count - 1
		      t.RemoveAll
		      Dim dt As New DateTime(track.Times(i))
		      t.Add dt.SQLDateTime
		      t.Add Format(track.Lats(i), "-0.0000000")
		      t.Add Format(track.Lons(i), "-0.0000000")
		      t.Add Str(track.Alts(i))
		      t.Add Str(track.Precisions(i))
		      t.Add Str(track.SatCounts(i))
		      t.Add If(track.Rssis(i) = -255, "", Str(track.Rssis(i)))
		      t.Add If(track.Snrs(i) = -255, "", Format(track.Snrs(i), "-0.00"))
		      tos.WriteLine Join(t, ";")
		    Next
		    tos.Close
		    
		    f = fg.Child(prefix + "_positions.gpx")
		    If f.Exists Then f.Remove
		    tos = TextOutputStream.Create(f)
		    tos.WriteLine "<?xml version=""1.0"" encoding=""UTF-8""?>"
		    tos.WriteLine "<gpx version=""1.1"" creator=""Sensor_Dashboard"" xmlns=""http://www.topografix.com/GPX/1/1"">"
		    tos.WriteLine "  <trk><name>" + prefix + "</name><trkseg>"
		    Dim utc As New TimeZone(0)
		    For i As Integer = 0 To track.Count - 1
		      Dim d As New DateTime(track.Times(i), utc)
		      Dim iso As String = Format(d.Year, "0000") + "-" + Format(d.Month, "00") + "-" + Format(d.Day, "00") + "T" + _
		      Format(d.Hour, "00") + ":" + Format(d.Minute, "00") + ":" + Format(d.Second, "00") + "Z"
		      Dim pt As String = "    <trkpt lat=""" + Format(track.Lats(i), "-0.0000000") + """ lon=""" + Format(track.Lons(i), "-0.0000000") + """>"
		      If track.Alts(i) <> 0 Then pt = pt + "<ele>" + Str(track.Alts(i)) + "</ele>"
		      pt = pt + "<time>" + iso + "</time>"
		      If track.SatCounts(i) > 0 Then pt = pt + "<sat>" + Str(track.SatCounts(i)) + "</sat>"
		      tos.WriteLine pt + "</trkpt>"
		    Next
		    tos.WriteLine "  </trkseg></trk>"
		    tos.WriteLine "</gpx>"
		    tos.Close
		    
		    Dim p As Picture = map.ToPicture
		    p.Save(fg.Child(prefix + "_Map.png"), Picture.Formats.PNG, 100)
		    LogEvents "ExportPositions", Str(track.Count) + " position(s) exported as " + prefix + "_positions.csv / .gpx / _Map.png"
		  Catch e As IOException
		    LogEvents "ExportPositions", "Couldn't write the position files: " + e.Message
		  End Try
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
		EventLogTOS As TextOutputStream
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
		MySensordb As SQLiteDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		MySensordbFI As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		MySessionID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		MySessionNum As Integer
	#tag EndProperty


	#tag Constant, Name = kSqliteCommand, Type = String, Dynamic = False, Default = \"CREATE TABLE telemetry(hitID INTEGER PRIMARY KEY\x2C logType INTEGER\x2C sessionID INTEGER\x2C timestamp INTEGER\x2C fromID INTEGER\x2C senderID INTEGER\x2C rssi INTEGER\x2C snr REAL\x2C payload TEXT);\nCREATE TABLE sessions(sessionID INTEGER PRIMARY KEY\x2C fullID TEXT NOT NULL UNIQUE\x2C timestamp TEXT);\nCREATE TABLE logtypes(id INTEGER PRIMARY KEY\x2C typeName TEXT NOT NULL UNIQUE);\nINSERT INTO logtypes(id\x2C typeName) VALUES (1\x2C \'M5 AQI\');\nINSERT INTO logtypes(id\x2C typeName) VALUES (2\x2C \'Meshtastic MQTT\');", Scope = Public
	#tag EndConstant


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
