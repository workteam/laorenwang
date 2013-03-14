<?php  
class ControllerHomesHospital   extends Controller {
	public function index() {
        $this->load -> model("tool/q");
        $this->load -> model("tool/str");
        $this->load -> model("tool/image");
        $language_id= $this->config->get("config_language_id");
        ///echo $language_id;
		$this->document->setTitle(       "老人院 - ".       $this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

        ///  广告条   begin
        $adsid=array(13,14,15,16);
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
        //print_r($ads);
        //// 广告条   end
        ///   地区
        $this->load ->model("localisation/country") ;
        $this->load ->model("localisation/zone") ;
        $countrys= $this->model_localisation_country->getCountries();
        foreach  ($countrys as $key=>$val) {
            $countrys[$key]["zones"]= $this->model_localisation_zone->getZonesByCountryId($val["country_id"]);
        }
        $this->data["countrys"] = $countrys ;
        ////print_r($countrys);
        /// 分类
        $catkey=isset($_GET["cat_id"])?$_GET["cat_id"]: 0;
        $cats= $this->model_tool_q->q(" select  * from  op_news_category where  parent_id='$catkey' order by  sort_order  asc ") ->rows;
        foreach ($cats    as  $key =>  $val   ) {
            $items=$this->model_tool_q->q(" select  * from  op_news as a
                 left join  op_news_description  b   on  a.news_id=b.news_id
                 where  a.category_id='$val[id]'     and b.language_id ='$language_id'   order by  a.news_id  desc limit 0,6 ") ->rows;
            foreach  ($items      as $keyitem=> $item   ) {
                $items[$keyitem]["title"]= $this->model_tool_str->utf8substr( $items[$keyitem]["title"] , 25, 0);
                $items[$keyitem]["description"]=  $this->model_tool_str->utf8substr( strip_tags(  html_entity_decode( $items[$keyitem]["description"] ,ENT_QUOTES)  ) , 70, 0);
                $items[$keyitem]["href"] = "?route=news/news&news_id=$item[news_id]";
            }
            $cats[$key]["items"] =$items;
        }
        $cats =$cats;
        ////print_r($cats);
        $this->data["cats"] = $cats;
        ///  最新文章
        $items_new=$this->model_tool_q->q(" select  * from  op_news as a
                 left join  op_news_description  b   on  a.news_id=b.news_id
                 where  b.language_id ='$language_id'   order by  a.news_id  desc limit 0,16 ") ->rows;
        foreach  ($items_new      as $keyitem=> $item   ) {
            $items_new[$keyitem]["title"]= $this->model_tool_str->utf8substr( $items_new[$keyitem]["title"] , 10, 0);
            $items_new[$keyitem]["description"]=  $this->model_tool_str->utf8substr( strip_tags(  html_entity_decode( $items_new[$keyitem]["description"] ,ENT_QUOTES)  ) , 70, 0);
            $items_new[$keyitem]["href"] ="?route=news/news&news_id=$item[news_id]";
        }
        $this->data["items_new"] =$items_new;

        ////// 院舍详情
        $news_id= isset($_GET["news_id"]) ? $_GET["news_id"] :"" ;
        $this->load->model('catalog/news');
        $news_info = $this->model_catalog_news->getnews($news_id);
        ////print_r($news_info) ;
        if ($news_info) {
                    $news_info["description"]=html_entity_decode($news_info["description"]) ;
                    $news_info["description_e"]=  $this->model_tool_str->utf8substr( strip_tags(  html_entity_decode( $news_info["description"] ,ENT_QUOTES)  ) , 120, 0);
                    $news_info["thumb"] = $this->model_tool_image->resize( $news_info["image"] , 250, 250 ) ;
                    $imgs=$this->model_tool_q->q (" select  * from  op_news_image where  product_id='$news_info[news_id]' "  ) ->rows ;
                    foreach  (        $imgs        as $imgkey=>$imgval   ) {
                                        $imgs[$imgkey]["thumb"] =$this->model_tool_image->resize($imgval["image"] , 180, 180) ;
                    }
                    $news_info["imgs"]=$imgs ;
                    ///print_r($imgs) ;

        }
        $this->data["news"] =$news_info;

        /////院舍详情
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/homes/home.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/homes/home.tpl';
        } else {
            $this->template = 'default/template/homes/homes.tpl';
        }

		$this->data['heading_title'] = $this->config->get('config_title');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/homes/hospital.tpl')) {
			    $this->template = $this->config->get('config_template') . '/template/homes/hospital.tpl';
		} else {
			    $this->template = 'default/template/homes/hospital.tpl';
		}


		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header',
            'module/homessearch',
            'module/homeszones',
		);
										
		$this->response->setOutput($this->render());
	}
}
?>