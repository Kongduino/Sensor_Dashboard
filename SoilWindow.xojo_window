#tag DesktopWindow
Begin DesktopWindow SoilWindow
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
   Height          =   520
   ImplicitInstance=   False
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   ""
   MenuBarVisible  =   False
   MinimumHeight   =   520
   MinimumWidth    =   760
   Resizeable      =   True
   Title           =   "Soil"
   Type            =   0
   Visible         =   True
   Width           =   760
   Begin DesktopPopupMenu pmSoilNode
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
      Width           =   376
   End
   Begin DesktopPopupMenu pmSoilMetric
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
      Left            =   408
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   -1
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   210
   End
   Begin DesktopButton btSoilExport
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
   Begin SensorChart SoilChart
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   416
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
   Begin DesktopLabel lbSoilStats
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   480
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
		  // Closing the window ends the feed; its row leaves the source list
		  MQTTClient1.Disconnect
		  Dim i As Integer = MySoilWindows.IndexOf(Self)
		  If i >= 0 Then
		    MySoilWindows.RemoveAt(i)
		    RemoveSourceRow("Soil", i)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  // An MQTT feed for soil readings (see Setup): one node and one metric at a time, from the database (Shared/SoilData)
		  FitControlsForLinux(Self) // taller controls on Linux
		  mUpdating = True
		  pmSoilMetric.RemoveAllRows
		  For i As Integer = 0 To SoilMetricCount - 1
		    pmSoilMetric.AddRow(SoilMetricName(i))
		  Next
		  pmSoilMetric.SelectedRowIndex = 0
		  mUpdating = False
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function CurrentNode() As Int64
		  // The node chosen in the popup, 0 when there is none
		  Dim i As Integer = pmSoilNode.SelectedRowIndex
		  If i < 0 Or i > mNodes.LastIndex Then Return 0
		  Return mNodes(i)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExportCSV()
		  // Every stored soil reading of the chosen node, into Session_<id>/ with the event log, like the other exports
		  Dim node As Int64 = CurrentNode
		  If node = 0 Then
		    MessageBox "No soil readings to export yet"
		    Return
		  End If
		  Dim nodeText As String = NodeLabel(node)
		  Try
		    Dim fg As New FolderItem("Session_" + MySessionID)
		    If Not fg.Exists Then fg.CreateFolder
		    Dim f As FolderItem = fg.Child("SOIL_" + nodeText.Middle(1) + "_" + Format(DateTime.Now.SecondsFrom1970, "0") + ".csv")
		    WriteSoilCSV(node, f)
		    MessageBox "Soil readings saved to " + f.NativePath
		  Catch e As RuntimeException
		    MessageBox "Couldn't write the file: " + e.Message
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FillNodes()
		  // The nodes that sent soil readings, the most recent first; the chosen one stays chosen
		  Dim chosen As Int64 = CurrentNode
		  mUpdating = True
		  pmSoilNode.RemoveAllRows
		  mNodes.RemoveAll
		  Dim rs As RowSet = SoilNodes(mGatewayNum)
		  If rs <> Nil Then
		    While Not rs.AfterLastRow
		      Dim num As Int64 = rs.Column("fromID").Int64Value
		      If mNodeFilter <> 0 And num <> mNodeFilter Then
		        rs.MoveToNextRow
		        Continue
		      End If
		      mNodes.Add(num)
		      Dim when As String = TimeLabel(rs.Column("lastTS").IntegerValue, False)
		      pmSoilNode.AddRow(NodeLabel(num) + "  (" + SampleCount(rs.Column("n").IntegerValue) + ", latest " + when + ")")
		      rs.MoveToNextRow
		    Wend
		  End If
		  If mNodes.Count = 0 Then
		    // With a node filter, say whose readings are awaited: the filter may be what hides the other nodes
		    pmSoilNode.AddRow(If(mNodeFilter <> 0, "No soil readings from " + NodeLabel(mNodeFilter) + " yet", "No soil readings yet"))
		    pmSoilNode.SelectedRowIndex = 0
		  Else
		    Dim i As Integer = mNodes.IndexOf(chosen)
		    pmSoilNode.SelectedRowIndex = If(i < 0, 0, i)
		  End If
		  pmSoilNode.Enabled = (mNodes.Count > 0)
		  btSoilExport.Enabled = (mNodes.Count > 0)
		  mUpdating = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlePacketJSON(jsonText As String)
		  // Soil readings of this feed (the followed node only, when filtered) are stored; SoilChanged then redraws every
		  // Soil window. Everything else is left to the MQTT window
		  Dim js As JSONItem
		  Try
		    js = New JSONItem(jsonText)
		  Catch e As JSONException
		    Return
		  End Try
		  If js.Lookup("type", "?").StringValue <> "telemetry" Then Return
		  If mNodeFilter <> 0 And js.Lookup("from", 0).UInt64Value <> mNodeFilter Then Return
		  Dim payload As JSONItem = js.Lookup("payload", Nil)
		  If Not HasSoilData(payload) Then Return
		  Dim TS As Integer = js.Lookup("timestamp", 0).IntegerValue
		  If TS <= 0 Then TS = DateTime.Now.SecondsFrom1970 // rx_time 0: the gateway has no clock
		  Dim fromID As String = js.Lookup("from", "?").StringValue
		  Dim senderID As String = Format(mGatewayNum, "0")
		  Dim hops, hopStart, relayNode As Integer
		  Dim viaMQTT As Boolean
		  MeshLastPacketRadio(hops, hopStart, relayNode, viaMQTT)
		  LogTelemetry(2, fromID, senderID, Str(TS), payload.ToString, js.Lookup("rssi", -255).DoubleValue, _
		  js.Lookup("snr", -255).DoubleValue, MySessionNum, hops, hopStart, relayNode, viaMQTT)
		  SoilChanged
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetStatus(status As String)
		  // Connection state in the title bar
		  Dim feed As String = mFeedID
		  If mNodeFilter <> 0 Then feed = NodeLabel(mNodeFilter) + " via " + mFeedID
		  Self.Title = "Soil (" + feed + ") - " + status + If(mTLS, " (TLS)", "")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Setup(UUID As String, broker As String, username As String, pwd As String, topic As String, keys As String = "", nodeFilter As String = "", tls As Boolean = False)
		  // The same feed as an MQTT window (<topic>/2/e/+/!<gateway>, see MQTTwindow.Setup), for its soil readings
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
		    LogEvents "SoilWindow Setup", "Keys ignored: " + problem
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
		  Dim clientID As String = "SDash-soil-" + UUID.Left(8) + "-" + Format(System.Random.InRange(0, 999999), "000000")
		  LogEvents "SoilWindow Setup", "Connecting to " + host + ":" + Str(port) + If(tls, " with TLS", "") + " as " + username + " (" + clientID + "), topic " + mTopic + _
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

	#tag Method, Flags = &h21
		Private Function NodeLabel(num As Int64) As String
		  // !aabbccdd
		  Dim hexText As String = "00000000" + Hex(num)
		  Return "!" + hexText.Right(8).Lowercase
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowChart()
		  // The chosen metric of the chosen node, from the database (both feeds, every session)
		  Dim metric As Integer = pmSoilMetric.SelectedRowIndex
		  If metric < 0 Then metric = 0
		  Dim node As Int64 = CurrentNode
		  Dim times(), values() As Double
		  If node <> 0 Then SoilSeries(node, metric, times, values)
		  Dim labels() As String
		  For Each t As Double In times
		    labels.Add(TimeLabel(t, True))
		  Next
		  Dim name As String = SoilMetricName(metric)
		  Dim unit As String = " " + SoilMetricUnit(metric)
		  StyleChart(SoilChart, name + "  (" + SampleCount(values.Count) + ")", SoilMetricFormat(metric))
		  SoilChart.AddLabels(labels)
		  SoilChart.AddTimes(times)
		  SoilChart.AddDataset(LineSet(name, SoilMetricColor(metric), values, unit))
		  SoilChart.Refresh
		  If node = 0 Then
		    lbSoilStats.Text = "Soil readings appear here when a node sends some through this feed"
		  Else
		    lbSoilStats.Text = StatsText(name, values, unit, SoilMetricFormat(metric)) + "      latest: " + SoilSummary(node)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SoilDataChanged()
		  // Called (through SoilChanged) when a window stored soil readings: maybe a new node, surely a new point
		  FillNodes
		  ShowChart
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mFallbackPSK As String = "AQ=="
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFeedID As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGatewayNum As Int64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNodeFilter As Int64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNodes() As Int64
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


