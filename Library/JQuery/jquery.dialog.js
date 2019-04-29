(function($){
	$.fn.ShowDialog = function(options) {
	var opts = $.extend({},$.fn.ShowDialog.defaults,options);
	$(this).click(function(){
		//设置皮肤
   		var skinurl="",yanse="";
		switch(opts.skin)
		{
			case "blue":
			skinurl="../Common/Image/diagcloseblue.gif";	
			skinurl2="../Common/Image/diagcloseorange.gif";	
			yanse="blue";
			break;
			case "red":
			skinurl="images/red/close_1.gif";	
			skinurl2="images/blue/close_2.gif";	
			yanse="red";
			break;
			case "green":
			skinurl="images/green/close_1.gif";	
			skinurl2="images/blue/close_2.gif";	
			yanse="green";
			break;
		}	
		$("#showdialogcss").attr("href","../Common/Layout/Default.css");
			//如果对话框不存在追加对话 如果对话框存在现实
			if(!$("#diawindow").length>0)
			{
				var maktemp='<div id="markdiag" style="background:#666;width:'+$(document).width()+'; height:'+($(document).height())+'px; position:absolute; top:0px; left:0px; z-index:80;"></div>';
				var tempstr ='';
				//内容加载方式 1为html加载 0 为iframe加载
				if(opts.ContentFlag==1)
			{
				tempstr ='<div class="showdiv" id="diawindow" style="display:none;"><div class="top"><div class="topleft"></div><div class="topmiddle" id="topmiddle"> <span style="float:left; color:#FFF; font-weight:bold; line-height:26px; font-size:12px;">&nbsp;'+opts.Title+'</span><span style="float:right"><a href="javascript:"><img border="0" src="'+skinurl+'" width="26" height="20" id="diagclose" /></a></span></div><div class="topright"></div></div><div class="clear"></div><div class="middle"><div class="middleleft" id="middleleft"></div><div class="middlemiddle"  id="middlemiddle"><div style="padding:5px;background:#fff;" id="middlecontent">'+opts.Contents+'</div></div><div class="middleright" id="middleright"></div></div><div class="clear"></div><div class="end"><div class="endleft"></div><div class="endmiddle" id="endmiddle"></div><div class="endright"></div></div><div class="clear"></div></div>';
			}
			else
			{
				tempstr ='<div class="showdiv" id="diawindow" style="display:none;"><div class="top"><div class="topleft"></div><div class="topmiddle" id="topmiddle"> <span style="float:left; color:#FFF; font-weight:bold; line-height:26px; font-size:12px;">&nbsp;'+opts.Title+'</span><span style="float:right"><a href="javascript:"><img border="0" src="'+skinurl+'" width="26" height="20" id="diagclose" /></a></span></div><div class="topright"></div></div><div class="clear"></div><div class="middle"><div class="middleleft" id="middleleft"></div><div class="middlemiddle"  id="middlemiddle"><div style="padding:5px;background:#fff;" id="middlecontent"><iframe src="'+opts.FrameURL+'" style="height:100%; width:100%;" scrolling="no" frameborder="0"></iframe></div></div><div class="middleright" id="middleright"></div></div><div class="clear"></div><div class="end"><div class="endleft"></div><div class="endmiddle" id="endmiddle"></div><div class="endright"></div></div><div class="clear"></div></div>';
			}
			$("body").append(maktemp);
			$("body").append(tempstr);									  
			}
			else
			{
				$("#markdiag").show();
				$("#showdiv").show();
			}
			//设置遮罩层的透明度
			var css={}
			if(window.navigator.userAgent.indexOf('MSIE')>=1)
			{
				css.filter= 'progid:DXImageTransform.Microsoft.Alpha(opacity='+opts.Intopacity*100+')';
			}
			else
			{
				css.opacity= opts.Intopacity;
		    }
			$("#markdiag").css(css);
			//设置对话框的位置
			var w,h,de;
			de = document.documentElement;
			w = self.innerWidth || (de&&de.clientWidth) || document.body.clientWidth;
			h = self.innerHeight || (de&&de.clientHeight)|| document.body.clientHeight;
			var diagtop = h/2-(opts.Height/2)+eval($(document).scrollTop());
			var diagleft = w/2-(opts.Width/2)+eval($(document).scrollLeft());	
			$("#diawindow").css({"top" : diagtop,"left":diagleft,"width":opts.Width,"height":opts.Height});
			$("#topmiddle").css({"width":opts.Width-20});
			$("#middlemiddle").css({"width":opts.Width-8,"height":opts.Height-34});
			$("#middleleft").css({"height":opts.Height-34});
			$("#middleright").css({"height":opts.Height-34});
			$("#middlecontent").css({"height":opts.Height-44});								
			$("#endmiddle").css({"width":opts.Width-20});
			
			//滚动条滚动永远居中-----------------开始
			if(opts.IsAutoCenter==1)
			{
				$(window).scroll(function(){
					var diagtop = h/2-(opts.Height/2)+eval($(document).scrollTop());
					var diagleft = w/2-(opts.Width/2)+eval($(document).scrollLeft());
				$("#diawindow").css({"top" : diagtop,"left":diagleft });
				});
			}
			if(opts.Isfade==1)
			{
				$("#diawindow").fadeIn("slow");
			}
			else
			{
				$("#diawindow").show();
			}
			
			//滚动条滚动永远居中-----------------结束
			//关闭按钮事件   -------------开始
			$("#diagclose").mousemove(
				  function(){
					  $(this).attr("src",skinurl2);
				  }
				  ).mouseout(
				  function(){
					  $(this).attr("src",skinurl);
				  }
				  ).click(function(){
					  if($("#diawindow").length>0)
					  {
						  $("#diawindow").remove();
					  }
					  if($("#markdiag").length>0)
					  {
						  $("#markdiag").remove();
					  }
   			})
			//关闭按钮事件   -------------结束
			//拖动         -------------开始
			if(opts.IsDrag==1)
			{
				document.onselectstart = function(){return true;}; 
				var moveFlag = false;
				var mouseStartLeft = mouseStartTop = 0;
				var divStartLeft = divStartTop = 0;
				$("#diawindow").mousedown(function(e){
						moveFlag = true;
						$("#diawindow").css({"cursor":"move"});
						mouseStartLeft = (typeof(event)!='undefined') ? event.x : e.pageX;
						mouseStartTop = (typeof(event)!='undefined') ? event.y : e.pageY;
						divStartLeft = $("#diawindow").offset().left;
						divStartTop = $("#diawindow").offset().top;
				}).mouseup(function () {
						moveFlag = false;
						$("#diawindow").css({"cursor":"default"});
						mouseStartLeft = mouseStartTop = 0;
						divStartLeft = divStartTop = 0;
				});									
				$(document).mousemove(function (e) {		 
				if (!moveFlag) return;
				document.onselectstart = function(){return false;}; 
				var mouseLeft = (typeof(event)!='undefined') ? event.x : e.pageX;
				var mouseTop = (typeof(event)!='undefined') ? event.y : e.pageY;
				var addLeft = mouseLeft - mouseStartLeft;
				var addTop = mouseTop - mouseStartTop;
				$("#diawindow").css({"left":divStartLeft+addLeft, "top":divStartTop+addTop});
				});	
			}
			//拖动         -------------结束
			
			//窗口大小改变时 修改遮罩层和窗口位置               ---------------开始
			$(window).resize(function(){
				  //修改遮罩层
				  var markxint = 0,markyint=0;
				  if($(document).width()>=$(window).width())
				  {
					  markxint = $(document).width();
				  }
				  else
				  {
					  markxint = $(window).width();
				  }
				  if($(document).height()>=$(window).height())
				  {
					  markyint = $(document).height();
				  }
				  else
				  {
					  markyint = $(window).height();
				  }
				  $("#markdiag").height(markyint).width(markxint);
				  //移动对话框
				  var topy=0,leftx=0;
				  if($(window).width()>opts.Width)
				  {
					  leftx = ($(window).width()-opts.Width)/2;
				  }
				  if($(window).height()>opts.Height)
				  {
					  topy = ($(window).height()-opts.Height)/2;
				  }
				  $("#diawindow").css({"top" : topy,"left":leftx });
			});
			//窗口大小改变时 修改遮罩层和窗口位置               ---------------结束				
		})
	};
	
	//默认参数
	$.fn.ShowDialog.defaults={
		Width: "650",
		Height: "450",
		Title: "Dialog",
		Intopacity: "0.2",
		ContentFlag: "1",
		skin: "blue",
		FrameURL: "http://www.51testing.com/?uid/275266",
		Contents: "There is No Content Found ...",
		IsDrag: "0",
		IsAutoCenter: "1",
		Isfade: "1"
	};
})(jQuery);