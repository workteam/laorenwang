<div class="items" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<!--
        <div class="home_layout_1">
                    <h3> <b> 论坛 </b>
                              <a href="#" class="more"> 更多 </a>
                    </h3>
                    <div class="item_1">
                           <ul class="fckdata">
                                <?php  echo $config_home_bbs_1; ?>
                                 <hr></hr>
                           </ul>
                        <ul class="fckdata">
                            <?php  echo $config_home_bbs_2; ?>

                        </ul>

                    </div>
        </div>-->
    <div class="home_layout_1">

        <h3> <b> <?php echo isset($cms[0])?$cms[0]:""; ?>  </b>
            <a href="?route=homes/home" class="more"> 更多 </a>
        </h3>
        <div class="item_1">
                <ul>

                    <form  action="?route=homes/hospitals" method="post" enctype="application/x-www-form-urlencoded">
                      <table width="100%">
                                <tr>
                                      <td width="12%" nowrap="nowrap"><b>关键字:</b></td>
                                      <td width="30%" colspan="2"><input name="kw"  style="width:100px;"/></td>
                                      <td width="72%">
                                      <select  name="zone_id">
                                        <option  value="0"> 地区 </option>
                                        <?php foreach  ( $countrys as $val ) { ?>
                                        <optgroup label="<?php  echo $val['name']?>">
                                          <?php foreach  ( $val["zones"] as $valb ) { ?>
                                          <option  value="<?php  echo $valb['zone_id']?>">
                                            <?php  echo $valb['name']?>
                                        </option>
                                          <?php }?>
                                        </optgroup>
                                        <?php }?>
                                      </select></td>
                                      <td width="10%" rowspan="2" >
                                                <?php 
                                                      $tpldir= dirname(__file__)."/../../";
                                                      ///print_r( $tpldir ); 
                                                ?>
                                                <input type="image" src="catalog/view/theme/default/image/adv_search.png" />
                                      			
                                      </td>
                                      
                                </tr>
                                <tr>
                                  <td nowrap="nowrap"><b>按环境:</b></td>
                                  <td>
                                   <select name="config_homes_env">
                                    <option value="-1"> 不限 </option>
                                    <?php if ( isset($config_homes_env) ) {       foreach  ($config_homes_env as     $key =>   $val) {     ?>
                                                        <option value="<?php echo $key; ?>" > <?php echo $val  ?> </option>
                                    <?php } } ?>
                            
                                </select></td>
                                  <td nowrap="nowrap"><b>价格:</b></td>
                                  <td>
                                  <select name="config_homes_pri" style=" width:100px">
                                    <option value="-1"> 不限 </option>
                                    <?php if ( isset($config_homes_pri) ) {       foreach  ($config_homes_pri as  $key =>  $val) {     ?>
                                             <option  value="<?php echo $key; ?>"> <?php echo $val  ?> </option>
                                    <?php } } ?>
                                </select>
                                  </td>
                                  
                                </tr>
                                <tr>
                                  <td colspan="5">&nbsp;</td>
                                </tr>
                      </table>
                    </form>
                     <div  class="fckdata"">
                                <?php  echo $config_home_homes; ?>
                    </div>

                </ul>
        </div>
    </div>
    <div class="home_layout_r">
        <h3> <b> 老年商城 </b>
            <a href="?route=product/home" class="more"> 更多 </a>
        </h3>
        <div class="item_r">
                 <ul>
					      <table width="100%">
                                <?php if ( isset($shop_cats[0]) ) { ?>
                                <tr>
                                		<td>
                                                 <b> <a href="<?php  echo $shop_cats[0]["href"]?>" target="_blank"> <?php  echo $shop_cats[0]["name"]?> </a></b>
                                        </td>
                                </tr>
                                <tr>
                                	 <td>
                                     			<?php foreach  ($shop_cats[0]["c"]  as $key=>$val ) { ?> 
                                                         <a href="<?php echo   isset($val["href"]) ?  $val["href"] :""; ?>" target="_blank">   <?php echo   isset($val["name"]) ?  $val["name"] :""; ?> </a>
                                                <?php }?>
                                     </td>
                                </tr>
                                <?php }?>
                                <tr>
                                			<td> <hr></hr> </td>
                                </tr>
                                <tr>
                                		<td>
                                        		<table width="100%">
                                                		<tr>
                                                        		<td> 
                                                                        <?php if ( isset($shop_cats[1]) ) { ?>
                                                                                 <b>  <a href="<?php  echo $shop_cats[1]["href"]?>" target="_blank">  <?php  echo $shop_cats[1]["name"]?> </a> </b>
                                                                                 <?php foreach  ($shop_cats[1]["c"]  as $key=>$val ) { ?> 
                                                                                           <a href="<?php echo   $val["href"] ; ?>" target="_blank">     <?php echo   $val["name"] ; ?>  </a>
                                                                                 <?php }?>
                                                                        <?php }?>
                                                                </td> 
                                                                <td> 
                                                                        <?php if ( isset($shop_cats[2]) ) { ?>
                                                                                 <b> <a href="<?php  echo $shop_cats[2]["href"]?>" target="_blank"> <?php  echo $shop_cats[2]["name"]?></a> </b>
                                                                                 <?php foreach  ($shop_cats[2]["c"]  as $key=>$val ) { ?> 
                                                                                              <a href="<?php echo   $val["href"] ; ?>" target="_blank">     <?php echo   $val["name"] ; ?>  </a>
                                                                                 <?php }?>
                                                                        <?php }?>
                                                                </td>
                                                        </tr>
                                                        <tr>
                                                        		<td> 
                                                                        <?php if ( isset($shop_cats[3]) ) { ?>
                                                                                 <b><a href="<?php  echo $shop_cats[3]["href"]?>" target="_blank">  <?php  echo $shop_cats[3]["name"]?></a> </b>
                                                                                 <?php foreach  ($shop_cats[3]["c"]  as $key=>$val ) { ?> 
                                                                                              <a href="<?php echo   $val["href"] ; ?>" target="_blank">     <?php echo   $val["name"] ; ?>  </a>
                                                                                 <?php }?>
                                                                        <?php }?>
                                                                </td> 
                                                                <td> 
                                                                        <?php if ( isset($shop_cats[4]) ) { ?>
                                                                                 <b> <a href="<?php  echo $shop_cats[4]["href"]?>" target="_blank"> <?php  echo $shop_cats[4]["name"]?></a> </b>
                                                                                 <?php foreach  ($shop_cats[4]["c"]  as $key=>$val ) { ?> 
                                                                                               <a href="<?php echo   $val["href"] ; ?>" target="_blank">     <?php echo   $val["name"] ; ?>  </a>
                                                                                 <?php }?>
                                                                        <?php }?>
                                                                </td>
                                                        </tr>
                                                </table>
                                        </td>
                                </tr>
                          </table>			
                 </ul>
        </div>
    </div>

