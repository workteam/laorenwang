<!doctype html>
<html>
<head>
<meta charset="<?php echo htmlspecialchars(Wekit::app()->charset, ENT_QUOTES, 'UTF-8');?>" />
<title><?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','seo','title'), ENT_QUOTES, 'UTF-8');?> - Powered by phpwind</title>
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<meta name="generator" content="phpwind v<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','version'), ENT_QUOTES, 'UTF-8');?>" />
<meta name="description" content="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','seo','description'), ENT_QUOTES, 'UTF-8');?>" />
<meta name="keywords" content="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','seo','keywords'), ENT_QUOTES, 'UTF-8');?>" />
<link rel="stylesheet" href="<?php echo Wekit::app()->themes.'/site/'.Wekit::C('site', 'theme.site.default').'/css'.Wekit::getGlobal('theme','debug'); ?>/core.css?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" />
<link rel="stylesheet" href="<?php echo Wekit::app()->themes.'/site/'.Wekit::C('site', 'theme.site.default').'/css'.Wekit::getGlobal('theme','debug'); ?>/style.css?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" />
<!-- <base id="headbase" href="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','base'), ENT_QUOTES, 'UTF-8');?>/" /> -->
<?php echo Wekit::C('site', 'css.tag');?>
<script>
//全局变量 Global Variables
var GV = {
	JS_ROOT : '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','res'), ENT_QUOTES, 'UTF-8');?>/js/dev/',										//js目录
	JS_VERSION : '<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>',											//js版本号(不能带空格)
	JS_EXTRES : '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','extres'), ENT_QUOTES, 'UTF-8');?>',
	TOKEN : '<?php echo htmlspecialchars(Wind::getComponent('windToken')->saveToken('csrf_token'), ENT_QUOTES, 'UTF-8');?>',	//token $.ajaxSetup data
	U_CENTER : '<?php echo Wekit::app()->baseUrl,'/','index.php?m=space'; ?>',		//用户空间(参数 : uid)
<?php 
$loginUser = Wekit::getLoginUser();
if ($loginUser->isExists()) {
?>
	//登录后
	U_NAME : '<?php echo htmlspecialchars($loginUser->username, ENT_QUOTES, 'UTF-8');?>',										//登录用户名
	U_AVATAR : '<?php echo htmlspecialchars(Pw::getAvatar($loginUser->uid), ENT_QUOTES, 'UTF-8');?>',							//登录用户头像
<?php 
}
?>
	U_AVATAR_DEF : '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>/face/face_small.jpg',					//默认小头像
	U_ID : parseInt('<?php echo htmlspecialchars($loginUser->uid, ENT_QUOTES, 'UTF-8');?>'),									//uid
	REGION_CONFIG : '',														//地区数据
	CREDIT_REWARD_JUDGE : '<?php echo $loginUser->showCreditNotice();?>',			//是否积分奖励，空值:false, 1:true
	URL : {
		LOGIN : '<?php echo Wekit::app()->baseUrl,'/','index.php?m=u&c=login'; ?>',										//登录地址
		QUICK_LOGIN : '<?php echo Wekit::app()->baseUrl,'/','index.php?m=u&c=login&a=fast'; ?>',								//快速登录
		IMAGE_RES: '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>',										//图片目录
		CHECK_IMG : '<?php echo Wekit::app()->baseUrl,'/','index.php?m=u&c=login&a=showverify'; ?>',							//验证码图片url，global.js引用
		VARIFY : '<?php echo Wekit::app()->baseUrl,'/','index.php?m=verify&a=get'; ?>',									//验证码html
		VARIFY_CHECK : '<?php echo Wekit::app()->baseUrl,'/','index.php?m=verify&a=check'; ?>',							//验证码html
		HEAD_MSG : {
			LIST : '<?php echo Wekit::app()->baseUrl,'/','index.php?m=message&c=notice&a=minilist'; ?>'							//头部消息_列表
		},
		USER_CARD : '<?php echo Wekit::app()->baseUrl,'/','index.php?m=space&c=card'; ?>',								//小名片(参数 : uid)
		LIKE_FORWARDING : '<?php echo Wekit::app()->baseUrl,'/','index.php?c=post&a=doreply'; ?>',							//喜欢转发(参数 : fid)
		REGION : '<?php echo Wekit::app()->baseUrl,'/','index.php?m=bbs&c=webData&a=area'; ?>',									//地区数据
		SCHOOL : '<?php echo Wekit::app()->baseUrl,'/','index.php?m=bbs&c=webData&a=school'; ?>',								//学校数据
		EMOTIONS : "<?php echo Wekit::app()->baseUrl,'/','index.php?m=emotion&type=bbs'; ?>",					//表情数据
		CRON_AJAX : '<?php echo htmlspecialchars($runCron, ENT_QUOTES, 'UTF-8');?>',											//计划任务 后端输出执行
		FORUM_LIST : '<?php echo Wekit::app()->baseUrl,'/','index.php?m=bbs&c=forum&a=list'; ?>',								//版块列表数据
		CREDIT_REWARD_DATA : '<?php echo Wekit::app()->baseUrl,'/','index.php?m=u&a=showcredit'; ?>',					//积分奖励 数据
		AT_URL: '<?php echo Wekit::app()->baseUrl,'/','index.php?m=bbs&c=remind'; ?>',									//@好友列表接口
		TOPIC_TYPIC: '<?php echo Wekit::app()->baseUrl,'/','index.php?m=bbs&c=forum&a=topictype'; ?>'							//主题分类
	}
};
</script>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/wind.js?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>

