<!---地区-->
<div style="padding: 10px; line-height: 200%; border: 1px solid #ddd; margin: 3px 0 3px 0;">
    <?php if ( !empty($countrys)  ) {      foreach  ($countrys as $val) {    ?>
    <div>
        <b> <?php echo $val["name"] ?> </b>
        <?php foreach(  $val["zones"] as $zone ) { ?>
        <a href="?route=homes/hospitals&zone_id=<?php echo $zone["zone_id"]  ?>">    <?php echo $zone["name"]  ?> </a>
        <?php }?>
    </div>
    <?php }  }?>
</div>
<!---地区-->