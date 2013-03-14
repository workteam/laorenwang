<?php
class ModelCatalognews extends Model {
	public function getnews($news_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "news i LEFT JOIN " . DB_PREFIX . "news_description id ON (i.news_id = id.news_id) LEFT JOIN " . DB_PREFIX . "news_to_store i2s ON (i.news_id = i2s.news_id) WHERE i.news_id = '" . (int)$news_id . "' AND id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1'");
	
		return $query->row;
	}
	
	public function getnewss($news_limit) {

        /////add
        $where="";

        $cat_id = isset($_GET["cat_id"])?$_GET["cat_id"] :"";
        $category_id=isset($_GET['category_id'])?$_GET['category_id']:'';
        if ($category_id) {
            $where.="  and  i.category_id='$category_id'  "      ;
        }
        elseif ( $cat_id  ) {
                $where.="  and  i.cat_id='$cat_id'  "      ;
        }    else{
                $where.="  and  i.cat_id=''  "      ;
        }
        ////die($where);
        //// addd

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news i LEFT JOIN " . DB_PREFIX . "news_description id ON (i.news_id = id.news_id) LEFT JOIN " . DB_PREFIX . "news_to_store i2s ON (i.news_id = i2s.news_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1'    $where      ORDER BY i.sort_order DESC LIMIT " . (int)$news_limit);
		
		return $query->rows;
	}
		public function getnewsss() {

            /////add
            $where="";
            $cat_id = isset($_GET["cat_id"])?$_GET["cat_id"] :"";

            $category_id=isset($_GET['category_id'])?$_GET['category_id']:'';
            if ($category_id) {
                $where.="  and  i.category_id='$category_id'  "      ;
            }
            elseif ( $cat_id  ) {
                $where.="  and  i.cat_id='$cat_id'  "      ;
            }     else{
                $where.="  and  i.cat_id=''  "      ;
            }
            ////die($where);
            //// addd
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news i LEFT JOIN " . DB_PREFIX . "news_description id ON (i.news_id = id.news_id) LEFT JOIN " . DB_PREFIX . "news_to_store i2s ON (i.news_id = i2s.news_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1'     $where    ORDER BY i.sort_order DESC");
		
		return $query->rows;
	}
		public function getTotalnewss() {

            /////add
            $where=" where 1  ";
            $cat_id = isset($_GET["cat_id"])?$_GET["cat_id"] :"";

            $category_id=isset($_GET['category_id'])?$_GET['category_id']:'';
            if ($category_id) {
                $where.="  and  i.category_id='$category_id'  "      ;
            }
            elseif ( $cat_id  ) {
                $where.="  and  i.cat_id='$cat_id'  "      ;
            }    else{
                $where.="  and  i.cat_id=''  "      ;
            }
            ////die($where);
            //// addd

      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news   as  i   $where");
		
		return $query->row['total'];
	}	
	public function getlist($data = array()) {

        /////add
        $where="";
        $cat_id = isset($_GET["cat_id"])?$_GET["cat_id"] :"";
        $category_id=isset($_GET['category_id'])?$_GET['category_id']:'';
        if ($category_id) {
            $where.="  and  i.category_id='$category_id'  "      ;
        }
        elseif ( $cat_id  ) {
            $where.="  and  i.cat_id='$cat_id'  "      ;
        }      else{
            $where.="  and  i.cat_id=''  "      ;
        }
        ////die($where);
        //// addd

		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "news i LEFT JOIN " . DB_PREFIX . "news_description id ON (i.news_id = id.news_id) LEFT JOIN " . DB_PREFIX . "news_to_store i2s ON (i.news_id = i2s.news_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1'   $where           ORDER BY i.sort_order DESC";

		
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}		

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	
			
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	
			
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
}
?>