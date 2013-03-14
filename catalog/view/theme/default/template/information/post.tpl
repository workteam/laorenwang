<?php   echo  $header; ?>
<script>
$(function(){ 
		$('.mc table td,#mc table td, .mc table ,#mc table  ').css({"border":"0"});
})
</script>
<!--site nav-->
<div class="site_guide">
    <?php echo $breadcrumbs  ; ?>
   <?php   echo    isset( $val[0]['name'])   ?    $val[0]['name']  :"" ;  ?> 

   </div>
<!--main-->
<div id="column">
  <div class="lc">
    <dl class="leftNav">
    
	      <?php  
	        
	      if(  $category_id   ||  1==1 )  {  ?>	
	      <dt><?php  echo $l_category[0]['name'] ?></dt>
	     
	      
	      <?php     foreach ($l_category[0]['c']  as $val ) { ?>
	      <dd><a    <?php  if ($category_id==$val['href']) { ?>  class="on"   <?php }?>  
	         <?php  if ( !empty($val['c']) )  { ?>       class='on'   <?php  }?>
	      href="?route=information/post&path=<?php  echo $val['href']  ?>&category_id=<?php  echo $val['href']  ?>&id=<?php echo $val['category_id'];  ?>"><?php  echo $val['name']  ?></a>
	      
	        <?php  if ($category_id==$val['href']         ||  1==1      ) { ?>
	      	<ul>
	      	        <?php   foreach (   $val['c'] as  $valb        )  {  ?>
	      	          <li><a href="?route=information/post&path=<?php  echo $valb['href'] ?>&category_id=<?php  echo $val['href']  ?>&id=<?php echo $valb['category_id'];  ?>"><?php  echo $valb['name'] ?></a></li>  
	      	        <?php   }  ?>  
	      	</ul>
	      	<?php }?>
	      	
	      </dd>
	      <?php  }?>
	      <?php  } else {  ?>
	                <dt><?php  echo $l_category[0]['name'] ?></dt>
	                <?php     foreach ($l_category[0]['c']  as $val ) { ?>
	                 <dd><a <?php if($path==$val['href']){ echo " class='on' " ;  }  ?> 
	                  href="?route=information/post&path=<?php  echo $val['href']  ?>&category_id=<?php  echo $val['href']  ?>&id=<?php echo $val['category_id'];  ?>"><?php  echo $val['name']  ?></a>
	                <?php  }?>
	      <?php   } ?>
      
    </dl>
  </div>
  <div class="mc" >
	    
	    <?php  foreach  (  $posts as $val )  { ?>
	    <h1><strong><?php   echo $val['name'] ?></strong></h1>
	    
	   	<div > 
	   			<?php   echo $val['description'] ?>
	   	</div>
	    <?php  }?>
    
    
  </div>
  <div class="rc">
	  <div class="maiUs">
	      <h2>业务合作</h2>
	      <p>
                         <div style='margin:5px 0 5px 0; '>
	   									<!--客服代码-->
          <!-- 将下面的代码放在需要显示的地方 -->
											<script type="text/javascript">
(function() {
    document.write('<span id="laoma-e-1"></span>');
    var s = document.createElement('script');
    s.type = 'text/javascript';s.async = true;s.charset = 'utf-8';
    s.src = ('https:' == document.location.protocol ? 'https:' : 'http:')+'//chat.laoma.com/webchat/echo.jsp?corpID=iuniou&config=config4500&async=true&aid=laoma-e-1';
    var x = document.getElementsByTagName('script')[0];
    x.parentNode.insertBefore(s, x);
})();
</script>
						 <!-- 将下面的代码放在需要显示的地方 -->	
	   </div>
	      </p>
	      <p class="mail"><a href="mailto:sales@iuniou.com">发邮件联系业务</a></p>
	      <p>或者致电我们到</p>
	      <p>电话:+86(755)82950869         </p>
	      <p>传真:+86(755)82950868</p>
	   </div>
	 
	  
  </div>
</div>
<!--end-->
 <?php  echo $footer ; ?> 