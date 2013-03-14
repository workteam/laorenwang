<div style="border:1px #ddd solid; padding: 10px; ">
    <form action="?route=homes/hospitals" method="post" enctype="application/x-www-form-urlencoded">
    <b>  院舍搜索</b>  <input value="关键字" name="kw">
    <select  name="zone_id">

        <option  value="0">  地区  </option>
        <?php foreach  ( $countrys as $val ) { ?>
                    <optgroup label="<?php  echo $val['name']?>">
                        <?php foreach  ( $val["zones"] as $valb ) { ?>
                                 <option  value="<?php  echo $valb['zone_id']?>"> <?php  echo $valb['name']?>     </option>
                        <?php }?>
                    </optgroup>
        <?php }?>

    </select>

     <b> 环境:</b>
    <select name="config_homes_env">
        <option value="-1"> 不限 </option>
        <?php if ( isset($config_homes_env) ) {       foreach  ($config_homes_env as     $key =>   $val) {     ?>
                            <option value="<?php echo $key; ?>" > <?php echo $val  ?> </option>
        <?php } } ?>

    </select>
    <b> 护理:</b>
    <select name="config_homes_nur">
        <option value="-1"> 不限 </option>
        <?php if ( isset($config_homes_nur) ) {       foreach  ($config_homes_nur as  $key => $val) {     ?>
        <option  value="<?php echo $key; ?>"> <?php echo $val  ?> </option>
        <?php } } ?>
    </select>
     <b>   价格:</b>
    <select name="config_homes_pri">
        <option value="-1"> 不限 </option>
        <?php if ( isset($config_homes_pri) ) {       foreach  ($config_homes_pri as  $key =>  $val) {     ?>
                 <option  value="<?php echo $key; ?>"> <?php echo $val  ?> </option>
        <?php } } ?>
    </select>
    <input value="搜索" type="submit" class="button">
    </form>
</div>

