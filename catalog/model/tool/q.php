<?php
class ModelToolQ     extends Model {
           function  q( $sql ) {
                                 if ( $sql ) {
                                       return    $this->db->query($sql);

                                 }
           }

}
?>