<?php  
class ControllerHomesHospitals   extends Controller {
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
        //// 老人院舍
        $where= "" ;
        if (  isset($_POST) ) {
                  $data=$_POST;

                  ///print_r($data);
                  if (      isset( $data["kw"]) &&      $data["kw"]       &&     trim($data["kw"])<>'关键字'    && $kw=trim($data["kw"])      ) {
                      $where.= "  and b.title  like '%$kw%' " ;
                  }
                      if (         isset($data["config_homes_env"])  &&   $data["config_homes_env"] > -1   ) {
                           $where.= "  and a.config_homes_env='$data[config_homes_env]' " ;
                      }
                    if (      isset($data["config_homes_nur"])  &&     $data["config_homes_nur"] > -1   ) {
                        $where.= "  and a.config_homes_nur='$data[config_homes_nur]' " ;
                    }
                    if (      isset($data["config_homes_pri"])  &&      $data["config_homes_pri"] > -1   ) {
                        $where.= "  and a.config_homes_pri='$data[config_homes_pri]' " ;
                    }
                    if (    isset($data["zone_id"] )  &&    $data["zone_id"]    ) {
                        $where.= "  and a.zone_id='$data[zone_id]' " ;
                    }
                    ////die($where);
        }
		if(	isset( $_GET ) ) {
			
			if (      isset( $_GET["kw"]) &&      $_GET["kw"]       &&     trim($_GET["kw"])<>'关键字'    && $kw=trim($_GET["kw"])      ) {
                      $where.= "  and b.title  like '%$kw%' " ;
                  }
		}
        $laorenhomes=array();
        $limit = $this->config->get('config_admin_limit');
        $page=isset($_GET["page"])?$_GET["page"]:1;
        $zone_id=isset($_GET["zone_id"])    &&  $_GET["zone_id"]    ?"  and   a.zone_id=".$_GET["zone_id"]:"  and   a.zone_id > ''  ";
        if ($zone_id) {
            $laorenhomes=$this->model_tool_q->q(" select  * from  op_news as a
                     left join  op_news_description  b   on  a.news_id=b.news_id
                     where  b.language_id ='$language_id'  $zone_id       $where       order by  a.news_id  desc limit ".($page-1)*$limit.",   $limit ") ->rows;
            foreach  ($laorenhomes      as $keyitem=> $item   ) {
                $laorenhomes[$keyitem]["title"]= $this->model_tool_str->utf8substr( $laorenhomes[$keyitem]["title"] , 10, 0);
                $laorenhomes[$keyitem]["description"]=  $this->model_tool_str->utf8substr( strip_tags(  html_entity_decode( $laorenhomes[$keyitem]["description"] ,ENT_QUOTES)  ) , 70, 0);
                $laorenhomes[$keyitem]["href"] ="?route=homes/hospital&news_id=$item[news_id]";
                $laorenhomes[$keyitem]["thumb"] = $this->model_tool_image -> resize( ($item["image"]?$item["image"]:"no_image.jpg")    , 150, 150) ;
            }
        }
        //   分页
        $pagination = new Pagination();
        $total=$this->model_tool_q->q(" select   count(*) as total  from  op_news as a
                     left join  op_news_description  b   on  a.news_id=b.news_id
                     where  b.language_id ='$language_id'  $zone_id   $where          ") ->row;
        ///print_r($total);
        $pagination->total = $total["total"];
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->text = $this->language->get('text_pagination');
        $zone_id=isset($_GET["zone_id"]) ? $_GET["zone_id"]:"";
        
        //$pagination->url = HTTPS_SERVER . "?route=homes/hospital&zone_id=$zone_id&token=". $this->session->data['token']  . '&page={page}';
        
            $pagination->url = HTTPS_SERVER . "?route=homes/hospital&zone_id=$zone_id&page={page}";
        $this->data['pagination'] = $pagination->render();

       //   分页
        ////print_r($laorenhomes);
        $this->data["laorenhomes"] =$laorenhomes;
        //// 老人院舍
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/homes/home.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/homes/home.tpl';
        } else {
            $this->template = 'default/template/homes/homes.tpl';
        }

		$this->data['heading_title'] = $this->config->get('config_title');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/homes/hospitals.tpl')) {
			    $this->template = $this->config->get('config_template') . '/template/homes/hospitals.tpl';
		} else {
			    $this->template = 'default/template/homes/hospitals.tpl';
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