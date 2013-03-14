<?php  
class ControllerModuleSlideshow extends Controller {
	protected function index($setting) {
		static $module = 0;
		
		$this->load->model('design/banner');
		$this->load->model('tool/image');
        $language_id=$this->config ->get("config_language_id");
		
		$this->document->addScript('catalog/view/javascript/jquery/nivo-slider/jquery.nivo.slider.pack.js');
		
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/slideshow.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/slideshow.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/slideshow.css');
		}
		
		$this->data['width'] = $setting['width'];
		$this->data['height'] = $setting['height'];
		
		$this->data['banners'] = array();
        ///  广告条   begin
        $adsid=array( 7, 12);
        $ads=array();
        ///echo        $language_id;
        foreach  ( $adsid as $val ) {
            $imgs=$this->model_tool_q->q(" select  a.*, b.*  from op_banner_image as a
             left join  op_banner_image_description as  b   on  b.banner_id=a.banner_id
             where  a.banner_id='$val' and  b.language_id='$language_id'  group by a.banner_image_id   ") ->rows;
            /*
            foreach  (  $imgs as $imgkey=>$imgval  ) {
                       $imgs[$imgkey]['image']=$this->model_tool_image->resize($imgval["image"],975,110) ;
            }
            */
            ////print_r($imgs);
            $ads[$val]=$imgs;
        }
        $this->data["ads"] =$ads;
        // print_r($ads);
        //// 广告条   end
		
		if (isset($setting['banner_id'])) {
			$results = $this->model_design_banner->getBanner($setting['banner_id']);
			  
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['banners'][] = array(
						'title' => $result['title'],
						'link'  => $result['link'],
						'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
					);
				}
			}
		}
		
		$this->data['module'] = $module++;
						
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/slideshow.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/slideshow.tpl';
		} else {
			$this->template = 'default/template/module/slideshow.tpl';
		}
		
		$this->render();
	}
}
?>