 var httpd = "http://localhost:8891/rest/";

 
 function getItemCat(){
	 return httpd+"getTbItemCat";
 }
 function searchURL(){
	 return httpd+"search";
 }
 /* 首页点击搜索框后跳转*/
 var idxSearch = document.getElementById('idxSearch');
 function jumpToSearch(){
	window.location.href= "http://localhost:8892/search.html";
	 
 }