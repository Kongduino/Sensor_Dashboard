#tag DesktopWindow
Begin DesktopWindow BatteryWindow
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
   ImplicitInstance=   False
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   ""
   MenuBarVisible  =   False
   MinimumHeight   =   560
   MinimumWidth    =   760
   Resizeable      =   True
   Title           =   "Battery"
   Type            =   0
   Visible         =   True
   Width           =   760
   Begin DesktopPopupMenu pmBatteryNode
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   -1
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   460
   End
   Begin DesktopButton btBatteryCopy
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Copy #define"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   492
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   126
   End
   Begin DesktopButton btBatteryExport
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Export CSV…"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   630
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   110
   End
   Begin SensorChart BatteryChart
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   428
      Index           =   -2147483648
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Title           =   ""
      Tooltip         =   ""
      Top             =   52
      Transparent     =   True
      Visible         =   True
      Width           =   720
   End
   Begin DesktopLabel lbBatteryCurve
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "Menlo"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   True
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   492
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   720
   End
   Begin DesktopLabel lbBatteryStats
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   520
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   720
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
		Sub Closing()
		  // Closing the window ends the feed (none for a device's Battery window); its row leaves the source list
		  If mFeedID <> "" Then MQTTClient1.Disconnect
		  Dim i As Integer = MyBatteryWindows.IndexOf(Self)
		  If i >= 0 Then
		    MyBatteryWindows.RemoveAt(i)
		    RemoveSourceRow("Battery", i)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  // An MQTT feed for device metrics (see Setup), and the battery curve of one node at a time, from every stored
		  // reading (this feed, the other feeds and the nodes' own links: Shared/BatteryCurve)
		  FitControlsForLinux(Self) // taller controls on Linux
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub BatteryDataChanged(node As Int64)
		  // Called (through BatteryChanged) when a window stored device metrics of node: maybe a new node, perhaps a new point
		  FillNodes
		  If node = CurrentNode Then ShowChart
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeviceNode() As Int64
		  // The connected node of a device's Battery window (SetupDevice), 0 for an MQTT feed's
		  Return mDeviceNode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CurrentNode() As Int64
		  // The node chosen in the popup, 0 when there is none
		  Dim i As Integer = pmBatteryNode.SelectedRowIndex
		  If i < 0 Or i > mNodes.LastIndex Then Return 0
		  Return mNodes(i)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExportCSV()
		  // The run shown (time, voltage, smoothed, charge left), into Session_<id>/ with the event log, like the other exports
		  Dim node As Int64 = CurrentNode
		  If node = 0 Or mFirst < 0 Then
		    MessageBox "No discharge run to export yet"
		    Return
		  End If
		  Dim nodeText As String = NodeLabel(node)
		  Try
		    Dim fg As New FolderItem("Session_" + MySessionID)
		    If Not fg.Exists Then fg.CreateFolder
		    Dim f As FolderItem = fg.Child("BATTERY_" + nodeText.Middle(1) + "_" + Format(DateTime.Now.SecondsFrom1970, "0") + ".csv")
		    WriteBatteryCSV(mTimes, mVolts, mSmooth, mFirst, mLast, f)
		    LogEvents "Export", "Exported " + nodeText + "'s discharge run to " + f.NativePath + " (" + mDefine + ")"
		    MessageBox "Discharge run saved to " + f.NativePath
		  Catch e As RuntimeException
		    LogEvents "Export", "Couldn't write the battery CSV: " + e.Message
		    MessageBox "Couldn't write the file: " + e.Message
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FillNodes()
		  // The nodes with stored device metrics, the most recent first; the chosen one stays chosen
		  Dim chosen As Int64 = CurrentNode
		  If chosen = 0 Then chosen = mDeviceNode // a device's window starts with the connected node
		  mUpdating = True
		  pmBatteryNode.RemoveAllRows
		  mNodes.RemoveAll
		  Dim rs As RowSet = BatteryNodes
		  If rs <> Nil Then
		    While Not rs.AfterLastRow
		      Dim num As Int64 = rs.Column("fromID").Int64Value
		      If mNodeFilter <> 0 And num <> mNodeFilter Then
		        rs.MoveToNextRow
		        Continue
		      End If
		      mNodes.Add(num)
		      Dim when As String = TimeLabel(rs.Column("last").IntegerValue, False)
		      pmBatteryNode.AddRow(NodeLabel(num) + "  (" + SampleCount(rs.Column("readings").IntegerValue) + ", latest " + when + ")")
		      rs.MoveToNextRow
		    Wend
		  End If
		  If mNodes.Count = 0 Then
		    // With a node filter, say whose readings are awaited: the filter may be what hides the other nodes
		    pmBatteryNode.AddRow(If(mNodeFilter <> 0, "No device metrics from " + NodeLabel(mNodeFilter) + " yet", "No device metrics yet"))
		    pmBatteryNode.SelectedRowIndex = 0
		  Else
		    Dim i As Integer = mNodes.IndexOf(chosen)
		    pmBatteryNode.SelectedRowIndex = If(i < 0, 0, i)
		  End If
		  pmBatteryNode.Enabled = (mNodes.Count > 0)
		  mUpdating = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlePacketJSON(jsonText As String)
		  // Device metrics of this feed (the followed node only, when filtered) are stored (logType 4); BatteryChanged then
		  // updates every Battery window. Everything else is left to the MQTT window
		  Dim js As JSONItem
		  Try
		    js = New JSONItem(jsonText)
		  Catch e As JSONException
		    Return
		  End Try
		  If js.Lookup("type", "?").StringValue <> "telemetry" Then Return
		  Dim fromNum As Int64 = js.Lookup("from", 0).UInt64Value
		  If mNodeFilter <> 0 And fromNum <> mNodeFilter Then Return
		  Dim payload As JSONItem = js.Lookup("payload", Nil)
		  If Not IsDeviceMetrics(payload) Then Return
		  Dim TS As Integer = js.Lookup("timestamp", 0).IntegerValue
		  If TS <= 0 Then TS = DateTime.Now.SecondsFrom1970 // rx_time 0: the gateway has no clock
		  Dim hops, hopStart, relayNode As Integer
		  Dim viaMQTT As Boolean
		  MeshLastPacketRadio(hops, hopStart, relayNode, viaMQTT)
		  LogTelemetry(4, Format(fromNum, "0"), Format(mGatewayNum, "0"), Str(TS), payload.ToString, js.Lookup("rssi", -255).DoubleValue, _
		  js.Lookup("snr", -255).DoubleValue, MySessionNum, hops, hopStart, relayNode, viaMQTT)
		  BatteryChanged(fromNum)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function NodeLabel(num As Int64) As String
		  // !aabbccdd
		  Dim hexText As String = "00000000" + Hex(num)
		  Return "!" + hexText.Right(8).Lowercase
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetStatus(status As String)
		  // Connection state in the title bar
		  Dim feed As String = mFeedID
		  If mNodeFilter <> 0 Then feed = NodeLabel(mNodeFilter) + " via " + mFeedID
		  Self.Title = "Battery (" + feed + ") - " + status + If(mTLS, " (TLS)", "")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Setup(UUID As String, broker As String, username As String, pwd As String, topic As String, keys As String = "", nodeFilter As String = "", tls As Boolean = False)
		  // The same feed as an MQTT window (<topic>/2/e/+/!<gateway>, see MQTTwindow.Setup), for its device metrics
		  Dim names(), psks() As String
		  Dim fallback, problem As String
		  If ParseChannelKeys(keys, names, psks, fallback, problem) Then
		    mFallbackPSK = fallback
		    For i As Integer = 0 To names.LastIndex
		      MeshEnsureChannels
		      Call MeshAddChannel(names(i), psks(i))
		    Next
		  Else
		    mFallbackPSK = "AQ=="
		    LogEvents "BatteryWindow Setup", "Keys ignored: " + problem
		  End If
		  If UUID.LeftBytes(1) = "!" Then UUID = UUID.MiddleBytes(1)
		  UUID = UUID.Lowercase
		  mFeedID = UUID
		  mGatewayNum = Val("&H" + UUID)
		  mTopic = topic + "/2/e/+/!" + UUID
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
		  // A client id of its own: a broker drops a connection when another one (an MQTT window of the same feed) uses it
		  Dim clientID As String = "SDash-batt-" + UUID.Left(8) + "-" + Format(System.Random.InRange(0, 999999), "000000")
		  LogEvents "BatteryWindow Setup", "Connecting to " + host + ":" + Str(port) + If(tls, " with TLS", "") + " as " + username + " (" + clientID + "), topic " + mTopic + _
		  If(mNodeFilter <> 0, ", node " + NodeLabel(mNodeFilter) + " only", "")
		  SetStatus("connecting")
		  MQTTClient1.SetCredentials(username, pwd)
		  MQTTClient1.SetTLS(tls)
		  MQTTClient1.SetAutoReconnect(True, 60, 86400)
		  MQTTClient1.Connect(host, port, clientID)
		  FillNodes
		  ShowChart
		  Self.Show()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetupDevice(node As Int64, sourceText As String)
		  // A Battery window for a node connected through the device tab: no feed of its own, the device window stores the
		  // device metrics (logType 5). Every node with readings is listed, the connected one first chosen
		  mDeviceNode = node
		  Self.Title = "Battery (" + sourceText + ")"
		  LogEvents "BatteryWindow Setup", "Device " + sourceText
		  FillNodes
		  ShowChart
		  Self.Show()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowChart()
		  // The chosen node's voltage: its latest discharge run when there is one (measured, smoothed, and the firmware's
		  // generic curve over the same time for comparison), otherwise every reading on battery; the curve below
		  Dim node As Int64 = CurrentNode
		  mTimes.RemoveAll
		  mVolts.RemoveAll
		  mFirst = -1
		  mLast = -1
		  mDefine = ""
		  If node <> 0 Then LoadReadings(node, mTimes, mVolts)
		  mSmooth = Smoothed(mVolts, BatteryCurve.kSmoothWidth)
		  Dim first, last As Integer // FindRun's ByRef results: properties can't be passed ByRef
		  Dim hasRun As Boolean = FindRun(mTimes, mSmooth, first, last)
		  If hasRun Then
		    mFirst = first
		    mLast = last
		  End If
		  Dim lo As Integer = If(hasRun, mFirst, 0)
		  Dim hi As Integer = If(hasRun, mLast, mTimes.LastIndex)

		  // New arrays each time: the chart keeps them by reference
		  Dim times(), measured(), smooth(), generic() As Double
		  Dim labels() As String
		  Dim genericMV() As Integer = GenericMillivolts
		  For i As Integer = lo To hi
		    times.Add(mTimes(i))
		    labels.Add(TimeLabel(mTimes(i), False))
		    measured.Add(mVolts(i))
		    smooth.Add(mSmooth(i))
		    If hasRun Then generic.Add(VoltsAtPercent(genericMV, PercentAt(mTimes, mFirst, mLast, i)))
		  Next
		  mChartTimes = times
		  mChartLabels = labels
		  mChartMeasured = measured
		  mChartSmooth = smooth
		  mChartGeneric = generic

		  Dim what As String = If(hasRun, "discharge run", "voltage on battery")
		  StyleChart(BatteryChart, If(node = 0, "Battery", NodeLabel(node) + " " + what) + "  (" + SampleCount(measured.Count) + ")", "0.00")
		  BatteryChart.AddLabels(mChartLabels)
		  BatteryChart.AddTimes(mChartTimes)
		  BatteryChart.AddDataset(LineSet("Smoothed", "rssi", mChartSmooth, " V"))
		  BatteryChart.AddDataset(LineSet("Measured", "snr", mChartMeasured, " V", False))
		  If hasRun Then BatteryChart.AddDataset(LineSet("Generic Li-ion", "temperature", mChartGeneric, " V", False))
		  BatteryChart.Refresh

		  If node = 0 Then
		    lbBatteryCurve.Text = ""
		    lbBatteryStats.Text = "Battery readings appear here when a node sends device metrics (through this feed or a node's own link)"
		  ElseIf Not hasRun Then
		    lbBatteryCurve.Text = "No discharge run yet: it needs " + Str(BatteryCurve.kMinReadings) + " readings on battery without a long gap"
		    lbBatteryStats.Text = If(measured.Count = 0, "No readings on battery (on external power, or no voltage measured)", _
		    StatsText("Voltage", measured, " V", "0.000"))
		  Else
		    mDefine = OCVDefine(CurveMillivolts(mTimes, mSmooth, mFirst, mLast))
		    lbBatteryCurve.Text = mDefine
		    Dim minutes As Integer = (mTimes(mLast) - mTimes(mFirst)) \ 60
		    Dim runText As String = "Run: " + TimeLabel(mTimes(mFirst), False) + " to " + TimeLabel(mTimes(mLast), False) + ", " + _
		    Str(minutes \ 60) + " h " + Format(minutes Mod 60, "00") + " min, " + SampleCount(mLast - mFirst + 1) + ", " + _
		    FormatValue(mSmooth(mFirst), "0.000") + " V to " + FormatValue(mSmooth(mLast), "0.000") + " V"
		    // Still sending: the last reading isn't where the node shut down yet, so the lower values will change
		    If DateTime.Now.SecondsFrom1970 - mTimes(mLast) <= RunGap(mTimes) Then runText = runText + "  ·  still running: 0% not final"
		    lbBatteryStats.Text = runText
		  End If
		  btBatteryCopy.Enabled = (mDefine <> "")
		  btBatteryExport.Enabled = (mDefine <> "")
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mChartGeneric() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChartLabels() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChartMeasured() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChartSmooth() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChartTimes() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDefine As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDeviceNode As Int64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFallbackPSK As String = "AQ=="
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFeedID As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFirst As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGatewayNum As Int64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLast As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNodeFilter As Int64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNodes() As Int64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSmooth() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTimes() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTLS As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTopic As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUpdating As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVolts() As Double
	#tag EndProperty


