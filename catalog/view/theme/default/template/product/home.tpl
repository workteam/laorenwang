<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>

<!--幻灯片--->
<link rel="stylesheet" type="text/css" href="jqslider/jqslider_shop.css" xmlns="http://www.w3.org/1999/html"/>
<script type="text/javascript" src="jqslider/jqslider.js"></script>
<!--幻灯片--->
<div id="content">
    <table width="99%" cellpadding="0" cellspacing="0" border="0">
          <tr>
                <td valign="top" width="199">
                    <!--方块1-->
                    <div class="shop_left_box">
                            <h1 class="shop_left">
                                      <b>  产品检索 </b>
                            </h1>
                        <form action="<?php echo HTTP_SERVER;?>?route=product/search" method="get"    >
                            <div class="shop_left">

                                           <table width="100%">
                                                 <tr>
                                                       <td  align="center" width="55">  <b>主类别:</b> </td>
                                                       <td>
                                                             <select   name="filter_category_id">
                                                                    <option value=""> ----请选择----- </option>
                                                                    <?php foreach  ( $categories  as  $categorie) { ?>
                                                                          <option value="<?php echo $categorie['category_id'] ?>"> <?php echo $categorie['name'] ?> </option>
                                                                           <?php foreach  ( $categorie["children"]  as $valb  ) { ?>
                                                                             <option value="<?php echo $valb['category_id'] ?>"> - <?php echo $valb['name'] ?> </option>
                                                                           <?php }?>
                                                                   <?php }?>
                                                             </select>
                                                        </td>
                                                 </tr>
                                               <tr>
                                                   <td align="center">  <b>关键字:</b> </td>
                                                   <td>
                                                            <input style="width: 60px;" name="filter_name">
                                                            <input type="submit" value="搜索">
                                                            <input type="hidden" name="route" value="product/search">
                                                   </td>
                                               </tr>
                                           </table>


                            </div>

                         </form>


                    </div>
                    <!--方块1-->
                    <div class="shop_left_box">
                        <h1 class="shop_left">
                            <b>  产品总览 </b>
                        </h1>
                        <div class="shop_left">
                            <table width="100%">
                                <tr>
                                     <td>
                                            <div class="left_categories_box">
                                                  <ul>
                                                        <?php foreach  ( $categories  as  $categorie) { ?>
                                                                     <li>
                                                                         <a href="<?php echo  $categorie["href"]   ?>">
                                                                             <?php echo  $categorie["name"]   ?>
                                                                         </a>
                                                                     </li>
                                                        <?php }?>
                                                  </ul>
                                            </div>

                                     </td>
                                </tr>

                            </table>

                        </div>


                    </div>
                    <!--方块2-->
                    <div>
                            <?php  if ( isset($ads['21']) ) {  foreach  (      $ads['21'] as $val   ) {  ?>
                                    <a href="<?php echo $val["link"] ?>">
                                    <img src="<?php echo  HTTP_IMAGE. $val['image'] ?>" width="97%"  >
                                    </a>
                            <?php  }}?>

                    </div>
                </td>
                <td valign="top" id="shop_center">
                    <!--- center  begin --->
                    <div class="breadcrumb">
                        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                        <?php } ?>
                    </div>
                    <!---幻灯片---->
                    <div style="margin-bottom: 10px; ">
                        <table cellpadding="0" cellspacing="0" width="100%" style="margin-left: 0px;">
                            <tr>
                                <td  valign="top">
                                    <!-- *** jQuery Slider code starts *** -->
                                    <?php

                                    if ( isset($ads["23"][0]["image"]) ) { ?>
                                    <div id="wsnSlider">
                                        <img src='<?php echo HTTP_IMAGE.$ads[$bannerarr[$cat_id]][0]["image"] ?>' />
                                        <ul class="buttons">
                                            <?php $i=1;  foreach  (  $ads["23"] as $val) { ?>
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
                    <!---center  end ---->
                    <div id="hotbox">
                                <h1>  <b>   热门推荐   </h1>
                                <div>
                                     <ul>
                                        <?php  foreach  ( $getProducts as $val ) { ?>
                                               <li>
                                                   <p> <a href="<?php echo $val['href'] ?>"><img src="<?php echo $val["thumb"]  ?>">  </a> </p>
                                                   <p style="height: 50px;"> <b>  <a href="<?php echo $val['href'] ?>"><?php echo $val["name"]  ?> </a>  </b> </p>
                                                   <p> <b>市场价:</b> <?php echo $val["price"]  ?> </p>
                                                   <p style="color: #ff7d27;">  <b>销售价:</b> <?php echo $val["price"]  ?> </p>
                                                   <p>  <a class="button" href="<?php echo $val['location'] ?>" target="_blank">  定购  </a>   </p>
                                               </li>
                                        <?php  }?>
                                     </ul>
                                </div>
                                <div style="clear: both;"> </div>
                    </div>

                    <div id="newbox">
                               <h1> <b>最新商品 </b></h1>
                        <div>
                            <ul>
                                <?php  foreach  ( $LatestProducts as $val ) { ?>
                                <li style="width: 48%; height: 160px;">
                                    <table width="100%">
                                           <tr>
                                                <td>  <p>   <a href="<?php echo $val['href'] ?>"><img src="<?php echo $val["thumb"]  ?>"> </a> </p></td>
                                                <td width="6"> </td>
                                                <td>
                                                    <p style="text-align: left; "> <b>  <a href="<?php echo $val['href'] ?>"><?php echo $val["name"]  ?> </a></b> </p>
                                                    <p style="text-align: left; "> <b>市场价:</b> <?php echo $val["price"]  ?> </p>
                                                    <p style="color: #ff7d27; text-align: left;">  <b>销售价:</b> <?php echo $val["price"]  ?> </p>
                                                    <p>  <a class="button" href="<?php echo $val['location'] ?>" target="_blank">  定购  </a>   </p>
                                                </td>
                                           </tr>
                                    </table>


                                </li>
                                <?php  }?>
                            </ul>
                        </div>
                        <div style="clear: both;"> </div>

                    </div>
                </td>
                <td width="8px"></td>
                <td valign="top" width="176">
                        <div class="shop_right">
                                        <div  class="shop_right_item">
                                                     <h1>  <b>  商城焦点</b> </h1>
                                                     <div id="shop_r_news_box">
                                                           <ul>
                                                               <?php  foreach  (  $shop_news as $val) { ?>
                                                                <li> <a target="_blank" href="<?php echo $val['href']  ?>">   <?php echo $val['title']  ?>  </a> </li>
                                                               <?php  }?>

                                                           </ul>

                                                     </div>
                                        </div>
                        </div>

                    <div class="shop_right">
                        <div  class="shop_right_item">
                            <h1>  <b>  热卖产品</b> </h1>
                            <div class="shop_r_items_box">
                                <ul>
                                    <?php foreach  ( $getBestSellerProducts as $val) { ?>
                                    <li>  <a href="<?php echo $val['href'] ?>">  <?php echo $val['name'] ?> </a> </li>
                                    <?php  }  ?>

                                </ul>

                            </div>
                        </div>
                    </div>
                    <!------>
                    <div class="shop_right">
                        <div  class="shop_right_item">
                            <h1>  <b>  公益活动 </b> </h1>
                            <div class="shop_r_items_box">
                                      <table  width="100%" cellpadding="0" cellspacing="0">
                                            <?php  foreach  (  $news_activity as $val )  { ?>
                                                        <tr>
                                                             <td>
                                                                    <a href="<?php echo $val['href'] ?>">
                                                                       <img border="0" style="margin: 1px 0 1px 0px " width="100%" src="<?php    echo  HTTP_IMAGE.$val['image']    ?> ">
                                                                    </a>
                                                             </td>
                                                        </tr>
                                            <?php }   ?>
                                      </table>
                            </div>
                        </div>
                    </div>
                    <div>
                        <?php  if ( isset($ads['22']) ) {  foreach  (      $ads['22'] as $val   ) {  ?>
                        <a href="<?php echo $val["link"] ?>">
                        <img src="<?php echo  HTTP_IMAGE. $val['image'] ?>" width="100%"  >
                        </a>
                        <?php  }}?>

                    </div>
                    <div class="">
                                 <a href="<?php echo $config_facebook;  ?>">    <img border="0" src="<?php  echo   HTTP_IMAGE."facebook.png"; ?>" alt="facebook"> </a>
                    </div>
                </td>
          </tr>

    </table>

    <?php echo $content_top; ?>
    <h1 style="display: none;"><?php echo $heading_title; ?></h1>
    <?php echo $content_bottom; ?></div>

<?php echo $footer; ?>