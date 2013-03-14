<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

  <!--
  <h1>NEWS</h1>
    -->
<table width="980px" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="202" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <!--DWLayoutTable-->
      <tr>
        <td style="margin-top:0; padding-top:0px;" width="283" class="homes">
		 <div id="column-left">
                           <h3>  </h3>
                           <div class="column-left_c">
                               <ul>
                                   <?php if  ( !empty($cats ) ) {  foreach  ($cats as  $key =>  $val) {  ?>
                                   <li>
                                       <a href="?route=news/allnews&cat_id=<?php echo $key; ?>">
                                           <?php echo $val ?>                                       </a>                                   </li>
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
                                           <img src="<?php echo HTTP_IMAGE. $adsitem['image'] ?>" alt="" width="100%">                                       </a>                                   </td>
                               </tr>
                               <?php }}?>

                               </tr>
                           </table>
                       </div>		</td>
      </tr>
    </table>    </td>
    <td width="748" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <!--DWLayoutTable-->
      <tr>

		
                              <?php foreach ($newss as $news) { ?>
<td valign="top">
                              <?php  if ( $news['post_date']!=='0000-00-00') { ?>
          <td>&nbsp;</td>
      <tr>
                                <td height="19" ><a href="<?php echo $news['href']; ?>" style="text-decoration:none;"><?php echo $news['title']; ?></a>&nbsp;</td>
                                <td><?php ////echo "Date:" ?><?php echo    $news['post_date'] ; ?>&nbsp;</td>
                                <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
                              <?php  }?>
                              <tr>
                                <td  width="200" style="padding-right: 10px;">
                                    <a href="<?php echo $news['href']; ?>">  <img align="left" src="<?php echo $news['image_thumb']; ?>" title="" alt="" id="image" style="margin-bottom: 3px; border: 0;" />           </a>

                                    &nbsp;</td>
                                <td  width="500" style="padding-right: 10px;"><?php echo $news['description']; ?>&nbsp;</td>
                                <td valign="top"><a href="<?php echo $news['href']; ?>">[more]</a>&nbsp;</td>
                              </tr>
                              
                              <tr><td height="19" colspan="3" style="border-bottom:1px solid #ddd;">
  <?php } ?>
                              </td>
          </tr>
    </table>    </td>
  </tr>
</table>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>
