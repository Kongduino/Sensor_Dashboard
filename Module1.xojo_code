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
		  // Exports this window's feed only: the session's MQTT rows (logType 2) whose senderID is the
		  // window's gateway, to Session_<id>/MQTT_<gateway>.csv plus the three charts as PNG
		  Dim feed As String = w.FeedID
		  Dim title, t(), header As String
		  Dim fg, fi As FolderItem
		  Dim tos As TextOutputStream
		  Dim rs As RowSet
		  Dim cmd As String
		  cmd = "select * from telemetry where sessionID=" + _
		  Str(MySessionNum) + " AND logType=2 AND senderID=" + _
		  Format(Val("&H" + feed), "0") + ";"
		  // logType=2 ==> MQTT Meshtastic
		  LogEvents "ExportMQTT", cmd
		  rs = MySensordb.SelectSQL(cmd)
		  If rs.RowCount = 0 Then
		    LogEvents "ExportMQTT", "Nothing to export yet for !" + feed
		    MessageBox "Nothing to export yet for !" + feed + ": no telemetry received in this session."
		    Return
		  End If
		  
		  title = "Session_" + MySessionID
		  fg = New FolderItem(title)
		  If Not fg.Exists Then fg.CreateFolder()
		  title = "MQTT_" + feed + ".csv"
		  fi = fg.Child(title)
		  If fi.Exists Then fi.Remove()
		  tos = tos.Create(fi)
		  rs.MoveToFirstRow()
		  t.Add "timestamp"
		  t.Add "fromID"
		  t.Add "senderID"
		  t.Add "rssi"
		  t.Add "snr"
		  Dim pl As JSONItem
		  Dim s As String
		  s = rs.Column("payload").StringValue
		  s = s.ReplaceAllBytes("'", """")
		  pl = New JSONItem(s)
		  For Each K As String in pl.Keys
		    t.Add K
		  Next
		  header = Join(t, ";")
		  tos.WriteLine header
		  While Not rs.AfterLastRow
		    Redim t(-1)
		    Dim dt As New DateTime(rs.Column("timestamp").IntegerValue)
		    t.Add dt.SQLDateTime
		    // Node ids as !aabbccdd (8 lowercase hex digits)
		    s = "00000000" + Hex(rs.Column("fromID").IntegerValue)
		    t.Add "!" + s.Lowercase.RightBytes(8)
		    s = "00000000" + Hex(rs.Column("senderID").IntegerValue)
		    t.Add "!" + s.Lowercase.RightBytes(8)
		    // -255: no radio values (e.g. the gateway's own packets): an empty cell
		    If rs.Column("rssi").IntegerValue = -255 Then
		      t.Add ""
		    Else
		      t.Add rs.Column("rssi").StringValue
		    End If
		    If rs.Column("snr").DoubleValue = -255 Then
		      t.Add ""
		    Else
		      t.Add rs.Column("snr").StringValue
		    End If
		    // This row's own payload (the header's keys come from the first row)
		    Dim rowPL As JSONItem
		    Try
		      rowPL = New JSONItem(rs.Column("payload").StringValue.ReplaceAllBytes("'", """"))
		    Catch e As JSONException
		      rowPL = New JSONItem
		    End Try
		    For Each K As String in pl.Keys
		      If rowPL.HasKey(K) Then
		        t.Add Format(rowPL.Value(K).DoubleValue, "0.00")
		      Else
		        t.Add ""
		      End If
		    Next
		    header = Join(t, ";")
		    tos.WriteLine header
		    rs.MoveToNextRow
		  Wend
		  
		  tos.Flush()
		  tos = Nil
		  LogEvents "ExportMQTT", "Exported successfuly file " + fi.NativePath
		  MessageBox "Exported successfuly file " + fi.NativePath
		  
		  title = "MQTT_" + feed + "_RSSISNR.png"
		  fi = fg.Child(title)
		  Dim p As Picture = w.SNRSSIchart.ToPicture
		  p.Save(fi, Picture.Formats.PNG, 100)
		  
		  title = "MQTT_" + feed + "_DHT.png"
		  fi = fg.Child(title)
		  p = w.TempRHchart.ToPicture
		  p.Save(fi, Picture.Formats.PNG, 100)
		  
		  title = "MQTT_" + feed + "_HPa.png"
		  fi = fg.Child(title)
		  p = w.HPaChart.ToPicture
		  p.Save(fi, Picture.Formats.PNG, 100)
		  
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
		  
		  MyFolder = New FolderItem("/tmp/Sensor_Dashboard")
		  If Not MyFolder.Exists Then MyFolder.CreateFolder()
		  MessageBox "My Folder" + EndOfLine + EndOfLine + _
		  MyFolder.NativePath
		  MySensordbFI = MyFolder.Child("records.sqlite")
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
		  // Exports this window's device: the session's AQI rows (logType 1) whose fromID is the device id,
		  // to Session_<id>/AQI_<device>.csv plus the four charts as PNG
		  Dim deviceNum As String = Format(Val("&H" + w.MyID), "0")
		  Dim cmd As String = "select * from telemetry where sessionID=" + Str(MySessionNum) + _
		  " AND logType=1 AND fromID=" + deviceNum + " ORDER BY timestamp;"
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
		  If fi.Exists Then fi.Remove()
		  Dim tos As TextOutputStream = TextOutputStream.Create(fi)
		  
		  // Columns: the time, then the payload keys of the first row (sen55_..., scd40_...)
		  rs.MoveToFirstRow()
		  Dim first As New JSONItem(rs.Column("payload").StringValue.ReplaceAllBytes("'", """"))
		  Dim t() As String
		  t.Add "timestamp"
		  For Each K As String In first.Keys
		    t.Add K
		  Next
		  tos.WriteLine Join(t, ";")
		  While Not rs.AfterLastRow
		    t.RemoveAll
		    Dim dt As New DateTime(rs.Column("timestamp").IntegerValue)
		    t.Add dt.SQLDateTime
		    Dim rowPL As JSONItem
		    Try
		      rowPL = New JSONItem(rs.Column("payload").StringValue.ReplaceAllBytes("'", """"))
		    Catch e As JSONException
		      rowPL = New JSONItem
		    End Try
		    For Each K As String In first.Keys
		      If rowPL.HasKey(K) Then
		        t.Add Format(rowPL.Value(K).DoubleValue, "0.00")
		      Else
		        t.Add ""
		      End If
		    Next
		    tos.WriteLine Join(t, ";")
		    rs.MoveToNextRow
		  Wend
		  tos.Close
		  LogEvents "ExportAQI", "Exported successfuly file " + fi.NativePath
		  MessageBox "Exported successfuly file " + fi.NativePath
		  
		  Dim p As Picture = w.TemperatureChart.ToPicture
		  p.Save(fg.Child("AQI_" + w.MyID + "_Temperature.png"), Picture.Formats.PNG, 100)
		  p = w.HumidityChart.ToPicture
		  p.Save(fg.Child("AQI_" + w.MyID + "_Humidity.png"), Picture.Formats.PNG, 100)
		  p = w.VOCO2chart.ToPicture
		  p.Save(fg.Child("AQI_" + w.MyID + "_VOC_CO2.png"), Picture.Formats.PNG, 100)
		  p = w.PMchart.ToPicture
		  p.Save(fg.Child("AQI_" + w.MyID + "_PM.png"), Picture.Formats.PNG, 100)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExportDevice(w As MeshtasticWindow)
		  // Exports this window's node: the session's rows of logType 3 (Meshtastic device) whose fromID is the
		  // node, to Session_<id>/DEV_<node>.csv plus the two charts as PNG
		  Dim feed As String = w.FeedID
		  Dim cmd As String = "select * from telemetry where sessionID=" + Str(MySessionNum) + _
		  " AND logType=3 AND fromID=" + Format(Val("&H" + feed), "0") + " ORDER BY timestamp;"
		  LogEvents "ExportDevice", cmd
		  Dim rs As RowSet = MySensordb.SelectSQL(cmd)
		  If rs.RowCount = 0 Then
		    LogEvents "ExportDevice", "Nothing to export yet for !" + feed
		    MessageBox "Nothing to export yet for !" + feed + ": no sensor reading received in this session."
		    Return
		  End If
		  
		  Dim fg As New FolderItem("Session_" + MySessionID)
		  If Not fg.Exists Then fg.CreateFolder()
		  Dim fi As FolderItem = fg.Child("DEV_" + feed + ".csv")
		  If fi.Exists Then fi.Remove()
		  Dim tos As TextOutputStream = TextOutputStream.Create(fi)
		  
		  // Columns: the time, the node, then the payload keys of the first row
		  rs.MoveToFirstRow()
		  Dim first As New JSONItem(rs.Column("payload").StringValue.ReplaceAllBytes("'", """"))
		  Dim t() As String
		  t.Add "timestamp"
		  t.Add "node"
		  For Each K As String In first.Keys
		    t.Add K
		  Next
		  tos.WriteLine Join(t, ";")
		  While Not rs.AfterLastRow
		    t.RemoveAll
		    Dim dt As New DateTime(rs.Column("timestamp").IntegerValue)
		    t.Add dt.SQLDateTime
		    t.Add "!" + feed
		    Dim rowPL As JSONItem
		    Try
		      rowPL = New JSONItem(rs.Column("payload").StringValue.ReplaceAllBytes("'", """"))
		    Catch e As JSONException
		      rowPL = New JSONItem
		    End Try
		    For Each K As String In first.Keys
		      If rowPL.HasKey(K) Then
		        t.Add Format(rowPL.Value(K).DoubleValue, "0.00")
		      Else
		        t.Add ""
		      End If
		    Next
		    tos.WriteLine Join(t, ";")
		    rs.MoveToNextRow
		  Wend
		  tos.Close
		  LogEvents "ExportDevice", "Exported successfuly file " + fi.NativePath
		  MessageBox "Exported successfuly file " + fi.NativePath
		  
		  Dim p As Picture = w.TempRHchart.ToPicture
		  p.Save(fg.Child("DEV_" + feed + "_DHT.png"), Picture.Formats.PNG, 100)
		  p = w.HPaChart.ToPicture
		  p.Save(fg.Child("DEV_" + feed + "_HPa.png"), Picture.Formats.PNG, 100)
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