<link href="<?php echo Wekit::app()->themes.'/site/default/css'.Wekit::getGlobal('theme','debug'); ?>/fans.css?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" rel="stylesheet" />
</head>
<body>
<div class="wrap">
<?php if ($site_info_notice = Wekit::C('site','info.notice')) {?>
<style>.header_wrap{top:29px;}body{padding-top:75px;}</style><div id="notice"><?php echo htmlspecialchars($site_info_notice, ENT_QUOTES, 'UTF-8');?></div>
<?php }?>
<header class="header_wrap">
	<div id="J_header" class="header cc">
		<div class="logo">
			<a href="<?php echo Wekit::app()->baseUrl,'/',''; ?>">
				<?php  if($__css = Wekit::C('site', 'css.logo')) { ?>
				<!--后台logo上传-->
				<img src="<?php echo htmlspecialchars(Pw::getPath($__css), ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars(Wekit::C('site','info.name'), ENT_QUOTES, 'UTF-8');?>">
				<?php  } else { ?>
				<img src="<?php echo Wekit::app()->themes.'/site/'.Wekit::C('site', 'theme.site.default').'/images'; ?>/logo.png" alt="<?php echo htmlspecialchars(Wekit::C('site','info.name'), ENT_QUOTES, 'UTF-8');?>">
				<?php  } ?>
			</a>
		</div>
		<nav class="nav_wrap">
			<div class="nav">
				<ul>
	<?php  $nav = Wekit::load('SRV:nav.bo.PwNavBo');
		  $nav->setRouter();
		  $currentId =  '';
		   $main = $child = array();
		  if ($nav->isForum()) $nav->setForum($pwforum->foruminfo['parentid'], $fid, $tid);
		  $main = $nav->getNavFromConfig('main', true);
		  foreach($main as $key=>$value):
			if ($value['current']) {
				$current = 'current';
				$currentId = $key;
			} else {
				$current = '';
			}
			$value['child'] && $child[$key] = $value['child'];
		  ?>
					<li class="<?php echo htmlspecialchars($current, ENT_QUOTES, 'UTF-8');?>"><?php echo $value['name'];?></li>
	<?php  endforeach; ?>
				</ul>
			</div>
		</nav>
		<div class="header_search" role="search">
			<form action="<?php echo Wekit::app()->baseUrl,'/','index.php?m=search&c=s'; ?>" method="post">
				<input type="text" id="s" aria-label="搜索关键词" accesskey="s" placeholder="搜索其实很简单" x-webkit-speech speech name="keyword"/>
				<button type="submit" aria-label="搜索"><img src="<?php echo Wekit::app()->themes.'/site/'.Wekit::C('site', 'theme.site.default').'/images'; ?>/common/search.png" alt="search" /></button>
			<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
		</div>
		<?php
