#tag DesktopWindow
Begin DesktopWindow MQTTwindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   HasTitleBar     =   True
   Height          =   560
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   ""
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Untitled"
   Type            =   0
   Visible         =   False
   Width           =   828
   Begin DesktopLabel laLatest
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   15.0
      FontUnit        =   0
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   True
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Waiting for the first reading…"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   "The latest values"
      Top             =   12
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   788
   End
   Begin DesktopTabPanel TabPanel1
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   504
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "Temperature\rHumidity\rPressure\rRSSI / SNR"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   44
      Transparent     =   False
      Underline       =   False
      Value           =   0
      Visible         =   True
      Width           =   788
      Begin SensorChart TempChart
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         Enabled         =   True
         Height          =   400
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   82
         Transparent     =   False
         Visible         =   True
         Width           =   748
      End
      Begin SensorChart RHChart
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         Enabled         =   True
         Height          =   400
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   82
         Transparent     =   False
         Visible         =   True
         Width           =   748
      End
      Begin SensorChart SNRSSIchart
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         Enabled         =   True
         Height          =   400
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         Tooltip         =   ""
         Top             =   82
         Transparent     =   False
         Visible         =   True
         Width           =   748
      End
      Begin DesktopLabel laAverageRH
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "AverageRH%"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   490
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   748
      End
      Begin DesktopLabel laAverageTemp
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "AverageT°"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   490
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   748
      End
      Begin DesktopLabel laAverageRSSI
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   4
         TabStop         =   True
         Text            =   "AverageRSSI"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   490
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   360
      End
      Begin DesktopLabel laAverageSNR
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   420
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   4
         TabStop         =   True
         Text            =   "AverageSNR"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   490
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   368
      End
      Begin SensorChart HPaChart
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         Enabled         =   True
         Height          =   400
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Tooltip         =   ""
         Top             =   82
         Transparent     =   False
         Visible         =   True
         Width           =   748
      End
      Begin DesktopLabel laAverageHPa
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "AverageHPa"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   490
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   748
      End
   End
   Begin MQTTClient MQTTClient1
      Address         =   ""
      BytesAvailable  =   0
      BytesLeftToSend =   0
      CertificatePassword=   ""
      Index           =   -2147483648
      InitialParent   =   ""
      LastErrorCode   =   0
      LockedInPosition=   False
      Port            =   0
      Scope           =   0
      SSLConnected    =   False
      SSLConnecting   =   False
      SSLConnectionType=   5
      SSLEnabled      =   False
      TabPanelIndex   =   0
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  FitControlsForLinux(Self) // taller controls on Linux
		End Sub
	#tag EndEvent

	#tag Event
		Sub Closing()
		  // Closing the window ends the feed (the Python process used to end with its Shell)
		  MQTTClient1.Disconnect
		  // Off the source list
		  Dim i As Integer = MyMQTTwindows.IndexOf(Self)
		  If i >= 0 Then
		    MyMQTTwindows.RemoveAt(i)
		    RemoveSourceRow("MQTT", i)
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function NodeFilterNum() As UInt32
		  // The one node this feed follows, 0 for every node of the gateway
		  Return mNodeFilter
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FeedID() As String
		  // The gateway id this window follows, as 8 lowercase hex digits without "!"
		  Return mFeedID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlePacketJSON(jsonText As String)
		  // jsonText: one packet as JSON, exactly as mqtt-converter (and the former Python script) produce it
		  Dim js As JSONItem
		  Try
		    js = New JSONItem(jsonText)
		  Catch e As JSONException
		    LogEvents "MQTTwindow", "Bad JSON: " + e.Message
		    Return
		  End Try
		  
		  Dim type As String
		  type = js.Lookup("type", "?")
		  If type = "telemetry" Then
		    // A feed of one node: the other nodes' readings are left out
		    If mNodeFilter <> 0 And js.Lookup("from", 0).UInt64Value <> mNodeFilter Then Return
		    Dim rssi, snr, temp, rh, pa As Double
		    Dim payload As JSONItem
		    Dim TS As Integer
		    Dim fromID, senderID As String
		    rssi = js.Lookup("rssi", -255).DoubleValue
		    snr = js.Lookup("snr", -255).DoubleValue
		    TS = js.Lookup("timestamp", 0).IntegerValue
		    If TS <= 0 Then TS = DateTime.Now.SecondsFrom1970 // rx_time 0: the gateway has no clock
		    fromID = js.Lookup("from", "?").StringValue
		    senderID = js.Lookup("sender", "?").StringValue
		    If senderID <> "?" Then
		      senderID = senderID.ReplaceBytes("!", "&H")
		      senderID = Format(Val(senderID), "0") // all digits: Str() of a Double gives 1.867777e+9
		    End If
		    payload = js.Lookup("payload", Nil)
		    // Sensor readings only (environment telemetry): device metrics (battery, voltage...) are neither
		    // charted, RSSI / SNR included, nor stored, as in the Meshtastic window
		    If payload <> Nil And payload.HasKey("temperature") Then
		      temp = payload.Lookup("temperature", -255).DoubleValue
		      rh = payload.Lookup("relative_humidity", -255).DoubleValue
		      pa = payload.Lookup("barometric_pressure", -255).DoubleValue
		      updateData(rssi, snr, temp, rh, pa, TS)
		      TempChart.Refresh()
		      RHChart.Refresh()
		      HPaChart.Refresh()
		      SNRSSIchart.Refresh()
		      LogTelemetry(2, fromID, senderID, Str(TS), payload.ToString, rssi, snr, MySessionNum)
		    End If
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadHistory()
		  // Earlier readings of this feed (its gateway, and its node if filtered) from the database, so the charts
		  // start with the recent past; the time axis shows the gap until the first live reading
		  Dim nodeArg As Int64 = -1
		  If mNodeFilter <> 0 Then nodeArg = mNodeFilter
		  Dim gatewayArg As Int64 = Val("&H" + mFeedID)
		  Dim rs As RowSet = HistoryRows(2, nodeArg, gatewayArg)
		  If rs = Nil Then Return
		  Dim n As Integer
		  mLoadingHistory = True
		  While Not rs.AfterLastRow
		    Dim pl As JSONItem
		    Try
		      pl = New JSONItem(rs.Column("payload").StringValue.ReplaceAllBytes("'", """"))
		    Catch e As JSONException
		      pl = Nil
		    End Try
		    If pl <> Nil And pl.HasKey("temperature") Then
		      updateData(rs.Column("rssi").DoubleValue, rs.Column("snr").DoubleValue, pl.Lookup("temperature", -255).DoubleValue, _
		      pl.Lookup("relative_humidity", -255).DoubleValue, pl.Lookup("barometric_pressure", -255).DoubleValue, rs.Column("timestamp").IntegerValue)
		      n = n + 1
		    End If
		    rs.MoveToNextRow
		  Wend
		  mLoadingHistory = False
		  LogEvents "MQTTwindow", "History: " + Str(n) + " earlier reading(s) loaded"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetStatus(status As String)
		  // Connection state in the title bar
		  Dim feed As String = mFeedID
		  If mNodeFilter <> 0 Then
		    Dim h As String = "00000000" + Hex(mNodeFilter)
		    feed = "!" + h.RightBytes(8).Lowercase + " via " + mFeedID
		  End If
		  Self.Title = "MQTT Feed (" + feed + ") - " + status + If(mTLS, " (TLS)", "")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Setup(UUID As String, broker As String, username As String, pwd As String, topic As String, keys As String = "", nodeFilter As String = "", tls As Boolean = False)
		  // Same feed as the former meshtastic_protobuf_to_json.py: <topic>/2/e/+/!<gateway id>, on port 1883
		  // without TLS. broker can also be "host:port". keys: see ParseChannelKeys (empty: AQ== on every channel)
		  Dim names(), psks() As String
		  Dim fallback, problem As String
		  If ParseChannelKeys(keys, names, psks, fallback, problem) Then
		    mFallbackPSK = fallback
		    For i As Integer = 0 To names.LastIndex
		      MeshEnsureChannels
		      Call MeshAddChannel(names(i), psks(i))
		      LogEvents "MQTTwindow Setup", "Channel " + names(i) + " with its own key"
		    Next
		    If mFallbackPSK <> "AQ==" Then LogEvents "MQTTwindow Setup", "Other channels: the key given without a channel name"
		  Else
		    mFallbackPSK = "AQ=="
		    LogEvents "MQTTwindow Setup", "Keys ignored: " + problem
		  End If
		  
		  If UUID.LeftBytes(1) = "!" Then UUID = UUID.MiddleBytes(1)
		  UUID = UUID.Lowercase
		  mFeedID = UUID
		  mTopic = topic + "/2/e/+/!" + UUID
		  // Optional: one node only (8 hex digits, checked by the Setup window)
		  If nodeFilter <> "" Then mNodeFilter = Val("&H" + nodeFilter)
		  mTLS = tls
		  
		  Dim host As String = broker
		  Dim port As Integer = If(tls, 8883, 1883)
		  Dim colon As Integer = broker.IndexOf(":")
		  If colon > 0 Then
		    host = broker.Left(colon)
		    port = Val(broker.Middle(colon + 1))
		    If port <= 0 Then port = If(tls, 8883, 1883)
		  End If
		  
		  // A client id of its own for each window: a broker drops a connection when another one uses the same id
		  Dim clientID As String = "SDash-" + UUID.Left(8) + "-" + Format(System.Random.InRange(0, 999999), "000000")
		  LogEvents "MQTTwindow Setup", "Connecting to " + host + ":" + Str(port) + If(tls, " with TLS", "") + " as " + username + " (" + clientID + "), topic " + mTopic + If(mNodeFilter <> 0, ", node !" + nodeFilter + " only", "")
		  SetStatus("connecting")
		  MQTTClient1.SetCredentials(username, pwd)
		  // TLS encrypts the connection, but Xojo's SSLSocket doesn't verify the broker's certificate
		  MQTTClient1.SetTLS(tls)
		  MQTTClient1.SetAutoReconnect(True, 60, 86400) // like paho's loop_forever: keep trying (gives up after a day)
		  MQTTClient1.Connect(host, port, clientID)
		  
		  
		  // Charts: one per quantity, so each gets a Y axis fitted to its own values (see ChartLook)
		  StyleChart(TempChart, "Temperature", "0.0")
		  TempChart.AddLabels dhtLabels
		  TempChart.AddTimes dhtTimes
		  TempChart.AddDataset LineSet("Temperature", "temperature", myTemp, " °C")
		  
		  StyleChart(RHChart, "Humidity", "0.0")
		  RHChart.AddLabels dhtLabels
		  RHChart.AddTimes dhtTimes
		  RHChart.AddDataset LineSet("Relative humidity", "humidity", myRH, " %")
		  
		  StyleChart(HPaChart, "Pressure", "0.0")
		  HPaChart.AddLabels paLabels
		  HPaChart.AddTimes dhtTimes
		  HPaChart.AddDataset LineSet("Pressure", "pressure", myPA, " hPa")
		  
		  StyleChart(SNRSSIchart, "RSSI / SNR", "0.0")
		  SNRSSIchart.AddLabels snrLabels
		  SNRSSIchart.AddTimes snrTimes
		  SNRSSIchart.AddDatasets LineSet("RSSI", "rssi", myRSSI, " dBm"), LineSet("SNR", "snr", mySNR, " dB")
		  
		  LoadHistory
		  Self.Show()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updateData(rssi As Double, snr As Double, temp As Double, rh As Double, pa As Double, TS As Integer)
		  // One telemetry sample; -255 marks a value the packet didn't have
		  Dim d As New DateTime(TS)
		  Dim tsmp As String = TimeLabel(TS, True)
		  If rh <> -255 And temp <> -255 And pa <> -255 Then
		    dhtLabels.Add tsmp
		    dhtTimes.Add TS
		    myRH.Add rh
		    myTemp.Add temp
		    paLabels.Add tsmp
		    myPA.Add pa
		    
		    If Not mLoadingHistory Then LogEvents "MQTTwindow UpdateData", "TS: " + Str(TS)
		    If Not mLoadingHistory Then LogEvents "MQTTwindow UpdateData", "T°: " + Str(temp)
		    If Not mLoadingHistory Then LogEvents "MQTTwindow UpdateData", "RH: " + Str(rh)
		    If Not mLoadingHistory Then LogEvents "MQTTwindow UpdateData", "PA: " + Str(pa)
		  Else
		    If Not mLoadingHistory Then LogEvents "MQTTwindow UpdateData", "Incomplete DHT Data!"
		  End If
		  
		  If snr <> -255 And rssi <> -255 Then
		    snrLabels.Add tsmp
		    snrTimes.Add TS
		    If Not mLoadingHistory Then LogEvents "MQTTwindow UpdateData", "RSSI: " + Str(rssi)
		    If Not mLoadingHistory Then LogEvents "MQTTwindow UpdateData", "SNR: " + Str(snr)
		    myRSSI.Add rssi
		    mySNR.Add snr
		  Else
		    If Not mLoadingHistory Then LogEvents "MQTTwindow UpdateData", "Incomplete RSSI/SNR Data!" + EndOfLine
		  End If
		  
		  // Keep the last kMaxSamples samples: drop the oldest ones
		  While dhtLabels.Count > kMaxSamples
		    dhtLabels.RemoveAt(0)
		    dhtTimes.RemoveAt(0)
		    myRH.RemoveAt(0)
		    myTemp.RemoveAt(0)
		    paLabels.RemoveAt(0)
		    myPA.RemoveAt(0)
		  Wend
		  While snrLabels.Count > kMaxSamples
		    snrLabels.RemoveAt(0)
		    snrTimes.RemoveAt(0)
		    myRSSI.RemoveAt(0)
		    mySNR.RemoveAt(0)
		  Wend
		  
		  TempChart.RemoveAllLabels()
		  TempChart.AddLabels dhtLabels
		  RHChart.RemoveAllLabels()
		  RHChart.AddLabels dhtLabels
		  SNRSSIchart.RemoveAllLabels()
		  SNRSSIchart.AddLabels snrLabels
		  HPaChart.RemoveAllLabels()
		  HPaChart.AddLabels paLabels
		  
		  laAverageTemp.Text = StatsText("Temperature", myTemp, " °C", "-0.0")
		  laAverageRH.Text = StatsText("Humidity", myRH, " %", "0.0")
		  laAverageHPa.Text = StatsText("Pressure", myPA, " hPa", "0.0")
		  laAverageRSSI.Text = StatsText("RSSI", myRSSI, " dBm", "-0")
		  laAverageSNR.Text = StatsText("SNR", mySNR, " dB", "-0.0")
		  TempChart.Title = "Temperature  (" + SampleCount(myTemp.Count) + ")"
		  RHChart.Title = "Humidity  (" + SampleCount(myRH.Count) + ")"
		  HPaChart.Title = "Pressure  (" + SampleCount(myPA.Count) + ")"
		  SNRSSIchart.Title = "RSSI / SNR  (" + SampleCount(myRSSI.Count) + ")"
		  
		  // The latest values at a glance
		  Dim parts() As String
		  If myTemp.Count > 0 Then
		    parts.Add Format(LastOf(myTemp), "-0.0") + " °C"
		    parts.Add Format(LastOf(myRH), "0.0") + " %"
		    parts.Add Format(LastOf(myPA), "0.0") + " hPa"
		  End If
		  If myRSSI.Count > 0 Then
		    parts.Add "RSSI " + Format(LastOf(myRSSI), "-0") + " dBm"
		    parts.Add "SNR " + Format(LastOf(mySNR), "-0.0") + " dB"
		  End If
		  If parts.Count > 0 Then laLatest.Text = Join(parts, "   ·   ") + "      " + tsmp
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		dhtLabels() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private dhtTimes() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private snrTimes() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFallbackPSK As String = "AQ=="
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFeedID As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLoadingHistory As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNodeFilter As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTLS As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTopic As String
	#tag EndProperty

	#tag Property, Flags = &h0
		myPA() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		myRH() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		myRSSI() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		mySNR() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		myTemp() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		paLabels() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		snrLabels() As String
	#tag EndProperty


	#tag Constant, Name = kMaxSamples, Type = Double, Dynamic = False, Default = \"100", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events laAverageRH
	#tag Event
		Sub Opening()
		  Me.Text = ""
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events laAverageTemp
	#tag Event
		Sub Opening()
		  Me.Text = ""
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events laAverageRSSI
	#tag Event
		Sub Opening()
		  Me.Text = ""
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events laAverageSNR
	#tag Event
		Sub Opening()
		  Me.Text = ""
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events laAverageHPa
	#tag Event
		Sub Opening()
		  Me.Text = ""
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MQTTClient1
	#tag Event
		Sub MQTTConnected(sessionPresent As Boolean)
		  // Every (re)connection subscribes again (clean session)
		  Dim packetID As Integer = MQTTClient1.Subscribe(mTopic)
		  LogEvents "MQTTwindow", "Connected, subscribing to " + mTopic + " (packetID " + Str(packetID) + ")"
		  SetStatus("connected")
		End Sub
	#tag EndEvent
	#tag Event
		Sub MessageReceived(topic As String, payload As String, qos As Integer, retained As Boolean)
		  // <root>/2/e/<channel>/!<gateway>: a channel without a key of its own (Keys field) gets the fallback key,
		  // AQ== unless a key without a channel name was given (as --psk did in the former script)
		  Dim parts() As String = topic.Split("/")
		  If parts.Count >= 2 Then
		    Dim channelName As String = parts(parts.LastIndex - 1)
		    MeshEnsureChannels
		    If channelName <> "PKI" And MeshChannelIndex(channelName) < 0 Then
		      Call MeshAddChannel(channelName, mFallbackPSK)
		      If mFallbackPSK = "AQ==" Then
		        LogEvents "MQTTwindow", "Channel " + channelName + " added with the default key"
		      Else
		        LogEvents "MQTTwindow", "Channel " + channelName + " added with the key given without a channel name"
		      End If
		    End If
		  End If
		  
		  Dim jsonText, packetKey As String
		  Dim summary As String = MeshPacketSummary(payload, jsonText, packetKey)
		  If summary = "" Then
		    LogEvents "MQTTwindow", topic + ": not a Meshtastic packet (" + Str(payload.Bytes) + " bytes)"
		    Return
		  End If
		  LogEvents "MQTTwindow", summary
		  If jsonText <> "" Then
		    LogEvents "MQTTwindow", "json_data: " + jsonText
		    HandlePacketJSON(jsonText)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MQTTConnectionRefused(reasonCode As Integer)
		  // CONNACK return codes of MQTT 3.1.1
		  Dim reason As String
		  Select Case reasonCode
		  Case 1
		    reason = "unacceptable protocol version"
		  Case 2
		    reason = "client identifier rejected"
		  Case 3
		    reason = "server unavailable"
		  Case 4
		    reason = "bad username or password"
		  Case 5
		    reason = "not authorized"
		  Else
		    reason = "unknown reason"
		  End Select
		  LogEvents "MQTTwindow", "The broker refused the connection: " + reason + " (code " + Str(reasonCode) + ")"
		  SetStatus("refused: " + reason)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MQTTDisconnected()
		  If MQTTClient1.IsReconnecting Then Return // reported by Reconnecting
		  LogEvents "MQTTwindow", "Disconnected from the broker"
		  SetStatus("disconnected")
		End Sub
	#tag EndEvent
	#tag Event
		Sub Reconnecting(attempt As Integer, delaySeconds As Integer, reason As String)
		  LogEvents "MQTTwindow", "Attempt " + Str(attempt) + " in " + Str(delaySeconds) + " s (" + reason + ")"
		  SetStatus("reconnecting")
		End Sub
	#tag EndEvent
	#tag Event
		Sub ReconnectFailed(reason As String)
		  LogEvents "MQTTwindow", "Gave up reconnecting (last error: " + reason + ")"
		  SetStatus("offline")
		End Sub
	#tag EndEvent
	#tag Event
		Sub SocketError(err As RuntimeException)
		  // While a reconnection is pending, Reconnecting reports the error
		  If MQTTClient1.IsReconnecting Then Return
		  LogEvents "MQTTwindow", "Socket " + MQTTClient1.ErrorDescription(err)
		  SetStatus("error")
		End Sub
	#tag EndEvent
	#tag Event
		Sub Trace(message As String)
		  LogEvents "MQTTClient", message
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasTitleBar"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
