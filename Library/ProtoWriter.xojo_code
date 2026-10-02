#tag Module
Protected Module ProtoWriter
	#tag Method, Flags = &h0
		Function ProtoFieldBytes(field As Integer, data As String) As String
		  // bytes, string (UTF-8) and embedded messages
		  Dim raw As String = ProtoRawBytes(data)
		  Return ProtoKey(field, 2) + ProtoVarint(raw.Bytes) + raw
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProtoFieldFixed32(field As Integer, value As UInt32) As String
		  Dim m As New MemoryBlock(4)
		  m.LittleEndian = True
		  m.UInt32Value(0) = value
		  Return ProtoKey(field, 5) + m.StringValue(0, 4)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProtoFieldInt32(field As Integer, value As Int32) As String
		  // int32: negative values are sign-extended to 64 bits (10-byte varint), as protobuf requires
		  Dim m As New MemoryBlock(8)
		  m.LittleEndian = True
		  m.Int64Value(0) = value
		  Return ProtoFieldVarint(field, m.UInt64Value(0))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProtoFieldSFixed32(field As Integer, value As Int32) As String
		  Dim m As New MemoryBlock(4)
		  m.LittleEndian = True
		  m.Int32Value(0) = value
		  Return ProtoKey(field, 5) + m.StringValue(0, 4)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProtoFieldVarint(field As Integer, value As UInt64) As String
		  // uint32, uint64, bool, enum
		  Return ProtoKey(field, 0) + ProtoVarint(value)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProtoKey(field As Integer, wireType As Integer) As String
		  Return ProtoVarint(Bitwise.ShiftLeft(field, 3) Or wireType)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProtoRawBytes(s As String) As String
		  // The bytes of s without a text encoding, so that concatenating protobuf pieces never converts anything
		  If s.Bytes = 0 Then Return ""
		  Dim mb As MemoryBlock = s
		  Return mb.StringValue(0, mb.Size)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProtoVarint(value As UInt64) As String
		  // Base-128 varint, least significant group first
		  Dim mb As New MemoryBlock(10)
		  Dim n As Integer = 0
		  Dim v As UInt64 = value
		  Do
		    Dim b As Integer = CType(v And &h7F, Integer)
		    v = Bitwise.ShiftRight(v, 7)
		    If v <> 0 Then b = b Or &h80
		    mb.UInt8Value(n) = b
		    n = n + 1
		  Loop Until v = 0
		  Return mb.StringValue(0, n)
		End Function
	#tag EndMethod


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
	#tag EndViewBehavior
End Module
#tag EndModule
