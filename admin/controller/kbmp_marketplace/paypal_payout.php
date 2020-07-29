<?php

class ControllerKbmpMarketplacePaypalPayout extends Controller {

    private $error = array();

    public function __construct($params) {

        parent::__construct($params);
        $this->document->addScript('view/javascript/kbmp_marketplace/validation/velovalidation.js');
        $this->document->addScript('view/javascript/kbmp_marketplace/jquery.mousewheel.js');
        $this->document->addScript('view/javascript/kbmp_marketplace/jquery.scrolltabs.js');
        $this->document->addScript('view/javascript/summernote/summernote.js');
        $this->document->addScript('view/javascript/summernote/opencart.js');
        $this->document->addScript('view/javascript/kbmp_marketplace/bootstrap-tagsinput.js');


        $this->document->addStyle('view/javascript/summernote/summernote.css');
        $this->document->addStyle('view/stylesheet/kbmp_marketplace/bootstrap-tagsinput.css');
        $this->document->addStyle('view/stylesheet/kbmp_marketplace/scrolltabs.css');
        $this->document->addStyle('view/stylesheet/kbmp_marketplace/kbmp_validation.css');
        if (VERSION >= 3.0) {
            $this->session_token_key = 'user_token';
            $this->session_token = $this->session->data['user_token'];
        } else {
            $this->session_token_key = 'token';
            $this->session_token = $this->session->data['token'];
        }
        if (VERSION <= 2.2) {
            $this->module_path = 'module';
        } else {
            $this->module_path = 'extension/module';
        }
    }
    
    public function index() {

        $this->load->language('kbmp_marketplace/common');
        $this->load->language('kbmp_marketplace/paypal_payout');
        
        $this->load->language('extension/module/kbmp_marketplace');
        $this->document->setTitle($this->language->get('heading_title'));
        
        $data['token'] = $this->session_token;
        
        //Get Language Content
        $data['heading_title'] = $this->language->get('heading_title');
        
        //Menu Options Text
$data['text_support'] = $this->language->get('text_support');
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
        $data['text_paypal_payout'] = $this->language->get('text_paypal_payout');
        $data['text_email_templates'] = $this->language->get('text_email_templates');
        $data['text_seller_catgory_commision'] = $this->language->get('text_seller_catgory_commision');
        
        $data['text_active'] = $this->language->get('text_active');
        $data['text_client_id'] = $this->language->get('text_client_id');
        $data['text_client_secret'] = $this->language->get('text_client_secret');
        $data['text_paypal_mode'] = $this->language->get('text_paypal_mode');
        $data['text_paypal_email_subject'] = $this->language->get('text_paypal_email_subject');
        $data['text_paypal_currency'] = $this->language->get('text_paypal_currency');
        $data['text_sandbox'] = $this->language->get('text_sandbox');
        $data['text_live'] = $this->language->get('text_live');
        
        //Form Labels and Help Text
        $data['text_active_tooltip'] = $this->language->get('text_active_tooltip');
        $data['text_paypal_currency_tooltip'] = $this->language->get('text_paypal_currency_tooltip');
       
        //Velovalidation Text
        $data['error_empty_field'] = $this->language->get('error_empty_field');
        $data['error_minchar_field'] = $this->language->get('error_minchar_field');
        $data['error_maxchar_field'] = $this->language->get('error_maxchar_field');
        
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        
        $data['button_save'] = $this->language->get('button_save');
        
        $this->load->model('setting/kbmp_marketplace');
        $this->load->model('localisation/language');
        $this->load->model('localisation/currency');
        
        if (isset($this->request->get['store_id'])) {
            $store_id = $this->request->get['store_id'];
        } else {
            $store_id = 0;
        }
        
        //Get All Languages
        $languages = $this->model_localisation_language->getLanguages();
        $data['languages'] = $languages;
        
        // Get all currency
        $currencies = $this->model_localisation_currency->getCurrencies();
        $data['currencies'] = $currencies;
        
        //Set Error Message to display
        if (isset($this->session->data['error'])) {
            $data['error'] = $this->session->data['error'];
            unset($this->session->data['error']);
        } else {
            $data['error'] = '';
        }
        
        //Set Success Message to display
        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }
        
        //handle Post Request
        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
            $settings['kbmp_marketplace_paypal_settings'] = $this->request->post['kbmp_marketplace_paypal_settings'];
            
            if ($this->model_setting_kbmp_marketplace->editSetting('kbmp_marketplace', $settings, $store_id)) {   
                $this->session->data['success'] = $this->language->get('text_setting_success');
            } else {
                $this->session->data['error'] = $this->language->get('text_setting_error');
            }
            
            $this->response->redirect($this->url->link('kbmp_marketplace/paypal_payout', $this->session_token_key.'=' . $this->session_token, 'SSL'));
        }
        
        $data['token'] = $this->session_token;
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        
        //Get the module configuration values
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);

        if (isset($settings['kbmp_marketplace_paypal_settings']) && !empty($settings['kbmp_marketplace_paypal_settings'])) {
            $data['kbmp_marketplace_paypal_settings'] = $settings['kbmp_marketplace_paypal_settings'];
        }else{
            $data['kbmp_marketplace_paypal_settings']['enable'] = '0';
        }
        
        $this->load->model('catalog/category');
        

        $this->response->setOutput($this->load->view('kbmp_marketplace/paypal_payout', $data));
    }

}
