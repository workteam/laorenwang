<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
<div class="box">
  <div class="heading">
      <h1><img src="view/image/information.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
    </div>
  <div class="content">
    <form action="<?php echo $action."&cat_id=".(isset($_GET['cat_id'])?$_GET['cat_id']:'0'); ?>" method="post" enctype="multipart/form-data" id="form">
      <div class="htabs">
          <div id="languages" class="htabs">
              <?php foreach ($languages as $language) { ?>
              <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
              <?php } ?>
          </div>
      </div>

      <?php foreach ($languages as $language) { ?>
      <div id="language<?php echo $language['language_id']; ?>">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_title; ?></td>
            <td><input name="news_description[<?php echo $language['language_id']; ?>][title]" size="100" value="<?php echo isset($news_description[$language['language_id']]) ? $news_description[$language['language_id']]['title'] : ''; ?>" />
              <?php if (isset($error_title[$language['language_id']])) { ?>
              <span class="error"><?php echo $error_title[$language['language_id']]; ?></span>
              <?php } ?></td>
          </tr>
		  <!--post date-->

          <tr>
            <!--
		  <tr>
            <td><span class="required">*</span><?php echo $entry_image; ?></td>
            <td><input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
            <img src="<?php echo $preview; ?>" alt="" id="preview" class="image" onclick="image_upload('image', 'preview');" /></td>
          </tr>
          -->
          <tr>
            <td><span class="required">*</span> <?php echo $entry_description; ?></td>
            <td><textarea name="news_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($news_description[$language['language_id']]) ? $news_description[$language['language_id']]['description'] : ''; ?></textarea>
              <?php if (isset($error_description[$language['language_id']])) { ?>
              <span class="error"><?php echo $error_description[$language['language_id']]; ?></span>
              <?php } ?></td>
          </tr>
        </table>
      </div>
	  <?php } ?>
      <table class="form">
          <tr>
              <td><span class="required">*</span> <?php echo $entry_post_date; ?></td>
              <td><input type="text" name="post_date" value="<?php echo $post_date; ?>" size="12" class="date" /></td>
          </tr>
          <tr>
              <td><?php echo $entry_image; ?></td>
              <td>

                  <div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" /><br />
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
                  <a onclick="image_upload('image', 'thumb');">  选择图像  </a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"> 清除图像 </a></div>
              </td>
          </tr>
          <tr>
                 <td> 分类: </td>
                 <Td>
                            <select name="category_id">
                                    <option value="0"> ---请选择--- </option>
                                    <?php if ( !empty($cats) ) {  foreach  ($cats as $cat) {  ?>
                                                 <option
                                                         <?php if  (  isset($category_id) &&  $cat['id']==$category_id ) { ?>  selected='selected'  <?php }?>
                                                         value="<?php echo $cat['id'] ?>">  <?php echo $cat['name'] ?>
                                                 </option>
                                    <?php } }?>
                            </select>
                 </Td>
          </tr>
         <?php if ( isset($countrys)     && !empty($countrys)       ) { ?>
                    <tr>
                           <td>地区: </td>
                           <td>
                                    请选择:
                                    <select name="country_id" onchange="getzone(this.value)">
                                             <?php foreach  ($countrys as $country) { ?>

                                                      <option <?php if ( isset($country_id) &&  $country['country_id']==$country_id) { ?>  selected='selected'    <?php }?>      value="<?php echo $country['country_id'] ?>">
                                                          <?php echo $country['name'] ?>

                                                      </option>

                                              <?php }?>
                                    </select>

                                    <select  name="zone_id">

                                    </select>
                                    <script type="text/javascript">
									
$('select[name=\'country_id\']').bind('change', function() {

	$.ajax({
		url: '../index.php?route=account/register/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="view/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value="">请选择</option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
//					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
//	      				html += ' selected="selected"';
//	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected">无</option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
	                                                var  zone_id='<?php echo   isset($zone_id)?$zone_id :0;  ?>';
                                                function     getzone(id){
                                                             ////   alert(id);
                                                    $.get( location.href+"&country_id="+ id ,function(msg){
                                                            $("select[name='zone_id']").html("");
                                                            var msg=eval(msg);
                                                            for (  i=0; i<msg.length; i++  ) {
                                                                var  sel=    msg[i]['zone_id']==zone_id?" selected='selected'  ":""
                                                                $("select[name='zone_id']").append(" <option  "+sel+"  value='"+msg[i]['zone_id']+"' > "+msg[i]['name']+" </option> ");
                                                            }
                                                    } ) ;
                                                }

$('select[name=\'country_id\']').trigger('change');
                                    </script>
                           </td>
                    </tr>
                    <tr>
                          <td>  选项: </td>
                          <td>
                              <b>    环境:    </b>
                              <select name="config_homes_env">
                                  <option value="-1">  选择 </option>
                                  <?php if ( isset($config_homes_env) ) {       foreach  ($config_homes_env as     $key =>   $val) {     ?>
                                  <option
                                  <?php echo  isset($news_info['config_homes_env']) &&  $news_info['config_homes_env']==$key ? " selected='selected' ":""   ?>
                                  value="<?php echo $key; ?>" > <?php echo $val  ?> </option>
                                  <?php } } ?>

                              </select>
                              <b>   护理:   </b>
                              <select name="config_homes_nur">
                                  <option value="-1"> 选择 </option>
                                  <?php if ( isset($config_homes_nur) ) {       foreach  ($config_homes_nur as  $key => $val) {     ?>
                                  <option
                                  <?php echo  isset($news_info['config_homes_nur']) &&  $news_info['config_homes_nur']==$key ? " selected='selected' ":""   ?>
                                  value="<?php echo $key; ?>"> <?php echo $val  ?> </option>
                                  <?php } } ?>
                              </select>
                                  <b> 价格:  </b>
                              <select name="config_homes_pri">
                                  <option value="-1"> 选择 </option>
                                  <?php if ( isset($config_homes_pri) ) {       foreach  ($config_homes_pri as  $key =>  $val) {     ?>
                                  <option
                                  <?php echo  isset($news_info['config_homes_pri']) &&  $news_info['config_homes_pri']==$key ? " selected='selected' ":""   ?>
                                  value="<?php echo $key; ?>"> <?php echo $val  ?> </option>
                                  <?php } } ?>
                              </select>
                                     <a href="index.php?route=setting/setting&token=<?php echo $this->session->data['token'];  ?>">
                              设置选项
                              </a>
                          </td>
                    </tr>

         <?php }?>
        <tr style="display: none;">
          <td><?php echo $entry_store; ?></td>
          <td><div class="scrollbox">
              <?php $class = 'even'; ?>
              <div class="<?php echo $class; ?>">
                <?php if (in_array(0, $news_store)) { ?>
                <input type="checkbox" name="news_store[]" value="0" checked="checked" />
                <?php echo $text_default; ?>
                <?php } else { ?>
                <input type="checkbox" name="news_store[]" value="0" />
                <?php echo $text_default; ?>
                <?php } ?>
              </div>
              <?php foreach ($stores as $store) { ?>
              <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
              <div class="<?php echo $class; ?>">
                <?php if (in_array($store['store_id'], $news_store)) { ?>
                <input type="checkbox" name="news_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                <?php echo $store['name']; ?>
                <?php } else { ?>
                <input type="checkbox" name="news_store[]" value="<?php echo $store['store_id']; ?>" />
                <?php echo $store['name']; ?>
                <?php } ?>
              </div>
              <?php } ?>
            </div></td>
        </tr>
        <tr>
          <td><?php echo $entry_keyword; ?></td>
          <td><input type="text" name="keyword" value="<?php echo $keyword; ?>" /></td>
        </tr>
		   <tr>
              <td><?php echo $entry_status; ?></td>
              <td><select name="status">
                  <?php if ($status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_sort_order; ?></td>
              <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="1" /></td>
            </tr>
      </table>
      <!--关联图-->
      <?php if ( isset($countrys)     && !empty($countrys)       ) { ?>
      <table id="images" class="list">
          <thead>
          <tr>
              <td class="left"> 关联图片 </td>
              <td class="right"><?php echo $entry_sort_order; ?></td>
              <td></td>
          </tr>
          </thead>
          <?php $image_row = 0; ?>
          <?php  if ( isset($product_images) && !empty($product_images) ) {   foreach ($product_images as $product_image) { ?>
          <tbody id="image-row<?php echo $image_row; ?>">
          <tr>
              <td class="left"><div class="image">
                  <img src="<?php echo $product_image['thumb']; ?>" alt="" id="thumb<?php echo $image_row; ?>" />
                  <input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="image<?php echo $image_row; ?>" />
                  <br />
                  <a onclick="image_upload('image<?php echo $image_row; ?>', 'thumb<?php echo $image_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb<?php echo $image_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $image_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
              <td class="right"><input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" size="2" /></td>
              <td class="left"><a onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
          </tr>
          </tbody>
          <?php $image_row++; ?>
          <?php } }?>
          <tfoot>
          <tr>
              <td colspan="2"></td>
              <td class="left"><a onclick="addImage();" class="button"><?php echo $button_add_image; ?></a></td>
          </tr>
          </tfoot>
      </table>
      <?php  }?>
      <!--关联图--->
    </form>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 


<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script> 

  <script type="text/javascript"><!--
  function image_upload(field, thumb) {
      $('#dialog').remove();

      $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

      $('#dialog').dialog({
          title: '<?php echo $text_image_manager; ?>',
          close: function (event, ui) {
              ////alert($('#' + field).attr('value'));
              if ($('#' + field).attr('value')) {
                  $.ajax({
                      url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
                      dataType: 'text',
                      success: function(text) {
                               ////alert(text);
                               $('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
                               /////$("#"+ field).val($('#' + field).attr('value'));
                      }
                  });
              }
          },
          bgiframe: false,
          width: 800,
          height: 400,
          resizable: false,
          modal: false
      });
  };
  //--></script>
  <script type="text/javascript"><!--
  var image_row = <?php echo  isset($image_row)?$image_row:5; ?>;

  function addImage() {
      html  = '<tbody id="image-row' + image_row + '">';
      html += '  <tr>';
      html += '    <td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="image' + image_row + '" /><br /><a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
      html += '    <td class="right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" size="2" /></td>';
      html += '    <td class="left"><a onclick="$(\'#image-row' + image_row  + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
      html += '  </tr>';
      html += '</tbody>';

      $('#images tfoot').before(html);

      image_row++;
  }
  //--></script>
  <script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript"><!--
$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs(); 
$('#vtab-option a').tabs();
//--></script>
<?php echo $footer; ?>