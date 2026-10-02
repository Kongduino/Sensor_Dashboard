#tag DesktopWindow
Begin DesktopWindow M5AQIwindow
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
   Height          =   528
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
   Begin DesktopTabPanel TabPanel1
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   488
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
      TabDefinition   =   "Temperature\rHumidity\rVOCO2\rPM"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Value           =   2
      Visible         =   True
      Width           =   788
      Begin DesktopChart TemperatureChart
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowPopover    =   True
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF
         Bold            =   False
         DoubleBuffer    =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   11.0
         FontUnit        =   0
         GridColor       =   &ca6a6a6
         HasLegend       =   True
         Height          =   430
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mode            =   0
         Scope           =   "0"
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextColor       =   &c000000
         Title           =   ""
         Tooltip         =   ""
         Top             =   58
         Underline       =   False
         Visible         =   True
         Width           =   748
      End
      Begin DesktopChart HumidityChart
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowPopover    =   True
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF
         Bold            =   False
         DoubleBuffer    =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   11.0
         FontUnit        =   0
         GridColor       =   &ca6a6a6
         HasLegend       =   True
         Height          =   430
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mode            =   0
         Scope           =   "0"
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextColor       =   &c000000
         Title           =   ""
         Tooltip         =   ""
         Top             =   58
         Underline       =   False
         Visible         =   True
         Width           =   748
      End
      Begin DesktopChart VOCO2chart
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowPopover    =   True
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF
         Bold            =   False
         DoubleBuffer    =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   11.0
         FontUnit        =   0
         GridColor       =   &ca6a6a6
         HasLegend       =   True
         Height          =   430
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mode            =   0
         Scope           =   "0"
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         TextColor       =   &c000000
         Title           =   ""
         Tooltip         =   ""
         Top             =   58
         Underline       =   False
         Visible         =   True
         Width           =   748
      End
      Begin DesktopChart PMchart
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowPopover    =   True
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF
         Bold            =   False
         DoubleBuffer    =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   11.0
         FontUnit        =   0
         GridColor       =   &ca6a6a6
         HasLegend       =   True
         Height          =   430
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mode            =   0
         Scope           =   "0"
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         TextColor       =   &c000000
         Title           =   ""
         Tooltip         =   ""
         Top             =   58
         Underline       =   False
         Visible         =   True
         Width           =   748
      End
      Begin DesktopLabel laAverageVOC
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
         Text            =   "AverageVOC"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   488
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   183
      End
      Begin DesktopLabel laAverageCO2
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
         Left            =   235
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "AverageCO2"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   488
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   183
      End
      Begin DesktopLabel laAverageTemp40
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
         Left            =   235
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "AverageTemp40"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   488
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   183
      End
      Begin DesktopLabel laAverageTemp55
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
         Text            =   "AverageTemp55"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   488
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   183
      End
   End
   Begin Timer DataAcquisitionTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   600000
      RunMode         =   2
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Closing()
		  DataAcquisitionTimer.RunMode = Timer.RunModes.Off
		  If mConnection <> Nil Then
		    RemoveHandler mConnection.ContentReceived, WeakAddressOf HandleContent
		    RemoveHandler mConnection.Error, WeakAddressOf HandleError
		    mConnection.Disconnect
		    mConnection = Nil
		  End If
		  // Off the source list (a window whose first reading failed isn't on it)
		  Dim i As Integer = MyAQIwindows.IndexOf(Self)
		  If i >= 0 Then
		    MyAQIwindows.RemoveAt(i)
		    RemoveSourceRow("M5AQI", i)
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub Setup()
		  // Called once the first sample has arrived (see HandleContent)
		  LogEvents "M5AQIwindow", MyID + " Start!"
		  Self.Title = nickname + " (" + MyID + ")"
		  // Poll every minute (or at the device's interval if shorter): a sample is only added when
		  // updateTime changes, so each new reading shows up within a minute
		  DataAcquisitionTimer.Period = Min(periodicity, 60) * 1000
		  
		  UpdateData()
		  Self.Show()
		  
		  Dim sen55TempDataset As New ChartLinearDataset( _
		  "SEn55", New ColorGroup(Color.Red, Color.Orange), _
		  True, SEN55temperature)
		  sen55TempDataset.ChartType = ChartLinearDataset.ChartTypes.Bar
		  
		  Dim scd40TempDataset As New ChartLinearDataset( _
		  "SCD40", New ColorGroup(Color.Blue, Color.White), _
		  True, SCD40temperature)
		  scd40TempDataset.ChartType = ChartLinearDataset.ChartTypes.Bar
		  
		  TemperatureChart.Title = "Temperature"
		  TemperatureChart.Mode = DesktopChart.Modes.Bar
		  TemperatureChart.GridColor = Color.Clear
		  TemperatureChart.AddLabels TemperatureLabels
		  TemperatureChart.AddDatasets sen55TempDataset, scd40TempDataset
		  
		  Dim sen55HumidDataset As New ChartLinearDataset( _
		  "SEN55", new ColorGroup(Color.Blue, Color.White), _
		  True, SEN55humidity)
		  sen55HumidDataset.ChartType = ChartLinearDataset.ChartTypes.Bar
		  
		  Dim SCD40humidityDataset As New ChartLinearDataset( _
		  "SCD40", new ColorGroup(Color.Red, Color.Orange), _
		  True, SCD40humidity)
		  SCD40humidityDataset.ChartType = ChartLinearDataset.ChartTypes.Bar
		  
		  HumidityChart.Title = "Humidity"
		  HumidityChart.Mode = DesktopChart.Modes.Bar
		  'HumidityChart.GridColor = Color.Clear
		  HumidityChart.AddDatasets sen55HumidDataset, SCD40humidityDataset
		  HumidityChart.AddLabels TemperatureLabels
		  
		  Dim vocDataset As New ChartLinearDataset( _
		  "VOC", New ColorGroup(Color.Red, Color.Orange), _
		  True, SEN55voc)
		  vocDataset.ChartType = ChartLinearDataset.ChartTypes.Bar
		  
		  Dim co2Dataset As New ChartLinearDataset( _
		  "CO2", New ColorGroup(Color.Blue, Color.White), _
		  True, SCD40CO2)
		  co2Dataset.ChartType = ChartLinearDataset.ChartTypes.Bar
		  VOCO2chart.Title = "PM VOC"
		  VOCO2chart.Mode = DesktopChart.Modes.Bar
		  VOCO2chart.GridColor = Color.Clear
		  VOCO2chart.AddDatasets vocDataset, co2Dataset
		  VOCO2chart.AddLabels TemperatureLabels
		  
		  Dim pm1Dataset As New ChartLinearDataset( _
		  "PM 1.0", New ColorGroup(Color.Red, Color.Orange), _
		  True, SEN55PM1)
		  pm1Dataset.ChartType = ChartLinearDataset.ChartTypes.Bar
		  
		  Dim pm2Dataset As New ChartLinearDataset( _
		  "PM 2.5", New ColorGroup(Color.Blue, Color.White), _
		  True, SEN55PM2)
		  pm2Dataset.ChartType = ChartLinearDataset.ChartTypes.Bar
		  
		  Dim pm10Dataset As New ChartLinearDataset( _
		  "PM 10.0", New ColorGroup(Color.Gray, Color.LightGray), _
		  True, SEN55PM10)
		  pm10Dataset.ChartType = ChartLinearDataset.ChartTypes.Bar
		  
		  Dim pm4Dataset As New ChartLinearDataset( _
		  "PM 4.0", New ColorGroup(Color.Green, Color.White), _
		  True, SEN55PM4)
		  pm4Dataset.ChartType = ChartLinearDataset.ChartTypes.Bar
		  PMchart.Title = "PM"
		  PMchart.Mode = DesktopChart.Modes.Bar
		  PMchart.GridColor = Color.Clear
		  PMchart.AddDatasets pm1Dataset, pm2Dataset, pm4Dataset, pm10Dataset
		  PMchart.AddLabels TemperatureLabels
		  
		  TemperatureChart.Refresh()
		  HumidityChart.Refresh()
		  VOCO2chart.Refresh()
		  PMchart.Refresh()
		  DataAcquisitionTimer.RunMode = Timer.RunModes.Multiple
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateData()
		  Dim sen55, scd40 As JSONItem
		  Dim pm1, pm2, pm4, pm10, sen55RH, sen55Temp, sen55VOCdata As Double
		  Dim scd40RH, scd40Temp, scd40CO2data As Double
		  
		  sen55 = Values.Lookup("sen55", Nil)
		  scd40 = Values.Lookup("scd40", Nil)
		  
		  sen55Temp = sen55.Lookup("temperature", -255.0).DoubleValue
		  sen55RH = sen55.Lookup("humidity", -255.0).DoubleValue
		  sen55VOCdata = sen55.Lookup("voc", -255.0).DoubleValue
		  pm1 = sen55.Lookup("pm1.0", -255.0).DoubleValue
		  pm2 = sen55.Lookup("pm2.5", -255.0).DoubleValue
		  pm4 = sen55.Lookup("pm4.0", -255.0).DoubleValue
		  pm10 = sen55.Lookup("pm10.0", -255.0).DoubleValue
		  
		  scd40Temp = scd40.Lookup("temperature", -255.0).DoubleValue
		  scd40RH = scd40.Lookup("humidity", -255.0).DoubleValue
		  scd40CO2data = scd40.Lookup("co2", -255.0).DoubleValue
		  
		  SEN55Humidity.Add sen55RH
		  scd40Humidity.Add scd40RH
		  SEN55temperature.Add sen55Temp
		  SCD40temperature.Add scd40Temp
		  SEN55voc.Add sen55VOCdata
		  scd40CO2.Add scd40CO2data
		  SEN55PM1.Add pm1
		  SEN55PM2.Add pm2
		  SEN55PM4.Add pm4
		  SEN55PM10.Add pm10
		  
		  // Label: the time of the reading (updateTime, seconds since 1970) as HH:MM
		  Dim d As New DateTime(updateTime.Val())
		  TemperatureLabels.Add Format(d.Hour, "00") + ":" + Format(d.Minute, "00")
		  mLastUpdateTime = updateTime
		  
		  // Keep the last kMaxSamples samples: drop the oldest ones
		  While TemperatureLabels.Count > kMaxSamples
		    TemperatureLabels.RemoveAt(0)
		    SEN55temperature.RemoveAt(0)
		    SCD40temperature.RemoveAt(0)
		    SEN55humidity.RemoveAt(0)
		    SCD40humidity.RemoveAt(0)
		    SEN55voc.RemoveAt(0)
		    SCD40CO2.RemoveAt(0)
		    SEN55PM1.RemoveAt(0)
		    SEN55PM2.RemoveAt(0)
		    SEN55PM4.RemoveAt(0)
		    SEN55PM10.RemoveAt(0)
		  Wend
		  // One label set is enough
		  TemperatureChart.RemoveAllLabels()
		  TemperatureChart.AddLabels TemperatureLabels
		  HumidityChart.RemoveAllLabels()
		  HumidityChart.AddLabels TemperatureLabels
		  VOCO2chart.RemoveAllLabels()
		  VOCO2chart.AddLabels TemperatureLabels
		  PMchart.RemoveAllLabels()
		  PMchart.AddLabels TemperatureLabels
		  
		  LogEvents "M5AQIwindow", "SEN55 T°: " + Str(sen55Temp)
		  LogEvents "M5AQIwindow", "SCD40 T°: " + Str(scd40Temp)
		  LogEvents "M5AQIwindow", "SEN55 H%: " + Str(sen55RH)
		  LogEvents "M5AQIwindow", "SCD40 H%: " + Str(scd40RH)
		  LogEvents "M5AQIwindow", "SEN55 VOC: " + Str(sen55VOCdata)
		  LogEvents "M5AQIwindow", "SCD40 CO2: " + Str(scd40CO2data)
		  LogEvents "M5AQIwindow", "SEN55 PM1.0: " + Str(pm1)
		  LogEvents "M5AQIwindow", "SEN55 PM2.5: " + Str(pm2)
		  LogEvents "M5AQIwindow", "SEN55 PM4.0: " + Str(pm4)
		  LogEvents "M5AQIwindow", "SEN55 PM10.0: " + Str(pm10)
		  
		  laAverageCO2.Text = "x̄ CO₂: " + Format(MeanOf(SCD40CO2), "-0.000")
		  laAverageVOC.Text = "x̄ VOC: " + Format(MeanOf(SEN55voc), "-0.000")
		  laAverageTemp55.Text = "x̄ SEN55: " + Format(MeanOf(SEN55temperature), "-0.000")
		  laAverageTemp40.Text = "x̄ SCD40: " + Format(MeanOf(SCD40temperature), "-0.000")
		  
		  // SQLite (logType 1 = M5 AQI): fromID and senderID are the device id as a number, the payload
		  // the readings with flat keys (sen55_temperature, scd40_co2, ...); no radio, so rssi/snr -255
		  Dim pl As New JSONItem
		  For Each k As String In sen55.Keys
		    pl.Value("sen55_" + k) = sen55.Value(k)
		  Next
		  For Each k As String In scd40.Keys
		    pl.Value("scd40_" + k) = scd40.Value(k)
		  Next
		  Dim deviceNum As String = Format(Val("&H" + MyID), "0")
		  LogTelemetry(1, deviceNum, deviceNum, updateTime, pl.ToString, -255, -255, MySessionNum)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start(ID As String)
		  // Starts following the device: fetches its first sample in the background. On success the window
		  // sets itself up, shows itself and calls SetupWindow.AddAQISource; on failure it reports and closes
		  MyID = ID
		  DataAcquisitionTimer.RunMode = Timer.RunModes.Off
		  mConnection = New URLConnection
		  AddHandler mConnection.ContentReceived, WeakAddressOf HandleContent
		  AddHandler mConnection.Error, WeakAddressOf HandleError
		  Fetch()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Fetch()
		  // One GET of the device's latest data (replaces curl in AirQ_json_parse.sh)
		  If mBusy Or mConnection = Nil Then Return
		  mBusy = True
		  mConnection.Send("GET", kAQIURL.Replace("$1", MyID))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleContent(sender As URLConnection, URL As String, HTTPStatus As Integer, content As String)
		  mBusy = False
		  If HTTPStatus <> 200 Then
		    ReportProblem("HTTP status " + Str(HTTPStatus))
		    Return
		  End If
		  Dim problem As String
		  If Not ParseAQIResponse(content, Self, problem) Then
		    ReportProblem(problem)
		    Return
		  End If
		  
		  If Not mStarted Then
		    mStarted = True
		    Setup()
		    SetupWindow.AddAQISource(Self)
		    Return
		  End If
		  
		  If updateTime = mLastUpdateTime Then Return // no new reading since the last poll
		  UpdateData()
		  TemperatureChart.Refresh()
		  HumidityChart.Refresh()
		  VOCO2chart.Refresh()
		  PMchart.Refresh()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleError(sender As URLConnection, e As RuntimeException)
		  mBusy = False
		  ReportProblem("network error: " + e.Message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReportProblem(problem As String)
		  // Before the first sample: tell the user and give up. Afterwards: log it and retry at the next poll
		  LogEvents "M5AQIwindow", MyID + ": " + problem
		  If mStarted Then Return
		  MessageBox "Error!" + EndOfLine + EndOfLine + "Couldn't read the data of " + MyID + ": " + problem
		  Self.Close
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		HumidityLabels() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		MyID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		nickname As String
	#tag EndProperty

	#tag Property, Flags = &h0
		periodicity As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PMLabels() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		SCD40CO2() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		SCD40humidity() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		SCD40temperature() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		SEN55humidity() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		SEN55PM1() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		SEN55PM10() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		SEN55PM2() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		SEN55PM4() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		SEN55temperature() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		SEN55voc() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		TemperatureLabels() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		updateTime As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Values As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h0
		VOCLabels() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBusy As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mConnection As URLConnection
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastUpdateTime As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStarted As Boolean
	#tag EndProperty


	#tag Constant, Name = kAQIURL, Type = String, Dynamic = False, Default = \"https://ezdata2.m5stack.com/api/v2/$1/dataMacByKey/raw", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMaxSamples, Type = Double, Dynamic = False, Default = \"100", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events laAverageVOC
	#tag Event
		Sub Opening()
		  Me.Text = ""
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events laAverageCO2
	#tag Event
		Sub Opening()
		  Me.Text = ""
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events laAverageTemp40
	#tag Event
		Sub Opening()
		  Me.Text = ""
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events laAverageTemp55
	#tag Event
		Sub Opening()
		  Me.Text = ""
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DataAcquisitionTimer
	#tag Event
		Sub Action()
		  Fetch() // the answer is handled in HandleContent
		  
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
		Name="MyID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="nickname"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="periodicity"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="updateTime"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