PwHook::display(array(PwSimpleHook::getInstance("header_nav"), "runDo"), array(), "", $__viewer);

  if (!$loginUser->isExists()) { ?>
<div class="header_login">
	<a rel="nofollow" href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=u&c=login'; ?>">登录</a><a rel="nofollow" href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=u&c=register'; ?>">注册</a>
</div>
<?php  } else {
	if ($pwforum && $pwforum->isForum()) {
		$ifJsFastPost = '';
		$_tmpfid = $pwforum->fid;
	} else {
		$ifJsFastPost = "J_head_forum_post";
		$_tmpfid = 0;
	}
?>
	<a class="header_login_btn" id="<?php echo htmlspecialchars($ifJsFastPost, ENT_QUOTES, 'UTF-8');?>" role="button" aria-label="快速发帖" aria-haspopup="J_head_forum_pop" href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=bbs&c=post&fid=', rawurlencode($_tmpfid); ?>" title="快速发帖" style="width:68px;" tabindex="-1"><span class="inside"><span class="header_post" >发帖</span></span></a>
	<div id="J_head_forum_pop" tabindex="0" class="pop_select_forum" style="top:45px;left:50%;margin-left:100px;z-index:11;display:none;" aria-label="快速发帖菜单,按ESC键关闭菜单">
		<a id="J_head_forum_close" href="#" class="pop_close" role="button">关闭窗口</a>
		<div class="core_arrow_top" style="left:310px;"><em></em><span></span></div>
		<div class="hd">发帖到其他版块</div>
		<div id="J_head_forum_ct" class="ct cc">
			<div class="pop_loading"></div>
		</div>
		<div class="ft">
			<div class="associate">
				<label class="fr"><input type="checkbox" id="J_head_forum_join" data-url="<?php echo Wekit::app()->baseUrl,'/','index.php?m=bbs&c=forum&a=join'; ?>">添加到我的版块</label>
				发帖到：<span id="J_post_to_forum"></span>
			</div>
			<div class="tac">
				<button type="button" class="btn btn_submit disabled" disabled="disabled" id="J_head_forum_sub" data-url="<?php echo Wekit::app()->baseUrl,'/','index.php?m=bbs&c=post'; ?>">确定</button>
			</div>
		</div>
	</div>
	<?php 
		$messageCount = $loginUser->info['notices'] + $loginUser->info['messages'];
		$messageClass = $messageCount ? 'header_message' : 'header_message header_message_none';
	?>
	<a class="header_login_btn" id="J_head_msg_btn" tabindex="0" href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=message&c=message'; ?>" aria-haspopup="J_head_msg_pop" style="width:37px;" aria-label="消息菜单,按pagedown打开菜单,tab键导航,esc键关闭"><span class="inside"><span class="<?php echo htmlspecialchars($messageClass, ENT_QUOTES, 'UTF-8');?>">消息<em class="core_num J_hm_num"><?php echo htmlspecialchars($messageCount, ENT_QUOTES, 'UTF-8');?></em></span></span></a>
	<!--消息下拉菜单-->
	<div id="J_head_msg_pop" tabindex="0" aria-label="消息下拉菜单,按ESC键关闭菜单" class="header_menu_wrap my_message_menu" style="width:380px;display:none;">
		<div class="header_menu cc">
			<div class="header_menu_hd" id="J_head_pl_hm"><span class="<?php echo htmlspecialchars($messageClass, ENT_QUOTES, 'UTF-8');?> header_message_down">消息<em class="core_num J_hm_num"><?php echo htmlspecialchars($messageCount, ENT_QUOTES, 'UTF-8');?></em></span></div>
			<div id="J_head_msg" class="my_message_content"><div class="pop_loading"></div></div>
		</div>
	</div>
	<div class="header_login_later">
		<?php
PwHook::display(array(PwSimpleHook::getInstance("header_info_1"), "runDo"), array(), "", $__viewer);
?>
		<a aria-haspopup="J_head_user_menu" aria-label="个人功能菜单,按pagedown打开菜单,tab键导航,esc键关闭" tabindex="0" rel="nofollow" href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=space&uid=', rawurlencode($loginUser->uid); ?>" id="J_head_user_a" class="username" title="<?php echo htmlspecialchars($loginUser->username, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars(Pw::substrs($loginUser->username,6), ENT_QUOTES, 'UTF-8');?><em class="core_arrow"></em></a>
		<?php
PwHook::display(array(PwSimpleHook::getInstance("header_info_2"), "runDo"), array(), "", $__viewer);
?>
		<div class="fl">
		<div id="J_head_user_menu" role="menu" class="header_menu_wrap my_menu_wrap" style="display:none;">
			<div class="header_menu my_menu cc">
				<div class="header_menu_hd" id="J_head_pl_user"><span title="<?php echo htmlspecialchars($loginUser->username, ENT_QUOTES, 'UTF-8');?>" class="username"><?php echo htmlspecialchars(Pw::substrs($loginUser->username,6), ENT_QUOTES, 'UTF-8');?></span><em class="core_arrow_up"></em></div>
				<ul class="ct cc">
				<?php  $nav = Wekit::load('SRV:nav.bo.PwNavBo');
					$myNav = $nav->getNavFromConfig('my');
					foreach($myNav as $key=>$value):
				?>
					<li><?php echo $value['name'];?></li>
				<?php  endforeach; 
 
				$_url = '';
				$_panelManage = false;
				if ($loginUser->getPermission('panel_bbs_manage')) {
					$_url = 'manage/content/run';
					$_panelManage = true;
				}
				if (!$_panelManage && $loginUser->getPermission('panel_user_manage')) {
					$_url = 'manage/user/run';
					$_panelManage = true;
				}
				if (!$_panelManage && $loginUser->getPermission('panel_report_manage')) {
					$_url = 'manage/report/run';
					$_panelManage = true;
				}
				if (!$_panelManage && $loginUser->getPermission('panel_recycle_manage')) {
					$_url = 'manage/recycle/run';
					$_panelManage = true;
				}
				if ($_panelManage) {
				?>
					<li><a href="<?php echo WindUrlHelper::createUrl($_url);?>" rel="nofollow"><em class="icon_system"></em>前台管理</a></li>
				<?php } if (Pw::getstatus($loginUser->info['status'], PwUser::STATUS_ALLOW_LOGIN_ADMIN) || in_array(3, $loginUser->groups)) {?>
					<li><a href="<?php echo htmlspecialchars(Wind::getComponent('router')->getRoute('pw')->checkUrl('admin.php'), ENT_QUOTES, 'UTF-8');?>" target="_blank" rel="nofollow"><em class="icon_admin"></em>系统后台</a></li>
				<?php }?>
				</ul>
				<ul class="ft cc">
					<li><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=profile'; ?>"><em class="icon_profile"></em>个人设置</a></li>
					<li><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=u&c=login&a=logout'; ?>" rel="nofollow"><em class="icon_quit"></em>退出</a></li>
				</ul>
			</div>
		</div>
		</div>
	</div>
	<?php  if ($loginUser->info['message_tone'] > 0 && $messageCount > 0) { ?>
	<audio autoplay="autoplay">
		<source src="<?php echo Wekit::app()->themes.'/site/default/images'; ?>/message/msg.wav" type="audio/wav" />
		<source src="<?php echo Wekit::app()->themes.'/site/default/images'; ?>/message/msg.mp3" type="audio/mp3" />
		<div style='overflow:hidden;width:0;float:left'><embed src='<?php echo Wekit::app()->themes.'/site/default/images'; ?>/message/msg.wav' width='0' height='0' AutoStart='true' type='application/x-mplayer2'></embed></div>
	</audio>
	<?php  } 
  } ?>
	</div>
