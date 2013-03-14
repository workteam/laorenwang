<?php
class ModelCatalognews extends Model {
	public function addnews($data) {

        $cat_id=isset($_GET['cat_id'])?$_GET["cat_id"]:'';
        $category_id=isset($_POST['category_id'])  ? $_POST['category_id'] :"";

        ////  地区
        $zone_id="";
        if (  isset($data['zone_id']) ) {
                 $zone_id= " , zone_id='".$data['zone_id']."' " ;
        }
        $country_id="";
        if (  isset($data['country_id']) ) {
            $country_id= " , country_id='".$data['country_id']."' " ;
        }
        //老人院 设置
        if (  isset($data['config_homes_env']) ) {
            $config_homes_env= " , config_homes_env='".$data['config_homes_env']."' " ;
        }else{
               $config_homes_env="";
        }
        if (  isset($data['config_homes_nur']) ) {
            $config_homes_nur= " , config_homes_nur='".$data['config_homes_nur']."' " ;
        }else{
            $config_homes_nur="";
        }
        if (  isset($data['config_homes_pri']) ) {
            $config_homes_pri= " , config_homes_pri='".$data['config_homes_pri']."' " ;
        }else{
            $config_homes_pri="";
        }
        //老人院 设置
        ////  地区
        $image= $this->getimage( $data['image'])  ;
        ////print_r($data);
        ////die();
		$this->db->query("INSERT INTO " . DB_PREFIX . "news SET cat_id='$cat_id',  sort_order = '" . (int)$this->request->post['sort_order'] . "', status = '" . (int)$data['status'] . "'   , post_date='$data[post_date]'   , image='$image'        ,category_id='$category_id'    $zone_id   $country_id
                $config_homes_env   $config_homes_nur   $config_homes_pri

		  ");

		$news_id = $this->db->getLastId();
        //// 关联图片
        /////$news_id = $this->db->getLastId();
        if (  !empty($data["product_image"]) ) {
            $this->db->query("  delete from   op_news_image where product_id='$news_id' ") ;
            foreach  ($data["product_image"]   as  $imgkey =>  $img ) {
                $this->db->query(" insert into  op_news_image set  product_id='$news_id' , image='".$this->getimage($img["image"])."' ,sort_order='$imgkey' ");
            }
            ////print_r($data);
            ////die();
        }
        //// 关联图片
			
		foreach ($data['news_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_description SET news_id = '" . (int)$news_id . "', language_id = '" . (int)$language_id . "', post_date = '" . $this->db->escape($data['post_date']) . "', image = '" . $this->db->escape($data['image']) . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		if (isset($data['news_store'])) {
			foreach ($data['news_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_to_store SET news_id = '" . (int)$news_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_id=" . (int)$news_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->cache->delete('news');
	}
	
	public function editnews($news_id, $data) {
        ////  地区
        $zone_id="";
        if (  isset($data['zone_id']) ) {
            $zone_id= " , zone_id='".$data['zone_id']."' " ;
        }
        $country_id="";
        if (  isset($data['country_id']) ) {
            $country_id= " , country_id='".$data['country_id']."' " ;
        }
        ////  地区
        //老人院 设置
        if (  isset($data['config_homes_env']) ) {
            $config_homes_env= " , config_homes_env='".$data['config_homes_env']."' " ;
        }else{
            $config_homes_env="";
        }
        if (  isset($data['config_homes_nur']) ) {
            $config_homes_nur= " , config_homes_nur='".$data['config_homes_nur']."' " ;
        }else{
            $config_homes_nur="";
        }
        if (  isset($data['config_homes_pri']) ) {
            $config_homes_pri= " , config_homes_pri='".$data['config_homes_pri']."' " ;
        }else{
            $config_homes_pri="";
        }
        //老人院 设置
        $category_id=isset($_POST['category_id'])  ? $_POST['category_id'] :"";
        //////
        $image= $this->getimage( $data['image'])  ;
        ////
        ///die($image);

		$this->db->query("UPDATE " . DB_PREFIX . "news SET sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "'
       ,category_id='$category_id'     $zone_id     $country_id         , post_date='$data[post_date]'   , image='$image'
        $config_homes_env   $config_homes_nur   $config_homes_pri

		WHERE news_id = '" . (int)$news_id . "'");

        //// 关联图片
        /////$news_id = $this->db->getLastId();
        if (  !empty($data["product_image"]) ) {
             $this->db->query("  delete from   op_news_image where product_id='$news_id' ") ;
            foreach  ($data["product_image"]   as  $imgkey =>  $img ) {
                   $this->db->query(" insert into  op_news_image set  product_id='$news_id' , image='".$this->getimage($img["image"])."' ,sort_order='$imgkey' ");
            }
            ////print_r($data);
            ////die();
        }
        //// 关联图片

		$this->db->query("DELETE FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'");
					
		foreach ($data['news_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_description SET news_id = '" . (int)$news_id . "', language_id = '" . (int)$language_id . "', post_date = '" . $this->db->escape($data['post_date']) . "', image = '" . $this->db->escape($data['image']) . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_store WHERE news_id = '" . (int)$news_id . "'");
		
		if (isset($data['news_store'])) {
			foreach ($data['news_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_to_store SET news_id = '" . (int)$news_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$news_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_id=" . (int)$news_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->cache->delete('news');
	}
	public  function   getimage( $image ){
                       return str_replace( array( HTTP_IMAGE ,"-100x100." , "cache/" ) ,array("",".", "") , $image );
    }
	public function deletenews($news_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "news WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_store WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$news_id . "'");

		$this->cache->delete('news');
	}	

	public function getnews($news_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$news_id . "') AS keyword

		 FROM " . DB_PREFIX . "news WHERE news_id = '" . (int)$news_id . "'");
		
		return $query->row;
	}
		
	public function getnewss($data = array()) {
		if ($data) {
			$sql = "SELECT i.*, id.*, c.name as cat_name  FROM " . DB_PREFIX . "news i LEFT JOIN " . DB_PREFIX . "news_description id ON (i.news_id = id.news_id)
          left join  op_news_category   as  c on c.id=i.category_id
			WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'        ";
		
			$sort_data = array(
                'i.sort_order',
				'id.news_id',

			);		

            ////  取分类
           if (isset($_GET["cat_id"])     && $cat_id=$_GET['cat_id']     ) {
                          $sql.= "   and  i.cat_id='$cat_id'    " ;
           }  else{
                        $sql.= "   and  i.cat_id=''    " ;
           }
            ////  取分类

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY id.news_id";
			}
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " ASC ";
			} else {
				$sql .= " DESC ";
			}
		
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}		

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	
			
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	

            ///die($sql);
			$query = $this->db->query($sql);
			
			return $query->rows;
		} else {
			$news_data = $this->cache->get('news.' . $this->config->get('config_language_id'));
		
			if (!$news_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news i LEFT JOIN " . DB_PREFIX . "news_description id ON (i.news_id = id.news_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");
	
				$news_data = $query->rows;
			
				$this->cache->set('news.' . $this->config->get('config_language_id'), $news_data);
			}	
	
			return $news_data;			
		}
	}
	
	public function getnewsDescriptions($news_id) {
		$news_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'");

		foreach ($query->rows as $result) {
			$news_description_data[$result['language_id']] = array(
				'title'       => $result['title'],
                'post_date'       => $result['post_date'],
				'description' => $result['description']
			);
		}
		
		return $news_description_data;
	}
	
	public function getnewsStores($news_id) {
		$news_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_to_store WHERE news_id = '" . (int)$news_id . "'");

		foreach ($query->rows as $result) {
			$news_store_data[] = $result['store_id'];
		}
		
		return $news_store_data;
	}
	
	public function getTotalnewss() {
	    $this->checkNews();

        ////  取分类
        $where= " where  1  " ;
        if (isset($_GET["cat_id"])     && $cat_id=$_GET['cat_id']     ) {
            $where.= "  and     cat_id='$cat_id'    " ;
        }  else{
            $where.= "   and   cat_id=''    " ;
        }
        ////  取分类
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news    $where        ");
		
		return $query->row['total'];
	}	
	public function checkNews() {
		$create_news = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "news` (`news_id` int(11) NOT NULL auto_increment, `sort_order` int(3) NOT NULL default '0', `status`int(1) NOT NULL  default '1', PRIMARY KEY  (`news_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
		$this->db->query($create_news);
		$create_news_descriptions = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "news_description` (`news_id` int(11) NOT NULL default '0', `language_id` int(11) NOT NULL default '0', `post_date` date NULL, `image` varchar(255) collate utf8_bin NULL default '',`title` varchar(64) collate utf8_bin NOT NULL default '', `description` text collate utf8_bin NOT NULL, PRIMARY KEY  (`news_id`,`language_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
		$this->db->query($create_news_descriptions);
		$create_news_to_store = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "news_to_store` (`news_id` int(11) NOT NULL, `store_id` int(11) NOT NULL, PRIMARY KEY  (`news_id`, `store_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
		$this->db->query($create_news_to_store);
	}
}
?>