</div>
<div class="fix"></div>
<div class="adss">
       <?php if (   isset($ads[9])   ) {
                 foreach  ($ads[9] as $val) {
                         echo  "<a href='".$val['link']."'  target='_blank'> <img src='".HTTP_IMAGE.$val['image']."' border='0' WIDTH='972'> </a> " ;
                 }
       }?>
</div>
<div class="items">
      <div class="item2">
          <h3>
                  <table width="100%">
                        <tr>
                             <td>    <b>推荐老人院</b> </td>
                              <td  align="right">   <a href="?route=cms/home&cat_id=0" style="font-weight: 500;"> 更多 >> </a> </td>
                        </tr>
                  </table>

          </h3>
          <table width="100%">
              <tr>
                  <?php if ($Travel &&  !empty($Travel)  )  {      foreach ($Travel as $val) {      ?>
                       <td align="center" style="padding-top: 10px;">
                             <p>  <a href="<?php echo $val['href'] ?>" target="_blank">   <img src="<?php echo $val['thumb']  ?>" alt="<?php echo $val['title'] ?>" border="0">  </a></p>
                             <p>   <a href="<?php echo $val['href'] ?>" target="_blank"> <?php echo $val['title'] ?> </a> </p>
                       </td>
                  <?php }} ?>
              </tr>
          </table>
      </div>
    <div class="item3" style="height: 282px;">
                   <h3>
                         <b>
                             <?php
                            $cmskey=1;  ///  需修改
                            if ( isset($cms[$cmskey])){
                                     echo  "<a href='?route=news/allnews&cat_id=$cmskey' target='_blank' class='link_title'>".  $cms[$cmskey] ."</a>";
                            }

                         ?>
                         </b>
                   </h3>
                    <div style="height: 105px;" class="item">
                                 <table width="100%" cellpadding="0" cellspacing="0"  class="cmslist">
                                     <?php
                                     $cmskey=1;       //   需修改
                                     $limit=6;
                                     if  ( isset($news[$cmskey])  &&  !empty($news[$cmskey]) )  { $i=1; foreach  ($news[$cmskey] as $val) { if ($i<$limit){  ?>
                                             <tr>  <td class="arr">
                                                  <?php //echo $i;?>   <a href="?route=news/news&news_id=<?php echo $val['news_id'] ?>" target="_blank">    <?php  echo $val['title'] ?> </a>
                                             </td> </tr>
                                     <?php $i++; } }}?>
                                 </table>
                    </div>
                    <h3>
                        <b>
                            <?php
                            $cmskey=2;  ///  需修改
                            if ( isset($cms[$cmskey])){
                                     echo  "<a href='?route=news/allnews&cat_id=$cmskey' target='_blank' class='link_title'>".  $cms[$cmskey] ."</a>";
                            }

                            ?>
                        </b>
                    </h3>
                    <div style="height: 105px;" class="item">
                        <table width="100%" cellpadding="0" cellspacing="0"  class="cmslist">
                            <?php
                                     $cmskey=2;       //   需修改
                                     $limit=6;
                                     if  ( isset($news[$cmskey])  &&  !empty($news[$cmskey]) )  { $i=1; foreach  ($news[$cmskey] as $val) { if ($i<$limit){  ?>
                            <tr>  <td class="arr">
                                <?php //echo $i;?>   <a href="?route=news/news&news_id=<?php echo $val['news_id'] ?>" target="_blank">    <?php  echo $val['title'] ?> </a>
                            </td> </tr>
                            <?php $i++; } }}?>
                        </table>
                    </div>
    </div>
