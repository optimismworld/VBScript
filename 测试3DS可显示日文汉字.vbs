Dim inputstr,jpstr
Do
	inputstr=InputBox("输入你要查询的日文汉字串，点击确定即可显示。" & vbCrLf & "不可显示的日文汉字会显示为问号。","日文汉字可显示查询",jpstr)
	jpstr = gTs(inputstr,"shift-jis","shift-jis")
Loop Until(Len(inputstr)<1)

Function gTs(str,charset1,charset2)
	Set adostream = CreateObject("ADODB.Stream")
	With adostream
		.Type = 2
		.Open
		.Charset = charset1
		.WriteText str
		.Position = 0
		.Charset = charset2
		gTs = .ReadText
		.close
	End With
	Set adostream = Nothing
End Function

WScript.Quit