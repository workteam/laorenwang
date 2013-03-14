<?php
class ModelToolStr extends Model {

    //  过滤html
    function uh($str)
    {
        $farr = array(
            "/\s+/", //过滤多余的空白
            "/<(\/?)(script|i?frame|style|html|body|title|link|meta|\?|\%)([^>]*?)>/isu", //过滤 <script 等可能引入恶意内容或恶意改变显示布局的代码,如果不需要插入flash等,还可以加入<object的过滤
            "/(<[^>]*)on[a-za-z]+\s*=([^>]*>)/isu", //过滤javascript的on事件

        );
        $tarr = array(
            " ",
            "＜\\1\\2 \\3＞", //如果要直接清除不安全的标签，这里可以留空
            "\\1\\2",
        );

        $str = preg_replace( $farr,$tarr,$str);
        $str=str_replace(array("'"),array("\'"),$str);
        return $str;
    }



    function strLen($str, $charset = 'UTF-8')    {

	        if (function_exists('mb_get_info'))
            {
                    return mb_strlen($str, $charset);
                }
                else
                {
                    preg_match_all("/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|\xe0[\xa0-\xbf][\x80-\xbf]|[\xe1-\xef][\x80-\xbf][\x80-\xbf]|\xf0[\x90-\xbf][\x80-\xbf][\x80-\xbf]|[\xf1-\xf7][\x80-\xbf][\x80-\xbf][\x80-\xbf]/", $str, $info);

                    return sizeof($info[0]);
                }
	   }

    function utf8substr($string, $sublen, $start = 0, $code = 'UTF-8')
        /*
                  03	Utf-8、gb2312都支持的汉字截取函数
                  04	cut_str(字符串, 截取长度, 开始长度, 编码);
                  05	编码默认为 utf-8
                  06	开始长度默认为 0
                  07	*/
    {
        if($code == 'UTF-8')
        {
            $pa ="/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|\xe0[\xa0-\xbf][\x80-\xbf]|[\xe1-\xef][\x80-\xbf][\x80-\xbf]|\xf0[\x90-\xbf][\x80-\xbf][\x80-\xbf]|[\xf1-\xf7][\x80-\xbf][\x80-\xbf][\x80-\xbf]/";
            preg_match_all($pa, $string, $t_string);        if(count($t_string[0]) - $start > $sublen) return join('', array_slice($t_string[0], $start, $sublen))."...";
            return join('', array_slice($t_string[0], $start, $sublen));
        }
        else
        {
            $start = $start*2;
            $sublen = $sublen*2;
            $strlen = strlen($string);
            $tmpstr = '';        for($i=0; $i<$strlen; $i++)
        {
            if($i>=$start && $i<($start+$sublen))
            {
                if(ord(substr($string, $i, 1))>129)
                {
                    $tmpstr.= substr($string, $i, 2);
                }
                else
                {
                    $tmpstr.= substr($string, $i, 1);
                }
            }
            if(ord(substr($string, $i, 1))>129) $i++;
        }
            if(strlen($tmpstr)<$strlen ) $tmpstr.= "...";
            return $tmpstr;
        }
    }

}
?>