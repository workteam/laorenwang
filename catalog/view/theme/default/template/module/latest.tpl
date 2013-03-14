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


<table width="100%" cellpadding="0" cellspacing="0" border="0" >
                <tr>
                            <td  width="340" valign="top">
                                   <!--begin-->

                                <TABLE style="MARGIN: 3px 0px 0px;" cellSpacing=0 cellPadding=0 width=330 bgColor=#f6f6f6 border=0>
                                    <TBODY>
                                    <TR>
                                        <TD style="BORDER-TOP: #fff 1px solid; BACKGROUND: url(1501.gif) repeat-x 0px 100%" vAlign=bottom align=left>
                                            <DIV class=menub1_1 id=menu_1_1 onmouseover=showtabs(1,1,5);><?php echo $mlang['news'] ?></DIV>
                                            <DIV class=menub1_2 id=menu_1_2 onmouseover=showtabs(1,2,5);><?php echo $mlang['Technology'] ?></DIV>

                                        </TD></TR>
                                    <TR>
                                        <TD colSpan=2>
                                            <TABLE cellSpacing=0 cellPadding=0 width="100%" bgColor=#ffffff border=0>
                                                <TBODY>
                                                <TR>
                                                    <TD align=middle>

                                                        <?php foreach  ( $news as $key=>$val ) { ?>
                                                        <DIV class=menugtab id=menutab_1_<?php echo $key+1; ?>  <?php echo ($key+1)>1?" style='DISPLAY: none'" :"" ;?> >
                                                                  <table width="100%">
                                                                  <?php foreach  ( $val as  $valb ) { ?>
                                                                          <tr>
                                                                                <td height="18">
                                                                                    <a href="?route=news/news&news_id=<?php echo $valb['news_id'] ?>" target="_blank">
                                                                                    <?php echo $valb['title'] ?>
                                                                                    </a>
                                                                                </td>
                                                                                 <td width="80"> <?php echo $valb['post_date'] ?>   </td>
                                                                          </tr>
                                                                  <?php } ?>
                                                                  </table>
                                                        </DIV>
                                                        <?php }?>
                                                        <!--
                                                        <DIV class=menugtab id=menutab_1_2 >

                                                            <a href="http://www.duice.net/html/list_592.html" target="_blank">零度对策-网络营销教程</a>

                                                        </DIV>
                                                        -->

                                                    </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                                   <!--end -->
                            </td>
                             <td>
                                 <!--最新商品-->
                                 <div class="box">
                                     <div class="box-heading"><?php echo $heading_title; ?></div>
                                     <div class="box-content">
                                         <div class="box-product">
                                             <?php foreach ($products as $product) { ?>
                                             <div>
                                                 <?php if ($product['thumb']) { ?>
                                                 <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
                                                 <?php } ?>
                                                 <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>

                                                 <!--
                                                 <?php if ($product['price']) { ?>
                                                 <div class="price">
                                                     <?php if (!$product['special']) { ?>
                                                     <?php echo $product['price']; ?>
                                                     <?php } else { ?>
                                                     <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                                                     <?php } ?>
                                                 </div>
                                                 <?php } ?>
                                                 <?php if ($product['rating']) { ?>
                                                 <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
                                                 <?php } ?>
                                                 <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
                                                  -->

                                             </div>
                                             <?php } ?>
                                         </div>
                                     </div>
                                 </div>

                                 <!--最新商品-->

                             </td>
                </tr>

</table>

