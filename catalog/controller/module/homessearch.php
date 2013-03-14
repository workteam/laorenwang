<?php  
class ControllerModuleHomessearch extends Controller {
	protected function index() {


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

		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/homessearch.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/homessearch.tpl';
		} else {
			$this->template = 'default/template/module/homessearch.tpl';
		}
		
		$this->render();
	}
}
?>