</div>
<div class="fix"></div>
<div class="items">
    <!---->
    <?php foreach  ($cms as $cmskey => $cmsval) {  if ($cmsval &&    $cmskey> 2  &&   $cmskey<7 ) { ?>
    <div class="item3">
        <h3>
            <b>
                <?php
                            $cmskey=$cmskey;  ///  需修改
                            if ( isset($cms[$cmskey])){
                            echo  "<a href='?route=news/allnews&cat_id=$cmskey' target='_blank' class='link_title'>".  $cms[$cmskey] ."</a>";
                }

                ?>
               </b>
        </h3>
        <div class="item">
                <?php if ( file_exists("image/cms-".$cmskey.".jpg")) { ?>
                          <img src="image/cms-<?php echo $cmskey ?>.jpg" alt="" height="75" width="98%" style="margin: 2px 1% 2px 1%;">

                <table width="100%" cellpadding="0" cellspacing="0"  class="cmslist">
                    <?php
                                         $cmskey=$cmskey;       //   需修改
                                         $limit=8;
                                         if  ( isset($news[$cmskey])  &&  !empty($news[$cmskey]) )  { $i=1; foreach  ($news[$cmskey] as $val) { if ($i<$limit){  ?>
                    <tr>  <td class="arr">
                        <?php //echo $i;?>   <a href="?route=news/news&news_id=<?php echo $val['news_id'] ?>" target="_blank">    <?php  echo $val['title'] ?> </a>
                    </td> </tr>
                    <?php $i++; } }}?>
                </table>
                <?php }   else{ ?>
                        <!---显示图片-->
                        <table width="100%" cellpadding="0" cellspacing="0"  class="cmslist">

                            <?php
                                                     $cmskey=$cmskey;       //   需修改
                                                     $limit=5;
                                                     if  ( isset($news[$cmskey])  &&  !empty($news[$cmskey]) )  { $i=1; foreach  ($news[$cmskey] as $val) { if ($i<$limit){  ?>
                            <tr>
                                      <td style="padding: 2px 10px 2px 10px; line-height: 110%;border-top: 1px #ccc dotted;">
                                          <a href="?route=news/news&news_id=<?php echo $val['news_id'] ?>" target="_blank">
                                           <img border="0" src="<?php  echo $val['thumb'] ?>" alt="<?php  echo $val['title'] ?>">
                                          </a>
                                      </td>
                                      <td  style="line-height: 150%;border-top: 1px #ccc dotted;">
                                          <?php //echo $i;?>   <a href="?route=news/news&news_id=<?php echo $val['news_id'] ?>" target="_blank">
                                          <?php  /// echo $val['title'] ?>
                                          <?php  echo $val['description'] ?>    </a>
                                      </td>
                            </tr>
                            <?php $i++; } }}?>
                        </table>
                         <!---显示图片-->
                <?php  }?>
        </div>
    </div>
    <?php }}?>
    <!------>

    <!--
    <div class="item3">
        <h3>
            <b>   设备采购      </b>
        </h3>
        <div class="item">

        </div>
    </div>
    -->
