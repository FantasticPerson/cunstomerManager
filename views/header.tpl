<header class="navbar navbar-inverse navbar-fixed-top" role="banner">
  <div class="container">
    <div style="color:#FFF;height:30px;line-height:30px;font-size:12px;"><span>组织单位：{{.vName}}</span><span style="margin-left:10px;">当前用户名：{{.uName}}</span></div>
    <div class="navbar-header">
      <a href="{{.baseurl}}" class="navbar-brand" id="logo"><i class="fa fa-cloud"></i>TrueIM Cloud</a>
    </div>
    <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
      <ul class="nav navbar-nav">
        <li>
          <a class="active" href="{{.baseurl}}/chart/main.do"><i class="fa fa-bar-chart-o"></i> 组织信息</a>
        </li>
        <li>
          <a href="{{.baseurl}}/contacts/show.do"><i class="fa fa-book"></i> 通讯录管理</a>
        </li>
        <li>
          <a href="{{.baseurl}}/im/main.do"><i class="fa fa-comments-o"></i> IM管理</a>
        </li>
         <li>
          <a href="{{.baseurl}}/role/main.do"><i class="fa fa-comments-o"></i> 角色管理</a>
        </li>
        {{if eq .project "2"}}
  
              {{if eq .s_level "1"}}
                <li style="display:none">
                  <a href="{{.baseurl}}/superadmin/manager.do"><i class="fa fa-comments-o"></i>管理员管理</a>
                </li>
              {{end}}

        {{else}}
          <li>
         <a href="{{.baseurl}}/im/group"><i class="fa fa-comments-o"></i> 群组管理</a>
        </li>   
        {{end}}
  
          <li>
              <a href="{{.baseurl}}/keyword/main.do"><i class="fa fa-comments-o"></i>敏感词管理</a>
         </li>
          <li>
              <a href="{{.baseurl}}/depart/license.do"><i class="fa fa-comments-o"></i>license页面</a>
         </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li>
          <a href="{{.baseurl}}/sign/checkout.do"><i class="fa fa-power-off"></i> 退出</a>
        </li>
      </ul>
    </nav>
	<input type="hidden" id="Project" name="Project" value="{{.project}}">
  </div>
</header>
<hr>
