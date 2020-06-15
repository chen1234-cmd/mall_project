/**
 * 
 */
function check() {
	var f = document.getElementById("search");
	if (f.checkValidity() == false) {
		f.setCustomValidity("不能为空");
	}else{
		submit;
	}
}
//ajax异步处理提示数据
function sreach() {
	var name = document.getElementById("search").value;
	
	if (name == "" || name ==null) {
		// removeCode();
		$("#myDiv1").show();
		removeCode();
	} else  {
		$("#myDiv1").hide();
		
		var xmlhttp;
		if (window.XMLHttpRequest) {
			// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
			xmlhttp = new XMLHttpRequest();
		} else {
			// IE6, IE5 浏览器执行代码
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

				/*
				 * document.getElementById("myDiv").innerHTML =
				 * xmlhttp.responseText;
				 */
				var result = xmlhttp.responseText;
				var json = JSON.parse(result);
				if(json.status==200){
				var jsonData = json.data;
				addNode(jsonData);
				}
			}
		}
		xmlhttp.open("POST", searchURL(), true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("name=" + name);
	}

}
//添加ul 、li结点
function addNode(json) {
	if (json != null || json != "") {
		removeCode();
		var mydiv = document.getElementById("myDiv");
		mydiv.innerHTML = "";
		var ul = document.createElement("ul");
		ul.id="mydiv_ul";
		mydiv.appendChild(ul);
		for (var i = 0; i < json.length; i++) {
			var nextNode = json[i];
			var li = document.createElement("li");
			li.setAttribute("class", "d7-sousuo-jl1");
			li.setAttribute("onclick", "javascript:alert('测试')");
			var litext = document.createTextNode(nextNode.title);
			li.appendChild(litext);			
			ul.appendChild(li);	
			/*var no=i+2;
			li.setAttribute('TabIndex', no);*/
		}		
		mydiv.style.border = "black 1px solid";	
	} 
}
//删除ul 、li结点
function removeCode() {
	var e = document.getElementById("myDiv");
	var size = e.childNodes.length;
	for (var k = size - 1; k >= 0; k--) {
		e.removeChild(e.childNodes[k]);
	}
	var mydiv = document.getElementById("myDiv");
	mydiv.style.border = "none";
}
//搜索框失去焦点
function loseFocus(){
	
	var ul = document.getElementById("mydiv_ul");	
	console.log("ceshi:" + document.activeElement.id);
	console.log("ceshi:" + document.activeElement.tagName);
	
	
	if(document.activeElement.id!="myDiv"&&document.activeElement.tagName!="BODY"){
		removeCode();
	}else{				
		var obj_lis = ul.getElementsByTagName("li");
		for(var i=0;i<obj_lis.length;i++){
	        obj_lis[i].onclick = function(){	        		        	 
				document.getElementById("search").value=this.innerHTML;
				document.getElementById("form1").submit();
				
	        }
	    }
	}
}



