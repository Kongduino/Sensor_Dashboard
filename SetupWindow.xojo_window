#tag DesktopWindow
Begin DesktopWindow SetupWindow
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
   Height          =   432
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   432
   MaximumWidth    =   806
   MenuBar         =   1248274431
   MenuBarVisible  =   False
   MinimumHeight   =   432
   MinimumWidth    =   806
   Resizeable      =   True
   Title           =   "Setup"
   Type            =   0
   Visible         =   True
   Width           =   806
   Begin DesktopListBox lbDataSources
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   False
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   3
      ColumnWidths    =   "80,,0"
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   360
      Index           =   -2147483648
      InitialValue    =   "Type	Source"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   300
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopLabel Label1
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   False
      Text            =   "Data Sources"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   243
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   666
      RunMode         =   2
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin DesktopTabPanel TabPanel1
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   328
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   332
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "MQTT\rM5 AQI\rMeshtastic"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   84
      Transparent     =   False
      Underline       =   False
      Value           =   0
      Visible         =   True
      Width           =   454
      Begin DesktopLabel Label3
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
         Left            =   352
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Broker:"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   154
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   63
      End
      Begin DesktopLabel Label4
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
         Left            =   352
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Root topic:"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   186
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   77
      End
      Begin DesktopTextField tfMQTTSite
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
         Hint            =   "mqtt.example.com or host:port"
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   441
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   154
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   251
      End
      Begin DesktopTextField tfMQTTTopic
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
         Hint            =   "msh/EU_868"
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   441
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   186
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   251
      End
      Begin DesktopButton btAddMQTT
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Add"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   704
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   380
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   62
      End
      Begin DesktopLabel Label5
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
         Left            =   352
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "AQI ID:"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   122
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   63
      End
      Begin DesktopTextField tfAQIID
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
         Hint            =   "12 hex digits (the device's MAC address)"
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   427
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   120
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   205
      End
      Begin DesktopButton btAddAQI
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Add"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   552
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   154
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin DesktopLabel Label6
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
         Left            =   352
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Gateway:"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   218
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   77
      End
      Begin DesktopTextField tfMQTTNodeID
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
         Hint            =   "gateway id, e.g. aabbccdd"
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   441
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   218
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   251
      End
      Begin DesktopLabel Label9
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
         Left            =   352
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   11
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Username:"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   250
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   77
      End
      Begin DesktopTextField tfMQTTUsername
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
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   441
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   12
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   250
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   251
      End
      Begin DesktopLabel Label10
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
         Left            =   352
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   13
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Password:"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   282
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   77
      End
      Begin DesktopTextField tfMQTTUserPassword
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
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   441
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   True
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   14
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   282
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   251
      End
      Begin DesktopLabel Label13
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
         Left            =   352
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   15
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Keys:"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   "Channel keys (PSK) for decryption"
         Top             =   314
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   77
      End
      Begin DesktopTextField tfMQTTKeys
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
         Hint            =   "MyChannel=<PSK>; ... (empty: AQ==)"
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   441
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   True
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   16
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   "Channel=PSK pairs separated by ; (PSK as the Meshtastic app shows it). A PSK alone is used for all other channels. Empty: the default key AQ== on every channel"
         Top             =   314
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   251
      End
      Begin DesktopButton btShowPassword
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Show"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   712
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   17
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   "Show or hide the text"
         Top             =   284
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   64
      End
      Begin DesktopButton btShowKeys
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Show"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   712
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   18
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   "Show or hide the text"
         Top             =   316
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   64
      End
      Begin DesktopLabel Label15
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
         Left            =   352
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   19
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Node:"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   "Only this node's readings (empty: every node the gateway uploads)"
         Top             =   346
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   77
      End
      Begin DesktopTextField tfMQTTNodeFilter
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
         Hint            =   "optional: one node, e.g. aabbccdd"
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   441
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   20
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   "Only this node's readings (empty: every node the gateway uploads)"
         Top             =   346
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   251
      End
      Begin DesktopCheckBox cbMQTTTLS
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "TLS"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   441
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   21
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   "Connect with TLS (port 8883 unless the broker field says host:port). The connection is encrypted, but the broker's certificate isn't verified"
         Top             =   378
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   100
      End
      Begin DesktopTabPanel tpConnectionTypes
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   206
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   352
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Panels          =   ""
         Scope           =   0
         SmallTabs       =   False
         TabDefinition   =   "Network\rUSB"
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Tooltip         =   ""
         Top             =   122
         Transparent     =   False
         Underline       =   False
         Value           =   0
         Visible         =   True
         Width           =   414
         Begin DesktopLabel Label11
            AllowAutoDeactivate=   True
            Bold            =   False
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   20
            Index           =   -2147483648
            InitialParent   =   "tpConnectionTypes"
            Italic          =   False
            Left            =   372
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "host:"
            TextAlignment   =   0
            TextColor       =   &c000000
            Tooltip         =   ""
            Top             =   160
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   63
         End
         Begin DesktopTextField tfNetworkHost
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
            Hint            =   "node IP address or name"
            Index           =   -2147483648
            InitialParent   =   "tpConnectionTypes"
            Italic          =   False
            Left            =   461
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   ""
            TextAlignment   =   0
            TextColor       =   &c000000
            Tooltip         =   ""
            Top             =   160
            Transparent     =   False
            Underline       =   False
            ValidationMask  =   ""
            Visible         =   True
            Width           =   191
         End
         Begin DesktopButton btAddNetworkConenction
            AllowAutoDeactivate=   True
            Bold            =   False
            Cancel          =   False
            Caption         =   "Add"
            Default         =   False
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   20
            Index           =   -2147483648
            InitialParent   =   "tpConnectionTypes"
            Italic          =   False
            Left            =   572
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MacButtonStyle  =   0
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   1
            TabStop         =   True
            Tooltip         =   ""
            Top             =   194
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   80
         End
         Begin DesktopLabel Label12
            AllowAutoDeactivate=   True
            Bold            =   False
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   20
            Index           =   -2147483648
            InitialParent   =   "tpConnectionTypes"
            Italic          =   False
            Left            =   372
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   3
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "TCP port:"
            TextAlignment   =   0
            TextColor       =   &c000000
            Tooltip         =   ""
            Top             =   192
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   63
         End
         Begin DesktopTextField tfNetworkPort
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
            Hint            =   ""
            Index           =   -2147483648
            InitialParent   =   "tpConnectionTypes"
            Italic          =   False
            Left            =   461
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumCharactersAllowed=   0
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "4403"
            TextAlignment   =   0
            TextColor       =   &c000000
            Tooltip         =   ""
            Top             =   192
            Transparent     =   False
            Underline       =   False
            ValidationMask  =   ""
            Visible         =   True
            Width           =   87
         End
         Begin DesktopLabel Label14
            AllowAutoDeactivate=   True
            Bold            =   False
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   20
            Index           =   -2147483648
            InitialParent   =   "tpConnectionTypes"
            Italic          =   False
            Left            =   372
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   5
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "Port:"
            TextAlignment   =   0
            TextColor       =   &c000000
            Tooltip         =   ""
            Top             =   160
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   63
         End
         Begin DesktopPopupMenu pmSerialPorts
            AllowAutoDeactivate=   True
            Bold            =   False
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   20
            Index           =   -2147483648
            InitialParent   =   "tpConnectionTypes"
            InitialValue    =   ""
            Italic          =   False
            Left            =   461
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            SelectedRowIndex=   -1
            TabIndex        =   6
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   "The node's USB serial port"
            Top             =   160
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   191
         End
         Begin DesktopButton btAddSerial
            AllowAutoDeactivate=   True
            Bold            =   False
            Cancel          =   False
            Caption         =   "Add"
            Default         =   False
            Enabled         =   False
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   20
            Index           =   -2147483648
            InitialParent   =   "tpConnectionTypes"
            Italic          =   False
            Left            =   572
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MacButtonStyle  =   0
            Scope           =   0
            TabIndex        =   7
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   194
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   80
         End
      End
      Begin DesktopPopupMenu pmMQTTProfiles
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   ""
         Italic          =   False
         Left            =   441
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         SelectedRowIndex=   -1
         TabIndex        =   22
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   122
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   251
      End
      Begin DesktopLabel Label16
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
         Left            =   352
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   23
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Profile:"
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   122
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   63
      End
      Begin DesktopButton btForgetMQTT
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Forget"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   704
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   24
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   122
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   72
      End
   End
   Begin DesktopLabel Label2
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   332
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   False
      Text            =   "Add Data Source:"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   320
   End
   Begin Timer ShakeTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   88
      RunMode         =   2
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin DesktopCanvas Canvas1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   96
      Index           =   -2147483648
      Left            =   710
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Visible         =   True
      Width           =   96
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Function CancelClosing(appQuitting As Boolean) As Boolean
		  // Closing the Data Sources window quits the app, after a confirmation. Quitting the app (Cmd-Q, menu)
		  // doesn't ask: appQuitting is True then
		  If appQuitting Then Return False
		  Dim d As New MessageDialog
		  d.Message = "Quit Sensor Dashboard?"
		  d.Explanation = "This closes the app and every source: MQTT feeds, AQI devices and Meshtastic connections."
		  d.ActionButton.Caption = "Quit"
		  d.CancelButton.Visible = True
		  Dim b As MessageDialogButton = d.ShowModal(Self)
		  If b = d.CancelButton Then Return True // keep everything running
		  LogEvents "SetupWindow", "Closed by the user: quitting"
		  Quit
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Sub Closing()
		  SaveSetupFields
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  FitControlsForLinux(Self) // taller controls on Linux
		  // The fields as last used (settings file outside the project, see SettingsFile)
		  LoadSetupFields
		  LoadMQTTProfiles
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddAQISource(w As M5AQIwindow)
		  // Called by an M5AQIwindow once its first sample has arrived
		  MyAQIwindows.Add w
		  lbDataSources.AddRow "M5AQI", w.MyID, Str(MyAQIwindows.Count-1)
		  LogEvents "btAddAQI", w.MyID + ": " + w.nickname + " / " + Str(w.periodicity) + " seconds"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddDeviceSource(w As MeshtasticWindow)
		  // Called by a MeshtasticWindow once connected to its node
		  MyMeshtasticWindows.Add w
		  lbDataSources.AddRow "Meshtastic", w.NodeID + " via " + w.SourceName, Str(MyMeshtasticWindows.Count-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadMQTTProfiles()
		  // The saved MQTT feeds (table mqtt_profiles, see SaveMQTTProfile) in the popup, most recently used first; row 0 is
		  // a title. When there are none yet, the MQTT fields in use become the first one
		  mMQTTProfiles.RemoveAll
		  pmMQTTProfiles.RemoveAllRows
		  If MySensordb = Nil Then Return
		  Dim rs As RowSet = MQTTProfiles()
		  If (rs = Nil Or rs.AfterLastRow) And tfMQTTSite.Text.Trim <> "" Then
		    SaveMQTTProfile(tfMQTTSite.Text.Trim, tfMQTTTopic.Text.Trim, tfMQTTNodeID.Text.Trim, tfMQTTUsername.Text.Trim, _
		    tfMQTTUserPassword.Text.Trim, tfMQTTKeys.Text.Trim, tfMQTTNodeFilter.Text.Trim, cbMQTTTLS.Value)
		    rs = MQTTProfiles()
		  End If
		  If rs <> Nil Then
		    While Not rs.AfterLastRow
		      Dim d As New Dictionary
		      d.Value("id") = rs.Column("profileID").Int64Value
		      d.Value("broker") = rs.Column("broker").StringValue
		      d.Value("rootTopic") = rs.Column("rootTopic").StringValue
		      d.Value("gatewayID") = rs.Column("gatewayID").StringValue
		      d.Value("username") = rs.Column("username").StringValue
		      d.Value("password") = rs.Column("password").StringValue
		      d.Value("keys") = rs.Column("keys").StringValue
		      d.Value("nodeFilter") = rs.Column("nodeFilter").StringValue
		      d.Value("tls") = (rs.Column("tls").IntegerValue = 1)
		      mMQTTProfiles.Add(d)
		      rs.MoveToNextRow
		    Wend
		  End If
		  If mMQTTProfiles.Count = 0 Then
		    pmMQTTProfiles.AddRow("No saved feeds yet")
		  Else
		    pmMQTTProfiles.AddRow("Saved feeds (" + Str(mMQTTProfiles.Count) + ")")
		  End If
		  For Each d As Dictionary In mMQTTProfiles
		    pmMQTTProfiles.AddRow(MQTTProfileName(d.Value("broker").StringValue, d.Value("rootTopic").StringValue, _
		    d.Value("gatewayID").StringValue, d.Value("username").StringValue))
		  Next
		  pmMQTTProfiles.SelectedRowIndex = 0
		  btForgetMQTT.Enabled = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadSetupFields()
		  Dim f As FolderItem = SettingsFile()
		  If f = Nil Or Not f.Exists Then Return
		  Dim js As JSONItem
		  Try
		    Dim tis As TextInputStream = TextInputStream.Open(f)
		    js = New JSONItem(tis.ReadAll(Encodings.UTF8))
		    tis.Close
		  Catch e As RuntimeException
		    LogEvents "Settings", "Couldn't read " + f.NativePath + ": " + e.Message
		    Return
		  End Try
		  If js.HasKey("mqtt_broker") Then tfMQTTSite.Text = js.Value("mqtt_broker").StringValue
		  If js.HasKey("mqtt_root_topic") Then tfMQTTTopic.Text = js.Value("mqtt_root_topic").StringValue
		  If js.HasKey("mqtt_gateway_id") Then tfMQTTNodeID.Text = js.Value("mqtt_gateway_id").StringValue
		  If js.HasKey("mqtt_username") Then tfMQTTUsername.Text = js.Value("mqtt_username").StringValue
		  If js.HasKey("mqtt_password") Then tfMQTTUserPassword.Text = js.Value("mqtt_password").StringValue
		  If js.HasKey("mqtt_keys") Then tfMQTTKeys.Text = js.Value("mqtt_keys").StringValue
		  If js.HasKey("mqtt_node_filter") Then tfMQTTNodeFilter.Text = js.Value("mqtt_node_filter").StringValue
		  If js.HasKey("mqtt_tls") Then cbMQTTTLS.Value = js.Value("mqtt_tls").BooleanValue
		  If js.HasKey("aqi_device_id") Then tfAQIID.Text = js.Value("aqi_device_id").StringValue
		  If js.HasKey("device_host") Then tfNetworkHost.Text = js.Value("device_host").StringValue
		  If js.HasKey("device_port") Then tfNetworkPort.Text = js.Value("device_port").StringValue
		  mSavedSerialPort = js.Lookup("serial_port", "").StringValue
		  LogEvents "Settings", "Fields loaded from " + f.NativePath
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RefreshSerialPorts()
		  // The USB tab's port menu, in SerialDevice order (the menu row is the device index)
		  Dim previous As String = mSavedSerialPort
		  If pmSerialPorts.SelectedRowIndex >= 0 Then previous = pmSerialPorts.SelectedRowText
		  pmSerialPorts.RemoveAllRows
		  For i As Integer = 0 To SerialDevice.LastIndex
		    pmSerialPorts.AddRow SerialDevice.At(i).Name
		    If SerialDevice.At(i).Name = previous Then pmSerialPorts.SelectedRowIndex = i
		  Next
		  // Default: the first USB modem port (cu.usbmodem... / cu.usbserial... on macOS, COMx elsewhere)
		  If pmSerialPorts.SelectedRowIndex < 0 Then
		    For i As Integer = 0 To SerialDevice.LastIndex
		      If SerialDevice.At(i).Name.IndexOf("usb") >= 0 Then
		        pmSerialPorts.SelectedRowIndex = i
		        Exit
		      End If
		    Next
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveSourceRow(kind As String, index As Integer)
		  // See Module1.RemoveSourceRow
		  For row As Integer = lbDataSources.LastRowIndex DownTo 0
		    If lbDataSources.CellTextAt(row, 0) = kind Then
		      Dim n As Integer = lbDataSources.CellTextAt(row, 2).Val
		      If n = index Then
		        lbDataSources.RemoveRowAt(row)
		      ElseIf n > index Then
		        lbDataSources.CellTextAt(row, 2) = Str(n - 1)
		      End If
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveSetupFields()
		  // Called when a source is added and when the window closes. Plain text, readable by you only (600):
		  // it holds the broker password and the channel keys
		  Dim f As FolderItem = SettingsFile()
		  If f = Nil Then Return
		  Dim js As New JSONItem
		  js.Value("mqtt_broker") = tfMQTTSite.Text.Trim
		  js.Value("mqtt_root_topic") = tfMQTTTopic.Text.Trim
		  js.Value("mqtt_gateway_id") = tfMQTTNodeID.Text.Trim
		  js.Value("mqtt_username") = tfMQTTUsername.Text.Trim
		  js.Value("mqtt_password") = tfMQTTUserPassword.Text.Trim
		  js.Value("mqtt_keys") = tfMQTTKeys.Text.Trim
		  js.Value("mqtt_node_filter") = tfMQTTNodeFilter.Text.Trim
		  js.Value("mqtt_tls") = cbMQTTTLS.Value
		  js.Value("aqi_device_id") = tfAQIID.Text.Trim
		  js.Value("device_host") = tfNetworkHost.Text.Trim
		  js.Value("device_port") = tfNetworkPort.Text.Trim
		  If pmSerialPorts.SelectedRowIndex >= 0 Then mSavedSerialPort = pmSerialPorts.SelectedRowText
		  js.Value("serial_port") = mSavedSerialPort
		  Try
		    Dim tos As TextOutputStream = TextOutputStream.Create(f)
		    tos.Write js.ToString
		    tos.Close
		    f.Permissions = &o600
		  Catch e As RuntimeException
		    LogEvents "Settings", "Couldn't save " + f.NativePath + ": " + e.Message
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShakeWindow()
		  ShakeCounter = 9
		  ShakeDirection = -20
		  ShakeTimer.RunMode = Timer.RunModes.Multiple
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ContextualRow As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMQTTProfiles() As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSavedSerialPort As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ShakeCounter As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		ShakeDirection As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events lbDataSources
	#tag Event
		Sub DoublePressed()
		  Dim ix, n As Integer
		  
		  ix = me.SelectedRowIndex
		  If ix = -1 Then Return
		  n = me.CellTextAt(ix, 2).Val()
		  Select Case me.CellTextAt(ix, 0)
		  Case "M5AQI"
		    MyAQIwindows(n).Show()
		  Case "MQTT"
		    MyMQTTwindows(n).Show()
		  Case "Meshtastic"
		    MyMeshtasticWindows(n).Show()
		  End Select
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  Dim ix As Integer
		  ix = me.RowCount
		  If ix = 0 Then Return False
		  ContextualRow = Me.RowFromXY(x, y)
		  If ContextualRow = -1 Then Return False
		  
		  base.AddMenu New DesktopMenuItem("Export Data")
		  base.AddMenu New DesktopMenuItem("Close Source")
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  Select Case selectedItem.Text
		  Case "Export Data"
		    Dim type, source As String
		    Dim ix As Integer
		    type = me.CellTextAt(ContextualRow, 0)
		    source = me.CellTextAt(ContextualRow, 1)
		    ix = me.CellTextAt(ContextualRow, 2).Val // column 2: index in the window list (as in DoublePressed)
		    Select Case type
		    Case "MQTT"
		      ExportMQTT(MyMQTTwindows(ix))
		    Case "M5AQI"
		      ExportAQI(MyAQIwindows(ix))
		    Case "Meshtastic"
		      ExportDevice(MyMeshtasticWindows(ix))
		    End Select
		    Return True
		  Case "Close Source"
		    // Closing the window stops the source; its Closing event removes the row
		    Dim n As Integer = me.CellTextAt(ContextualRow, 2).Val
		    Select Case me.CellTextAt(ContextualRow, 0)
		    Case "MQTT"
		      MyMQTTwindows(n).Close
		    Case "M5AQI"
		      MyAQIwindows(n).Close
		    Case "Meshtastic"
		      MyMeshtasticWindows(n).Close
		    End Select
		    Return True
		  End Select
		  Return False
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  // Each Add button is enabled when its own fields are filled in
		  btAddAQI.Enabled = tfAQIID.Text.Trim() <> ""
		  
		  Dim NodeID As String = tfMQTTNodeID.Text.Trim().Lowercase()
		  If NodeID.LeftBytes(1) = "!" Then NodeID = NodeID.MiddleBytes(1)
		  btAddMQTT.Enabled = NodeID.Length >= 8 And tfMQTTSite.Text.Trim() <> "" And tfMQTTTopic.Text.Trim() <> ""
		  
		  btAddNetworkConenction.Enabled = tfNetworkHost.Text.Trim() <> ""
		  btAddSerial.Enabled = pmSerialPorts.SelectedRowIndex >= 0
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TabPanel1
	#tag Event
		Sub PanelChanged()
		  If me.SelectedPanelIndex = 0 Then
		    tfMQTTSite.SelectionStart = 0
		    tfMQTTSite.SelectionLength = 65535
		    tfMQTTSite.SetFocus()
		    Return
		  End If
		  
		  If me.SelectedPanelIndex = 1 Then
		    tfAQIID.SelectionStart = 0
		    tfAQIID.SelectionLength = 65535
		    tfAQIID.SetFocus()
		    Return
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tfMQTTSite
	#tag Event
		Sub KeyUp(key As String)
		  If Key = Chr(13) And btAddMQTT.Enabled Then btAddMQTT.Press()
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(key As String) As Boolean
		  If Key = Chr(13) Then Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events tfMQTTTopic
	#tag Event
		Sub KeyUp(key As String)
		  If Key = Chr(13) And btAddMQTT.Enabled Then btAddMQTT.Press()
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(key As String) As Boolean
		  If Key = Chr(13) Then Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events pmMQTTProfiles
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  // A saved feed fills the MQTT fields; Add opens it
		  #Pragma Unused item
		  Dim idx As Integer = Me.SelectedRowIndex
		  btForgetMQTT.Enabled = (idx > 0)
		  If idx <= 0 Or idx > mMQTTProfiles.Count Then Return
		  Dim d As Dictionary = mMQTTProfiles(idx - 1)
		  tfMQTTSite.Text = d.Value("broker").StringValue
		  tfMQTTTopic.Text = d.Value("rootTopic").StringValue
		  tfMQTTNodeID.Text = d.Value("gatewayID").StringValue
		  tfMQTTUsername.Text = d.Value("username").StringValue
		  tfMQTTUserPassword.Text = d.Value("password").StringValue
		  tfMQTTKeys.Text = d.Value("keys").StringValue
		  tfMQTTNodeFilter.Text = d.Value("nodeFilter").StringValue
		  cbMQTTTLS.Value = d.Value("tls").BooleanValue
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btForgetMQTT
	#tag Event
		Sub Pressed()
		  // Deletes the saved feed selected in the popup (the fields stay as they are)
		  Dim idx As Integer = pmMQTTProfiles.SelectedRowIndex
		  If idx <= 0 Or idx > mMQTTProfiles.Count Then Return
		  Dim d As Dictionary = mMQTTProfiles(idx - 1)
		  ForgetMQTTProfile(d.Value("id").Int64Value)
		  LoadMQTTProfiles
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btAddMQTT
	#tag Event
		Sub Pressed()
		  Dim UUID, broker, username, pwd, topic, keys As String
		  UUID = tfMQTTNodeID.Text.Trim()
		  broker = tfMQTTSite.Text.Trim()
		  username = tfMQTTUsername.Text.Trim()
		  pwd = tfMQTTUserPassword.Text.Trim()
		  topic = tfMQTTTopic.Text.Trim()
		  keys = tfMQTTKeys.Text.Trim()
		  
		  // Check the channel keys before opening the feed
		  Dim names(), psks() As String
		  Dim fallback, problem As String
		  If Not ParseChannelKeys(keys, names, psks, fallback, problem) Then
		    LogEvents "btAddMQTT", "Keys: " + problem
		    MessageBox "Keys: " + problem
		    tfMQTTKeys.SelectionStart = 0
		    tfMQTTKeys.SelectionLength = tfMQTTKeys.Text.Length
		    ShakeWindow()
		    Return
		  End If
		  
		  // Optional node filter: 8 hex digits, with or without "!"
		  Dim nodeFilter As String = tfMQTTNodeFilter.Text.Trim().Lowercase()
		  If nodeFilter.LeftBytes(1) = "!" Then nodeFilter = nodeFilter.MiddleBytes(1)
		  If nodeFilter <> "" And (nodeFilter.Length <> 8 Or Val("&H" + nodeFilter) = 0) Then
		    MessageBox "Node: """ + tfMQTTNodeFilter.Text.Trim() + """ is not a node id (8 hex digits, e.g. aabbccdd)"
		    tfMQTTNodeFilter.SelectionStart = 0
		    tfMQTTNodeFilter.SelectionLength = tfMQTTNodeFilter.Text.Length
		    ShakeWindow()
		    Return
		  End If
		  Dim tls As Boolean = cbMQTTTLS.Value
		  
		  // Saved feeds: this one becomes (or stays) a saved feed, the most recently used
		  SaveMQTTProfile(broker, topic, UUID, username, pwd, keys, tfMQTTNodeFilter.Text.Trim(), tls)
		  LoadMQTTProfiles
		  SaveSetupFields
		  Dim w As New MQTTwindow
		  w.Setup(UUID, broker, username, pwd, topic, keys, nodeFilter, tls)
		  MyMQTTwindows.Add w
		  Dim sourceText As String = topic + "/" + UUID
		  If nodeFilter <> "" Then sourceText = "!" + nodeFilter + " via " + sourceText
		  If tls Then sourceText = sourceText + " (TLS)"
		  lbDataSources.AddRow "MQTT", sourceText, Str(MyMQTTwindows.Count-1)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tfAQIID
	#tag Event
		Function KeyDown(key As String) As Boolean
		  If Key = Chr(13) Then Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub KeyUp(key As String)
		  If Key = Chr(13) And btAddAQI.Enabled Then btAddAQI.Press()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btAddAQI
	#tag Event
		Sub Pressed()
		  // The device id: its MAC address, 12 hex digits
		  Dim ID As String
		  
		  ID = tfAQIID.Text.Trim()
		  If ID.Length<>12 Or Val("&H" + ID) = 0 Then
		    tfAQIID.SelectionStart = 0
		    tfAQIID.SelectionLength = 11111111
		    ShakeWindow()
		    Return
		  End If
		  
		  // Already followed: bring its window to the front
		  For Each aqi As M5AQIwindow In MyAQIwindows
		    If aqi.MyID = ID Then
		      aqi.Show()
		      Return
		    End If
		  Next
		  
		  // The window fetches the first sample in the background, then shows itself and calls AddAQISource,
		  // or reports the problem and closes
		  SaveSetupFields
		  LogEvents "btAddAQI", "Checking data for " + ID
		  Dim w As New M5AQIwindow
		  w.Start(ID)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tfMQTTNodeID
	#tag Event
		Sub KeyUp(key As String)
		  If Key = Chr(13) And btAddMQTT.Enabled Then btAddMQTT.Press()
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(key As String) As Boolean
		  If Key = Chr(13) Then Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events tfMQTTUsername
	#tag Event
		Sub KeyUp(key As String)
		  If Key = Chr(13) And btAddMQTT.Enabled Then btAddMQTT.Press()
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(key As String) As Boolean
		  If Key = Chr(13) Then Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events tfMQTTUserPassword
	#tag Event
		Sub KeyUp(key As String)
		  If Key = Chr(13) And btAddMQTT.Enabled Then btAddMQTT.Press()
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(key As String) As Boolean
		  If Key = Chr(13) Then Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events tfMQTTKeys
	#tag Event
		Sub KeyUp(key As String)
		  If Key = Chr(13) And btAddMQTT.Enabled Then btAddMQTT.Press()
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(key As String) As Boolean
		  If Key = Chr(13) Then Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btShowPassword
	#tag Event
		Sub Pressed()
		  // Reveal or hide the field's text
		  tfMQTTUserPassword.Password = Not tfMQTTUserPassword.Password
		  If tfMQTTUserPassword.Password Then
		    Me.Caption = "Show"
		  Else
		    Me.Caption = "Hide"
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btShowKeys
	#tag Event
		Sub Pressed()
		  // Reveal or hide the field's text
		  tfMQTTKeys.Password = Not tfMQTTKeys.Password
		  If tfMQTTKeys.Password Then
		    Me.Caption = "Show"
		  Else
		    Me.Caption = "Hide"
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tfMQTTNodeFilter
	#tag Event
		Sub KeyUp(key As String)
		  If Key = Chr(13) And btAddMQTT.Enabled Then btAddMQTT.Press()
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(key As String) As Boolean
		  If Key = Chr(13) Then Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events tpConnectionTypes
	#tag Event
		Sub PanelChanged()
		  If Me.SelectedPanelIndex = 1 Then RefreshSerialPorts // USB
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tfNetworkHost
	#tag Event
		Sub KeyUp(key As String)
		  If Key = Chr(13) And btAddNetworkConenction.Enabled Then btAddNetworkConenction.Press()
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(key As String) As Boolean
		  If Key = Chr(13) Then Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btAddNetworkConenction
	#tag Event
		Sub Pressed()
		  // A node on WiFi/Ethernet: its client API on TCP (default port 4403)
		  Dim host As String = tfNetworkHost.Text.Trim()
		  Dim port As Integer = Val(tfNetworkPort.Text.Trim())
		  If port <= 0 Then port = 4403
		  If host = "" Then
		    ShakeWindow()
		    Return
		  End If
		  SaveSetupFields
		  Dim w As New MeshtasticWindow
		  w.StartTCP(host, port)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tfNetworkPort
	#tag Event
		Sub KeyUp(key As String)
		  If Key = Chr(13) And btAddNetworkConenction.Enabled Then btAddNetworkConenction.Press()
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(key As String) As Boolean
		  If Key = Chr(13) Then Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btAddSerial
	#tag Event
		Sub Pressed()
		  // A node on USB: its client API over the serial port
		  Dim i As Integer = pmSerialPorts.SelectedRowIndex
		  If i < 0 Or i > SerialDevice.LastIndex Then
		    ShakeWindow()
		    Return
		  End If
		  SaveSetupFields
		  Dim w As New MeshtasticWindow
		  w.StartSerial(SerialDevice.At(i))
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ShakeTimer
	#tag Event
		Sub Action()
		  ShakeCounter = ShakeCounter - 1
		  If ShakeCounter = 0 Then
		    me.RunMode = Timer.RunModes.Off
		    Return
		  End If
		  
		  Self.Left = Self.Left + ShakeDirection
		  ShakeDirection = ShakeDirection * -1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Opening()
		  Dim p As New Picture(96, 96)
		  p.Graphics.DrawPicture greenlogo, 16, 16, 64, 64, _
		  0, 0, greenlogo.Width, greenlogo.Height
		  
		  me.Backdrop = p
		  me.Refresh()
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
		Name="ShakeCounter"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ShakeDirection"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ContextualRow"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
