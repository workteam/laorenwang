<?php echo $header; ?>
<script type="text/javascript" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html"
        xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html"
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



                            <!---列表---->
                            <div id="homeslist">
                                       <?php  if (!empty($laorenhomes)) {  foreach  ( $laorenhomes as $val) { ?>
                                         <div class="item">
                                                <table cellpadding="0" cellspacing="0" width="98%">
                                                      <tr>
                                                            <td width="170" valign="middle">
                                                                <a target="_blank" style="color: #ff7d27;" href="<?php echo $val["href"] ?>">
                                                                <img border="0" style="border: 1px solid #ddd; padding: 2px;" src="<?php echo $val["thumb"]  ?>"  >
                                                                </a>
                                                            </td>
                                                            <td valign="middle">
                                                                  <p> <b><?php echo $val["title"]  ?> </b></p>
                                                                 <p>
                                                                     <a target="_blank"  href="<?php echo $val["href"] ?>">
                                                                     <?php echo $val["description"] ?>
                                                                     </a
                                                                 </p>
                                                                 <p>  <a target="_blank" style="color: #ff7d27;" href="<?php echo $val["href"] ?>"> 了解更多 >> </a> </p>
                                                            </td>
                                                      </tr>

                                                </table>
                                         </div>
                                       <?php }   }?>
                                        <div style="clear: both;"></div>
                                       <div style="line-height: 200%; text-align: right;">
                                                 <?php echo $pagination; ?>
                                       </div>


                            </div>

                            <!---列表---->
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