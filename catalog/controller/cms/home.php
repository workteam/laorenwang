<?php  
class ControllerCmshome extends Controller {
	public function index() {
        $this->load -> model("tool/q");
        $this->load -> model("tool/str");
        $this->load -> model("tool/image");

        $language_id= $this->config->get("config_language_id");
        ///echo $language_id;
        $cms=$this->config->get("config_cms");
        $cms=explode("\n", $cms);
        $this->data["cms"] =$cms;
        $catkey=isset($_GET["cat_id"])?$_GET["cat_id"]: 0;

		$this->document->setTitle(    (isset($cms[$catkey])?$cms[$catkey] ." - " :"").        $this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');

        ///  广告条   begin
        $adsid=array(13,14,15,16,17, 18, 19, 20);
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

        $cats= $this->model_tool_q->q(" select  * from  op_news_category where  parent_id='$catkey' order by  sort_order  asc ") ->rows;
        foreach ($cats    as  $key =>  $val   ) {
                $items=$this->model_tool_q->q(" select  * from  op_news as a
                 left join  op_news_description  b   on  a.news_id=b.news_id
                 where  a.category_id='$val[id]'     and b.language_id ='$language_id'   order by  a.news_id  desc limit 0,6 ") ->rows;
                foreach  ($items      as $keyitem=> $item   ) {
                    $items[$keyitem]["title"]= $this->model_tool_str->utf8substr( $items[$keyitem]["title"] , 25, 0);
                    $items[$keyitem]["description"]=  $this->model_tool_str->utf8substr( strip_tags(  html_entity_decode( $items[$keyitem]["description"] ,ENT_QUOTES)  ) , 55, 0);
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
            $items_new[$keyitem]["description"]=  $this->model_tool_str->utf8substr( strip_tags(  html_entity_decode( $items_new[$keyitem]["description"] ,ENT_QUOTES)  ) , 50, 0);
            $items_new[$keyitem]["href"] ="?route=news/news&news_id=$item[news_id]";
            $items_new[$keyitem]["thumb"] = $this->model_tool_image->resize( $item['image'],150, 150 ) ;
        }
        $this->data["items_new"] =$items_new;
        //// 幻灯片
        $slinews=$this->model_tool_q->q(" select  * from  op_news as a
                 left join  op_news_description  b   on  a.news_id=b.news_id
                 where  b.language_id ='$language_id'  and a.image<>'' and a.image<>'no_image.jpg' and  a.cat_id='$catkey'  order by  a.news_id  desc limit 0,6 ") ->rows;
        foreach  ($slinews      as $keyitem=> $item   ) {
            $slinews[$keyitem]["title"]= $this->model_tool_str->utf8substr( $slinews[$keyitem]["title"] , 10, 0);
            $slinews[$keyitem]["description"]=  $this->model_tool_str->utf8substr( strip_tags(  html_entity_decode( $slinews[$keyitem]["description"] ,ENT_QUOTES)  ) , 70, 0);
            $slinews[$keyitem]["href"] ="?route=news/news&news_id=$item[news_id]";
            $slinews[$keyitem]["thumb"] = $this->model_tool_image->resize( $item['image'],300, 200 ) ;
        }
        ////print_r($slinews);
        $this->data["slinews"]=$slinews;
        //// 幻灯片
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/cms/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/cms/home.tpl';
		} else {
			$this->template = 'default/template/cms/homes.tpl';
		}


		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header' ,
             'module/homessearch',
            'module/homeszones',
		);
										
		$this->response->setOutput($this->render());
	}
}
?>