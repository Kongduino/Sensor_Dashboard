#tag DesktopWindow
Begin DesktopWindow MeshtasticWindow
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
      Width           =   340
   End
   Begin DesktopTextField tfNodeFilter
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   "Filter nodes"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   368
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   "Shows only the nodes whose name, short name or id contain this text (e.g. 6870 or !e771)"
      Top             =   12
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   110
   End
   Begin DesktopPopupMenu pmChartNode
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   484
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   -1
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Whose sensor to chart: the connected node, or another node it knows"
      Top             =   12
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   216
   End
   Begin DesktopButton btRequest
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Request now"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   708
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Ask the selected node for its environment readings now (through the connected node)"
      Top             =   12
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
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
      Scope           =   "0"
      SmallTabs       =   False
      TabDefinition   =   "Temperature\rHumidity\rPressure\rMap"
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
         Scope           =   "0"
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
         Scope           =   "0"
         TabIndex        =   0
         TabPanelIndex   =   2
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
         Scope           =   "0"
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
         Scope           =   "0"
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
         Scope           =   "0"
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
         Scope           =   "0"
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
      Begin MapView PositionMap
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
         Scope           =   "0"
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         Tooltip         =   ""
         Top             =   82
         Transparent     =   False
         Visible         =   True
         Width           =   748
      End
      Begin DesktopLabel laPositions
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
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   4
         TabStop         =   True
         Text            =   ""
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
		  If mTimeout <> Nil Then mTimeout.RunMode = Timer.RunModes.Off
		  If mRetry <> Nil Then mRetry.RunMode = Timer.RunModes.Off
		  DropLink
		  // Off the source list (a window that never connected isn't on it)
		  Dim i As Integer = MyMeshtasticWindows.IndexOf(Self)
		  If i >= 0 Then
		    MyMeshtasticWindows.RemoveAt(i)
		    RemoveSourceRow("Meshtastic", i)
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub CreateLink()
		  DropLink
		  mLink = New MeshDeviceLink
		  AddHandler mLink.ConfigComplete, WeakAddressOf LinkConfigComplete
		  AddHandler mLink.LinkClosed, WeakAddressOf LinkClosed
		  AddHandler mLink.LogLine, WeakAddressOf LinkLogLine
		  AddHandler mLink.PacketReceived, WeakAddressOf LinkPacketReceived
		  If mUseSerial Then
		    mLink.ConnectSerial(mDevice)
		  Else
		    mLink.ConnectTCP(mHost, mPort)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DropLink()
		  If mLink = Nil Then Return
		  RemoveHandler mLink.ConfigComplete, WeakAddressOf LinkConfigComplete
		  RemoveHandler mLink.LinkClosed, WeakAddressOf LinkClosed
		  RemoveHandler mLink.LogLine, WeakAddressOf LinkLogLine
		  RemoveHandler mLink.PacketReceived, WeakAddressOf LinkPacketReceived
		  mLink.Close
		  mLink = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FeedID() As String
		  // The charted node (the connected one unless another is selected) as 8 lowercase hex digits without "!":
		  // what Export Data exports
		  Dim h As String = "00000000" + Hex(mChartNode)
		  Return h.RightBytes(8).Lowercase
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlePacketJSON(jsonText As String)
		  // Environment telemetry (sensor readings) of any node is stored; the selected node's is charted
		  Dim js As JSONItem
		  Try
		    js = New JSONItem(jsonText)
		  Catch e As JSONException
		    LogSource("Bad JSON: " + e.Message)
		    Return
		  End Try
		  If js.Lookup("type", "?").StringValue = "position" Then
		    HandlePosition(js)
		    Return
		  End If
		  If js.Lookup("type", "?").StringValue <> "telemetry" Then Return
		  Dim payload As JSONItem = js.Lookup("payload", Nil)
		  If payload = Nil Or Not payload.HasKey("temperature") Then Return // device metrics, not the sensor
		  Dim fromNum As UInt32 = js.Lookup("from", 0).UInt64Value
		  
		  Dim TS As Integer = js.Lookup("timestamp", 0).IntegerValue
		  If TS <= 0 Then TS = DateTime.Now.SecondsFrom1970 // own packets may have no rx_time
		  
		  // SQLite: logType 3 = Meshtastic device, fromID the node that measured, senderID the connected node.
		  // At each connection the device replays the last packet of every node: stored once per node and time
		  Dim key As String = Str(fromNum)
		  If mLastStored = Nil Then mLastStored = New Dictionary
		  If TS > mLastStored.Lookup(key, 0).IntegerValue Then
		    mLastStored.Value(key) = TS
		    // With the radio values and hops of the packet as the connected node received it (none for its own)
		    Dim hops, hopStart, relayNode As Integer
		    Dim viaMQTT As Boolean
		    MeshLastPacketRadio(hops, hopStart, relayNode, viaMQTT) // how this packet reached the gateway / node
		    LogTelemetry(3, Format(fromNum, "0"), Format(mMyNum, "0"), Str(TS), payload.ToString, _
		    js.Lookup("rssi", -255).DoubleValue, js.Lookup("snr", -255).DoubleValue, MySessionNum, hops, hopStart, relayNode, viaMQTT)
		  End If
		  
		  If fromNum <> mChartNode Then Return
		  Dim temp As Double = payload.Lookup("temperature", -255).DoubleValue
		  Dim rh As Double = payload.Lookup("relative_humidity", -255).DoubleValue
		  Dim pa As Double = payload.Lookup("barometric_pressure", -255).DoubleValue
		  updateData(temp, rh, pa, TS)
		  TempChart.Refresh()
		  RHChart.Refresh()
		  HPaChart.Refresh()
		  If mRequested = fromNum And Not mRequestedPosition Then
		    mRequested = 0
		    SetStatus("reading received")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LinkClosed(sender As MeshDeviceLink, reason As String)
		  LogSource("connection closed (" + reason + ")")
		  If Not mStarted Then
		    ReportFailure(reason)
		    Return
		  End If
		  // Running: try again every 30 s (a node rebooting or leaving WiFi for a while)
		  SetStatus("disconnected, retrying")
		  If mRetry = Nil Then
		    mRetry = New Timer
		    AddHandler mRetry.Action, WeakAddressOf RetryAction
		  End If
		  mRetry.Period = 30000
		  mRetry.RunMode = Timer.RunModes.Single
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LinkConfigComplete(sender As MeshDeviceLink)
		  If mTimeout <> Nil Then mTimeout.RunMode = Timer.RunModes.Off
		  mMyNum = sender.MyNodeNum
		  NodeID = sender.MyNodeID
		  Owner = sender.LongName
		  LogSource("connected to " + NodeID + " """ + Owner + """ (" + sender.ShortName + ")")
		  If mStarted Then
		    SetStatus("connected")
		    FillNodeMenu(sender) // the node may know new nodes since
		    Return
		  End If
		  // One window per node: the node has a single queue towards its clients, so two connections
		  // would split its packets between them
		  For Each other As MeshtasticWindow In MyMeshtasticWindows
		    If other <> Self And other.NodeID = NodeID Then
		      LogSource(NodeID + " is already followed via " + other.SourceName + ": this connection is closed")
		      If mTimeout <> Nil Then mTimeout.RunMode = Timer.RunModes.Off
		      DropLink
		      MessageBox NodeID + " """ + Owner + """ is already followed via " + other.SourceName + "." + EndOfLine + EndOfLine + _
		      "A node sends its packets to one client at a time: two windows would share its readings."
		      other.Show()
		      Self.Close
		      Return
		    End If
		  Next
		  
		  mStarted = True
		  SetupCharts
		  mChartNode = mMyNum
		  FillNodeMenu(sender)
		  LoadHistory
		  SetStatus("connected")
		  Self.Show()
		  SetupWindow.AddDeviceSource(Self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LinkLogLine(sender As MeshDeviceLink, text As String)
		  LogEvents "MeshDevice[" + mSourceName + "]", text
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LinkPacketReceived(sender As MeshDeviceLink, envelope As String)
		  Dim jsonText, packetKey As String
		  Dim summary As String = MeshPacketSummary(envelope, jsonText, packetKey)
		  If summary = "" Then Return
		  LogSource(summary)
		  // An ACK / NAK for our telemetry request: NO_RESPONSE means the node has nothing to answer with
		  Dim requestID, routeFrom, routeTo As UInt32
		  Dim errorCode As Integer
		  If MeshTakeRouting(requestID, routeFrom, routeTo, errorCode) Then
		    If requestID = mRequestID And mRequestID <> 0 And errorCode <> 0 Then
		      mRequested = 0
		      SetStatus(If(mRequestedPosition, "position", "readings") + " from " + NodeLabel(mChartNode) + ": " + MeshRoutingErrorName(errorCode))
		      LogSource(If(mRequestedPosition, "Position", "Telemetry") + " request " + Str(requestID) + " to " + NodeLabel(mChartNode) + ": " + MeshRoutingErrorName(errorCode))
		    End If
		  End If
		  If jsonText <> "" Then
		    LogSource("json_data: " + jsonText)
		    HandlePacketJSON(jsonText)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LogSource(txt As String)
		  // Event log lines of this window, tagged with its connection (host:port or serial port)
		  LogEvents "Meshtastic[" + mSourceName + "]", txt
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ApplyNodeFilter()
		  // The node menu: "Own sensor" first, then the nodes matching the filter field (name, short name or id,
		  // ignoring case). The charted node stays in the menu even when it doesn't match, so the selection holds
		  Dim filter As String = tfNodeFilter.Text.Trim.Lowercase
		  mMenuNodes.RemoveAll
		  mSuppressMenu = True
		  pmChartNode.RemoveAllRows
		  pmChartNode.AddRow "Own sensor: " + Owner
		  mMenuNodes.Add mMyNum
		  Dim shown As Integer
		  For i As Integer = 0 To mAllNodeNums.LastIndex
		    If filter = "" Or mAllNodeSearch(i).IndexOf(filter) >= 0 Or mAllNodeNums(i) = mChartNode Then
		      pmChartNode.AddRow mAllNodeLabels(i)
		      mMenuNodes.Add mAllNodeNums(i)
		      If filter = "" Or mAllNodeSearch(i).IndexOf(filter) >= 0 Then shown = shown + 1
		    End If
		  Next
		  pmChartNode.SelectedRowIndex = Max(0, mMenuNodes.IndexOf(mChartNode))
		  mSuppressMenu = False
		  If filter = "" Then
		    pmChartNode.Tooltip = Str(mAllNodeNums.Count) + " nodes known by the connected node"
		  Else
		    pmChartNode.Tooltip = Str(shown) + " of " + Str(mAllNodeNums.Count) + " nodes match """ + tfNodeFilter.Text.Trim + """"
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlePosition(js As JSONItem)
		  // A node's GPS position: stored for any node (once per node and time, as the device replays the last
		  // packets at each connection), added to the track when it is the charted node
		  Dim ts, alt, precision, sats As Integer
		  Dim lat, lon As Double
		  If Not ParsePosition(js, ts, lat, lon, alt, precision, sats) Then Return // no fix
		  Dim fromNum As UInt32 = js.Lookup("from", 0).UInt64Value
		  // The radio values of this packet as the gateway / connected node received it (none for its own)
		  Dim rssi As Integer = js.Lookup("rssi", -255).IntegerValue
		  Dim snr As Double = js.Lookup("snr", -255).DoubleValue
		  Dim hops, hopStart, relayNode As Integer
		  Dim viaMQTT As Boolean
		  MeshLastPacketRadio(hops, hopStart, relayNode, viaMQTT) // how this packet reached the gateway / node
		  If mLastStoredPos = Nil Then mLastStoredPos = New Dictionary
		  Dim key As String = Str(fromNum)
		  If ts > mLastStoredPos.Lookup(key, 0).IntegerValue Then
		    mLastStoredPos.Value(key) = ts
		    LogPosition(fromNum, mMyNum, ts, lat, lon, alt, precision, sats, rssi, snr, hops, hopStart, relayNode, viaMQTT)
		  End If
		  If fromNum = mChartNode Then
		    Track.Add(ts, lat, lon, alt, precision, sats, rssi, snr, hops, viaMQTT)
		    LogSource("Position of " + NodeLabel(fromNum) + ": " + Track.Summary)
		    UpdateMap
		    If mRequested = fromNum And mRequestedPosition Then
		      mRequested = 0
		      SetStatus("position received")
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Track() As PositionTrack
		  // The followed node's positions (the Map tab)
		  If mTrack = Nil Then mTrack = New PositionTrack
		  Return mTrack
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateMap()
		  // The Map tab: the summary line, and the map redrawn (refitted) around the track
		  laPositions.Text = Track.Summary
		  PositionMap.Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function OnMapTab() As Boolean
		  // The Map tab is the last one
		  Return TabPanel1.SelectedPanelIndex = TabPanel1.PanelCount - 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClearCharts()
		  // Empties the sample arrays in place (the charts hold references to them)
		  dhtLabels.RemoveAll
		  dhtTimes.RemoveAll
		  myRH.RemoveAll
		  myTemp.RemoveAll
		  paLabels.RemoveAll
		  myPA.RemoveAll
		  laAverageTemp.Text = ""
		  laAverageRH.Text = ""
		  laAverageHPa.Text = ""
		  laLatest.Text = "Waiting for a reading…"
		  // The titles carry the sample count: reset too, or they keep the previous node's count
		  TempChart.Title = "Temperature  (" + SampleCount(0) + ")"
		  RHChart.Title = "Humidity  (" + SampleCount(0) + ")"
		  HPaChart.Title = "Pressure  (" + SampleCount(0) + ")"
		  TempChart.Refresh()
		  RHChart.Refresh()
		  HPaChart.Refresh()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FillNodeMenu(link As MeshDeviceLink)
		  // Every node the connected node knows, by name (the menu itself is built by ApplyNodeFilter)
		  Dim keys() As String
		  Dim nums() As UInt32
		  Dim labels() As String
		  Dim search() As String
		  For i As Integer = 0 To link.NodeCount - 1
		    If link.NodeNumAt(i) <> mMyNum Then
		      Dim nm As String = link.NodeLongNameAt(i)
		      If nm = "" Then nm = link.NodeShortNameAt(i)
		      Dim h As String = "00000000" + Hex(link.NodeNumAt(i))
		      Dim id As String = "!" + h.RightBytes(8).Lowercase
		      keys.Add nm.Lowercase
		      nums.Add link.NodeNumAt(i)
		      labels.Add nm + "  (" + id + ")"
		      Dim searchText As String = nm + " " + link.NodeShortNameAt(i) + " " + id
		      search.Add searchText.Lowercase
		    End If
		  Next
		  keys.SortWith(nums, labels, search)
		  mAllNodeNums = nums
		  mAllNodeLabels = labels
		  mAllNodeSearch = search
		  ApplyNodeFilter
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadHistory()
		  // Earlier readings of the charted node from the database (every session), so the charts start with the recent past
		  Dim nodeArg As Int64 = mChartNode
		  Dim rs As RowSet = HistoryRows(3, nodeArg, -1)
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
		      updateData(pl.Lookup("temperature", -255).DoubleValue, pl.Lookup("relative_humidity", -255).DoubleValue, _
		      pl.Lookup("barometric_pressure", -255).DoubleValue, rs.Column("timestamp").IntegerValue)
		      n = n + 1
		    End If
		    rs.MoveToNextRow
		  Wend
		  mLoadingHistory = False
		  TempChart.Refresh()
		  RHChart.Refresh()
		  HPaChart.Refresh()
		  LogSource("History of " + NodeLabel(mChartNode) + ": " + Str(n) + " earlier reading(s) loaded")
		  Track.Clear
		  Dim nPos As Integer = Track.LoadHistory(mChartNode)
		  LogSource("Positions of " + NodeLabel(mChartNode) + ": " + Str(nPos) + " stored, " + Track.Summary)
		  UpdateMap
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function NodeLabel(num As UInt32) As String
		  // "!aabbccdd", with the node's short name if the device knows it
		  Dim h As String = "00000000" + Hex(num)
		  Dim id As String = "!" + h.RightBytes(8).Lowercase
		  If mLink <> Nil Then
		    For i As Integer = 0 To mLink.NodeCount - 1
		      If mLink.NodeNumAt(i) = num And mLink.NodeShortNameAt(i) <> "" Then Return mLink.NodeShortNameAt(i) + " (" + id + ")"
		    Next
		  End If
		  Return id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReportFailure(reason As String)
		  // Before the first connection: tell the user and give up
		  If mTimeout <> Nil Then mTimeout.RunMode = Timer.RunModes.Off
		  DropLink
		  MessageBox "Error!" + EndOfLine + EndOfLine + "Couldn't connect to " + mSourceName + ": " + reason
		  Self.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RetryAction(sender As Timer)
		  LogSource("reconnecting")
		  SetStatus("reconnecting")
		  CreateLink
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetStatus(status As String)
		  Self.Title = "Node """ + Owner + """ (" + NodeID + ") via " + mSourceName + " - " + status + _
		  If(mChartNode <> 0 And mChartNode <> mMyNum, "  ·  charting " + NodeLabel(mChartNode), "")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetupCharts()
		  // One chart per quantity, so each gets a Y axis fitted to its own values (see ChartLook)
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
		  
		  PositionMap.Track = Track
		  
		  // Staggered below the other source windows
		  Dim n As Integer = MyMeshtasticWindows.Count + MyAQIwindows.Count + MyMQTTwindows.Count
		  Self.Left = n * 40
		  Self.Top = n * 40 + 60
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SourceName() As String
		  // host:port or the serial device's name
		  Return mSourceName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartSerial(device As SerialDevice)
		  // Connects in the background; on success the window shows itself and calls SetupWindow.AddDeviceSource,
		  // on failure it reports and closes
		  mUseSerial = True
		  mDevice = device
		  mSourceName = device.Name
		  Start
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartTCP(host As String, port As Integer = 4403)
		  // As StartSerial, over the node's TCP API (WiFi or Ethernet)
		  mUseSerial = False
		  mHost = host
		  mPort = port
		  mSourceName = host + ":" + Str(port)
		  Start
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Start()
		  LogSource("connecting")
		  // No configuration within 20 s: give up
		  mTimeout = New Timer
		  AddHandler mTimeout.Action, WeakAddressOf TimeoutAction
		  mTimeout.Period = 20000
		  mTimeout.RunMode = Timer.RunModes.Single
		  CreateLink
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TimeoutAction(sender As Timer)
		  If Not mStarted Then ReportFailure("no answer from the node within 20 s")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updateData(temp As Double, rh As Double, pa As Double, TS As Integer)
		  // One sample of the node's own sensor; -255 marks a value the packet didn't have
		  Dim d As New DateTime(TS)
		  Dim tsmp As String = TimeLabel(TS, True)
		  If rh <> -255 And temp <> -255 And pa <> -255 Then
		    dhtLabels.Add tsmp
		    dhtTimes.Add TS
		    myRH.Add rh
		    myTemp.Add temp
		    paLabels.Add tsmp
		    myPA.Add pa
		    If Not mLoadingHistory Then LogEvents "Meshtastic[" + mSourceName + "] UpdateData", "TS: " + Str(TS)
		    If Not mLoadingHistory Then LogEvents "Meshtastic[" + mSourceName + "] UpdateData", "T°: " + Str(temp)
		    If Not mLoadingHistory Then LogEvents "Meshtastic[" + mSourceName + "] UpdateData", "RH: " + Str(rh)
		    If Not mLoadingHistory Then LogEvents "Meshtastic[" + mSourceName + "] UpdateData", "PA: " + Str(pa)
		  Else
		    If Not mLoadingHistory Then LogEvents "Meshtastic[" + mSourceName + "] UpdateData", "Incomplete DHT Data!"
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
		  
		  TempChart.RemoveAllLabels()
		  TempChart.AddLabels dhtLabels
		  RHChart.RemoveAllLabels()
		  RHChart.AddLabels dhtLabels
		  HPaChart.RemoveAllLabels()
		  HPaChart.AddLabels paLabels
		  
		  laAverageTemp.Text = StatsText("Temperature", myTemp, " °C", "-0.0")
		  laAverageRH.Text = StatsText("Humidity", myRH, " %", "0.0")
		  laAverageHPa.Text = StatsText("Pressure", myPA, " hPa", "0.0")
		  TempChart.Title = "Temperature  (" + SampleCount(myTemp.Count) + ")"
		  RHChart.Title = "Humidity  (" + SampleCount(myRH.Count) + ")"
		  HPaChart.Title = "Pressure  (" + SampleCount(myPA.Count) + ")"
		  
		  // The latest values at a glance
		  If myTemp.Count > 0 Then
		    laLatest.Text = Format(LastOf(myTemp), "-0.0") + " °C   ·   " + Format(LastOf(myRH), "0.0") + " %   ·   " + _
		    Format(LastOf(myPA), "0.0") + " hPa      " + tsmp
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		dhtLabels() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private dhtTimes() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		myPA() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		myRH() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		myTemp() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		NodeID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Owner As String
	#tag EndProperty

	#tag Property, Flags = &h0
		paLabels() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDevice As SerialDevice
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHost As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLink As MeshDeviceLink
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMyNum As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPort As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRetry As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSourceName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStarted As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTimeout As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUseSerial As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAllNodeLabels() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAllNodeNums() As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAllNodeSearch() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChartNode As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastStoredPos As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTrack As PositionTrack
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastStored As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLoadingHistory As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMenuNodes() As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRequested As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRequestID As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRequestedPosition As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSuppressMenu As Boolean
	#tag EndProperty


	#tag Constant, Name = kMaxSamples, Type = Double, Dynamic = False, Default = \"100", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events tfNodeFilter
	#tag Event
		Sub TextChanged()
		  // Narrows the node menu as you type
		  ApplyNodeFilter
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmChartNode
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  // Another node to chart: its readings from the database, then live ones
		  If mSuppressMenu Or Me.SelectedRowIndex < 0 Or Me.SelectedRowIndex > mMenuNodes.LastIndex Then Return
		  If mMenuNodes(Me.SelectedRowIndex) = mChartNode Then Return
		  mChartNode = mMenuNodes(Me.SelectedRowIndex)
		  mRequested = 0
		  PositionMap.FitView // another node: its whole track
		  ClearCharts
		  LoadHistory
		  SetStatus("connected") // the title adds "charting <node>"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TabPanel1
	#tag Event
		Sub PanelChanged()
		  // Request now asks for what the tab shows
		  If OnMapTab Then
		    btRequest.Tooltip = "Ask the selected node for its GPS position now (through the connected node)"
		  Else
		    btRequest.Tooltip = "Ask the selected node for its environment readings now (through the connected node)"
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btRequest
	#tag Event
		Sub Pressed()
		  // The selected node, asked now through the connected node: its GPS position on the Map tab, its
		  // environment readings on the chart tabs
		  If mLink = Nil Or Not mLink.IsConfigured Then Return
		  mRequested = mChartNode
		  If OnMapTab Then
		    mRequestID = mLink.RequestPosition(mChartNode)
		    mRequestedPosition = True
		    LogSource("Position requested from " + NodeLabel(mChartNode) + " (packet " + Str(mRequestID) + ")")
		    SetStatus("position requested from " + NodeLabel(mChartNode))
		  Else
		    mRequestID = mLink.RequestTelemetry(mChartNode)
		    mRequestedPosition = False
		    LogSource("Telemetry requested from " + NodeLabel(mChartNode) + " (packet " + Str(mRequestID) + ")")
		    SetStatus("readings requested from " + NodeLabel(mChartNode))
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
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
#tag Events laAverageHPa
	#tag Event
		Sub Opening()
		  Me.Text = ""
		  
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
	#tag ViewProperty
		Name="Owner"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="NodeID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
