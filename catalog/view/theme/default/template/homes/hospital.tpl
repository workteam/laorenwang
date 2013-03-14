<?php echo $header; ?>
<script type="text/javascript" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html"
        xmlns="http://www.w3.org/1999/html"
        src="lib/jquery.jcarousel.min.js"></script>
<!--
  jCarousel skin stylesheet
-->
<link rel="stylesheet" type="text/css" href="lib/skin.css" />

<script type="text/javascript">

    function mycarousel_initCallback(carousel)
    {
        // Disable autoscrolling if the user clicks the prev or next button.
        carousel.buttonNext.bind('click', function() {
            carousel.startAuto(0);
        });

        carousel.buttonPrev.bind('click', function() {
            carousel.startAuto(0);
        });

        // Pause autoscrolling if the user moves with the cursor over the clip.
        carousel.clip.hover(function() {
            carousel.stopAuto();
        }, function() {
            carousel.startAuto();
        });
    };

    jQuery(document).ready(function() {
        jQuery('#carousel').jcarousel({
            auto: 2,
            wrap: 'last',
            initCallback: mycarousel_initCallback
        });
    });

</script>
<!--滑动门--->
<style media=all type=text/css rel=stylesheet>

    .menub1_1 {	FONT-WEIGHT: bold; BACKGROUND: url(1502.png) no-repeat 0 -29px; FLOAT: left; WIDTH: 130px; CURSOR: pointer; COLOR: #fff; LINE-HEIGHT: 26px; MARGIN-RIGHT: 4px; HEIGHT: 26px; TEXT-ALIGN: center}
    .menub1_2 {	FONT-WEIGHT: normal; BACKGROUND: url(1502.png) no-repeat; FLOAT: left; WIDTH: 130px; CURSOR: pointer; COLOR: #333; LINE-HEIGHT: 26px; MARGIN-RIGHT: 4px; HEIGHT:26px; TEXT-ALIGN: center}
    .menugtab {	PADDING-RIGHT: 6px; PADDING-LEFT: 6px; PADDING-BOTTOM: 6px; COLOR: #333; PADDING-TOP: 6px;height:163px;BORDER: #ddd 1px solid; BORDER-TOP: #ccc 1px solid; text-align: left;}
    .menugtab A {MARGIN: 0px 10px}
</style>
<SCRIPT language=Javascript type=text/javascript>
    function showtabs(m,n,count){
        count=2;
        for(var i=1;i<=count;i++){
            if (i==n){
                getObject('menutab_'+m+'_'+i).style.display='';
                getObject('menu_'+m+'_'+i).className='menub1_1';}
            else {
                getObject('menutab_'+m+'_'+i).style.display='none';
                getObject('menu_'+m+'_'+i).className='menub1_2';}
        }
    }
    function getObject(objectId) {
        if(document.getElementById && document.getElementById(objectId)){
            return document.getElementById(objectId);
        } else if (document.all && document.all(objectId)) {
            return document.all(objectId);
        } else if (document.layers && document.layers[objectId]) {
            return document.layers[objectId];
        } else {return false;}
                }

        function MM_findObj(n, d) { //v4.01
            var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
                d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
            if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
            for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
            if(!x && d.getElementById) x=d.getElementById(n); return x;
        }

        function MM_showHideLayers() { //v6.0
            var i,p,v,obj,args=MM_showHideLayers.arguments;
            for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
                if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
                obj.visibility=v; }
        }
</SCRIPT>
<!--滑动门-->

<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>

<!--<h1 style="display: none;"><?php echo $heading_title; ?></h1>  -->
 <table border="0" cellpadding="0" cellspacing="0">
     <tr>
           <td  valign="top"  class="homes" width="205">
                   <div id="column-left">
                           <h3>  </h3>
                           <div class="column-left_c">
                                    <ul>
                                        <?php if  ( !empty($cats ) ) {  foreach  ($cats as $val) {  ?>
                                           <li> <?php echo $val["name"] ?> </li>
                                        <?php  } } ?>

                                    </ul>
                           </div>
                           <h1> </h1>
                   </div>
                    <div style="clear: both;"></div>
                   <!--广告--->
                   <div style="width: 202px; margin: 2px 0 2px 0; ">
                       <table width="100%">
                           <tr>
                               <?php if ( isset($ads['16']) ) {  foreach   ( $ads['16'] as $adsitem ) { ?>
                               <tr>
                                   <td>
                                       <a href="<?php echo  $adsitem['link'] ?>" target="_blank">
                                           <img src="<?php echo HTTP_IMAGE. $adsitem['image'] ?>" alt="" width="100%">
                                       </a>
                                   </td>
                               </tr>
                               <?php }}?>

                           </tr>
                       </table>
                   </div>

                   <!--广告--->
                   <div style=" padding-top: 2px; border: 1px solid #ddd; margin-top: 10px; width: 195px;">
                         <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                      <td style="padding-top: 5px;">
                                          <h2 style="font-size: 13px;border-bottom: 1px #ddd solid;padding-bottom: 5px;">
                                                 <b style="  padding-left: 5px; margin-left: 3px; ">最新文章 </b>
                                          </h2>
                                      </td>
                                </tr>
                                 <tr>
                                       <td>
                                            <div class="cms_new">
                                                  <ul>
                                                      <?php foreach  ($items_new as $val ) { ?>
                                                        <li> <a href="<?php echo $val['href'] ?>" target="_blank"><?php echo $val['title'] ?> </a>  </li>
                                                      <?php }?>
                                                  </ul>
                                            </div>
                                       </td>
                                 </tr>

                         </table>

                   </div>

           </td>
           <td  valign="top" width="8px">

           </td>
         <td  valign="top" id="homes_content">

                          <?php   echo $homeszones;   ?>
                          <?php  echo $homessearch;  ?>

                         <!---详情---->
                          <Div style="padding: 10px 0 10px 0;"  id="news_description">
                              
                              <table width="100%" cellpadding="0" cellspacing="0">
                                     <tr>
                                            <td width="200" valign="top">
                                                      <img style="border: 1px solid #ddd;" src="<?php echo $news['thumb'];   ?>" alt="">
                                            </td>
                                            <td width="30">
                                            </td>
                                            <td valign="top">

                                                        <p>   <b style="font-size: 15px;"> <?php  echo isset($news['title']) ? $news['title'] :"暂无数据!"  ?>  </b>  </p>

                                                       <p>

                                                           <b>简介:</b>
                                                           <a  onclick="location=location.href.replace('#m_description','')+'#m_description'">
                                                           <?php  echo isset($news['description']) ? $news['description_e'] :"暂无数据!"  ?>
                                                           </a>

                                                       </p>
                                                       <p>

                                                              <a class="button" href="?route=information/contact">   在线申请     </a>
                                                       </p>
                                            </td>
                                     </tr>

                              </table>
                              <table cellpadding="0" cellspacing="0">
                                    <tr>
                                           <td>
                                                <a id="m_description" name="m_description"></a>
                                                <h3>  老人院介绍     </h3>
                                               <?php  echo isset($news['description']) ? $news['description'] :"暂无数据!"  ?>
                                           </td>
                                    </tr>

                                     <tr>
                                            <td>
                                                <h3> 老人院图集   </h3>
                                                 <?php  if  (    isset($news['imgs'])      )  {      foreach  ($news['imgs'] as $val) {            ?>

                                                         <a href="<?php echo $val["thumb"] ?>" target="_blank">
                                                         <img style="margin-right: 3px;" src="<?php echo $val["thumb"] ?>" alt="<?php  echo isset($news['title']) ? $news['title'] :"暂无数据!"  ?>"> </a>

                                                <?php  }  }?>

                                            </td>

                                     </tr>
                              </table>
                          </Div>
                         <!---详情---->
                         <!--广告--->
                         <!--
                         <div style="width: 100%; margin: 2px 0 2px 0; ">
                             <table width="100%">
                                 <tr>
                                     <?php if ( isset($ads['15']) ) {  foreach   ( $ads['15'] as $adsitem ) { ?>
                                     <td>
                                         <a href="<?php echo  $adsitem['link'] ?>" target="_blank">
                                             <img src="<?php echo HTTP_IMAGE. $adsitem['image'] ?>" alt="" width="100%">
                                         </a>
                                     </td>
                                     <?php }}?>

                                 </tr>
                             </table>
                         </div>
                         -->

                         <!--广告--->
         </td>
     </tr>

 </table>


<?php echo $content_bottom; ?></div>
<?php echo $footer; ?>