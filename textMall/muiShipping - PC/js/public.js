//cookie组件
function setCookie(name,value){
	var Days = 1;
	var exp = new Date();
	exp.setTime(exp.getTime() + Days*1*60*60*1000);//一小时后失效
	document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}
function getCookie(name){
	var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	if(arr=document.cookie.match(reg))
	return unescape(arr[2]);
	else
	return null;
}
function delCookie(name){
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval=getCookie(name);
	if(cval!=null)
	document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}
//时间戳转换成时间
Date.prototype.Format = function (fmt) {
    var o = {
            "M+": this.getMonth() + 1, // 月份
            "d+": this.getDate(), // 日
            "h+": this.getHours(), // 小时
            "m+": this.getMinutes(), // 分
            "s+": this.getSeconds(), // 秒
            "q+": Math.floor((this.getMonth() + 3) / 3), // 季度
            "S": this.getMilliseconds() // 毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + ""));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
//获取地址栏?后的参数值
 function GetQueryValue(queryName) {
	 var query = decodeURI(window.location.search.substring(1));
	 var vars = query.split("&");
	for (var i = 0; i < vars.length; i++) {
		var pair = vars[i].split("=");
		 if (pair[0] == queryName) { return pair[1]; }
	}
	 return null;
 }
 //弹出提示
 function msgBox(){
	 msg ='';
	 msg +='<div id="msg"style="position: fixed; top: 70%; left: 18%;background-color: #E9E9E9; width: 60%; height: 50px;border-radius: 20px;  color: #060606;text-align: center;line-height:50px ;font-size: 20px;z-index: 999;">';
	 msg +='错误提示';
	 msg +='</div>';
	 $('body').append(msg);
	 $('#msg').hide(0);
 }
//更换服务器ip
 function getIp(){
	// ip='47.98.40.146';
	ip='localhost';
	return ip;
}

 //按日期 重 新到旧 排序
 function DatetoLowPage(data, p) {
  for (i = 0; i < data.length - 1; i++) {
	  for (j = 0; j < data.length - 1 - i; j++) {
		  if (data[j][p] < data[j+1][p]) {
			  var temp = data[j];
			  data[j] = data[j + 1];
			  data[j + 1] = temp;
		 }
	 }
  }
 return data;
}

/* 随机数生成 */
	function sj(y,x) {
	    //x上限，y下限     
	    var x = x;
	    var y = y;
	    var rand = parseInt(Math.random() * (x - y + 1) + y);
	    return rand;
	}