#tag Class
Protected Class MapView
Inherits DesktopCanvas
	#tag Note, Name = About
		The map of a PositionTrack (see Shared/MapPainter, which draws it and keeps the tiles): this DesktopCanvas follows
		the mouse (hover box, drag to pan, wheel and double-click to zoom, the +/−/Fit buttons).
	#tag EndNote


	#tag Event
		Sub DoublePressed(x As Integer, y As Integer)
		  // Zoom in at that point
		  If Not Painter().InControls(x, y) Then
		    If Painter().ZoomAt(x, y, 1) Then Refresh(False)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  // The + / − / Fit buttons, or the start of a drag
		  If Painter().HitButton(x, y) Then
		    Refresh(False)
		    Return True
		  End If
		  Painter().StartDrag(x, y)
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(x As Integer, y As Integer)
		  // Panning: the map follows the mouse
		  If Painter().DragTo(x, y) Then
		    Me.MouseCursor = System.Cursors.HandClosed
		    Refresh(False)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  If Painter().ClearHover() Then Refresh(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(x As Integer, y As Integer)
		  // The position under the mouse (within 14 pixels), shown in a box
		  If Painter().HoverAt(x, y) Then Refresh(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  Painter().EndDrag()
		  Me.MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseWheel(x As Integer, y As Integer, deltaX As Integer, deltaY As Integer) As Boolean
		  // Scrolling (wheel or two fingers) zooms around the pointer
		  If Painter().Wheel(x, y, deltaY) Then Refresh(False)
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Painter().Paint(g, g.Width, g.Height)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub FitView()
		  // Back to the automatic view: every position, with a margin (also when another node is shown)
		  Painter().FitView()
		  Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Painter() As MapPainter
		  // The map itself (Shared/MapPainter), its tile cache next to settings.json and the database
		  If mPainter = Nil Then
		    mPainter = New MapPainter
		    Try
		      mPainter.CacheFolder = SpecialFolder.ApplicationData.Child("Sensor_Dashboard")
		    Catch e As RuntimeException
		      mPainter.CacheFolder = Nil
		    End Try
		    AddHandler mPainter.Changed, WeakAddressOf PainterChanged
		  End If
		  Return mPainter
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PainterChanged(sender As MapPainter)
		  // A tile arrived
		  Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToPicture() As Picture
		  // The map as a picture at twice the size (for exports)
		  Return Painter().ToPicture(Width, Height)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Painter().Track
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Painter().Track = value
			End Set
		#tag EndSetter
		Track As PositionTrack
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mPainter As MapPainter
	#tag EndProperty


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
			InitialValue=""
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
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
