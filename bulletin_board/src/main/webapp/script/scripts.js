/**
 * 
 */
function comparePw(){
	var obj=arguments[0];//ù��° �Ķ���ʹ� form�̴�
	var pass=[]; 
	//�迭�̴�. javaScript �迭�� ���� �迭�̴�. ��� Ÿ���� ���� �� ����. length�� 0�� �迭�̴�
	var pIdx=0;
	
	for(var i=0; i<obj.length;i++){
		if(obj[i].type.toUpperCase()=="PASSWORD"){
			pass[pIdx]=obj[i];
			pIdx++;
		}
	}
	if(pass[0].value!=pass[1].value){
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		pass[0].focus();
		return false;
	}
	return true
}

//join.jsp
//this.form���� �ش��ϴ� input �׸��� ���Ұ� �˴ϴ�.
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
	if(window.confirm("�α׾ƿ� �ٽ� �Ͻðڽ��ϱ�?")){
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
				alert("��������:"+obj[i].title);
				obj[i].focus();
				flag=false;
			}
		}
	}
	return flag;
	
}