</header>
<?php 
if ($child) {
foreach ($child as $ck => $cv) {
	 if ($currentId == $ck):
?>
	<div class="nav_weak" id="<?php echo htmlspecialchars($ck, ENT_QUOTES, 'UTF-8');?>">
<?php  else: ?>
	<div class="nav_weak" id="<?php echo htmlspecialchars($ck, ENT_QUOTES, 'UTF-8');?>" style="display:none">
<?php  endif; ?>
		<ul class="cc">
			<?php  foreach($cv as $_v):
				$current = $_v['current'] ? 'current' : '';
			?>
			<li class="<?php echo htmlspecialchars($current, ENT_QUOTES, 'UTF-8');?>"><?php echo $_v['name'];?></li>
			<?php  endforeach; ?>
		</ul>
	</div>
<?php }} ?>
<div class="tac"> </div>
	<div class="main_wrap">
		<div class="bread_crumb">
			<a href="<?php echo Wekit::app()->baseUrl; ?>" class="home" title="<?php echo Wekit::C("site", "info.name"); ?>">首页</a><em>&gt;</em>
			<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=fans'; ?>">我的粉丝</a>
		</div>
		<div class="main cc">
			<div class="main_body">
				<div class="main_content cc">
					<div class="box_wrap fans_page">
						<nav>
							<nav>
<div class="content_nav">
	<ul>
		<li class="<?php echo Pw::isCurrent($li == 'follow');?>"><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=follow'; ?>">我关注的人</a></li>
		<li class="<?php echo Pw::isCurrent($li == 'fans');?>"><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=fans'; ?>">我的粉丝</a></li>
		<li class="<?php echo Pw::isCurrent($li == 'invite');?>"><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=invite'; ?>">邀请好友</a></li>
		<li class="<?php echo Pw::isCurrent($li == 'friend');?>"><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=friend'; ?>">找人</a></li>
		<li class="<?php echo Pw::isCurrent($li == 'visitor');?>"><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=visitor'; ?>">访问脚印</a></li>
	</ul>
