<?php

class ControllerKbmpMarketplaceSupport extends Controller {

    public function index() {
        
        
        $this->load->language('kbmp_marketplace/support');
        $this->load->language('kbmp_marketplace/common');
        $this->load->language('extension/module/kbmp_marketplace');
        
        
        $this->document->setTitle($this->language->get('text_support'));
        
        $this->load->model('setting/setting');
        if (isset($this->request->get['store_id'])) {
            $store_id = $this->request->get['store_id'];
        } else {
            $store_id = 0;
        }
        $data['store_id'] = $store_id;
        
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_knowband_marketplace'),
            'href' => $this->url->link('extension/module/kbmp_marketplace', 'token=' . $this->session->data['user_token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_support'),
            'href' => $this->url->link('kbmp_marketplace/support', 'token=' . $this->session->data['user_token'], true)
        );
        
        
        $data['token'] = $this->session->data['user_token'];
        
        
        $this->document->addScript('view/javascript/kbmp_marketplace/validation/velovalidation.js');
        $this->document->addScript('view/javascript/kbmp_marketplace/validation/marketplace-validation.js');
        $this->document->addScript('view/javascript/kbmp_marketplace/jquery.mousewheel.js');
        $this->document->addScript('view/javascript/kbmp_marketplace/jquery.scrolltabs.js');
        $this->document->addScript('view/javascript/summernote/summernote.js');
        $this->document->addScript('view/javascript/summernote/opencart.js');
        $this->document->addScript('view/javascript/kbmp_marketplace/bootstrap-tagsinput.js');


        $this->document->addStyle('view/javascript/summernote/summernote.css');
        $this->document->addStyle('view/stylesheet/kbmp_marketplace/bootstrap-tagsinput.css');
        $this->document->addStyle('view/stylesheet/kbmp_marketplace/scrolltabs.css');
        $this->document->addStyle('view/stylesheet/kbmp_marketplace/kbmp_validation.css');

        $data['heading_title'] = $this->language->get('text_support');
        
        //Menu Options Text
        $data['text_settings'] = $this->language->get('text_settings');
        $data['text_sellers_list'] = $this->language->get('text_sellers_list');
        $data['text_seller_account_approval_list'] = $this->language->get('text_seller_account_approval_list');
        $data['text_product_approval_list'] = $this->language->get('text_product_approval_list');
        $data['text_seller_products'] = $this->language->get('text_seller_products');
        $data['text_seller_orders'] = $this->language->get('text_seller_orders');
        $data['text_admin_orders'] = $this->language->get('text_admin_orders');
        $data['text_product_reviews'] = $this->language->get('text_product_reviews');
        $data['text_reviews_approval_list'] = $this->language->get('text_reviews_approval_list');
        $data['text_seller_reviews'] = $this->language->get('text_seller_reviews');
        $data['text_seller_category_request_list'] = $this->language->get('text_seller_category_request_list');
        $data['text_seller_shippings'] = $this->language->get('text_seller_shippings');
        $data['text_admin_commissions'] = $this->language->get('text_admin_commissions');
        $data['text_seller_transactions'] = $this->language->get('text_seller_transactions');
        $data['text_seller_payout_request'] = $this->language->get('text_seller_payout_request');
        $data['text_seller_payout'] = $this->language->get('text_seller_payout');
        $data['text_paypal_payout'] = $this->language->get('text_paypal_payout');
        $data['text_email_templates'] = $this->language->get('text_email_templates');
        $data['text_support'] = $this->language->get('text_support');
        $data['text_seller_catgory_commision'] = $this->language->get('text_seller_catgory_commision');
        
        $data['text_support'] = $this->language->get('text_support');
        $data['text_support_other'] = $this->language->get('text_support_other');
        $data['text_support_sc'] = $this->language->get('text_support_sc');
        $data['text_support_sc_descp'] = $this->language->get('text_support_sc_descp');
        $data['text_support_etsy'] = $this->language->get('text_support_etsy');
        $data['text_support_etsy_descp'] = $this->language->get('text_support_etsy_descp');
        $data['text_support_ebay'] = $this->language->get('text_support_ebay');
        $data['text_support_ebay_descp'] = $this->language->get('text_support_ebay_descp');
        $data['text_support_mab'] = $this->language->get('text_support_mab');
        $data['text_support_mab_descp'] = $this->language->get('text_support_mab_descp');
        $data['text_support_view_more'] = $this->language->get('text_support_view_more');
        $data['text_support_ticket1'] = $this->language->get('text_support_ticket1');
        $data['text_support_ticket2'] = $this->language->get('text_support_ticket2');
        $data['text_support_ticket3'] = $this->language->get('text_support_ticket3');
        $data['text_click_here'] = $this->language->get('text_click_here');        
        $data['text_user_manual'] = $this->language->get('text_user_manual');
        
        //links
        
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        if (VERSION < 2.2) {
            $this->response->setOutput($this->load->view('kbmp_marketplace/support.tpl', $data));
        }else{
            $this->response->setOutput($this->load->view('kbmp_marketplace/support', $data));
        }
    }
}