#tag EndWindowCode

#tag Events MQTTClient1
	#tag Event
		Sub MQTTConnected(sessionPresent As Boolean)
		  #Pragma Unused sessionPresent
		  Dim packetID As Integer = MQTTClient1.Subscribe(mTopic)
		  LogEvents "SoilWindow", "Connected, subscribing to " + mTopic + " (packetID " + Str(packetID) + ")"
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
		  LogEvents "SoilWindow", "The broker refused the connection (code " + Str(reasonCode) + ")"
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
		  LogEvents "SoilWindow", "Attempt " + Str(attempt) + " in " + Str(delaySeconds) + " s (" + reason + ")"
		  SetStatus("reconnecting")
		End Sub
	#tag EndEvent
	#tag Event
		Sub ReconnectFailed(reason As String)
		  LogEvents "SoilWindow", "Gave up reconnecting (last error: " + reason + ")"
		  SetStatus("offline")
		End Sub
	#tag EndEvent
	#tag Event
		Sub SocketError(err As RuntimeException)
		  If MQTTClient1.IsReconnecting Then Return
		  LogEvents "SoilWindow", "Socket " + MQTTClient1.ErrorDescription(err)
		  SetStatus("error")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmSoilNode
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  If mUpdating Then Return
		  ShowChart
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmSoilMetric
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  If mUpdating Then Return
		  ShowChart
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btSoilExport
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
