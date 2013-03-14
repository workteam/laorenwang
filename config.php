<?php
// HTTP
$http= "http://127.0.0.1/laoren";

define("HTTP_SERVER", "$http/");
define("HTTP_IMAGE", "$http/image/");
define("HTTP_ADMIN", "$http/admin/");

// HTTPS
define("HTTPS_SERVER", "$http/");
define("HTTPS_IMAGE", "$http/image/");

// DIR
$dir=  dirname(__FILE__);

define("DIR_APPLICATION", "$dir/catalog/");
define("DIR_SYSTEM", "$dir/system/");
define("DIR_DATABASE", "$dir/system/database/");
define("DIR_LANGUAGE", "$dir/catalog/language/");
define("DIR_TEMPLATE", "$dir/catalog/view/theme/");
define("DIR_CONFIG", "$dir/system/config/");
define("DIR_IMAGE", "$dir/image/");
define("DIR_BBS", "$dir\\bbs\\");
//define("DIR_IMAGE", "D:\\image\\");
define("DIR_CACHE", "D:\\cache\\");
define("DIR_DOWNLOAD", "$dir/download/");
define("DIR_LOGS", "$dir/system/logs/");

// DB
define("DB_DRIVER", "mysql");
define("DB_HOSTNAME", "localhost");
define("DB_USERNAME", "root");
define("DB_PASSWORD", "123456");
define("DB_DATABASE", "laoren");
define("DB_PREFIX", "op_");
?>