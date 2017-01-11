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
  </head>
  <body>
    {{template "header.tpl" .}}
    <div class="container bs-docs-container">
        <div role="main">
          <div class="btn-group"><a href="{{.baseurl}}/contacts/show.do" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-circle-arrow-left"></i> 返回</a></div>
          <!-- Getting started ================================================== -->
          <form id="dataform" name="dataform" class="form-horizontal" role="form" enctype="multipart/form-data" method="post" action="{{.baseurl}}/contacts/save.do">
            <div class="panel panel-default">
              <div class="panel-heading">联系人信息</div>
              <div class="panel-body">
              <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">用户名<i class="cred">*</i></label>
                 <div class="col-sm-10">
                 {{if .exist}}
                    <input type="text" class="form-control" id="Uname" name="Uname" value="{{.data.Uname}}">
           <!--        </br><button type="button" id="btn_name" class="btn btn-danger"><i class="glyphicon glyphicon-floppy-disk"></i> 更改用户名</button> -->
                  {{else}}
                    <input type="text" class="form-control" id="Uname" name="Uname" value="{{.data.Uname}}"
                    placeholder="  --用户名选填，如果用户名不填则不开通即时通讯账号，仅供信息查看功能">
                  {{end}}
                </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">姓名<i class="cred">*</i></label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsRealname" name="ContactsRealname" value="{{.data.ContactsRealname}}"   placeholder="  --姓名必填">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">职位</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsPosition" name="ContactsPosition" value="{{.data.ContactsPosition}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">是否是领导</label>
                  <div class="col-sm-10">
                    <select class="form-control" id="ContactsIslead" name="ContactsIslead">
                      <option value="0">否</option>
                      <option value="1">是</option>
                    </select>
                  </div>
                </div>
                 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">手机号码1</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsPhone" name="ContactsPhone" value="{{.data.ContactsPhone}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">短号1</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsSphone" name="ContactsSphone" value="{{.data.ContactsSphone}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">手机号码2</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsTelecom" name="ContactsTelecom" value="{{.data.ContactsTelecom}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">短号2</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsStelecom" name="ContactsStelecom" value="{{.data.ContactsStelecom}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">手机号码3</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsUnicom" name="ContactsUnicom" value="{{.data.ContactsUnicom}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">短号3</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsSunicom" name="ContactsSunicom" value="{{.data.ContactsSunicom}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">办公室电话</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsOfficetel" name="ContactsOfficetel" value="{{.data.ContactsOfficetel}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">办公室电话</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsOfficestel" name="ContactsOfficestel" value="{{.data.ContactsOfficestel}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">办公室电话</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsSecondofficetel" name="ContactsSecondofficetel" value="{{.data.ContactsSecondofficetel}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">办公室电话</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsSecondofficestel" name="ContactsSecondofficestel" value="{{.data.ContactsSecondofficestel}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">家庭电话</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsHometel" name="ContactsHometel" value="{{.data.ContactsHometel}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">用户排序</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control" id="ContactsUserindex" name="ContactsUserindex" value="{{.data.ContactsUserindex}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">一级部门</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsArea" name="ContactsArea" value="{{.data.ContactsArea}}" placeholder="请输入一级部门">
                    <div class="dropdown">
                      <a data-toggle="dropdown" href="#">点击选择</a>
                      <ul id="c_level_1" class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">一级部门排序</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control" id="ContactsAreaindex" name="ContactsAreaindex" value="{{.data.ContactsAreaindex}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">二级部门</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsUnit" name="ContactsUnit" value="{{.data.ContactsUnit}}" placeholder="请输入二级部门">
                    <div class="dropdown">
                      <a data-toggle="dropdown" href="#">点击选择</a>
                      <ul id="c_level_2" class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">二级部门排序</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control" id="ContactsUnitindex" name="ContactsUnitindex" value="{{.data.ContactsUnitindex}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">三级部门</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsDepartment" name="ContactsDepartment" value="{{.data.ContactsDepartment}}" placeholder="请输入三级部门">
                    <div class="dropdown">
                      <a data-toggle="dropdown" href="#">点击选择</a>
                      <ul id="c_level_3" class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">三级部门排序</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control" id="ContactsDepartmentindex" name="ContactsDepartmentindex" value="{{.data.ContactsDepartmentindex}}">
                  </div>
                </div>

                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">工作地点</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsWorkspace" name="ContactsWorkspace" value="{{.data.ContactsWorkspace}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsEmail" name="ContactsEmail" value="{{.data.ContactsEmail}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">qq</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsQq" name="ContactsQq" value="{{.data.ContactsQq}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">首字母</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsFirstletter" name="ContactsFirstletter" value="{{.data.ContactsFirstletter}}">
                    <p class="c666">新增联系人，该字段系统会自动生成。</p>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">拼音</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsFullletter" name="ContactsFullletter" value="{{.data.ContactsFullletter}}">
                    <p class="c666">新增联系人，该字段系统会自动生成。</p>
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">对应键盘数字码</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ContactsNumletter" name="ContactsNumletter" value="{{.data.ContactsNumletter}}">
                    <p class="c666">新增联系人，该字段系统会自动生成。</p>
                  </div>
                </div>
              </div>
            </div>      

            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-floppy-disk"></i> 保 存</button>
              </div>
            </div>
            <input type="hidden" id="VersionId" name="VersionId" value="{{.data.VersionId}}">
            <input type="hidden" id="CustomerId" name="CustomerId" value="{{.data.CustomerId}}">
            <input type="hidden" id="ContactsId" name="ContactsId" value="{{.data.ContactsId}}">
            <input type="hidden" id="dbUname" name="dbUname" value="{{.data.Uname}}">
             <input type="hidden" id="Level" name="Level" value="{{.data.Level}}">
            <input type="hidden" id="ContactsVersion" name="ContactsVersion" value="{{.data.ContactsVersion}}">
          </form>
        </div>
    </div>
  </body>
  <script src="{{.baseurl}}/static/lib/jquery.js"></script>
  <script src="{{.baseurl}}/static/lib/bootstrap/js/bootstrap.min.js"></script>
  <script>
  $('#ContactsIslead').val({{.data.ContactsIslead}});
  var classdata;
  $.get('{{.baseurl}}/contacts/gettree.do?id={{.VersionId}}',function(data){
	classdata=data;
	createSelect(classdata,'c_level_1');
	initLoading4SubLevels('c_level_', 1);
  });
  console.log($('#c_level_1').html());
  function createSelect(data,id,l1){
    var data=data!=null?data:[];
    var html=[];
    var i=0,l=data.length;
    if(id=='c_level_1'){
      for(;i<l;i++){
        html.push('<li l1="'+i+'" index="'+data[i].index+'">'+data[i].name+'</li>');
      }
      if(html.length<=0) html=['<li>暂无分组</li>'];
      $('#c_level_1').html(html.join(''));
    }else if(id=='c_level_2'){
      for(;i<l;i++){
        html.push('<li l1="'+l1+'" l2="'+i+'" index="'+data[i].index+'">'+data[i].name+'</li>');
      }
      if(html.length<=0) html=['<li>暂无分组</li>'];
      $('#c_level_2').html(html.join(''));
    }else{
      for(;i<l;i++){
        html.push('<li index="'+data[i].index+'">'+data[i].name+'</li>');
      }
      if(html.length<=0) html=['<li>暂无分组</li>'];
      $('#c_level_3').html(html.join(''));
    }
  }
  $(document).on('click','#c_level_1 li',function(){
    var t=$(this).text();
    if(t=='暂无分组') t="";
    $('#ContactsArea').val(t);
    $('#ContactsAreaindex').val($(this).attr('index'));
    var l1=$(this).attr('l1');
    console.log(classdata[l1]);
    createSelect(classdata[l1].children,'c_level_2',l1);

    $('#ContactsUnit').val('');
    $('#ContactsUnitindex').val('');
    $('#ContactsDepartment').val('');
    $('#ContactsDepartmentindex').val('');
  });
  $(document).on('click','#c_level_2 li',function(){
    var t=$(this).text();
    if(t=='暂无分组') t="";
    $('#ContactsUnit').val(t);
    $('#ContactsUnitindex').val($(this).attr('index'));
    var l1=$(this).attr('l1'),l2=$(this).attr('l2');
    createSelect(classdata[l1].children[l2],'c_level_3');

    $('#ContactsDepartment').val('');
    $('#ContactsDepartmentindex').val('');
  });
  $(document).on('click','#c_level_3 li',function(){
    var t=$(this).text();
    if(t=='暂无分组') t="";
    $('#ContactsDepartment').val(t);
    $('#ContactsDepartmentindex').val($(this).attr('index'));
  });
  $(document).on('click','#btn_name',function(){
      alert("change the uname");
  });
  
  // 初始化加载二级部门
  
  function initLoading4SubLevels(levelId, level) {
	if (level >= 3)return;
	
	var inputNames = ['', 'ContactsArea', 'ContactsUnit', 'ContactsDepartment'];
	var levelName = levelId + '' + level,
	    inputName = inputNames[level],
		val = $('#' + inputName).val(),
		$aLi = $('#' + levelName).find('li'),
		$target;

	$aLi.each(function (){
		var thisVal = $(this).text();
		if ($.trim(val) === $.trim(thisVal)) {
			$target = $(this);
		}
	});

	if ($target) {
		var l1 = $target.attr('l1'),
			l2 = $target.attr('l2'),
			next = level + 1;
		
		if (level === 1){
			createSelect(classdata[l1].children, levelId+''+next, l1);
		} else if (level === 2) {
			createSelect(classdata[l1].children[l2], levelId+''+next);
		} else {
			// todo
		}
		
		setTimeout(function(){
			// 延迟加载第三级菜单
			initLoading4SubLevels(levelId, next);
		}, 4000);
	}
  }

  </script>
</html>
