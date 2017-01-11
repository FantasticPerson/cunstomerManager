<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>中威通讯管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="{{.baseurl}}/static/lib/jquery.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/js/ztree/jquery.ztree.all-3.5.min.js"></script>
	<link rel="stylesheet" href="{{.baseurl}}/static/js/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
  </head>
  <body>


<ul id="deptTree" class="ztree" style="max-height:320px;overflow:auto;"></ul>
<div class="buttonBar">
		<input type="submit" onclick="javascript:parent.deptDialog.close();"
			value="关闭" class="cancelBtn" /> <input type="submit"
			onclick="doChoose();" value="确定" class="confirmBtn" />
	</div>
</body>
<script type="text/javascript">
var currentDeptName = "";
var currentDeptId = "";
 $(function (){

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
                onClick:function(e,tid,tnode){

                  if(tnode.type=='0'){
					currentDeptName = tnode.name;
					currentDeptId = tnode.pId;
                  }
                }
              }
            };
        $.fn.zTree.init($("#deptTree"), setting);
    });
	
	function doChoose(){
		$(parent.dialog.iframe)[0].contentWindow.document.getElementById("Departid").value=currentDeptId;
		$(parent.dialog.iframe)[0].contentWindow.document.getElementById("Depart").value=currentDeptName;
		parent.deptDialog.close();
	}
</script>
</html>