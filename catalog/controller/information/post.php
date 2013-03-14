<?php 
//// die('1');
class ControllerInformationPost    extends Controller {
	private $error = array(); 
	    
  	public function index() {
	
  		////die("99");
  		$this->load->model('catalog/information');
  		$this->load->model('catalog/category');
  		$this->load->model('catalog/product');
  		
  		$path=explode("_",   $_GET['path'] ) ; 
  		////print_r($path);
  		$patharr=array(); 
  		foreach (  $path  as  $key =>  $val )  {
  				   
  			   ////$patharr[]['href']=$val;
  			   
  			   $patharr[]=$this->model_catalog_information->getall(" select  category_id, name
  			   		from ".DB_PREFIX."category_description   where category_id='$val'   ");
  				 
  		}
  		$breadcrumbs="  <a href='./'> 首页  </a> >  " ;
  		////print_r( $patharr ); 
  		foreach  ($patharr  as  $key=>$val )  { 
  			       
  			         ///print_r($val);
  			      
  			       
  				     $href='';
  					 foreach  ($patharr  as  $keyb=>$valb ) { 
  					 	       if(  $keyb <= $key      ) { 
  					 	       			$href.=$valb[0]['category_id']."_"; 
  					 	       			///echo $href;
  					 	        }
  					 }
  					 if ( $key==0   && $patharr[0][0]['name']  ) { 
  					 	$breadcrumbs.="<a  href='?route=information/post&path=".$patharr[0][0]['category_id']."&category_id=".$patharr[0][0]['category_id']."&id=".$patharr[0][0]['category_id']."' > ".$patharr[0][0]['name']." </a> > ";
  					 }elseif($key==1  && $patharr[1][0]['name']  ){ 
  					 	  $breadcrumbshref=$patharr[0][0]['category_id']."_".$patharr[1][0]['category_id'];
  					 	  $breadcrumbs.="<a href='?route=information/post&path=$breadcrumbshref&category_id=$breadcrumbshref&id=".$patharr[1][0]['category_id']."'>".$patharr[1][0]['name']." </a> > ";
  					 }
  					 elseif($key==2  && $patharr[2][0]['name']  ){
  					 	$breadcrumbshref=$patharr[0][0]['category_id']."_".$patharr[1][0]['category_id']."_".$patharr[2][0]['category_id'];
  					 	$breadcrumbs.="<a href='?route=information/post&path=$breadcrumbshref&category_id=$breadcrumbshref&id=".$patharr[2][0]['category_id']."'>".$patharr[2][0]['name']." </a> > ";
  					 }
  					 ///echo $breadcrumbshref;
  					 ///$breadcrumbs.="<a href='$breadcrumbshref'>". $val[0]['name']."</a>"."   > "  ;
  					 
  			
  			        $patharr[$key]['href']=substr($href , 0, -1)  ;
  			        $patharr[$key]['count']=count($patharr ); 
  			       
  			 
  		}
  		
  		$breadcrumbs=preg_replace('/\>\s+$/','',$breadcrumbs) ;
  		
  		$this->data['breadcrumbs']=$breadcrumbs;
  		//echo $breadcrumbs;
  		///  导航
  		
  		
  		$this->data['patharr']=$patharr;
  		$this->data['path']=$_GET['path'];
  		$this->data['category_id']=$_GET['category_id'];
  		
  		$l_category=$this->model_catalog_information->getall(" select  a.category_id, b.name from 
                            ".DB_PREFIX."category  as a 
  				            left join  ".DB_PREFIX."category_description as b  on  a.category_id=b.category_id
  				            where   a.category_id='".$path[0]."'  order by  a.sort_order  asc
     	");
  		///$l_category[0]['href']="?route=information/post&path=".$l_category[0]['category_id'];
  		foreach (   $l_category  as  $key=>$val  ) { 
  			
  			//// 二级分类
  			$c=$this->model_catalog_information->getall(" select  a.category_id, b.name from 
                            ".DB_PREFIX."category  as a 
  				            left join  ".DB_PREFIX."category_description as b  on  a.category_id=b.category_id
  				            where   a.parent_id='".$val['category_id']."'  order by  a.sort_order asc
     	            ");
  			
  			$l_category[$key]['c']=$c;
  			
 
  			foreach ( $c as  $keyc=>$valc ) { 
  				 $l_category[$key]['c'][$keyc]['href']="".$l_category[0]['category_id']."_".$valc['category_id'];
  		    	
  			
  				  $cc=$this->model_catalog_information->getall(" select  a.category_id, b.name from 
                            ".DB_PREFIX."category  as a 
  				            left join  ".DB_PREFIX."category_description as b  on  a.category_id=b.category_id
  				            where   a.parent_id='".$valc['category_id']."'  order by  a.sort_order asc
     	         ");
  				  foreach  ( $cc  as $keycc => $valcc  ) { 
  				  	  $cc[$keycc]['href']= "".$l_category[0]['category_id']."_".$valc['category_id']."_".$valcc['category_id'];
					  $cc[$keycc]['category_id']=$valcc['category_id']; 
  				  }
  				  
  	
  				 $l_category[$key]['c'][$keyc]['c']=$cc;
  				 
  			}
  			
  		}
  		$this->data['l_category']=$l_category;
  		//// 取文章开始 
  		///echo $_GET['id'];
  		$limit= "  limit  0 ,20   "  ;
  		$posts=$this->model_catalog_information->getall(" 
  						select  b.name, b.description, b.meta_description , b.meta_keyword  from   ".DB_PREFIX."product_to_category  as a 
  				       left join  ".DB_PREFIX."product_description   as b  on a.product_id=b.product_id
  				 where 1  and category_id='".$_GET['id']."'
  		"); 
  		///// html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8'); 
  		foreach  (  $posts as $key=>$val ) { 
  			 $posts[$key]['description']=html_entity_decode($val['description'], ENT_QUOTES, 'UTF-8'); 
  			 $posts[$key]['meta_description']=html_entity_decode($val['meta_description'], ENT_QUOTES, 'UTF-8');
  			 $posts[$key]['meta_keyword']=html_entity_decode($val['meta_keyword'], ENT_QUOTES, 'UTF-8');
  			
  		}
  		$this->data['posts']=$posts; 
  		///print_r($posts); 
  		//// 取文章结束
  		
  		////print_r(  $l_category );
  	    /////print_r($patharr); 
  		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/post.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/information/post.tpl';
		} else {
			$this->template = 'default/template/information/post.tpl';
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