</div>
<div class="fix"></div>
<div class="adss">
    <table width="100%">
                     <tr>
                          <td width="50%">   <?php if (   isset($ads[10])   ) {
                             foreach  ($ads[10] as $val) {
                             echo  "<a href='".$val['link']."'  target='_blank'> <img src='".HTTP_IMAGE.$val['image']."' border='0' WIDTH='100%'> </a> " ;
                              }
                              }?></td>
                          <td width="50%"> <?php if (   isset($ads[11])   ) {
                             foreach  ($ads[11] as $val) {
                             echo  "<a href='".$val['link']."'  target='_blank'> <img src='".HTTP_IMAGE.$val['image']."' border='0' WIDTH='100%'> </a> " ;
                              }
                              }?> </td>
                     </tr>
    </table>

</div>
<div class="fix"></div>
<div class="items">
    <!---->
    <?php foreach  ($cms as $cmskey => $cmsval) {  if ($cmsval &&    $cmskey> 6  &&   $cmskey<11 ) { ?>
    <div class="item3">
        <h3>
            <b>
                <?php
                            $cmskey=$cmskey;  ///  需修改
                            if ( isset($cms[$cmskey])){
                                     echo  "<a href='?route=news/allnews&cat_id=$cmskey' target='_blank' class='link_title'>".  $cms[$cmskey] ."</a>";
                }

                ?>
            </b>
        </h3>
        <div class="item">

            <?php if ( file_exists("image/cms-".$cmskey.".jpg")) { ?>
             <img src="image/cms-<?php echo $cmskey ?>.jpg" alt="" height="75" width="98%" style="margin: 2px 1% 2px 1%;">
            <?php }?>

            <table width="100%" cellpadding="0" cellspacing="0"  class="cmslist">
                <?php
                                     $cmskey=$cmskey;       //   需修改
                                     $limit=8;
                                     if  ( isset($news[$cmskey])  &&  !empty($news[$cmskey]) )  { $i=1; foreach  ($news[$cmskey] as $val) { if ($i<$limit){  ?>
                <tr>  <td class="arr">
                    <?php //echo $i;?>   <a href="?route=news/news&news_id=<?php echo $val['news_id'] ?>" target="_blank">    <?php  echo $val['title'] ?> </a>
                </td> </tr>
                <?php $i++; } }}?>
            </table>
        </div>
    </div>
    <?php }}?>
</div>