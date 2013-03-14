<?php 
class Controllernewsnews extends Controller {
	public function index() {
        ////
        $mlang=      $this->language->get('lang');
        $this->data['mlang'] = $mlang ;
        ////
    	$this->language->load('news/news');
		
		$this->load->model('catalog/news');
		
		$this->document->breadcrumbs = array();
		
      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	);
		
		if (isset($this->request->get['news_id'])) {
			$news_id = $this->request->get['news_id'];
		} else {
			$news_id = 0;
		}
        $news_info = $this->model_catalog_news->getnews($news_id);

        /*
		$this->data['breadcrumbs'][] = array(
        		'href'      => $this->url->link('news/allnews'),
        		////  'text'      => $this->language->get('allnews'),
              'text'      => $news_info["cat_id"]==2 ? $mlang["Technology"] : $mlang["news"]  ,
        		'separator' => $this->language->get('text_separator')
      		);
		*/

   		
		if ($news_info) {
	  		$this->document->setTitle($news_info['title']); 

      		$this->data['breadcrumbs'][] = array(
        		'text'      => $news_info['title'],
				'href'      => $this->url->link('news/news', 'news_id=' .  $news_id),      		
        		'separator' => $this->language->get('text_separator')
      		);		
					
				
			//-----------------------------------------------------------------------------------------------------
			//image part
		    $this->load->model('tool/image');

			if ($news_info['image']) {
				$image = $news_info['image'];
			} else {
				$image = 'no_image.jpg';
			}
			//-----------------------------------------------------------------------------------------------------	
      		$this->data['heading_title'] = $news_info['title'];
      		
      		$this->data['button_continue'] = $this->language->get('button_continue');
			
			$this->data['post_date'] = html_entity_decode($news_info['post_date']);
			//---------------------------------------------------------------------------------------------------------------------------
			$this->data['popup'] = $this->model_tool_image->resize($image, $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			$this->data['thumb'] = $this->model_tool_image->resize($image, $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
            $this->data['image']=  $news_info['image'];

			//----------------------------------------------------------------------------------------------------------------------------------
			$this->data['description'] = html_entity_decode($news_info['description'], ENT_QUOTES, 'UTF-8');
      		
			$this->data['continue'] = $this->url->link('common/home');
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/news/news.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/news/news.tpl';
			} else {
				$this->template = 'default/template/news/news.tpl';
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
    	} else {
      		$this->data['breadcrumbs'][] = array(
			    'text'      => $this->language->get('text_error'),
        		'href'      => $this->url->link('news/news', 'news_id=' . $news_id),
        		'separator' => $this->language->get('text_separator')
      		);
				
	  		$this->document->setTitle($this->language->get('text_error'));
			
      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
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
	
	public function info() {
		$this->load->model('catalog/news');
		
		if (isset($this->request->get['news_id'])) {
			$news_id = $this->request->get['news_id'];
		} else {
			$news_id = 0;
		}      
		
		$news_info = $this->model_catalog_news->getnews($news_id);

		if ($news_info) {
			$output  = '<html dir="ltr" lang="en">' . "\n";
			$output .= '<head>' . "\n";
			$output .= '  <title>' . $news_info['title'] . '</title>' . "\n";
			$output .= '  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' . "\n";
			$output .= '</head>' . "\n";
			$output .= '<body>' . "\n";
			$output .= '  <br /><br /><h1>' . $news_info['title'] . '</h1>' . "\n";
			$output .= html_entity_decode($news_info['description'], ENT_QUOTES, 'UTF-8') . "\n";
			$output .= '  </body>' . "\n";
			$output .= '</html>' . "\n";			

			$this->response->setOutput($output);
		}
	}
}
?>