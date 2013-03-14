<?php  
class ControllerModuleHomeszones extends Controller {
	protected function index() {


        $this->load ->model("localisation/country") ;
        $this->load ->model("localisation/zone") ;
        $countrys= $this->model_localisation_country->getCountries();
        foreach  ($countrys as $key=>$val) {
            $countrys[$key]["zones"]= $this->model_localisation_zone->getZonesByCountryId($val["country_id"]);
        }
        $this->data["countrys"] = $countrys ;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/homeszones.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/homeszones.tpl';
		} else {
			$this->template = 'default/template/module/homeszones.tpl';
		}
		
		$this->render();
	}
}
?>