<?php
class ControllerProductHome extends Controller {
    public function index() {
        $this->load -> model("tool/q");
        $this->load -> model("tool/image");
        $this->load -> model("tool/str");
        $language_id= $this->config->get("config_language_id");
        ///echo $language_id;
        $this->document->setTitle(   "商城 - " .  $this->config->get('config_title'));
        $this->document->setDescription($this->config->get('config_meta_description'));

        $this->data['heading_title'] = $this->config->get('config_title');
        ///  导航
        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home'),
            'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
            'text'      => "老年商城",
            'href'      => $this->url->link('product/home', 'path=' . ''),
            'separator' => $this->language->get('text_separator')
        );
        /// 分类
        if (isset($this->request->get['path'])) {
            $parts = explode('_', (string)$this->request->get['path']);
        } else {
            $parts = array();
        }

        if (isset($parts[0])) {
            $this->data['category_id'] = $parts[0];
        } else {
            $this->data['category_id'] = 0;
        }

        if (isset($parts[1])) {
            $this->data['child_id'] = $parts[1];
        } else {
            $this->data['child_id'] = 0;
        }

        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        $this->data['categories'] = array();

        $categories = $this->model_catalog_category->getCategories(0);

        foreach ($categories as $category) {
            $total = $this->model_catalog_product->getTotalProducts(array('filter_category_id'  => $category['category_id']));

            $children_data = array();

            $children = $this->model_catalog_category->getCategories($category['category_id']);

            foreach ($children as $child) {
                $data = array(
                    'filter_category_id'  => $child['category_id'],
                    'filter_sub_category' => true
                );

                $product_total = $this->model_catalog_product->getTotalProducts($data);

                $total += $product_total;

                $children_data[] = array(
                    'category_id' => $child['category_id'],
                    'name'        => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
                    'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                );
            }

            $this->data['categories'][] = array(
                'category_id' => $category['category_id'],
                'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $total . ')' : ''),
                'children'    => $children_data,
                'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
            );
        }
        ///print_r( $this->data['categories']) ;
        ////  分类
        ///  热门商品
        $this->load->model("catalog/product");
        $getProducts=$this->model_catalog_product->getProducts( array("sort"=>'sort_order','start'=>0,'limit'=>9 ) );
        foreach  ( $getProducts  as $key=>$val) {
                   $getProducts[$key]["thumb"] =$this->model_tool_image->resize( $val['image'] , 150, 150 );
                   //$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
                   $getProducts[$key]["price"]=$this->currency->format($this->tax->calculate($val['price'], $val['tax_class_id'], $this->config->get('config_tax')));
                   $getProducts[$key]["href"]="index.php?route=product/product&path=&product_id=$val[product_id]";
        }
        $this->data["getProducts"] = $getProducts;
        ////print_r($getProducts) ;

        ////  最新商品
        $LatestProducts=$this->model_catalog_product->getProducts( array("sort"=>'product_id','start'=>0,'limit'=>4,'order'=>'DESC' ) );
        ////print_r($LatestProducts);
        foreach  ( $LatestProducts  as $key=>$val) {
            $LatestProducts[$key]["thumb"] =$this->model_tool_image->resize( $val['image'] , 130, 130 );
            //$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
            $LatestProducts[$key]["price"]=$this->currency->format($this->tax->calculate($val['price'], $val['tax_class_id'], $this->config->get('config_tax')));
            $LatestProducts[$key]["href"]="index.php?route=product/product&path=&product_id=$val[product_id]";
        }
        $this->data["LatestProducts"] = $LatestProducts;
        ////  最新商品
        ///  热卖商品
        $getBestSellerProducts= $this->model_catalog_product->getBestSellerProducts(10);
        if ( count($getBestSellerProducts)  < 8    ){
                $getBestSellerProducts=$this->model_catalog_product->getProducts( array("sort"=>'sort_order','start'=>0,'limit'=>10) );
        }
        foreach  ( $getBestSellerProducts  as $key=>$val) {
            $getBestSellerProducts[$key]["thumb"] =$this->model_tool_image->resize( $val['image'] , 130, 130 );
            //$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
            $getBestSellerProducts[$key]["price"]=$this->currency->format($this->tax->calculate($val['price'], $val['tax_class_id'], $this->config->get('config_tax')));
            $getBestSellerProducts[$key]["href"]="index.php?route=product/product&path=&product_id=$val[product_id]";
             $getBestSellerProducts[$key]["name"] = $this->model_tool_str -> utf8substr($val['name'] ,   15, 0  ) ;
        }
        $this->data["getBestSellerProducts"]=$getBestSellerProducts;


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/home.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/product/home.tpl';
        } else {
            $this->template = 'default/template/product/home.tpl';
        }
        ///  广告
        ///  广告条   begin
        $adsid=array(21,22,23);
        $ads=array();
        foreach  ( $adsid as $val ) {
            $imgs=$this->model_tool_q->q(" select  * from op_banner_image where  banner_id='$val' ") ->rows;
            /*
            foreach  (  $imgs as $imgkey=>$imgval  ) {
                       $imgs[$imgkey]['image']=$this->model_tool_image->resize($imgval["image"],975,110) ;
            }
            */
            ////print_r($imgs);
            $ads[$val]=   $imgs;
        }
        $this->data["ads"] =$ads;
        ////print_r($ads);
        //// 广告条   end
        ///  公益活动
        $news_activity=$this->model_tool_q ->q(" select  * from  op_news  as a
                        left  join  op_news_description as b  on a.news_id=b.news_id
                        where    b.language_id='$language_id' and a.cat_id='-2'   order by  a.news_id desc limit 0,3
         ") ->rows;
        foreach  ($news_activity     as   $key => $val   ) {
                $news_activity[$key]["thumb"] = $this->model_tool_image->resize($val['image'], 175, 175) ;
                $news_activity[$key]['href']="?route=news/news&news_id=$val[news_id]";
        }
        $this->data["news_activity"]=$news_activity;
        ///print_r($news_activity);
        ///  公益活动
        ///  商城焦点

        $shop_news=$this->model_tool_q ->q(" select  * from  op_news  as a
                        left  join  op_news_description as b  on a.news_id=b.news_id
                        where    b.language_id='$language_id' and a.cat_id='-3'   order by  a.news_id desc limit 0,3
         ") ->rows;
        foreach  ($shop_news     as   $key => $val   ) {
            $shop_news[$key]["thumb"] = $this->model_tool_image->resize($val['image'], 175, 175) ;
            $shop_news[$key]['href']="?route=news/news&news_id=$val[news_id]";
        }
        $this->data["shop_news"]=$shop_news;
        ///print_r($news_activity);

        /// 商城焦点
        $this->data["config_facebook"] =$this->config->get("config_facebook");

        $this->children = array(
            'common/column_left',
            'common/column_right',
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header',
            'module/homessearch',
            'module/homeszones',
        );

        $this->response->setOutput($this->render());
    }
}
?>