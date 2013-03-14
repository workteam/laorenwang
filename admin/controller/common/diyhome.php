<?php   

class ControllerCommonDiyhome extends Controller {
	public function index() {
        $data=$_POST;
        $this->load->model("common/diyhome");
        $this->load->model("catalog/category");
        $this->data['getCategories']=$this->model_catalog_category->getCategories();
        $this->data['listfloor']=isset($_GET['listfloor'])?$_GET['listfloor']:'';
        if($this->data['listfloor']) {
                if(  !empty($data)   && isset($data['category_id']) && !empty($data['category_id'])  ) {
                      $files=$_FILES['img'];
                      ////print_r($files);
                      $floordata=array();

                      ////print_r($data);
                      /////die();
                      foreach  ( $data['category_id'] as  $key => $val  )  {

                                       $floordata[$key]["category_id"]=$val;
                                       ///$floordata[$key]["description"] =$this->db->escape($data["description"][$key]) ;
                                       /*
                                       $fo=fopen("../image/$key.html" , 'w+' );
                                       fwrite($fo, $this->db->escape($data["description"][$key]));
                                       fclose($fo);
                                       */

                                       if (    isset(   $files['tmp_name'][$key] ) && !empty($files['tmp_name'][$key])           ) {
                                                  $imgtype= strtolower(   end(  explode('.',$files['name'][$key]) )  ) ;
                                                  ////echo  $imgtype;
                                                  if(  $imgtype=='jpg'  ||    $imgtype=='png'  || $imgtype=='gif'   ) {
                                                            $saveimg="image/$key.$imgtype";
                                                            move_uploaded_file( $files['tmp_name'][$key] , "../$saveimg");
                                                            $floordata[$key]['img']=$saveimg;
                                                  }
                                       }

                                       $description.=$data['description'][$key]."<!--L-->";
                                       $floordata[$key]['img']=isset($floordata[$key]['img'])?$floordata[$key]['img']:$data["oimg"][$key];



                      }
                    ////print_r($floordata) ;
                    ////die();
                    $initdata=serialize($floordata);

                    $this->model_common_diyhome->query(" update ".DB_PREFIX."diyhome set
                 `value`='$initdata'  ,  description='".$description."'  where `key`='floorData' ");
                    ////  print_r($floordata);
                    ///  楼层结束
                  }
        }
        ////print_r($this->data['getCategories']);
		if (   $v=(int)$_POST['v']    )  {
                  ////echo $v;
                  $this->model_common_diyhome->setfloor($v);
        }elseif(  isset($data['Discount'])  ) {
                 $initdata=$this->db->escape($data['Discount']);
                 $this->model_common_diyhome->query(" update ".DB_PREFIX."diyhome set
                 `value`='$initdata'  where `key`='Discount' ");
        }elseif(  isset($data['hotBrand'])  ) {
            $initdata=$this->db->escape($data['hotBrand']);
            $this->model_common_diyhome->query(" update ".DB_PREFIX."diyhome set
                 `value`='$initdata'  where `key`='hotBrand' ");
        }elseif(  isset($data['hotEffect'])  ) {
            $initdata=$this->db->escape($data['hotEffect']);
            $this->model_common_diyhome->query(" update ".DB_PREFIX."diyhome set
                 `value`='$initdata'  where `key`='hotEffect' ");
        }elseif(  isset($data['hotSell'])  ) {
            $initdata=$this->db->escape($data['hotSell']);
            $this->model_common_diyhome->query(" update ".DB_PREFIX."diyhome set
                 `value`='$initdata'  where `key`='hotSell' ");
        }elseif(  isset($data['footer'])  ) {
            $initdata=$this->db->escape($data['footer']);
            $this->model_common_diyhome->query(" update ".DB_PREFIX."diyhome set
                 `value`='$initdata'  where `key`='footer' ");
        }elseif(  isset($data['indexright'])  ) {
            $initdata=$this->db->escape($data['indexright']);
            $this->model_common_diyhome->query(" update ".DB_PREFIX."diyhome set
                 `value`='$initdata'  where `key`='indexright' ");
        }

        elseif(  isset($data['indexfooter'])  ) {
        	$initdata=$this->db->escape($data['indexfooter']);
        	$this->model_common_diyhome->query(" update ".DB_PREFIX."diyhome set
        			`value`='$initdata'  where `key`='indexfooter' ");
        }
        elseif(  isset($data['Arearight'])  ) {
        	$initdata=$this->db->escape($data['Arearight']);
        	$this->model_common_diyhome->query(" update ".DB_PREFIX."diyhome set
        			`value`='$initdata'  where `key`='Arearight' ");
        }
		elseif(  isset($data['allcategory'])  ) {
        	$initdata=$this->db->escape($data['allcategory']);
        	$this->model_common_diyhome->query(" update ".DB_PREFIX."diyhome set
        			`value`='$initdata'  where `key`='allcategory' ");
        }elseif(  isset($data['hotcategory'])  ) {
        	
        	////die("1001");
        	
        	$initdata=$this->db->escape($data['hotcategory']);
        	$this->model_common_diyhome->query(" update ".DB_PREFIX."diyhome set
        			`value`='$initdata'  where `key`='hotcategory' ");
        }elseif (   isset($_GET['icos'])  )  { 
        		
        	       $f=$_FILES; 
        	       /////print_r($f);
        	       $img='';
        	       $str='';
        	        $link='';
        	       foreach  (  $f[img][name] as  $key=>$val ) { 
        	        	           $f_type=strtolower(end(explode(".", $val))); 
        	        	           if(
        	        	           		($f_type =='jpg'  ||  $f_type =='png' || $f_type =='gif') &&
        	        	           		    move_uploaded_file($f[img][tmp_name][$key], '../images/'.($key+1).".jpg" )
        	        	           		
        	        	           		) { 
        	        	           	       
        	        	             	  $img.=($key+1).".jpg|";
        	        	             	  
        	        	             }
        	        	            else{ 
        	        	            	$img.="|";
        	        	            }
        	        	            
        	        	           $str.=$_POST[text][$key]."|" ;
        	        	           $link.=$_POST[link][$key]."|" ;
        	        }
        	        
        	        $initdata=$this->db->escape($img.",".$str.",".$link);
        	        
        	        $this->model_common_diyhome->query(" update ".DB_PREFIX."diyhome set
        	        		`value`='$initdata'  where `key`='hotcategory' ");
        	       // echo  $img.",".$str; 
        	       //die();
        }
        
        $this->data['floor']=$this->model_common_diyhome->getfloor();
        $getdata=$this->model_common_diyhome->getdata();
        foreach ( $getdata as  $key=>$val )  {
                if($val['key']=='floorData') {
                    $getdata['floorData']['value']=unserialize($val[value]);
                    $getdata['floorData']['description']=explode("<!--L-->", $val['description']);
                    $e_description=explode("<!--L-->", $val['description']);
                    foreach (  $e_description    as  $descriptionkey=>$descriptionval  ) {
                         $getdata['floorData']['description'][$descriptionkey]=html_entity_decode($descriptionval,  ENT_QUOTES, 'UTF-8' );
                    }
                    ////print_r($getdata['floorData']['description']);
                }
              else{
                    $getdata[$val['key']]=html_entity_decode($val['value'],  ENT_QUOTES, 'UTF-8' );
                }
              unset($getdata[$key]) ;

        }

        ////print_r($getdata['floorData']);
        if(  isset($getdata[hotcategory])  ) { 
         	
         	    $gethotcategory=explode("," , $getdata[hotcategory] ); 
         	    foreach  (   $gethotcategory  as  $key=> $val  ) { 
         	    	
         	    	$gethotcategory[$key]=explode("|", $val);
         	    }
         	    ////print_r( $gethotcategory ) ; 
         	    $this->data[gethotcategory]=$gethotcategory; 
         }

        $this->data['getdata']=$getdata;
        ////print_r($getdata);

        $this->data['token']=$this->session->data['token'];

		$this->template = 'common/diyhome.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
  	}
	

}
?>