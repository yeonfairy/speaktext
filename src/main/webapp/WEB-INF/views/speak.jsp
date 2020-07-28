<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	
<script type="text/javascript">
	function speechClick(){
		var msg = document.getElementById("message").value;
		alert(msg);
		
		$.ajax({
			url:"/TextToSpeak/speak",
			data : {'msg':msg},
			type : "POST",
			dataType : "text",
			success : function(data){
				alert("success!");
			},
			error : function(error){
				alert("Error!");
			}
		});
		
		 if (typeof SpeechSynthesisUtterance === 'undefined' || typeof speechSynthesis === 'undefined') {
			    alert('This browser does not support speech API');
			    return;
			  }

			  const message = new SpeechSynthesisUtterance(msg);
			  const voices = speechSynthesis.getVoices();

			  message.voice = voices[0];
			  speechSynthesis.speak(message);
		
	}

</script>
</head>
<body>
		

	<table>
		<tr>
			<td>
			<textarea id="message"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" onclick="speechClick()" value="음성인식">
			</td>
		</tr>
	</table>
</body>
</html>