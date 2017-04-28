<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link href="/bootstrap.min.css" rel="stylesheet">
 
<script type="text/javascript">

 var idDubClicked=false;
 var id_reg=  /^(?=.*[a-zA-Z])(?=.*[0-9]).{5,10}$/;
 var pass_reg =/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~,!,@,#,$,*,(,),=,+,_,.,|]).{10,20}$/;
 
 //아이디 중복 확인                                           
 function idDupCheck(){
	 if(document.fr.sns_id.value==""){
	 		alert("아이디를 입력해 주세요!");
	 		document.fr.sns_id.focus();
	 	}
	
	
	 if(document.fr.sns_id.value!=""){
		 idDubClicked = true;
	 var sns_id=document.fr.sns_id.value;
	 var url = "./IdCheckAction.sn?sns_id="+sns_id;
	 window.open(url,'idCheck',"height=400 width=400");
	 }
 }

 
 function submitCheck(){
	 
 	//////아이디 체크
 	if(document.fr.sns_id.value==""){
 		alert("아이디를 입력해 주세요!");
 		document.fr.sns_id.focus();
 		return false;
 	}else if(!id_reg.test(document.fr.sns_id.value)){
		alert("아이디는 영어,숫자조합 5-10자리로 구성해주세요");
		document.fr.sns_id.focus();
		return false;

  	}else if(!idDubClicked){
 		alert("아이디 중복확인을 해주세요");
 		return false;
	}
 	
 	//////비밀번호 유형 체크
 	if(document.fr.pass.value==""){
 		alert("비밀번호를 입력해 주세요!");
 		document.fr.pass.focus();
 		return false;
 	}else if(!pass_reg.test(document.fr.pass.value)){
 		alert("비밀번호는 영문, 숫자, 특수문자 조합 10-20자리로 구성해주세요.");
 		document.fr.pass.focus();
 		return false;
 	}
	//////비밀번호 일치 체크
 	if(document.fr.pass2.value==""){
 		alert("비밀번호를 확인해 주세요!");
 		document.fr.pass2.focus();
 		return false;
 	}if(document.fr.pass.value!=document.fr.pass2.value){
 		alert("비밀번호가 일치하지 않습니다!");
 		document.fr.pass2.focus();
 		return false;
 	}
 	
 	
 	//////이름 체크
 	if(document.fr.name.value==""){
 		alert("이름을 입력해 주세요!");
 		document.fr.name.focus();
 		return false;
 	}
 }
 
//비밀번호 일치 체크 디스플레이
 function passCheck(){
 	if(document.fr.pass.value==document.fr.pass2.value){
 		document.getElementById("passdbCheckDisplay").innerHTML="비밀번호가 일치합니다";
 	}else{
 		document.getElementById("passdbCheckDisplay").innerHTML="비밀번호가 일치하지 않습니다.";	
 }	
 }

//비밀번호 유형 체크 디스플레이
 function passFormCheck(){
 	var pwd=document.fr.pass.value;
 	
 	if(!pass_reg.test(pwd)){
 		document.getElementById("passCheckDisplay").innerHTML="비밀번호는 영문, 숫자, 특수문자 조합 10-20자리로 구성해주세요.";	
 	}else{
 		document.getElementById("passCheckDisplay").innerHTML="OK!";	
 		
 	}
 }

//아이디 유형 체크 디스플레이
 function idCheck(){
 	var id=document.fr.sns_id.value;
 		if(!id_reg.test(id)){
 			document.getElementById("idCheckDisplay").innerHTML="아이디는 영어,숫자조합 5-10자리로 구성해주세요";

 		}else{
 			document.getElementById("idCheckDisplay").innerHTML="OK!";
 		}
 	
 }
 
//프로필메인이미지 미리보기 구현
var InputImage=(function loadImageFile(){
	if(window.FileReader){
		var ImagePre; 
		        var ImgReader = new window.FileReader();
		        var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 
		 
		        ImgReader.onload = function (Event) {
			
			 if (!ImagePre) {
				                var newPreview = document.getElementById("imagePreview");
				                ImagePre = new Image();
				                ImagePre.style.width = "200px";
				                ImagePre.style.height = "140px";
				                newPreview.appendChild(ImagePre);
				            }
				            ImagePre.src = Event.target.result;
				            
				        };
				 
				        return function () {
				         
				            var img = document.getElementById("image").files;
				           
				            if (!fileType.test(img[0].type)) { 
				             alert("이미지 파일을 업로드 하세요"); 
				             return; 
				            }
				            
				            ImgReader.readAsDataURL(img[0]);
				        }
				 
				    }
				   
				            document.getElementById("imagePreview").src = document.getElementById("image").value;
				 
				      
				})();

//다중 파일 업로드 
var selDiv = "";
document.addEventListener("DOMContentLoaded", init, false);
function init() {
    document.querySelector('#files').addEventListener('change', handleFileSelect, false);
    selDiv = document.querySelector("#selectedFiles");
}        
function handleFileSelect(e) { 
	var file_names = "";
    if(!e.target.files) return;        
    selDiv.innerHTML = "";       
    var files = e.target.files;
    for(var i=0; i<files.length; i++) {
        var f = files[i];            
        //selDiv.innerHTML += f.name + "<br/>";
        if(i == files.length-1) file_names += f.name;
        else file_names += f.name + ",";
        
    }
    selDiv.innerHTML += file_names+"<br/>";          
    document.fr.file_names.value = file_names;
}

function check(){
	var file_str = document.fr.file_names.value;
	alert(file_str);
}
				
 </script>
</head>
<body>

<h1>SNS Star Join Us</h1>

<form action="./SnsJoinAction.sn" id="join" name="fr" method="post" onsubmit="return submitCheck()" enctype="multipart/form-data">
<input type="hidden" name="type" value="client">
<input type="hidden" name="idDubOk">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="sns_id" class="sns_id" onkeyup="idCheck()">
<input type="button" value="dup. check" class="dup" onclick="idDupCheck()"><span id="idCheckDisplay"></span><br>
<label>Password</label>
<input type="password" name="pass" onkeyup="passFormCheck()"><span id="passCheckDisplay"></span><br>
<label>Retype Password</label>
<input type="password" name="pass2"  onkeyup="passCheck()"><span id="passdbCheckDisplay"></span><br>
<label>Name</label>
<input type="text" name="name"><br>

<div class="form-group">
      <label for="mySelect">category</label>
      <select id="mySelect"  name="myselect" class="form-control">
        <option>패션</option>
        <option>뷰티</option>
        <option>식품</option>
        <option>뭐였지</option>          
      </select>
    </div>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>Profile Image</label><br>
<input type="file" name="file" id="image" onchange="InputImage()"><br>
<div id="imagePreview"></div>
<legend>Sub Image<span style="font-size: 7px;"> (이미지는 최대 8개까지 업로드하세요.)</span></legend>
<input type="hidden" name="file_names" id="file_names" value="">
<input type="file" id="files" name="files" multiple><br>
selected file<div id="selectedFiles"></div><br>
<!-- <input type="button" value="체크" onclick="check()"> -->
<label>Content</label><br>
<textarea rows="2" cols="40" name="content"></textarea><br>

<!-- <label>Phone Number</label> -->
<!-- <input type="text" name="phone" id="phone"><br> -->
</fieldset>

<div class="clear"></div>

<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="button" value="Cancel" class="cancel" onclick="history.back()">
</div>
</form>

</body>
</html>