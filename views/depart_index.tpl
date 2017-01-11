<!DOCTYPE html>
<html>
  <head>
  	<meta charset="utf-8">
    <title>中威通讯管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{.baseurl}}/static/lib/bootstrap/css/bootstrap.min.css">
  	<link rel="stylesheet" href="{{.baseurl}}/static/lib/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="{{.baseurl}}/static/lib/font-awesome/css/font-awesome.min.css">
  	<link rel="stylesheet" href="{{.baseurl}}/static/css/app.css">
    <link rel="stylesheet" href="{{.baseurl}}/static/js/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
    <style type="text/css">
      #inputdiv {
        position: absolute;
        left: 338px;
        top:90px;
        width: 440px;
        height:250px;
        z-index: 1;
        background-color: #ffffff;
        border: solid #7A7A7A 4px;
      }
      #rMenu {
          background-color: #555555;
          text-align: left;
          padding: 2px;
          width: 100px;
          position: absolute;
          display: none;
      }
      #rMenu ul {
        margin: 1px 0;
        padding: 0 0px;
        background-color: #DFDFDF;
      }

       #rMenu ul li {
          margin-top: 2px;
          margin-bottom: 2px;
          cursor: pointer;
          padding-top: 4px;
          padding-left: 10px;
          padding-bottom: 4px;
          background-color: #d3d3d3;
          list-style-type: none;
       }

       #rMenu ul li:hover{
         color: #ffffff;
         background-color: #87ceeb;
       }

       .slide {
           position: absolute;
           padding-top: 4px;
           padding-left: 10px;
           margin-top: 2px;
           margin-bottom: 2px;
           background-color: #ffffff;
           border: solid #7A7A7A 4px;
           width:100%;
       }
    </style>
  </head>
  <body>
       <header class="navbar navbar-inverse navbar-fixed-top bs-docs-nav" role="banner">
      <div class="container">
        <div class="navbar-header">
          <a href="{{.baseurl}}" class="navbar-brand" id="logo"><i class="fa fa-cloud"></i> TrueIM Cloud</a>
        </div>
        <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
          <ul class="nav navbar-nav">
            <li>
              <a href="{{.baseurl}}/chart/main.do"><i class="fa fa-bar-chart-o"></i> 统计信息</a>
            </li>
            <li>
     <a href="{{.baseurl}}/depart/show.do"><i class="fa fa-book"></i> 通讯录管理</a>
            </li>
            <li>
              <a class="active" href="{{.baseurl}}/im/main.do"><i class="fa fa-comments-o"></i> IM管理</a>
            </li>
               <li>
              <a href="{{.baseurl}}/role/main.do"><i class="fa fa-comments-o"></i> 角色管理</a>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li>
              <a href="{{.baseurl}}/sign/checkout.do"><i class="fa fa-power-off"></i> 退出</a>
            </li>
          </ul>
        </nav>
      </div>
    </header>
