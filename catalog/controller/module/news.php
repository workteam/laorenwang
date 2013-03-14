<?php  
class ControllerModulenews extends Controller {
	protected function index() {
		$this->language->load('module/news');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
    	
		$this->data['text_contact'] = $this->language->get('text_contact');
    	$this->data['text_sitemap'] = $this->language->get('text_sitemap');
		
		$this->load->model('catalog/news');
		
		$this->data['newss'] = array();
		//news part
		//$results = $this->model_catalog_product->getfeaturedProducts($this->config->get('news_limit'));

		foreach ($this->model_catalog_news->getnewss($this->config->get('news_limit')) as $result) {
      		$this->data['newss'][] = array(
			    'description'    => strip_tags(substr(html_entity_decode($result['description']),0,40))."...", 
        		'title' => $result['title'],
				'href'  => $this->url->link('news/news', 'news_id=' . $result['news_id'])
      		);
    	}

		$this->data['contact'] = HTTP_SERVER . 'index.php?route=news/contact';
    	$this->data['sitemap'] = HTTP_SERVER . 'index.php?route=news/sitemap';
		
		$this->id = 'news';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/news.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/news.tpl';
		} else {
			$this->template = 'default/template/module/news.tpl';
		}
		
		$this->render();
	}
}
?>