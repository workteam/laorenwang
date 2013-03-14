<?php  
class ControllerModuleHomelayout extends Controller {
	protected function index($setting) {
        $this->load->model("tool/q");
        $this->load->model("tool/str");
        $this->load->model("tool/image");
        $language_id= $this->config->get("config_language_id");

		$this->language->load('module/welcome');
		
    	$this->data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));

        ///  广告条   begin
        $adsid=array( 7, 8,  9,10,11,13 ,14,  15, 16, 17);
        $ads=array();
        foreach  ( $adsid as $val ) {
                $imgs=$this->model_tool_q->q(" select  * from op_banner_image where  banner_id='$val' ") ->rows;
                /*
                foreach  (  $imgs as $imgkey=>$imgval  ) {
                           $imgs[$imgkey]['image']=$this->model_tool_image->resize($imgval["image"],975,110) ;
                }
                */
                ////print_r($imgs);
                $ads[$val]=   $imgs;
        }
        $this->data["ads"] =$ads;
        ////print_r($ads);
        //// 广告条   end
        ///  商城分类
        $shop_cats=  $this->model_tool_q->q(" select * from  op_category  a  left join
                  op_category_description b on  a.category_id=b.category_id  where  b.language_id='$language_id' and a.parent_id=''   order by a.sort_order asc
         ") ->rows ;
        foreach  ($shop_cats    as $key=>$val  ) {
                  $shop_cats[$key]["href"] = "?route=product/category&path=$val[category_id]";
                  $c=  $this->model_tool_q->q(" select * from  op_category  a  left join
                  op_category_description b on  a.category_id=b.category_id  where  b.language_id='$language_id' and a.parent_id='$val[category_id]'   order by a.sort_order asc
         ")  ->rows   ;
                    foreach  ( $c  as $keyc=>$valc) {
                        $c[$keyc]["href"]="?route=product/category&path=$val[category_id]_$valc[category_id]";
                    }
                   $shop_cats[$key]["c"]=   $c;


        }

        ///print_r($shop_cats);
        $this ->data["shop_cats"]  =$shop_cats;
        ///   CMS


        $cms=$this->config->get("config_cms");
        $cms=explode("\n", $cms);
        $this->data["cms"] =$cms;
        $news=array() ;
        foreach  ( $cms   as $key=> $news_id ) {
            ////echo $key;
            $rows=  $this->model_tool_q ->q ( " select  * from op_news   as     a
            left join  op_news_description  as b  on a.news_id = b.news_id
            where  a.cat_id='$key'  and   b.language_id='$language_id'  order by    a.sort_order, a.news_id desc limit  0,15   ") ->rows;
            foreach  ( $rows as $keyrow=>$valrow ) {
                    $rows[$keyrow]["title"] =     $this->model_tool_str->utf8substr (  $rows[$keyrow]["title"]  , 16, 0) ;
                    $rows[$keyrow]["thumb"] =$this->model_tool_image->resize( $valrow['image'] , 53,53    ) ;
                    $rows[$keyrow]["description"]=  $this->model_tool_str->utf8substr( strip_tags(  html_entity_decode( $rows[$keyrow]["description"],ENT_QUOTES)  ) , 36, 0);
            }
            $news[$key] = $rows;
        }
        ////print_r($news);
        $this->data["news"] = $news;
        ///   CMS
        ///  首页老年旅游
        $Travel=  $this->model_tool_q ->q ( " select  * from op_news   as     a
            left join  op_news_description  as b  on a.news_id = b.news_id

            where  a.cat_id='4'  and   b.language_id='$language_id'  order by    a.sort_order, a.news_id desc limit  0,4   ") ->rows;
        foreach ($Travel as $key=>$val) {
                $Travel[$key]["thumb"]=$this->model_tool_image->resize($Travel[$key]["image"], 150,180);
                $Travel[$key]["title"] =      $this->model_tool_str->utf8substr ($Travel[$key]["title"] ,11 ,0 ) ;
                $Travel[$key]["href"]=  "?route=news/news&news_id=$val[news_id]"        ;
        }
        $this->data["Travel"]=$Travel;


        ////   搜索 条

        $this->data["config_homes_env"]= explode("\n", $this->config->get("config_homes_env") );
        $this->data["config_homes_nur"]= explode("\n", $this->config->get("config_homes_nur") ) ;
        $this->data["config_homes_pri"]= explode("\n", $this->config->get("config_homes_pri") );
        $this->load ->model("localisation/country") ;
        $this->load ->model("localisation/zone") ;
        $countrys= $this->model_localisation_country->getCountries();
        foreach  ($countrys as $key=>$val) {
            $countrys[$key]["zones"]= $this->model_localisation_zone->getZonesByCountryId($val["country_id"]);
        }
        $this->data["countrys"] = $countrys ;
        //// 搜索 条
        $this->data["config_home_bbs_1"] =  html_entity_decode(   $this->config->get('config_home_bbs_1')) ;
        $this->data["config_home_bbs_2"] = html_entity_decode( $this->config->get('config_home_bbs_2')  ) ;
        $this->data["config_home_homes"] = html_entity_decode( $this->config->get('config_home_homes')  ) ;


        $this->data['message'] = html_entity_decode($setting['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/homelayout.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/homelayout.tpl';
		} else {
			$this->template = 'default/template/module/homelayout.tpl';
		}
		
		$this->render();
	}
}
?>