#tag EndWindowCode

#tag Events MQTTClient1
	#tag Event
		Sub MQTTConnected(sessionPresent As Boolean)
		  #Pragma Unused sessionPresent
		  Dim packetID As Integer = MQTTClient1.Subscribe(mTopic)
		  LogEvents "BatteryWindow", "Connected, subscribing to " + mTopic + " (packetID " + Str(packetID) + ")"
		  SetStatus("connected")
		End Sub
	#tag EndEvent
	#tag Event
		Sub MessageReceived(topic As String, payload As String, qos As Integer, retained As Boolean)
		  #Pragma Unused qos
		  #Pragma Unused retained
		  // <root>/2/e/<channel>/!<gateway>: a channel without a key of its own gets the fallback key (see MQTTwindow)
		  Dim parts() As String = topic.Split("/")
		  If parts.Count >= 2 Then
		    Dim channelName As String = parts(parts.LastIndex - 1)
		    MeshEnsureChannels
		    If channelName <> "PKI" And MeshChannelIndex(channelName) < 0 Then Call MeshAddChannel(channelName, mFallbackPSK)
		  End If
		  Dim jsonText, packetKey As String
		  Dim summary As String = MeshPacketSummary(payload, jsonText, packetKey)
		  If summary = "" Or jsonText = "" Then Return
		  HandlePacketJSON(jsonText)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MQTTConnectionRefused(reasonCode As Integer)
		  LogEvents "BatteryWindow", "The broker refused the connection (code " + Str(reasonCode) + ")"
		  SetStatus("refused (code " + Str(reasonCode) + ")")
		End Sub
	#tag EndEvent
	#tag Event
		Sub MQTTDisconnected()
		  SetStatus("disconnected")
		End Sub
	#tag EndEvent
	#tag Event
		Sub Reconnecting(attempt As Integer, delaySeconds As Integer, reason As String)
		  LogEvents "BatteryWindow", "Attempt " + Str(attempt) + " in " + Str(delaySeconds) + " s (" + reason + ")"
		  SetStatus("reconnecting")
		End Sub
	#tag EndEvent
	#tag Event
		Sub ReconnectFailed(reason As String)
		  LogEvents "BatteryWindow", "Gave up reconnecting (last error: " + reason + ")"
		  SetStatus("offline")
		End Sub
	#tag EndEvent
	#tag Event
		Sub SocketError(err As RuntimeException)
		  If MQTTClient1.IsReconnecting Then Return
		  LogEvents "BatteryWindow", "Socket " + MQTTClient1.ErrorDescription(err)
		  SetStatus("error")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmBatteryNode
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  If mUpdating Then Return
		  ShowChart
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btBatteryCopy
	#tag Event
		Sub Pressed()
		  // The OCV_ARRAY line, ready for a firmware variant.h
		  If mDefine = "" Then Return
		  Dim c As New Clipboard
		  c.Text = mDefine
		  c.Close
		  LogEvents "BatteryWindow", "Copied: " + mDefine
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btBatteryExport
	#tag Event
		Sub Pressed()
		  ExportCSV
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
