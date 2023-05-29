/**
 * 
 */
function comparePw(){
	var obj=arguments[0];//첫번째 파라미터는 form이다
	var pass=[]; 
	//배열이다. javaScript 배열은 가변 배열이다. 모든 타입을 넣을 수 있음. length가 0의 배열이다
	var pIdx=0;
	
	for(var i=0; i<obj.length;i++){
		if(obj[i].type.toUpperCase()=="PASSWORD"){
			pass[pIdx]=obj[i];
			pIdx++;
		}
	}
	if(pass[0].value!=pass[1].value){
		alert("비밀번호가 일치하지 않습니다.");
		pass[0].focus();
		return false;
	}
	return true
}

//join.jsp
//this.form에서 해당하는 input 항목이 원소가 됩니다.
function chkAndMove(){
	var obj=arguments[0];
	var flag=true;
	if(!emptyChk(obj)){
		flag=false;
	}
	if(flag&& arguments[2]){
		flag=comparePw(obj);
	}
	if(flag){
		justMove(obj,arguments[1]);
	}
}

//info.jsp


//loginSuccess.jsp

function logout(){
	if(window.confirm("로그아웃 다시 하시겠습니까?")){
		justMove(arguments[0],"goLogout");
	}
}

function justMove(){
	var obj=arguments[0];
	obj.cmd.value=arguments[1];
	obj.action="move.jsp";
	obj.method="post";
	obj.submit();
}


function emptyChk(obj){
	var flag=true;
	for(var i=0; flag&& i<obj.length;i++){
		var type=obj[i].type.toUpperCase();
		if(type!="BUTTON"&& type!="HIDDEN"){
			console.log(i+":"+obj[i].type);
			if(obj[i].value.trim().length==0){
				alert("누락사항:"+obj[i].title);
				obj[i].focus();
				flag=false;
			}
		}
	}
	return flag;
	
}



