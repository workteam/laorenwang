<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <table width="100%" style="table-layout:fixed;" border="0"><tbody>

  <?php  if ($post_date <> '0000-00-00' ) { ?>
  <tr><td><?php /// echo "Post Date:" ?><?php echo $post_date; ?></td></tr>
  <?php  }?>



  <tr>
  <td valign="top" style="padding:10px; background: none repeat scroll 0 0 #F8F8F8; line-height: 160%;">

      <?php  if ( $image ) {  ?>

          <img   align="left" src="<?php echo HTTP_IMAGE.$image; ?>" width="250"  title="" alt="<?php echo  $heading_title; ?>" id="image" style="margin-bottom: 15px; margin-right: 13px;" />

     <?php  }?>


      <?php echo $description; ?></td></tr></tbody></table>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>
