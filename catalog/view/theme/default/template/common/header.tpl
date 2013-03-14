<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>  技术支持:HCZM.CN" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<!--[if IE 6]>
    <script>
        alert("不支持低版本浏览器！")   ;
        location='http://windows.microsoft.com/zh-HK/internet-explorer/download-ie';
        /// location='505.html'
    </script>
<![endif]-->
<?php echo $google_analytics; ?>
<script>
   $(function(){
             $(".fckdata, .fckdata table , .fckdata td").css({"border":"0"   }) ;
             $(".fckdata, .fckdata table, table.fckdata  ").css({"width":"98%"   }) ;
             $(".fckdata p, .fckdata table p, .fckdata td p").css({"margin-bottom":"0"   }) ;
   })

</script>
</head>
<body>
<div class="top">
    <div style="border-bottom: 1px #EAEAEA solid; line-height: 30px; width: 980px; margin:  0 auto; padding: 0 8px 0 8px;">
        <form enctype="multipart/form-data" method="post" action="index.php?route=account/login">


           <table width="100%"  >
                  <tr>
                         <td>    <?php if ($logged) { ?>
							 <?php echo $text_logged; ?>
                             
                             <?php } else { ?>
                             <?php echo $text_welcome; ?>
                             </td>
                         <td></td>
                          <td width="60" style="text-align: right">
                              邮箱地址：
                          </td>
                          <td width="50">
                               <input class="input" name="email">
                          </td>
                          <td width="40"  style="text-align: right">
                              密码：
                          </td>
                          <td width="50">
                              <input class="input" name="password">
                          </td>
                          <td  style="vertical-align: middle; line-height: 30px; width: 50px;">
                                  <input class="button"  value="登录" type="submit">
                          </td>
                          <td width="60">
                              <a href="?route=account/forgotten">  忘记密码?    </a>
                          </td><?php } ?>
                  </tr>
           </table>
        </form>


    </div>
</div>

<div id="container">

<div id="header">
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>
  <?php echo $language; ?>
  <?php echo $currency; ?>
  <?php echo $cart; ?>
  <div id="search">
    <div class="button-search"></div>
    <?php if ($kw) { ?>
    <input type="text" name="kw" value="<?php echo $kw; ?>" />
    <?php } else { ?>
    <input type="text" name="kw" value="<?php echo $text_search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '#000000';" />
    <?php } ?>
  </div>

  <div id="welcome" style="display: none;">
    <?php if (!$logged) { ?>
    <?php echo $text_welcome; ?>
    <?php } else { ?>
    <?php echo $text_logged; ?>
    <?php } ?>
     <!--
      <a href="javascript:void(0);" onclick="SetHome(this,'<?php echo HTTP_SERVER; ?>');"> <?php echo $mlang['SetHome']  ;?> </a>
      |
      <a href="javascript:void(0);" onclick="AddFavorite('<?php echo $title; ?>',location.href)"><?php echo $mlang['AddFavorite']  ;?></a>
      -->
  </div>

  <!--
  <div class="links"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
  </div>
  -->
</div>
<?php if ($categories) { ?>
<div id="menu">
  <ul>

            <li> <a href="<?php echo $home; ?>"><?php echo $text_home; ?></a>  </li>
              <li> <a href="?route=information/information&information_id=1"><?php echo $mlang["about_us"]; ?></a>  </li>
              <!--<li> <a href="?route=news/allnews"><?php echo $mlang["news"]; ?></a>  </li>   -->
              <li> <a href="?route=homes/home">老人院</a>  </li>
              <li> <a href="?route=product/home">老年商城</a>  </li>
             <li> <a href="?route=cms/home&cat_id=6">设备采购</a>  </li>
              <li> <a href="?route=cms/home&cat_id=1">招商引资</a>  </li>
            <!--
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
              <?php if ($category['children']) { ?>
              <div>
                <?php for ($i = 0; $i < count($category['children']);) { ?>
                <ul>
                  <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                  <?php for (; $i < $j; $i++) { ?>
                  <?php if (isset($category['children'][$i])) { ?>
                  <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
                  <?php } ?>
                  <?php } ?>
                </ul>
                <?php } ?>
              </div>
              <?php } ?>
            </li>
            <?php } ?>
            -->
              <li> <a href="?route=cms/home&cat_id=3">养生百科</a>  </li>
              <li> <a href="bbs">老人论坛</a>  </li>
              <!--<li> <a href="?route=cms/home&cat_id=4">老年旅游</a>  </li>-->
              <li style="border: 0"> <a href="?route=information/contact"><?php echo $mlang["contact"]; ?></a>  </li>


  </ul>
</div>
<?php } ?>
<div id="notification"></div>


<script>
    //设为首页
    function SetHome(obj,url){
       	    try{
           	        obj.style.behavior='url(#default#homepage)';
           	        obj.setHomePage(url);
                }catch(e){
           	        if(window.netscape){
                            try{
                   	                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                   	            }catch(e){
                   	                alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
                                }
                        }else{
               	            alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【"+url+"】设置为首页。");
               	        }
                }
        	}

   	//收藏本站
    function AddFavorite(title, url) {
       	    try {
           	        window.external.addFavorite(url, title);
               }
       	    catch (e) {
           	        try {
               	            window.sidebar.addPanel(title, url, "");
                       }
                    catch (e) {
                            alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
               	        }
           	    }
       	}
</script>
