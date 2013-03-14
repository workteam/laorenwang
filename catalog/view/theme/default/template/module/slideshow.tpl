<!---
<table>
        <tr>
               <td width="50%">
                   <div class="slideshow">

                       <div id="slideshow<?php echo $module; ?>" class="nivoSlider" style="width: <?php echo $width; ?>px; height: <?php echo $height; ?>px;">
                       <?php foreach ($banners as $banner) { ?>
                       <?php if ($banner['link']) { ?>
                       <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
                       <?php } else { ?>
                       <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
                       <?php } ?>
                       <?php } ?>
                   </div>
                  </div>
               </td>

        </tr>

</table>
<script type="text/javascript">
$(document).ready(function() {
	$('#slideshow<?php echo $module; ?>').nivoSlider();
});
</script>
-->
<?php // print_r($banners) ?>
<link rel="stylesheet" href="themes/default/default.css" type="text/css" media="screen" />
<link rel="stylesheet" href="themes/light/light.css" type="text/css" media="screen" />
<link rel="stylesheet" href="themes/dark/dark.css" type="text/css" media="screen" />
<link rel="stylesheet" href="themes/bar/bar.css" type="text/css" media="screen" />
<link rel="stylesheet" href="themes/nivo-slider.css" type="text/css" media="screen" />
<table width="980">
     <tr>
         <?php foreach  (  $ads as $key=>$val ) { ?>
         <td width="100%" style="padding-right: 5px;">
             <div class="slider-wrapper theme-default">
                    <div id="slider<?php echo $key; ?>" class="nivoSlider">

                        <?php foreach  ( $val as $valb ) { ?>
                        <a target="_blank" href="<?php echo $valb["link"] ?>" >
                            <img src="<?php echo HTTP_IMAGE.$valb['image'] ?>" data-thumb="images/up.jpg"  />
                        </a>
                        <?php }?>

                    </div>

              </div>
         </td>
         <?php break;}?>

     </tr>
</table>

<script type="text/javascript" src="themes/jquery.nivo.slider.js"></script>
<script type="text/javascript">
    $(window).load(function() {
        <?php foreach  (  $ads as $key=>$val ) { ?>
        $('#slider<?php  echo $key ; ?> ').nivoSlider();
        <?php }?>
    });
</script>