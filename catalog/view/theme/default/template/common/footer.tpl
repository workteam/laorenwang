<!--
<div id="footer">


<?php if ($informations) { ?>
<div class="column">
  <h3><?php echo $text_information; ?></h3>
  <ul>
    <?php foreach ($informations as $information) { ?>
    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
    <?php } ?>
  </ul>
</div>
<?php } ?>
<div class="column">
  <h3><?php echo $text_service; ?></h3>
  <ul>
    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
    <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
    <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
  </ul>
</div>
<div class="column">
  <h3><?php echo $text_extra; ?></h3>
  <ul>
    <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
    <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
    <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
    <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
  </ul>
</div>
<div class="column">
  <h3><?php echo $text_account; ?></h3>
  <ul>
    <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
    <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
    <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
    <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
  </ul>
</div>

</div>
-->
<!--
hczm.cn is open source software and you are free to remove the powered by hczm.cn if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@hczm.cn.com
//-->

<div class="fix"></div>
<!--友情链接-->
<div style="margin: 10px 0 5px 0; border: 1px solid #ddd;">
    <table width="100%" cellpadding="0" cellspacing="0" id="tab_links">
        <tr>
            <td id='linksbox'>

            </td>
            <td width="10"></td>
            <td>
                <?php echo   isset($links) ? $links:""; ?>
            </td>
            <td width="10"></td>
        </tr>
    </table>
</div>
<!--友情链接-->

<div class="fix"></div>
<div id="footerbox">
   
        <?php echo   isset($footer) ? $footer:""; ?>
    
</div>
<div class="fix"></div>

<!--
<div id="powered" style="border-top: 1px #ddd solid; padding-top: 10px; line-height: 180%;"><?php echo $powered; ?></div>
-->
<!--
hczm.cn is open source software and you are free to remove the powered by hczm.cn if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@hczm.cn.com
//-->
</div>
</body></html>