<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <ul>
      <?php foreach ($newss as $news) { ?>
      <li><a href="<?php echo $news['href']; ?>"><?php echo $news['title']; ?></a></li>
      <?php } ?>
	  <a href="<?php echo (((HTTPS_SERVER) ? HTTPS_SERVER : HTTP_SERVER) . 'index.php?route=news/allnews');?>">Read all news</a>
    </ul>
  </div>
</div>
