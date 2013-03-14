<?php 
class ModelCommonDiyhome extends Model {
	public function  setfloor($v) {
        ///echo $v;
        $sql="update  ".DB_PREFIX."diyhome  set value='$v' where `key`='Floor'    ";
        ////echo $sql;
        $this->db->query($sql);
    }
    public  function  getfloor() {
            return  $this->db->query(  "  select  * from  ".DB_PREFIX."diyhome  where `key`='Floor' " )->row;
    }
    public function  query( $sql ) {
                if ( $sql ) {
                        return  $this->db->query($sql);
                }

    }
    public  function   getdata() {
            return $this->db->query("select  * from  ".DB_PREFIX."diyhome ")->rows;
    }
}
?>