</div>
</nav>
						</nav>
						<?php  if ($fans) { ?>
						<div class="fans_list" id="J_fans_page">
							<?php  foreach ($fans as $key => $value) { 
								$birthday = $value['byear'] ? '生日：' . $value['byear'] . '年'.$value['bmonth'].'月'.$value['bday'].'日' : '';
								$profile = $value['profile'] ? '  自我介绍：'.$value['profile'] : '';
							?>
							<dl class="cc J_friends_items">
								<dt><a data-uid="<?php echo htmlspecialchars($value['uid'], ENT_QUOTES, 'UTF-8');?>" class="J_user_card_show" href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=space&uid=', rawurlencode($value['uid']); ?>"><img class="J_avatar" src="<?php echo htmlspecialchars(Pw::getAvatar($value['uid'], 'small'), ENT_QUOTES, 'UTF-8');?>" data-type="small" width="50" height="50" alt="<?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?>" /></a><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=message&c=message&a=pop&username=', rawurlencode($value['username']); ?>" data-name="<?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?>" class="called J_send_msg_pop">打招呼</a></dt>
								<dd>
									<div class="title">
										<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=space&uid=', rawurlencode($value['uid']); ?>" data-uid="<?php echo htmlspecialchars($value['uid'], ENT_QUOTES, 'UTF-8');?>" class="name J_user_card_show"><?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?></a>
										<?php  $gender = $value['gender'] == 1 ? 'women' : 'man';
											$online = Pw::checkOnline($value['lastvisit']) ? 'ol' : 'unol';
										 ?>
										<span class="<?php echo htmlspecialchars($gender, ENT_QUOTES, 'UTF-8');?>_<?php echo htmlspecialchars($online, ENT_QUOTES, 'UTF-8');?>"></span>
									</div>
									<div class="num">
										关注<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=space&c=follows&uid=', rawurlencode($value['uid']); ?>"><?php echo htmlspecialchars($value['follows'], ENT_QUOTES, 'UTF-8');?></a><span>|</span>粉丝<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=space&c=fans&uid=', rawurlencode($value['uid']); ?>"><?php echo htmlspecialchars($value['fans'], ENT_QUOTES, 'UTF-8');?></a><span>|</span>帖子<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=space&c=thread&uid=', rawurlencode($value['uid']); ?>"><?php echo htmlspecialchars($value['postnum'], ENT_QUOTES, 'UTF-8');?></a>
									</div>
									<div class="action"><?php echo htmlspecialchars($birthday, ENT_QUOTES, 'UTF-8');?></div>
									<div class="action"><?php echo htmlspecialchars($profile, ENT_QUOTES, 'UTF-8');?> </div>
									<div class="attribute">
										<?php  if (isset($follows[$value['uid']])) { ?>
										<span class="mnfollow" title="互相关注">互相关注</span>
										<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=follow&a=delete&uid=', rawurlencode($value['uid']); ?>" data-uid="<?php echo htmlspecialchars($value['uid'], ENT_QUOTES, 'UTF-8');?>" data-role="unfollow" class="core_unfollow J_unfollow_btn J_fans_follow" style="display:none;" data-followed="true">取消关注</a>
										<?php  } else { ?>
										<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=follow&a=add&uid=', rawurlencode($value['uid']); ?>" data-uid="<?php echo htmlspecialchars($value['uid'], ENT_QUOTES, 'UTF-8');?>" data-role="follow" class="core_follow J_fans_follow" data-followed="true">加关注</a>
										<?php  } ?>
									</div>
								</dd>
							</dl>
							<?php  } ?>
							<div class=""><?php $__tplPageCount=(int)$count;
$__tplPagePer=(int)$perpage;
$__tplPageTotal=(int)0;
$__tplPageCurrent=(int)$page;
if($__tplPageCount > 0 && $__tplPagePer > 0){
$__tmp = ceil($__tplPageCount / $__tplPagePer);
($__tplPageTotal !== 0 &&  $__tplPageTotal < $__tmp) || $__tplPageTotal = $__tmp;}
$__tplPageCurrent > $__tplPageTotal && $__tplPageCurrent = $__tplPageTotal;
if ($__tplPageTotal > 1) {
 
$_page_min = max(1, $__tplPageCurrent-3);
$_page_max = min($__tplPageTotal, $__tplPageCurrent+3);
?>
<div class="pages">
<?php  if ($__tplPageCurrent > $_page_min) { 
	$_page_i = $__tplPageCurrent-1;
?>
	<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=fans&page=', rawurlencode($_page_i); 
 echo htmlspecialchars(array() ? '&' . http_build_query(array()) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_pre J_pages_pre">&laquo;&nbsp;上一页</a>
	<?php  if ($_page_min > 1) { 
		$_page_i = 1;		
	?>
	<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=fans&page=', rawurlencode($_page_i); 
 echo htmlspecialchars(array() ? '&' . http_build_query(array()) : '', ENT_QUOTES, 'UTF-8');?>">1...</a>
	<?php  } 
  for ($_page_i = $_page_min; $_page_i < $__tplPageCurrent; $_page_i++) { 
	?>
	<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=fans&page=', rawurlencode($_page_i); 
 echo htmlspecialchars(array() ? '&' . http_build_query(array()) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  } ?>
	<strong><?php echo htmlspecialchars($__tplPageCurrent, ENT_QUOTES, 'UTF-8');?></strong>
<?php  if ($__tplPageCurrent < $_page_max) { 
  for ($_page_i = $__tplPageCurrent+1; $_page_i <= $_page_max; $_page_i++) { 
	?>
	<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=fans&page=', rawurlencode($_page_i); 
 echo htmlspecialchars(array() ? '&' . http_build_query(array()) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  if ($_page_max < $__tplPageTotal) { 
		$_page_i = $__tplPageTotal;
	?>
	<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=fans&page=', rawurlencode($_page_i); 
 echo htmlspecialchars(array() ? '&' . http_build_query(array()) : '', ENT_QUOTES, 'UTF-8');?>">...<?php echo htmlspecialchars($__tplPageTotal, ENT_QUOTES, 'UTF-8');?></a>
	<?php  }
		$_page_i = $__tplPageCurrent+1;
	?>
	<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=fans&page=', rawurlencode($_page_i); 
 echo htmlspecialchars(array() ? '&' . http_build_query(array()) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_next J_pages_next">下一页&nbsp;&raquo;</a>
<?php  } ?>
</div>
<?php } ?></div>
						</div>
						<?php  } else { ?>
<!--无关注人时-->
						<div class="nofollow_list J_check_wrap">
							<div class="hd">啊哦，你还没有粉丝，试试关注几个争取点人气吧！</div>
							
						</div>
<!--无关注人时结束-->	
						<?php  } ?>
					</div>
				</div>
			</div>
			<div class="main_sidebar">
				<?php  if (!$loginUser->isExists()) { 
  Wind::import('APPS:u.service.helper.PwUserHelper'); 
  $_loginWay = PwUserHelper::getLoginMessage(); ?>
	<div class="box_wrap sidebar_login">
		<form id="J_login_form" action="<?php echo Wekit::app()->baseUrl,'/','index.php?m=u&c=login&a=dologin'; ?>" method="post">
		<dl>
			<dt id="J_sidebar_login_dt">
				<label for="J_username">用户名</label><input required type="text" class="input" id="J_username" name="username" placeholder="<?php echo htmlspecialchars($_loginWay, ENT_QUOTES, 'UTF-8');?>">
				<label for="J_password">密　码</label><input required type="password" class="input" id="J_password" name="password" placeholder="密码">
			</dt>
			<dd class="associate"><a class="sendpwd" rel="nofollow" href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=u&c=findPwd'; ?>">找回密码</a><label for="head_checkbox" title="下次自动登录"><input type="checkbox" id="head_checkbox" name="cktime" value="31536000">自动登录</label></dd>
			<dd class="operate"><button type="submit" id="J_sidebar_login" class="btn btn_big btn_submit">登录</button><a class="btn btn_big btn_error" href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=u&c=register'; ?>" rel="nofollow">立即注册</a></dd>
		</dl>
		<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
	</div>
<?php  } else { 
  $_group = $loginUser->getGroupInfo(); ?>
	<div class="box_wrap user_info">
		<dl class="cc">
			<dt id="J_ava_ie6">
				<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=space&uid=', rawurlencode($loginUser->uid); ?>"><img class="J_avatar" src="<?php echo htmlspecialchars(Pw::getAvatar($loginUser->uid), ENT_QUOTES, 'UTF-8');?>" data-type="middle" width="72" height="72" alt="<?php echo htmlspecialchars($loginUser->username, ENT_QUOTES, 'UTF-8');?>" /></a>
				<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=profile&c=avatar&_left=avatar'; ?>"><b></b><span>修改头像</span></a>
			</dt>
			<dd>
				<div class="name"><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=space&uid=', rawurlencode($loginUser->uid); ?>" class="username"><?php echo htmlspecialchars($loginUser->username, ENT_QUOTES, 'UTF-8');?><i></i></a></div>
				<div class="level"><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=profile&c=right&_left=right'; ?>"><?php echo htmlspecialchars($_group['name'], ENT_QUOTES, 'UTF-8');?></a></div>
				<div class="level_img">
					<img src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>/level/<?php echo htmlspecialchars($_group['image'], ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars($_group['name'], ENT_QUOTES, 'UTF-8');?>" />
				</div>
			</dd>
		</dl>
		<div class="num">
			<ul class="cc">
				<li><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=follow'; ?>"><span><?php echo htmlspecialchars($loginUser->info['follows'], ENT_QUOTES, 'UTF-8');?></span><em>关注</em></a></li>
				<li><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=fans'; ?>"><span><?php echo htmlspecialchars($loginUser->info['fans'], ENT_QUOTES, 'UTF-8');?></span><em>粉丝</em></a></li>
				<li class="tail"><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=article'; ?>"><span><?php echo htmlspecialchars($loginUser->info['postnum'], ENT_QUOTES, 'UTF-8');?></span><em>帖子</em></a></li>
			</ul>
		</div>
	<?php  if (Wekit::C('site','medal.isopen')): ?>
		<div class="medal_widget" id="J_medal_widget">
			<a href="javascript:;" class="next next_disabled J_lazyslide_next" title="下一组"><em></em></a>
			<a href="javascript:;" class="pre pre_disabled J_lazyslide_prev" title="上一组"><em></em></a>
			<div class="medal_list_wrap">
			<ul id="J_medal_widget_ul" class="cc J_lazyslide_list" style="width:900px;">
			<?php  
				$J_medals = Wekit::load('medal.srv.PwMedalCache')->getMyAndAutoMedal($loginUser->uid);
				$_medals = array_slice($J_medals, 0, 6, true);
				foreach ($_medals as $medal):
			
  if($medal['award_status'] !=4): ?>
					<li class="doing"><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=medal'; ?>"><img src="<?php echo htmlspecialchars($medal['icon'], ENT_QUOTES, 'UTF-8');?>" width="30" height="30" title="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" /></a></li>
				<?php  else: ?>
					<li><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=medal'; ?>"><img src="<?php echo htmlspecialchars($medal['icon'], ENT_QUOTES, 'UTF-8');?>" width="30" height="30" title="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" /></a></li>
				<?php  endif; 
  endforeach; ?>
			</ul>
			<textarea id="J_sidebar_medal_ta" style="display:none">
				<?php  	foreach ($J_medals as $medal): 
  if($medal['award_status'] !=4): ?><li class="doing"><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=medal'; ?>"><img src="<?php echo htmlspecialchars($medal['icon'], ENT_QUOTES, 'UTF-8');?>" width="30" height="30" title="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" /></a></li><?php  else: ?><li><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=medal'; ?>"><img src="<?php echo htmlspecialchars($medal['icon'], ENT_QUOTES, 'UTF-8');?>" width="30" height="30" title="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" /></a></li><?php  endif; 
  endforeach; ?></textarea>
			</div>
		</div>
	<?php  endif; 
  
	$punchService = Wekit::load('space.srv.PwPunchService');
	list($punchOpen,$punchFriendOpen) = $punchService->getPunchConfig();
	if ($punchOpen) {
		list($punchStatus,$punchButton,$punchData) = $punchService->getPunch();
		$punchStatus = $punchStatus ? '' : 'punch_widget_disabled';
		list($monthDay,$weekDay) = $punchService->formatWeekDay(Pw::getTime());
	 ?>
	<div class="cc punch_widget_wrap">
		<div id="J_punch_main_tip" class="fl dn">
		<?php  if ($punchData) { ?>
			<div class="tips">
				<div class="core_arrow_top"><em></em><span></span></div>
				<?php echo htmlspecialchars($punchData['username'], ENT_QUOTES, 'UTF-8');?>已帮你领取<span class="red"><?php echo htmlspecialchars($punchData['cNum'], ENT_QUOTES, 'UTF-8');?></span><?php echo htmlspecialchars($punchData['cUnit'], ENT_QUOTES, 'UTF-8');
 echo htmlspecialchars($punchData['cType'], ENT_QUOTES, 'UTF-8');?>
			</div>
		<?php  } ?>
		</div>
		<div class="punch_widget <?php echo htmlspecialchars($punchStatus, ENT_QUOTES, 'UTF-8');?>" id="J_punch_widget">
			<div class="date"><?php echo htmlspecialchars($monthDay, ENT_QUOTES, 'UTF-8');?><span><?php echo htmlspecialchars($weekDay, ENT_QUOTES, 'UTF-8');?></span></div>
			<div class="cont"><a data-punchurl="<?php echo Wekit::app()->baseUrl,'/','index.php?m=space&c=punch&a=punchtip'; ?>" href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=space&c=punch&a=punch'; ?>" id="J_punch_mine" tabindex="-1" target="_blank"><?php echo htmlspecialchars($punchButton, ENT_QUOTES, 'UTF-8');?></a></div>
			<?php  if ($punchFriendOpen) { ?>
			<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=space&c=punch&a=friend'; ?>" id="J_punch_friend" class="help_ta" tabindex="-1" target="_blank">帮Ta打卡</a>
			<?php  } ?>
		</div>
	</div>
<?php  } ?>
	</div>
<?php  } 
  if ($loginUser->isExists()) { ?>
	<div class="box_wrap">
		<h2 class="box_title J_sidebar_box_toggle">我的应用</h2>
		<div class="my_app_list">
			<ul>
				<li><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=vote&c=my'; ?>"><span class="icon_vote"></span>投票</a></li>
				<li><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=like&c=mylike'; ?>"><span class="icon_like"></span>喜欢</a></li>
				<?php  if (Wekit::C('site','medal.isopen')){ ?>
				<li><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=medal'; ?>"><span class="icon_medal"></span>勋章</a></li>
				<?php }
 if (1 == Wekit::C('site', 'task.isOpen')) {?>
				<li><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=task'; ?>"><span class="icon_task"></span>任务</a></li>
				<?php }?>
			</ul>
		</div>
	</div>
<?php  } ?>
<!--advertisement id='Site.Sider.User' sys='1'/-->
<?php  
	if ($loginUser->info['recommend_friend']) {
		$pFriends = Wekit::load('attention.srv.PwAttentionRecommendFriendsService')->getRecommentUser($loginUser);
		if ($pFriends) {
		$otherFriends = array_slice($pFriends,3);
		$pFriends = array_slice($pFriends,0,3);
 ?>
<div class="box_wrap" id="J_friend_maybe">
	<h2 class="box_title J_sidebar_box_toggle">可能认识的人</h2>
	<div class="side_may_list" id="J_friend_maybe_list" data-url="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=follow&a=recommendfriend'; ?>">
	<?php 
		$i = 0;
		foreach($pFriends as $v){
			$pUid = $v['uid'];
			//if ($v['cnt'] < 1) continue;
			$class = ($i > 1) ? 'display:none;' : '';
			$class2 = ($i > 0) ? 'display:none;' : '';
			$load = ($i > 0) ? 'false' : 'true';
			$arrow = ($i == 0) ? '&uarr;' : '&darr;';
	 ?>
		<div class="J_friend_maybe_items">
			<dl>
				<dt><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=space&uid=', rawurlencode($pUid); ?>" class="J_user_card_show" data-uid="<?php echo htmlspecialchars($pUid, ENT_QUOTES, 'UTF-8');?>"><img class="J_avatar" src="<?php echo htmlspecialchars(Pw::getAvatar($pUid,'small'), ENT_QUOTES, 'UTF-8');?>" width="50" height="50" data-uid="<?php echo htmlspecialchars($pUid, ENT_QUOTES, 'UTF-8');?>" data-type="small" /></a></dt>
				<dd>
					<p class="title"><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=space&uid=', rawurlencode($pUid); ?>" class="J_user_card_show" data-uid="<?php echo htmlspecialchars($pUid, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($v['username'], ENT_QUOTES, 'UTF-8');?></a></p>
					<p><a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=follow&a=add&uid=', rawurlencode($pUid); ?>" class="core_follow J_friend_maybe_follow mr10" role="button" rel="nofollow">关注</a>
					<?php  if ($v['cnt']) { ?>
					<a href="<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=follow&a=samefriend&uid=', rawurlencode($pUid); ?>" class="unmore J_friend_view" data-uid="<?php echo htmlspecialchars($pUid, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($v['cnt'], ENT_QUOTES, 'UTF-8');?>个共同好友<?php echo $arrow;?></a>
					<?php  } ?>
					</p>
				</dd>
			</dl>
			<?php  if ($v['sameUser']) { ?>
			<div id="J_friend_related_<?php echo htmlspecialchars($pUid, ENT_QUOTES, 'UTF-8');?>" class="related J_friend_related" style="<?php echo htmlspecialchars($class2, ENT_QUOTES, 'UTF-8');?>" data-load="<?php echo htmlspecialchars($load, ENT_QUOTES, 'UTF-8');?>">
				
				<div class="menu_arrow"><em></em><span></span></div>
				<?php  
					$tmp = array();
					foreach($v['sameUser'] as $sk => $su){
						if (!trim($su)) continue;
						$tmp[] = sprintf('<a href="%s" class="J_user_card_show" data-uid="%d" target="_blank">%s</a>',WindUrlHelper::createUrl('space/index/run',array('uid'=>$sk)),$sk,$su);
					}
					$tmp = implode('、', $tmp);
				 ?>
				 您关注的人中： <?php echo $tmp;
  if($v['cnt'] > 3) {?>等<?php echo htmlspecialchars($v['cnt'], ENT_QUOTES, 'UTF-8');?>人<?php  } ?> 也关注了Ta
			</div>
			<?php  } ?>
		</div>
	<?php 
		$i++;
		}
	 ?>
		
	</div>
</div>
<?php  }} ?>
 
 
			</div>
		</div>
	</div>
<!--.main-wrap,#main End-->
<div class="tac">
 <br />
 
</div>
<div class="footer_wrap">
	<div class="footer">
		 
		<div class="bottom">
		<?php 
			$nav = Wekit::load('SRV:nav.bo.PwNavBo');
			$bottom = $nav->getNavFromConfig('bottom');
			foreach($bottom as $key=>$value):
		
 echo $value['name'];
  endforeach; ?>
		</div>
		<p>Powered by <a href="http://www.phpwind.net/" target="_blank" rel="nofollow">phpwind v<?php echo htmlspecialchars(NEXT_VERSION, ENT_QUOTES, 'UTF-8');?></a> &copy;2003-2103 <a href="http://www.phpwind.com" target="_blank" rel="nofollow">phpwind.com</a> <a href="http://www.miibeian.gov.cn" target="_blank" rel="nofollow"><?php echo htmlspecialchars(Wekit::C('site','info.icp'), ENT_QUOTES, 'UTF-8');?></a></p>
		<p><?php echo Wekit::C('site','statisticscode');?></p>
	</div>
	 
	 
	 
	<div id="cloudwind_common_bottom"></div>
	<?php
PwHook::display(array(PwSimpleHook::getInstance("footer"), "runDo"), array(), "", $__viewer);
?>
</div>

<!--返回顶部-->
<a href="#" rel="nofollow" role="button" id="back_top" tabindex="-1">返回顶部</a>

</div>
<script>
var URL_UNFOLLOW = "<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=follow&a=delete'; ?>",
		URL_FOLLOW = "<?php echo Wekit::app()->baseUrl,'/','index.php?m=my&c=follow&a=add'; ?>";

Wind.use('jquery', 'global', function(){
	Wind.js(GV.JS_ROOT +'pages/bbs/fansFollow_index.js?v='+ GV.JS_VERSION);
});
</script>
</body>
</html>