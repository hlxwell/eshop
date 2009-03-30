//lightbox跳出窗口
var GB_ROOT_DIR = "/hcrm/website/hotelhome/js/greybox/";
$import("/hcrm/website/hotelhome/js/greybox/AJS.js","js");
$import("/hcrm/website/hotelhome/js/greybox/gb_scripts.js","js");
//lightbox结束

$import("/hcrm/website/hotelhome/js/calendar/calendar.js","js");//日历
$import("/hcrm/website/hotelhome/js/md5.js","js");//登录加密

var hotelCode="00441", language="chs";//code根据酒店进行修改

//********日期函数********
var gDateDelimiter="-";		//日期分隔符
function gGetDateTimeStr(iChoice,oDate){
	var yy=oDate.getFullYear(), mm=oDate.getMonth()+1, dd=oDate.getDate();
	var hh=oDate.getHours(), nn=oDate.getMinutes(), ss=oDate.getSeconds();
	if(mm<10) mm="0"+mm;
	if(dd<10) dd="0"+dd;
	if(hh<10) hh="0"+hh;
	if(nn<10) nn="0"+nn;
	if(ss<10) ss="0"+ss;
	if(iChoice==0) return (yy+gDateDelimiter+mm+gDateDelimiter+dd);
	if(iChoice==1) return (hh+":"+nn+":"+ss);
	if(iChoice==2) return (yy+gDateDelimiter+mm+gDateDelimiter+dd+" "+hh+":"+nn+":"+ss);
	return "";
}
function gDateAdd(dateStr,addYear,addMonth,addDate){
	var dt=new Date(Date.parse(gReplace(dateStr,"-","/")));
	dt.setFullYear(dt.getFullYear()+addYear);
	dt.setMonth(dt.getMonth()+addMonth);
	dt.setDate(dt.getDate()+addDate);
	return gGetDateTimeStr(0,dt);
}
function gGetToday(){
	return gGetDateTimeStr(0,new Date());
}
function gReplace(src,sFor,sBy){
	if(sFor==""||sBy=="") return src;
	for(var l=sFor.length,s="",p0=0,p;(p=src.indexOf(sFor,p0))>=0;s+=src.substring(p0,p)+sBy,p0=p+l);
	return (s+src.substring(p0));
}
//********日期函数结束********

//预订自动加载时间
function MM_preloadcalendar() { //v3.0
  try{
	var sdt=gGetToday();
	var f=document.queryPriceForm;
	f.hotelCode.value=hotelCode;
	f.language.value=language;
	f.action="/hcrm/"+language+"/hotelhome/"+hotelCode+"/reservation-booking.jsp";
	f.checkInDate.value=sdt;
	f.checkOutDate.value=gDateAdd(sdt,0,0,1);
  }
  catch (e){
  }

}
MM_preloadcalendar();

//用户登录
function validate(){
	var f=document.forms.loginForm;
	f.hotelCode.value=hotelCode;
	f.language.value=language;
	if (f.loginName1.value==""){
		window.alert("用户名不能为空！");
		f.loginName1.focus();
		return false;
	}
	if (f.password1.value==""){
		window.alert("密码不能为空！");
		f.password1.focus();
		return false;
	}
	f.password.value=MD5(f.password1.value);
	f.loginName.value=f.loginName1.value;
	f.password1.value="";
	f.loginName1.value="";
	return true;
}

//判断登录
function g_login(){
	if (!validate()) {
		return false;
	}
	
	var result = ajax_validate();
	if(result=='hotel'){
		document.forms.loginForm.submit();
	}else if(result=='guest'){
		guest_login();
	}else{
		return false;
	}
}
function guest_login(){
	var f = document.forms.loginForm;
	var url = "/hcrm/logon.do?hotelCode="+hotelCode+"&language="+language
				+"&loginName="+encodeURI(f.loginName.value)
				+"&password="+f.password.value
				+"&loginType=hotel&loginPage=hotelLogin.jsp";
	GB_showCenter("杭州宁远农业技术开发有限公司",url,550,650);//酒店名字，550是高，650是宽，根据需要修改。
}
//判断登录结束

function afterSetDay(){
	//预订入住时间
	var f=document.forms.queryPriceForm;
	if(outObject.name=="checkInDate" && f.checkInDate.value>=f.checkOutDate.value)	
		f.checkOutDate.value=gDateAdd(f.checkInDate.value,0,0,1);
	else if(outObject.name=="checkOutDate" && f.checkInDate.value>f.checkOutDate.value)
		f.checkInDate.value=gDateAdd(f.checkOutDate.value,0,0,-1);
}

