<?php echo $header; ?>
<script type="text/javascript" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html"
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

<!--幻灯片--->
<link rel="stylesheet" type="text/css" href="jqslider/jqslider.css" />
<script type="text/javascript" src="jqslider/jqslider.js"></script>
<!--幻灯片--->

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
                                           <li>
                                               <a href="?route=news/allnews&category_id=<?php echo $val['id'] ?>">
                                                     <?php echo $val["name"] ?>
                                               </a>
                                           </li>
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
                                                 <b style="  padding-left: 5px; margin-left: 3px; ">推荐老人院</b>
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

                            <!---幻灯片---->
                            <div style="margin-bottom: 10px; ">
                                   <table cellpadding="0" cellspacing="0" width="100%" style="margin-left: 6px;">
                                         <tr>
                                               <td  valign="top">
                                                   <!-- *** jQuery Slider code starts *** -->
                                                   <?php
                                            $cat_id=isset($_GET['cat_id'])?$_GET['cat_id']:"";
                                            $bannerarr=array(
                                                     "6" => "17",
                                                              "1" =>"18" ,
                                                               "3" =>"19",
                                                               "4" =>20,

                                            );
                                            if ( isset($ads[$bannerarr[$cat_id]][0]["image"]) ) { ?>
                                                   <div id="wsnSlider">
                                                       <img src='<?php echo HTTP_IMAGE.$ads[$bannerarr[$cat_id]][0]["image"] ?>' />
                                                       <ul class="buttons">
                                                           <?php $i=1;  foreach  (  $ads[$bannerarr[$cat_id]] as $val) { ?>
                                                           <li><a   link='<?php echo  $val['link'] ?>'     href="<?php echo HTTP_IMAGE.$val["image"] ?>"> <?php  echo $i; ?> </a></li>
                                                           <?php $i++; }?>

                                                       </ul>
                                                   </div>
                                                    <?php  }?>
                                                   <!-- *** jQuery Slider code ends *** -->
                                               </td>
                                         </tr>
                                   </table>

                            </div>
                            <!---幻灯片---->
                            <?php  //// echo $homessearch;  ?>
                            <div>
                                   <?php  if ( isset($ads[13])     && !empty($ads[13])      ) {  foreach  ($ads[13] as $val) {  ?>
                                               <a href="<?php echo $val["link"] ?>" target="_blank" >
                                                      <img border="0" src="<?php echo  HTTP_IMAGE.$val["image"] ?>" >
                                               </a>
                                   <?php  } } ?>
                            </div>




                             <div class="list" style="margin: 10px 0 10px 0;">
                                 <?php if  ( !empty($cats ) ) { $i=1;  foreach  ($cats as $val) {  ?>

                                    <?php if ($i==3) { ?>
                                    <!--广告--->
                                            <div style="width: 100%;  float: left; margin: 2px 0 2px 0; ">
                                                   <table width="100%">
                                                            <tr>
                                                                <?php if ( isset($ads['14']) ) {  foreach   ( $ads['14'] as $adsitem ) { ?>
                                                                 <td>
                                                                       <a href="<?php echo  $adsitem['link'] ?>" target="_blank">
                                                                       <img src="<?php echo HTTP_IMAGE. $adsitem['image'] ?>" alt="" width="100%">
                                                                       </a>
                                                                 </td>
                                                                 <?php }}?>

                                                            </tr>
                                                   </table>
                                            </div>

                                    <?php }?>

                                   <!--广告--->
                                    <div class="item" <?php   echo  $i%2==1? " style='float:light; margin-right:15px;' ":""     ?>>
                                                <h1>  <b> <?php echo $val['name'] ?>   </b>     </h1>
                                                <div>
                                                    <?php  if ( $i<3 ) { ?>
                                                    <p style="margin-bottom: 5px; height: 55px; border-bottom: 1px #ccc dotted; padding-bottom: 5px;">
                                                          <b>
                                                              <a style="color: #ff7d27;" href="<?php  echo    isset($val["items"][0]) ?   $val["items"][0]["href"] :"";     ?>">
                                                              <?php  echo    isset($val["items"][0]) ?   $val["items"][0]["title"] :"";     ?>
                                                              </a>
                                                          </b>
                                                          <br>
                                                          <a href="<?php  echo    isset($val["items"][0]) ?   $val["items"][0]["href"] :"";     ?>">
                                                           <?php  echo    isset($val["items"][0]) ?   $val["items"][0]["description"] :"";     ?>
                                                          </a
                                                    ></p>

                                                    <?php  if ( !empty($val["items"]) ) { ?>
                                                                <ul>
                                                                    <?php $ii=1;  foreach  ($val["items"] as $item) { if ($ii>1 && $ii < 5  ) { ?>
                                                                    <li> <a href="<?php  echo  $item['href'] ?>">  <?php  echo  $item['title'] ?> </a></li>

                                                                    <?php  } $ii++; } ?>
                                                                </ul>
                                                    <?php }?>
                                                    <?php  }  else{    ?>
                                                    <?php  if ( !empty($val["items"]) ) { ?>
                                                            <ul>
                                                                <?php foreach  ($val["items"] as $item) { ?>
                                                                <li> <a href="<?php  echo  $item['href'] ?>"><?php  echo  $item['title'] ?></a> </li>

                                                                <?php }?>
                                                            </ul>
                                                    <?php }?>
                                                    <?php  } ?>
                                                </div>
                                    </div>
                                 <?php $i++; }  }?>

                                 <div style="clear: both;"></div>
                             </div>
                             <!---中间结束--->
                            <!--广告--->
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

                            <!--广告--->
         </td>
     </tr>

 </table>


<?php echo $content_bottom; ?></div>
<?php echo $footer; ?>