<div class="container bs-docs-container">
       <div class="col-md-3">
          <div class="slide" >
              <div class="btn btn-primary"><span style="cursor:pointer" class="create">创建顶级部门</span></div>
            <ul id="tree" class="ztree">
            </ul>
          </div>
        </div>

    <div id="rMenu">
        <ul><li>新增</li>
        <li>编辑</li>
        <li>删除</li></ul>
    </div>
    <div id="inputdiv">
      <div style="background-color:#87ceeb;padding-top:4px;padding-bottom: 4px;"><span id="close" style="cursor:pointer;color: #ffffff;background-color: #fa8072;padding-top:4px;padding-bottom: 4px;padding-right: 4px;padding-left:4px; margin-left:5px;">关闭</span></div>
     
      <div align="left" style="margin-left:1cm;">
      <h3 id="dialog_title"></h3>
      <p>
        部门名：<input type="text" id="inputedit" value=""></p>
      <p>
        部门排序： <input type="number"  id="departIndex" value="">
      </p>
      <div class="btn-group">
             <div  type="button" class="btn btn-primary" id="saveDepart"><span style="cursor:pointer">提交</span></div>
      </div>
      <div>
    </div>
  </body>
  <script src="{{.baseurl}}/static/lib/jquery.js"></script>
  <script src="{{.baseurl}}/static/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="{{.baseurl}}/static/js/juicer.min.js"></script>
  <script type="text/javascript" src="{{.baseurl}}/static/js/ztree/jquery.ztree.core-3.5.js"></script>
  <script type="text/javascript">
      function uploadFile() {
        var fd = new FormData();
        fd.append("ExcelFile", document.getElementById('ExcelFile').files[0]);
        var xhr = new XMLHttpRequest();
        xhr.upload.addEventListener("progress", uploadProgress, false);
        xhr.addEventListener("load", uploadComplete, false);
        xhr.addEventListener("error", uploadFailed, false);
        xhr.addEventListener("abort", uploadCanceled, false);
        xhr.open("POST", "{{.baseurl}}/depart/import_excel.do");
        xhr.send(fd);
      }

        function uploadProgress(evt) {
        if (evt.lengthComputable) {
          var percentComplete = Math.round(evt.loaded * 100 / evt.total);
          document.getElementById('progressNumber').innerHTML = percentComplete.toString() + '%';
        }
        else {
          document.getElementById('progressNumber').innerHTML = 'unable to compute';
        }
      }

      function uploadComplete(evt) {
        //This event is raised when the server send back a response 
        document.getElementById('fileType').innerHTML = '导入进度: ' + evt.target.responseText;
        alert(evt.target.responseText);
      }

      function uploadFailed(evt) {
        alert("There was an error attempting to upload the file.");
      }

      function uploadCanceled(evt) {
        alert("The upload has been canceled by the user or the browser dropped the connection.");
      }

    $(function(){
      var departID;
      var departName;
      var departIndex;
      var departModel;
      function zTreeOnRightClick(event,treeId,treeNode){
        if(!treeNode){
          return;
        }
        departID=treeNode.pId;
        departName=treeNode.name;
        departIndex= treeNode.index;
        showRMenu("node",event.clientX,event.clientY);
      }
      function showRMenu(type,x,y){
        $("#rMenu").show();
        $("#rMenu").css({"top":y+"px","left":x+"px","display":"block"});
      }

      function hideRMenu(){
        $("#rMenu").hide();
      }

      $("#inputdiv").hide();
      $("body").bind(
          "mousedown",function(event){
            if(!(event.target.id=="rMenu"||$(event.target).parents("#rMenu").length>0)){
              $("#rMenu").hide();
          }});
      $(".create").click(function(){
              departID="";
              departModel=0;
              $('#inputedit').val("");
              $('#departIndex').val("");
              $('#dialog_title').html("新增部门");
            $("#inputdiv").fadeIn("slow");
          });
          $("#close").click(function(){
            $("#inputdiv").fadeOut("slow");
          });

      /**
       * 提交部门处理
       */
      $("#saveDepart").click(function(){
         var inputName=$('#inputedit').val();
         if(inputName==""){
            alert("请输入部门名！");
            return;
         }
          var index= $('#departIndex').val();
          var url = '{{.baseurl}}/depart/create.do?pid='+departID+'&model='+departModel+'&name='+inputName+'&departIndex='+index;
          location.href=url;
          
          $("#inputdiv").fadeOut("slow");
      });
      $("#rMenu ul li").click(function (){
          hideRMenu();
          
          var button=$(this).text();
          if(button=="新增"){
              departModel=0;
              $('#inputedit').val("");
              $('#departIndex').val("");
              $('#dialog_title').html("新增部门");
              $("#inputdiv").fadeIn("slow");
          }else if(button=="编辑"){
              departModel=1;
              $('#dialog_title').html("部门编辑");
              $('#departIndex').val(departIndex);
              $('#inputedit').val(departName);
              $("#inputdiv").fadeIn("slow");
          }else{
            //弹出删除确认框
            if(confirm("确认删除该部门吗？")){
              departModel=2;
              location.href='{{.baseurl}}/depart/create.do?model='+departModel+'&pid='+departID;
             }
          }
      });
       var setting = {
            view: {
              selectedMulti: false
            },
            async:{
              type:"get",
              enable: true,
              url:'{{.baseurl}}/depart/gettree2.do'
            },
            callback:{
              onRightClick:zTreeOnRightClick,
              onClick:function(e,tid,tnode){
                if(tnode.type=='0'){
                    // initContacts(tnode.pId,'');
                }
              }
            }
          };
      $.fn.zTree.init($("#tree"), setting);
    });
  </script>
</html>
