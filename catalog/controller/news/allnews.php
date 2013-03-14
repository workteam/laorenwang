<?php 
class Controllernewsallnews extends Controller {
	public function index() {

        $this->load->model('tool/q');
        ////
        $mlang=$this->language->get('lang');
        $this->data['mlang'] = $mlang ;
        ////
        $cat_id=isset($_GET['cat_id']) ? $_GET["cat_id"]:0;

    	$this->language->load('news/news');
		
		$this->load->model('catalog/news');
		$this->data['breadcrumbs'] = array();
		
      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	);
		$this->data['newss'] = array();
		if (isset($this->request->get['news_id'])) {
			$news_id = $this->request->get['news_id'];
		} else {
			$news_id = 0;
		}

        $cat_id=isset($_GET["cat_id"])?$_GET["cat_id"]:0;

        //// 左侧导航
        $config_cms=$this->config->get("config_cms");
        ///print_r($config_cms) ;
        $this->data["cats"] = explode("\n", $config_cms) ;
        //// 左侧导航

        if (     isset($this->data["cats"][$cat_id])       ) {
        $this->data['breadcrumbs'][] = array(
        		'href'      => $this->url->link("news/allnews&cat_id=$cat_id"),
        		///'text'      => $this->language->get('allnews'),
                 'text'      =>$this->data["cats"][$cat_id] ,

        		'separator' => $this->language->get('text_separator')
      		);
        }
		//$this->data['token'] = $this->session->data['token'];
		if(!isset($this->session->data['token'])) $this->session->data['token'] = '';
		//-----------------------------------------------------------------------------------------------
		//pagination part
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		$url = '';
			
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
        $this->data['newss'] = array();

		$data = array(
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		$news_total = $this->model_catalog_news->getTotalnewss();
       

		//------------------------------------------------------------------------------------------------
   		foreach ($this->model_catalog_news->getlist($data) as $news_info) {
		if ($news_info) {
	  		$this->document->setTitle(       (isset($this->data["cats"][$cat_id])?$this->data["cats"][$cat_id]: $this->language->get('allnews'))  .' | '.$this->config->get('config_name')    );

			//-----------------------------------------------------------------------------------------------------
			//image part
		    $this->load->model('tool/image');

			if ($news_info['image']) {
				$image = $news_info['image'];
			} else {
				$image = 'no_image.jpg';
			}
			//-----------------------------------------------------------------------------------------------------
            $this->data['newss'][] = array(
			    'description'    => strip_tags(substr(html_entity_decode($news_info['description']),0,700))."...", 
        		'title' => $news_info['title'],
                'image_popup' => $this->model_tool_image->resize($image,$this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
				'image_thumb' => $this->model_tool_image->resize($image, $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height')),
				'post_date' => html_entity_decode($news_info['post_date']),
	    		'href'  => $this->url->link('news/news', 'news_id=' . $news_info['news_id'])
      		);
        }}
	    $pagination = new Pagination();
		$pagination->total = $news_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = HTTPS_SERVER . "index.php?route=news/allnews&cat_id=$cat_id&token=". $this->session->data['token'] . $url . '&page={page}';
		$this->data['pagination'] = $pagination->render();
            ///  广告条   begin
            $adsid=array(16);
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
            ///print_r($ads);
            //// 广告条   end
            $this->data['button_continue'] = $this->language->get('button_continue');
            $this->data['continue'] = HTTP_SERVER . 'index.php?route=common/home';

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/news/allnews.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/news/allnews.tpl';
			} else {
				$this->template = 'default/template/news/allnews.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);	
			
	  		$this->response->setOutput($this->render());

    	}

}
?>