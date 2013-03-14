<?php echo $header; ?>
        <div id='msgbox' style=" display: none; position: absolute; width: 600px; height: 380px; margin-left: -250px; background: #fff; left: 50%; border: 1px #ddd solid; top:139px; ">
                            <h3 onclick="$('#msgbox').hide();" style="text-align: right;  padding: 5px;margin: 5px; border-bottom: 1px #ddd  solid ;cursor: pointer;">  关闭  </h3>
                            <table width="98%" align="center" id="msg_addbox">
                                      <tr>
                                            <td width="80" height="30">  <b> 分类名称: </b>
                                            <input id='name' name="name">
                                            <b>  排序(数值):</b><input name="sort_order" id="sort_order" style="width: 30px;">
                                             <input type="submit" value="添加" onclick="savecat($('#msg_addbox #name'), this)">
                                            </td>
                                      </tr>
                            </table>
                            <div style="height: 280px; overflow: auto; padding-top: 10px; border-top: 1px #ddd solid;">
                                     <table width="98%" align="center" id="msgbox_c">

                                     </table>
                            </div>
        </div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>

<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>

<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('view/image/news.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons">
        <?php if ( isset($_GET['cat_id'])     &&   $_GET['cat_id'] > -1 ) { ?>
                  <a  onclick="addcats();"  class="button">   分类管理    </a>
         <?php  }?>
        <a onclick="location = '<?php echo $insert."&cat_id=".(isset($_GET['cat_id'])?$_GET['cat_id']:'0'); ?>'" class="button"><span><?php echo $button_insert; ?></span></a>
        <a onclick="$('form').submit();" class="button"><span><?php echo $button_delete; ?></span></a>
    </div>
  </div>
  <div class="content">
    <form action="<?php echo $delete."&cat_id=".(isset($_GET['cat_id'])?$_GET['cat_id']:'0'); ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="list">
        <thead>
          <tr>
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
            <td class="left"><?php if ($sort == 'id.title') { ?>
              <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?></a>
              <?php } ?></td>
            <td class="right"><?php if ($sort == 'i.sort_order') { ?>
              <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
              <?php } ?></td>
              <td> 分类 </td>
            <td class="right"><?php echo $column_action; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($newss) { ?>
          <?php foreach ($newss as $news) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($news['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $news['news_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $news['news_id']; ?>" />
              <?php } ?></td>
            <td class="left"><?php echo $news['title']; ?></td>
            <td class="right"><?php echo $news['sort_order']; ?></td>
              <td> <?php echo $news['cat_name']  ?> </td>
            <td class="right"><?php foreach ($news['action'] as $action) { ?>
              [ <a href="<?php echo $action['href']."&cat_id=".(isset($_GET['cat_id'])?$_GET['cat_id']:'0'); ?>"><?php echo $action['text']; ?></a> ]
              <?php } ?></td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </form>
    <div class="pagination"><?php echo $pagination; ?></div>
  </div>
</div>

</div>
<?php echo $footer; ?>
<script>
    $(function(){
        getcatsdata();
    })
    function  addcats(){
            ////alert("d");
            $("#msgbox").show();
            addclear()
            getcatsdata();
    }
    function  savecat(v,t){
               ///     alert(v.val());
                if (v.val()=='') {
                    $(v).css({"border":"1px solid #f00"});
                    return false;
                }
                else{
                    $(v).css({"border":"1px solid #333"});
                    $.post(location.href, "name="+ v.val() +"&sort_order=" + $("#msg_addbox #sort_order").val() , function(){
                        addclear()
                        getcatsdata();
                    } )
                }

    }
    function addclear() {
        $("#msg_addbox #name , #msg_addbox #sort_order").val("");
    }
    function getcatsdata(){
        $.get(location.href+"&catsdata=1",    function (msg){
                           var  msg=eval(msg);
                           $("#msgbox_c").html("");
                           for( i=0; i<msg.length; i++ ) {
                               $("#msgbox_c").append(" <tr id='cats_tr_"+msg[i]["id"]+"' > <td> <input id='name' value='"+msg[i]['name']+"'>   <input value='"+msg[i]['sort_order']+"' style='width:30px;' id='sort_order'>          <a  onclick='edit("+msg[i]['id']+")'>  修改 </a> |  <a onclick='del("+msg[i]['id']+")'> 删除</a><span id='msg'></span> </td></tr>    ");
                           }
        }     );
    }
   function edit(id){
                   var  obj=$("#cats_tr_"+id);
                   $.post(location.href, "name="+ obj.find('#name').val() +"&sort_order=" + obj.find('#sort_order').val() +"&id="+id , function(msg){
                             if (msg==1){
                                   obj.find("#msg").html(" √ ");
                                   ////getcatsdata();
                             } else{
                                    obj.find("#msg").html(" error 404! ");
                             }
                   } )
   }
    function del(id){
        if (  confirm("您确定删除吗?")  ) {
                $.get(location.href+"&del="+id, function(){
                    getcatsdata();
                })
        }
    }


</script>