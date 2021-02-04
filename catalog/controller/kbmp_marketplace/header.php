<?php

class ControllerKbmpMarketplaceHeader extends Controller {

    public function index() {
        // Analytics
        $this->load->language('kbmp_marketplace/header');
        $this->load->model('setting/extension');

        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        $this->document->setTitle($this->language->get('heading_title'));
        $data['title'] = $this->document->getTitle();

        $data['base'] = $server;
        $data['description'] = $this->document->getDescription();
        $data['keywords'] = $this->document->getKeywords();
        $data['links'] = $this->document->getLinks();
        $data['styles'] = $this->document->getStyles();
        $data['scripts'] = $this->document->getScripts();

        $data['lang'] = $this->language->get('code');
        $data['direction'] = $this->language->get('direction');

        $data['name'] = $this->config->get('config_name');

        if(isset($this->session->data['error_warning'])){
            $data['error_warning'] = $this->session->data['error_warning'];
            unset($this->session->data['error_warning']);
        }else{
            $data['error_warning'] = '';
        }
        if(isset($this->session->data['success'])){
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        }else{
            $data['success'] = '';
        }
        
        //Column Right Text
        $data['text_dashboard'] = $this->language->get('text_dashboard');
        $data['text_seller_profile'] = $this->language->get('text_seller_profile');
        $data['text_seller_products'] = $this->language->get('text_products');
        $data['text_seller_orders'] = $this->language->get('text_orders');
        $data['text_product_reviews'] = $this->language->get('text_product_reviews');
        $data['text_seller_reviews'] = $this->language->get('text_seller_reviews');
        $data['text_seller_earning'] = $this->language->get('text_earning');
        $data['text_seller_transactions'] = $this->language->get('text_transactions');
        $data['text_payout_request'] = $this->language->get('text_payout_request');
        $data['text_category_request'] = $this->language->get('text_category_request');
        $data['text_seller_shipping'] = $this->language->get('text_shipping');
        $data['text_product_return'] = $this->language->get('text_product_return');
        $data['text_product_import'] = $this->language->get('text_product_import');
        $data['text_coupons'] = $this->language->get('text_coupons');
        $data['text_downloads'] = $this->language->get('text_downloads');
        $data['text_support_system'] = $this->language->get('text_support_system');
        $data['text_back_to_site'] = $this->language->get('text_back_to_site');
        $data['text_shipping'] = $this->language->get('text_shipping');
        
        $data['home_link'] = $this->url->link('common/home');
        $data['dashboard_link'] = $this->url->link('kbmp_marketplace/dashboard');
        $data['seller_profile_link'] = $this->url->link('kbmp_marketplace/seller_profile');
        $data['products_link'] = $this->url->link('kbmp_marketplace/products');
        $data['orders_link'] = $this->url->link('kbmp_marketplace/orders');
        $data['product_reviews_link'] = $this->url->link('kbmp_marketplace/product_reviews');
        $data['seller_reviews_link'] = $this->url->link('kbmp_marketplace/seller_reviews');
        $data['earning_link'] = $this->url->link('kbmp_marketplace/earning');
        $data['transactions_link'] = $this->url->link('kbmp_marketplace/transactions');
        $data['payout_request_link'] = $this->url->link('kbmp_marketplace/payoutRequest');
        $data['category_request_link'] = $this->url->link('kbmp_marketplace/category_request');
        $data['shipping_link'] = $this->url->link('kbmp_marketplace/shipping');
        $data['product_import_link'] = $this->url->link('kbmp_marketplace/product_import');
        $data['return_link'] = $this->url->link('kbmp_marketplace/return');
        $data['coupon_link'] = $this->url->link('kbmp_marketplace/coupon');
        $data['downloads_link'] = $this->url->link('kbmp_marketplace/download');
        $data['support_link'] = $this->url->link('kbmp_marketplace/support');
        
        $this->load->model('setting/kbmp_marketplace');
        //Get the module configuration values
        $store_id = (int) $this->config->get('config_store_id');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
        $data['kbmp_marketplace_settings'] = $settings;
//        $data['kbmp_marketplace_settings'] = $settings['kbmp_marketplace_setting'];
//        var_dump($data['kbmp_marketplace_settings']);die;
        return $this->load->view('kbmp_marketplace/header', $data);
    }

}