//查询按钮
function queryPrice(){
	var f=document.forms.queryPriceForm;
	if(f.checkInDate.value<gGetToday()){
		alert("入住日期先于今日！");
		f.checkInDate.value=gGetToday();
		f.checkOutDate.value=gDateAdd(f.checkInDate.value,0,0,1);
		return false;
	}
	
	if(f.checkInDate.value>=f.checkOutDate.value){
		alert("离店日期先于入住日期！");
		return false;
	}
	if(f.checkOutDate.value>gDateAdd(f.checkInDate.value,1,0,0)){
		alert("入住时间大于一年！");
		f.checkOutDate.value=gDateAdd(f.checkInDate.value,1,0,0);
		return false;
	}

	var paction="/hcrm/FITRoomOrder.do?method=addForFIT&hotelCode="
			+hotelCode+"&language="+language+"&checkInDate="+f.checkInDate.value
			+"&checkOutDate="+f.checkOutDate.value+"&roomNum="+f.roomNum.value;

	GB_showCenter("杭州宁远农业技术开发有限公司",paction,550,650);//酒店名字，550是高，650是宽，根据需要修改。
	//f.action=paction;
	//this.href=paction;
	//f.target="_blank";
	//f.submit();
}

//我的预订
function mybooking(){
	var url ="/hcrm/FITRoomOrder.do?method=queryOrder&language="+language+"&hotelCode="+hotelCode;
 	GB_showCenter("杭州宁远农业技术开发有限公司",url,550,650);//酒店名字，550是高，650是宽，根据需要修改。
}

//取回密码
function findPassword(){
 	var url ="/hcrm/FITMember.do?method=forgetPassword&hotelCode="+hotelCode+"&language="+language;
 	GB_showCenter("杭州宁远农业技术开发有限公司",url,450,650);//酒店名字，550是高，650是宽，根据需要修改。
}

//注册
function register(){
	var url = "/hcrm/FITMember.do?method=addForWeb&hotelCode="+hotelCode+"&language="+language;
	GB_showCenter("杭州宁远农业技术开发有限公司",url,550,650);//酒店名字，550是高，650是宽，根据需要修改。
}

//新闻更多
function onLoadWebNews(){
	top.location="/hcrm/website/hotelhome/"+hotelCode+"/cn/allNews.jsp?hotelCode="+hotelCode+"&langCode="+language+"&type=1";
}

//促销更多
function onLoadPromotions(){
	top.location="/hcrm/website/hotelhome/"+hotelCode+"/cn/allNews.jsp?hotelCode="+hotelCode+"&langCode="+language+"&type=0";
}


function $import(path, type){
  if (type == "css") {
      document.write("<" + "link rel=\"stylesheet\" rev=\"stylesheet\" href=\"" + path + "\" type=\"text/css\" media=\"screen\" />");
  } else {
      document.write("<" + "script src=\"" + path + "\" type=\"text/javascript\"></" + "script>");
  }
}





//判断登录的，基本上不需要改动
function ajax_validate(){	
	var url = '/hcrm/website/hotelhome/logon.jsp';//如有需要改动地址，这边也请加上！
	var f=document.forms.loginForm;
	var paras = 'hotelCode='+f.hotelCode.value
				+'&language='+f.language.value
				+'&loginName='+f.loginName.value
				+'&password='+f.password.value;	
	var result={};
	var request = new XmlRequest();
	if (request){
	  var connect = request.connect(
	  	url,
	  	'post',
	  	paras,
	  	function(x){
	  	  try{
	  	    result=eval(x.responseText);
	  	    if (!result.isSuccess){
	  	  	  if (result.msg)alert(result.msg);
	  	    }
	  	  }catch(e){}
	  	}
	  );
	  if (!connect){
	  	return false;
	  }
	}else{
	  alert("XMLHttpRequest not available. Try a newer/better browser.");
	  return false;
	}
	return (!result.isSuccess)?false:result.isHotel?'hotel':'guest';
}
function XmlRequest(){
  var request,cp;
  try{request=new ActiveXObject("Msxml2.XMLHTTP");}
  catch(e){try{request=new ActiveXObject("Microsoft.XMLHTTP");}
  catch(e){try{request=new XMLHttpRequest();}
  catch(e){request=false;}}}
  if(!request)return null;
  this.connect=function(url,m,v,fn){
    if(!request)return false;
    cp=false;
    m=m.toUpperCase();
    try{
      if(m=="GET"){
        request.open(m,url+"?"+v,false);
        v="";
      }else{
        request.open(m,url,false);
        request.setRequestHeader("Method","POST "+url+" HTTP/1.1");
        request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
      }
      request.send(v);
	  
	if (request.readyState == 4) {
		if (request.status == 200) {
			fn(request);
		}
	}

    }
    catch(z){return false;}
    return true;
  };
  return this;
}