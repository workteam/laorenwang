<?php
class ControllerCatalognews extends Controller { 
	private $error = array();

	public function index() {
		$this->load->language('catalog/news');
        $this->load->model("tool/q");
        $this->load->model("tool/image");
        $language_id = $this->config->get("config_language_id");

		///$this->document->setTitle($this->language->get('heading_title'));
        $this->document->setTitle($this->title());

		$this->load->model('catalog/news');
        $cat_id=isset($_GET['cat_id']) ? $_GET['cat_id'] :"0";
        if (  isset($_POST['name'])  && $data=$_POST ) {
                $sort_order=(int)$data['sort_order'];
                if ($data["id"] ) {
                        $this->model_tool_q->q("update  op_news_category set name='$data[name]' , sort_order='$sort_order' , language_id ='$language_id',
                           parent_id='$cat_id'       where  id='$data[id]'
                    ");
                } else{
                     $this->model_tool_q->q("insert into  op_news_category set name='$data[name]' , sort_order='$sort_order' , language_id ='$language_id',
                           parent_id='$cat_id'
                    ");
                 }
                 exit("1");
        }  elseif(    isset($_GET["catsdata"])   ) {
                  $rows=  $this->model_tool_q->q( " select  * from op_news_category where language_id ='$language_id' and  parent_id='$cat_id'   order by sort_order asc    ") ->rows;
                  exit(json_encode($rows)) ;
        }     elseif(     isset($_GET["del"])   ){
                 $this->model_tool_q->q(" delete from op_news_category where id='".$_GET["del"]."' ");
        }
		$this->getList();
	}

	public function insert() {
		$this->load->language('catalog/news');

		///$this->document->setTitle($this->language->get('heading_title'));
        $this->document->setTitle($this->title());
		
		$this->load->model('catalog/news');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_news->addnews($this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
            $cat_id=isset($_GET["cat_id"])?$_GET["cat_id"]:0;
			
			$this->redirect($this->url->link("catalog/news&cat_id=$cat_id", 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->load->language('catalog/news');
        $this->load->model('tool/q');
        $this->load->model('tool/image');

        $images=  $this->model_tool_q ->q(" select * from  op_news_image where  product_id='".$this->request->get['news_id']."'") ->rows;
        foreach  ( $images     as  $imgkey => $imgval    ) {
            $images[$imgkey]["thumb"]    = $this-> model_tool_image ->resize($imgval["image"], 100, 100  ) ;
        }
        $this->data["product_images"] = $images;
		///$this->document->setTitle($this->language->get('heading_title'));
        $this->document->setTitle($this->title());
		
		$this->load->model('catalog/news');


        $cat_id=isset($_GET["cat_id"])?$_GET["cat_id"]:0;
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_news->editnews($this->request->get['news_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->redirect($this->url->link("catalog/news&cat_id=$cat_id", 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}
 
	public function delete() {
		$this->load->language('catalog/news');

        $cat_id=isset($_GET["cat_id"])?$_GET["cat_id"]:0;

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/news');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $news_id) {
				$this->model_catalog_news->deletenews($news_id);
			}
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->redirect($this->url->link("catalog/news&cat_id=$cat_id", 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

    private  function  title() {
        ///   取标题

        $title= explode("\n",$this->config->get("config_cms") ) ;
        $title["-1"]="老人院舍";
        $title["-2"]="公益活动";
        ////print_r($title);
        $cat_id=isset($_GET["cat_id"]) ?$_GET["cat_id"]:0;
        return    isset( $title[$cat_id])?  $title[$cat_id] :""      ;
    }
	private function getList() {
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'id.title';
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		$url = '';
			
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
		    'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('catalog/news',   "cat_id=$_GET[cat_id]&token=" . $this->session->data['token'] . $url, 'SSL'),
       		'text'      => $this->title() ,
      		'separator' => ' :: '
   		);
							
		$this->data['insert'] = $this->url->link('catalog/news/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('catalog/news/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');	

		$this->data['newss'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		
		$news_total = $this->model_catalog_news->getTotalnewss();
	
		$results = $this->model_catalog_news->getnewss($data);
 
    	foreach ($results as $result) {
			$action = array();
						
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/news/update', 'token=' . $this->session->data['token'] . '&news_id=' . $result['news_id'] . $url, 'SSL')
			);
						
			$this->data['newss'][] = array(
				'news_id' => $result['news_id'],
				'title'      => $result['title'],
                'cat_name'      => $result['cat_name'],
				'sort_order' => $result['sort_order'],
				'selected'   => isset($this->request->post['selected']) && in_array($result['news_id'], $this->request->post['selected']),
				'action'     => $action
			);
		}	
	
		/////$this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['heading_title'] =$this-> title()    ;

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_title'] = $this->language->get('column_title');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_action'] = $this->language->get('column_action');		
		
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
 
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$this->data['sort_title'] = $this->url->link('catalog/news', 'token=' . $this->session->data['token'] . '&sort=id.title' . $url, 'SSL');
		$this->data['sort_sort_order'] = $this->url->link('catalog/news', 'token=' . $this->session->data['token'] . '&sort=i.sort_order' . $url, 'SSL');
		//--------------------------------------------------------------------------------------------------------------------------------------------------
			//news image part
			if (isset($this->request->get['news_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$newss_info = $this->model_catalog_news->getnewsss();
    	}
		//--------------------------------------------------------------------------------------------------------------------------------------------------
        $cat_id=isset($_GET["cat_id"]) ?$_GET["cat_id"] : 0;
		$url = "&cat_id=$cat_id";

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $news_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
        ///$pagination->limit = 2;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/news', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
			
		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;
		
		$this->template = 'catalog/news_list.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render());
	}

	private function getForm() {
        $language_id =$this->config->get("config_language_id");
        $this->load->model("tool/q");
        $this->load->model("tool/image");

        $cat_id=isset($_GET["cat_id"]) ?$_GET["cat_id"]:0;
        ///  取国家
        $this->load->model("localisation/country");
        $this->load->model("localisation/zone");
        if ($cat_id ==-1) {
                ///   老人院舍
                $this->data["config_homes_env"]= explode("\n", $this->config->get("config_homes_env") );
                $this->data["config_homes_nur"]= explode("\n", $this->config->get("config_homes_nur") ) ;
                $this->data["config_homes_pri"]= explode("\n", $this->config->get("config_homes_pri") );
               ///  老人院舍
                $countrys= $this-> model_localisation_country ->getCountries( array("start"=>0 ,'limit'=>1000) );
                ////print_r($countrys) ;
                $this->data["countrys"]    =$countrys;

        }
        if (   isset($_GET['country_id'])   ) {
                    ////die($_GET['country_id']);
                    $zones=  $this-> model_localisation_zone ->getZones( array('country_id'=>$_GET['country_id']  ) );
                    exit(  json_encode($zones) ) ;
        }

        /////
        $rows=  $this->model_tool_q->q( " select  * from op_news_category where language_id ='$language_id' and  parent_id='$cat_id'   order by sort_order asc    ") ->rows;
        $this->data["cats"]  =$rows;

        $this->data['heading_title'] = $this->title()    ;

		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
    	$this->data['text_disabled'] = $this->language->get('text_disabled');
		
		$this->data['entry_title'] = $this->language->get('entry_title');
		//post date
		$this->data['entry_post_date'] = $this->language->get('entry_post_date');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_keyword'] = $this->language->get('entry_keyword');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_status'] = $this->language->get('entry_status');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['token'] = $this->session->data['token'];

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

 		if (isset($this->error['title'])) {
			$this->data['error_title'] = $this->error['title'];
		} else {
			$this->data['error_title'] = '';
		}
	//---------------------------------------------------------------------------------------
		//post date
		if (isset($this->request->post['post_date'])) {
       		$this->data['post_date'] = $this->request->post['post_date'];
		} else {
			$this->data['post_date'] = ' ';
		}
			
		if (isset($this->error['post_date'])) {
			$this->data['error_post_date'] = $this->error['post_date'];
		} else {
			$this->data['error_post_date'] = '';
		}		
	//---------------------------------------------------------------------------------------
	    //image part
		if (isset($this->request->post['image'])) {
			$this->data['image'] = $this->request->post['image'];
		} elseif (isset($newss_info)) {
			$this->data['image'] = $newss_info['image'];
		} else {
			$this->data['image'] = '';
		}
		
		$this->load->model('tool/image');
		
		if (isset($newss_info) && $newss_info['image'] && file_exists(DIR_IMAGE . $newss_info['image'])) {
			$this->data['preview'] = $this->model_tool_image->resize($newss_info['image'], 100, 100);
		} else {
			$this->data['preview'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
	//---------------------------------------------------------------------------------------
	 	if (isset($this->error['description'])) {
			$this->data['error_description'] = $this->error['description'];
		} else {
			$this->data['error_description'] = '';
		}
		
		$url = '';
			
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
  		$this->data['breadcrumbs'] = array();
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),     		
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      =>  $this->title() ,
			'href'      => $this->url->link('catalog/news', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
							
		if (!isset($this->request->get['news_id'])) {
		    $this->data['action'] = $this->url->link('catalog/news/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/news/update', 'token=' . $this->session->data['token'] . '&news_id=' . $this->request->get['news_id'] . $url, 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('catalog/news', 'token=' . $this->session->data['token'] . $url, 'SSL');

        $this->data["image"]="no_image.jpg";
        $thumb = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		if (isset($this->request->get['news_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$news_info = $this->model_catalog_news->getnews($this->request->get['news_id']);
            ////////print_r($news_info);
            $this->data["category_id"]=    $news_info["category_id"];
            $this->data["zone_id"]=    $news_info["zone_id"];
            $this->data["country_id"]=    $news_info["country_id"];
            $this->data["post_date"]=    $news_info["post_date"];
            $this->data["news_info"] =$news_info;

            if ($news_info['image'] && file_exists(DIR_IMAGE . $news_info['image'])) {
                $thumb= $this->model_tool_image->resize($news_info['image'], 100, 100);
            }

            $this->data["image"] =  $news_info['image'] ;
		}
        $this->data["thumb"] = $thumb;

        $this->data["text_browse"]   = " 选择图像 " ;
        $this->data["text_clear"]  =" 清除图像  " ;
        $this->data["button_remove"] = "移除 " ;
        $this->data["button_add_image"] ="增加图像" ;
        $this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);

		$this->load->model('localisation/language');

		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['news_description'])) {
			$this->data['news_description'] = $this->request->post['news_description'];
		} elseif (isset($this->request->get['news_id'])) {
			$this->data['news_description'] = $this->model_catalog_news->getnewsDescriptions($this->request->get['news_id']);
		} else {
			$this->data['news_description'] = array();
		}

		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (isset($news_info)) {
			$this->data['status'] = $news_info['status'];
		} else {
			$this->data['status'] = 1;
		}
		
		$this->load->model('setting/store');
		
		$this->data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['news_store'])) {
			$this->data['news_store'] = $this->request->post['news_store'];
		} elseif (isset($news_info)) {
			$this->data['news_store'] = $this->model_catalog_news->getnewsStores($this->request->get['news_id']);
		} else {
			$this->data['news_store'] = array(0);
		}		
		
		if (isset($this->request->post['keyword'])) {
			$this->data['keyword'] = $this->request->post['keyword'];
		} elseif (isset($news_info)) {
			$this->data['keyword'] = $news_info['keyword'];
		} else {
			$this->data['keyword'] = '';
		}
		
		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (isset($news_info)) {
			$this->data['sort_order'] = $news_info['sort_order'];
		} else {
			$this->data['sort_order'] = '';
		}
		
		$this->template = 'catalog/news_form.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render());
	}

	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/news')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['news_description'] as $language_id => $value) {
			if ((strlen(utf8_decode($value['title'])) < 1 ) || (strlen(utf8_decode($value['title'])) > 50)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}
		
			if (strlen(utf8_decode($value['description'])) < 1  ) {
				$this->error['description'][$language_id] = $this->language->get('error_description');
			}
		}

		if (!$this->error) {
			return TRUE;
		} else {
			if (!isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_required_data');
			}
			return FALSE;
		}
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/news')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		$this->load->model('setting/store');
		
		foreach ($this->request->post['selected'] as $news_id) {
			if ($this->config->get('config_account_id') == $news_id) {
				$this->error['warning'] = $this->language->get('error_account');
			}
			
			if ($this->config->get('config_checkout_id') == $news_id) {
				$this->error['warning'] = $this->language->get('error_checkout');
			}
			
			//$store_total = $this->model_setting_store->getTotalStoresBynewsId($news_id);

			if ($store_total) {
				$this->error['warning'] = sprintf($this->language->get('error_store'), $store_total);
			}
		}

		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}
}
?>