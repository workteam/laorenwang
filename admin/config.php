<?php
// HTTP
$http= "http://127.0.0.1/laoren";
define("HTTP_SERVER", "$http/admin/");
define("HTTP_CATALOG", "$http/");
define("HTTP_IMAGE", "$http/image/");

// HTTPS
define("HTTPS_SERVER", "$http/admin/");
define("HTTPS_CATALOG", "$http/");
define("HTTPS_IMAGE", "$http/image/");

// DIR
$dir=  dirname(__FILE__)."/../";
define("DIR_APPLICATION", "$dir/admin/");
define("DIR_SYSTEM", "$dir/system/");
define("DIR_DATABASE", "$dir/system/database/");
define("DIR_LANGUAGE", "$dir/admin/language/");
define("DIR_TEMPLATE", "$dir/admin/view/template/");
define("DIR_CONFIG", "$dir/system/config/");
define("DIR_IMAGE", "$dir/image/");
//define("DIR_IMAGE", "D:\\image\\");
define("DIR_CACHE", "D:\\cache\\");
define("DIR_DOWNLOAD", "$dir/download/");
define("DIR_LOGS", "$dir/system/logs/");
define("DIR_CATALOG", "$dir/catalog/");

// DB
define("DB_DRIVER", "mysql");
define("DB_HOSTNAME", "localhost");
define("DB_USERNAME", "root");
define("DB_PASSWORD", "123456");
define("DB_DATABASE", "laoren");
define("DB_PREFIX", "op_");

/////define("cms" , array(11) );

?>