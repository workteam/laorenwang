<?php echo $header; ?>
<style type="text/css">
    .floorbox,  .floorbox td, .floorbox th { border:1px solid #ccc;  border-collapse: collapse;padding:2px 5px; }
    .floorbox th , .floorbox td{ text-align:  center;}
    .saveclass   button { padding: 2px 20px; background: #003A88; color:#fff; border:0;   }
    .saveclass { text-align:  right;}
</style>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_install) { ?>
  <div class="warning"><?php echo $error_install; ?></div>
  <?php } ?>
  <?php if ($error_image) { ?>
  <div class="warning"><?php echo $error_image; ?></div>
  <?php } ?>
  <?php if ($error_image_cache) { ?>
  <div class="warning"><?php echo $error_image_cache; ?></div>
  <?php } ?>
  <?php if ($error_cache) { ?>
  <div class="warning"><?php echo $error_cache; ?></div>
  <?php } ?>
  <?php if ($error_download) { ?>
  <div class="warning"><?php echo $error_download; ?></div>
  <?php } ?>
  <?php if ($error_logs) { ?>
  <div class="warning"><?php echo $error_logs; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/home.png" alt="" /> 编辑首页</h1>
    </div>
    <div class="content">

               <?php  if($listfloor) { ?>
                <!-- 自定义首页-->
                     <div style="background:#FBF8E1 ;padding: 5px;">
                         <p class="saveclass">
                         <b>首页楼层数 : </b>  <input value="<?php echo isset($floor['value'])?$floor['value']:''  ?>"  id="floor"  >   &nbsp;
                          <button type="submit" onclick="setfloor($('#floor').val())" > 保存 </button> </p>
                     </div>

                <!-- 自定义首页 -->
        <form    method="post"   enctype="multipart/form-data"    action="index.php?route=common/diyhome&token=<?php echo $token ?>&listfloor=1" >
                <?php
                  /////echo $floor['value'];

                  for ($i=1;  $i<= $floor['value'] ;  $i++ ){ ?>
                            <div>
                                  <p STYLE="FONT-SIZE: 15PX; COLOR: #003A88;FONT-WEIGHT: 800; ">   <?php echo $i;   ?> F  </p>
                                  <p>
                                      <table width="100%"  class='floorbox'>
                                        <tr >
                                                    <th width="10%">  基本设置  </th>

                                                    <th> 产品底部广告图 </th>

                                        </tr>
                                            <tr>
                                                <td style="text-align: left; vertical-align: top;">
                                                    <br> <br>
                                                    <b>  显示商品分类: </b>  <br>
                                                    <select  name="category_id[]">
                                                            <?php foreach  ( $getCategories as $cateval) { ?>
                                                                  <option
                                                                   <?php  echo  isset($getdata['floorData']['value'][$i-1]['category_id'])
                                                                   && $getdata['floorData']['value'][$i-1]['category_id']==$cateval['category_id']
                                                                   ?" selected='selected' ":''  ?>
                                                                        value="<?php  echo $cateval['category_id']?>">   <?php  echo $cateval['name']?>  </option>
                                                            <?php  } ?>
                                                    </select>
                                                    <br> <br>
                                                     <b> 左侧图片 </b> <br>
                                                     <input    value="<?php  echo  isset($getdata['floorData']['value'][$i-1]['img'])?$getdata['floorData']['value'][$i-1]['img']:''; ?>"    name="img[]"  type="file" >

                                                    <input  type="hidden" name="oimg[]"    value="<?php  echo  isset($getdata['floorData']['value'][$i-1]['img'])?$getdata['floorData']['value'][$i-1]['img']:''; ?>">
                                                     <br> <br>
                                                      <?php  echo  isset($getdata['floorData']['value'][$i-1]['img'])?"<img src='../".$getdata['floorData']['value'][$i-1]['img']."'>":'';   ?>



                                                </td>

                                                <td>
                                                    <textarea name="description[]"  id="description_floor<?php echo $i;  ?>"> <?php  echo  isset($getdata['floorData']['description'][$i-1])?$getdata['floorData']['description'][$i-1]:'';   ?> </textarea>
                                                </td>


                                        </tr>
                                       </table>
                                  </p>

                            </div>
                <?php  } ?>
                <p class="saveclass"> <button type="submit"> 保存 </button> </p>
               </form>
                <?php } elseif($_GET['footer']) { ?>
                        <form    method="post"     action="index.php?route=common/diyhome&token=<?php echo $token ?>&footer=1" >
                            <div>
                                <p>  <b>  底部  </b>    </p>
                                <p> <textarea  name="footer"   id="description1"><?php echo isset($getdata['footer'])?$getdata['footer']:''; ?></textarea> </p>

                                <p class="saveclass"> <button type="submit"> 保存 </button> </p>
                            </div>
                        </form>
                <?php  }    elseif($_GET['indexright']) {  ?>

        <form    method="post"     action="index.php?route=common/diyhome&token=<?php echo $token ?>&indexright=1" >
            <div>
                <p>  <b>  首页右侧  </b>    </p>
                <p> <textarea  name="indexright"   id="description1"><?php echo isset($getdata['indexright'])?$getdata['indexright']:''; ?></textarea> </p>

                <p class="saveclass"> <button type="submit"> 保存 </button> </p>
            </div>
        </form>
          <?php  }    elseif($_GET['indexfooter']) {  ?>

        <form    method="post"     action="index.php?route=common/diyhome&token=<?php echo $token ?>&indexfooter=1" >
            <div>
                <p>  <b>  热门分类上部广告 </b>    </p>
                <p> <textarea  name="indexfooter"   id="description1"><?php echo isset($getdata['indexfooter'])?$getdata['indexfooter']:''; ?></textarea> </p>

                <p class="saveclass"> <button type="submit"> 保存 </button> </p>
            </div>
        </form>
	  <?php  }    elseif($_GET['allcategory']) {  ?>

        <form    method="post"     action="index.php?route=common/diyhome&token=<?php echo $token ?>&allcategory=1" >
            <div>
                <p>  <b> 所有分类顶部  </b>    </p>
                <p> <textarea  name="allcategory"   id="description1"><?php echo isset($getdata['allcategory'])?$getdata['allcategory']:''; ?></textarea> </p>

                <p class="saveclass"> <button type="submit"> 保存 </button> </p>
            </div>
        </form>
        
         <?php  }    elseif($_GET['Arearight']) {  ?>

        <form    method="post"     action="index.php?route=common/diyhome&token=<?php echo $token ?>&Arearight=1" >
            <div>
                <p>  <b>  专区右侧广告 </b>    </p>
                <p> <textarea  name="Arearight"   id="description1"><?php echo isset($getdata['Arearight'])?$getdata['Arearight']:''; ?></textarea> </p>

                <p class="saveclass"> <button type="submit"> 保存 </button> </p>
            </div>
        </form>
          <?php  }    elseif($_GET['hotcategory']) {  ?>

        <form    method="post"     action="index.php?route=common/diyhome&token=<?php echo $token ?>&hotcategory=1" >
            <div>
                <p>  <b>  热门分类管理 </b>    </p>
                <p> <textarea  name="hotcategory"   id="description1"><?php echo isset($getdata['hotcategory'])?$getdata['hotcategory']:''; ?></textarea> </p>

				<p>
						模板代码：  <br> 
						<!--begin--->
						<textarea style='width:99%; height:200px'><table border="1" cellpadding="1" cellspacing="1" style="width: 100%;">
	<tbody>
		<tr>
			<td>
				1</td>
			<td>
				2</td>
			<td>
				3</td>
			<td>
				4</td>
			<td>
				5</td>
			<td>
				6</td>
			<td>
				7</td>
			<td>
				8</td>
		</tr>
		<tr>
			<td>
				&nbsp;</td>
			<td>
				&nbsp;</td>
			<td>
				&nbsp;</td>
			<td>
				&nbsp;</td>
			<td>
				&nbsp;</td>
			<td>
				&nbsp;</td>
			<td>
				&nbsp;</td>
			<td>
				&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4">
				4</td>
			<td colspan="4">
				6</td>
		</tr>
	</tbody>
</table>
<p>
	&nbsp;</p>
						</textarea>
						<br> 
						注：  如需恢复，请复制以上代码， 编辑器使用代码编辑模式， 粘贴即可！
						<!--end-->
				</p>
			
                <p class="saveclass"> <button type="submit"> 保存 </button> </p>
            </div>
        </form>
         <?php  } else { ?>
        <form    method="post"     action="index.php?route=common/diyhome&token=<?php echo $token ?>" >
            <div>
                <p>  <b>  头部链接  </p>
                <p> <textarea  name="Discount"   id="description1"><?php echo isset($getdata['Discount'])?$getdata['Discount']:''; ?></textarea> </p>

                <p class="saveclass"> <button type="submit"> 保存 </button> </p>
            </div>
        </form>
        <form    method="post"   enctype="multipart/form-data"     action="index.php?route=common/diyhome&token=<?php echo $token ?>&icos=1" >
        		<div>
        		           <p>     <b>  BANNER小图标 </b>    </p>
        		            <p> 图标1  <input  name='img[]'   type='file'> 
        		             <?php  if (isset($gethotcategory[0][0])) { ?> 
        		             			<img height="30" src="../images/<?php echo $gethotcategory[0][0];  ?>">
        		             <?php  }?>
        		             内容： <input value='<?php if( isset($gethotcategory[1][0]) ){   echo  $gethotcategory[1][0];   } ?>'  name='text[]'>  
        		              链接： <input value='<?php if( isset($gethotcategory[2][0]) ){   echo  $gethotcategory[2][0];   } ?>'  name='link[]'>  
        		             </p>
        		             <p> 图标2  <input  name='img[]'     type='file'>  
        		             
        		              <?php  if (isset($gethotcategory[0][1])) { ?> 
        		             			<img height="30" src="../images/<?php echo $gethotcategory[0][1];  ?>">
        		             <?php  }?>
        		             内容： <input  value='<?php if( isset($gethotcategory[1][1]) ){   echo  $gethotcategory[1][1];   } ?>'   name='text[]'>  
        		             
        		               链接： <input value='<?php if( isset($gethotcategory[2][1]) ){   echo  $gethotcategory[2][1];   } ?>'  name='link[]'>  
        		             </p>
        		              <p> 图标3  <input    value='<?php if( isset($gethotcategory[1][2]) ){   echo  $gethotcategory[1][2];   } ?>'   name='img[]'  type='file'>  
        		              
        		               <?php  if (isset($gethotcategory[0][2])) { ?> 
        		             			<img height="30" src="../images/<?php echo $gethotcategory[0][2];  ?>">
        		             <?php  }?>
        		              内容： <input  name='text[]'   value='<?php if( isset($gethotcategory[1][2]) ){   echo  $gethotcategory[1][2];   } ?>' >
        		              
        		                链接： <input value='<?php if( isset($gethotcategory[2][2]) ){   echo  $gethotcategory[2][2];   } ?>'  name='link[]'>  
        		                </p>
        		              
        		               <p class="saveclass"> <button type="submit"> 保存 </button> </p>
                </div>
        </form>
         <!--
        <form    method="post"     action="index.php?route=common/diyhome&token=<?php echo $token ?>" >
            <div>
                <p>   <b>  BANNER小图标 </b>    </p>
                <p> <textarea id="description5"  name="hotcategory"><?php echo isset($getdata['hotcategory'])?$getdata['hotcategory']:''; ?></textarea> </p>
                <p class="saveclass"> <button type="submit"> 保存 </button> </p>
            </div>
        </form>
         -->
        
        <form    method="post"     action="index.php?route=common/diyhome&token=<?php echo $token ?>" >
            <div>
                <p>   <b>  公告 </b>    </p>
                <p> <textarea id="description2"  name="hotBrand"><?php echo isset($getdata['hotBrand'])?$getdata['hotBrand']:''; ?></textarea> </p>
                <p class="saveclass"> <button type="submit"> 保存 </button> </p>
            </div>
        </form>
        <form    method="post"     action="index.php?route=common/diyhome&token=<?php echo $token ?>" >
            <div>
                <p>   <b>  我们的服务  </b>   </p>
                <p> <textarea id="description3"  name="hotEffect"><?php echo isset($getdata['hotEffect'])?$getdata['hotEffect']:''; ?></textarea> </p>
                <p class="saveclass"> <button type="submit"> 保存 </button> </p>
            </div>
        </form>


        <form    method="post"     action="index.php?route=common/diyhome&token=<?php echo $token ?>" >
            <div>
                <p>   <b> 底部链接  </b>   ( 区域宽度：803px , 区域高度:304px )  </p>
                <p> <textarea id="description4"  name="hotSell"><?php echo isset($getdata['hotSell'])?$getdata['hotSell']:''; ?></textarea> </p>
                <p class="saveclass"> <button type="submit"> 保存 </button> </p>
            </div>
        </form>

                <?php  }  ?>
                 <!--中间结束 -->

    </div>
  </div>
</div>
<!--[if IE]>
<script type="text/javascript" src="view/javascript/jquery/flot/excanvas.js"></script>
<![endif]--> 
<script type="text/javascript" src="view/javascript/jquery/flot/jquery.flot.js"></script> 
<script type="text/javascript"><!--
function getSalesChart(range) {
	$.ajax({
		type: 'get',
		url: 'index.php?route=common/home/chart&token=<?php echo $token; ?>&range=' + range,
		dataType: 'json',
		async: false,
		success: function(json) {
			var option = {	
				shadowSize: 0,
				lines: { 
					show: true,
					fill: true,
					lineWidth: 1
				},
				grid: {
					backgroundColor: '#FFFFFF'
				},	
				xaxis: {
            		ticks: json.xaxis
				}
			}

			$.plot($('#report'), [json.order, json.customer], option);
		}
	});
}

getSalesChart($('#range').val());
//--></script> 
<?php echo $footer; ?>

<script type="text/javascript">
    function  setfloor(v) {
        $.post(location.href, "v="+v,  function(){
                   ////  location.reload();
                    location="index.php?route=common/diyhome&token=<?php  echo $token; ?>&listfloor=1";
        } ) ;
    }


</script>

<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>

<script type="text/javascript">

var  ckboxleng='';

<?php  if($listfloor) { for ($i=1;  $i<= $floor['value'] ;  $i++ ){ ?>

    CKEDITOR.replace('description_floor<?php echo $i ?>', {
        filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
    });

<?php  } } else { ?>


    CKEDITOR.replace('description1', {
        filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
    });

    CKEDITOR.replace('description2', {
        filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
    });
    CKEDITOR.replace('description3', {
        filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
    });
    CKEDITOR.replace('description4', {
        filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
    });
     CKEDITOR.replace('description5', {
        filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
    });
    
    
<?php  } ?>

</script>