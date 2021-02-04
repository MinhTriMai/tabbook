<?php

class ControllerExtensionModulekbmpMarketplace extends Controller {

    private $error = array();

    public function __construct($params) {

        parent::__construct($params);
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
    
    public function install() {
        $this->load->model('setting/kbmp_marketplace');

        $this->model_setting_kbmp_marketplace->install();
    }

    public function index() {

        $this->load->language('kbmp_marketplace/common');
        
        $this->load->language('extension/module/kbmp_marketplace');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('setting/setting');
        $data['token'] = $this->session_token;
        
        //Get Language Content
        $data['heading_title'] = $this->language->get('heading_title');
        
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
		$data['text_seller_catgory_commision'] = $this->language->get('text_seller_catgory_commision');
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
        
        //Form Labels and Help Text
        $data['label_module_enable'] = $this->language->get('label_module_enable');
        $data['help_text_module_enable'] = $this->language->get('help_text_module_enable');
        $data['label_default_commission'] = $this->language->get('label_default_commission');
        $data['help_text_default_commission'] = $this->language->get('help_text_default_commission');
        $data['label_approval_request_limit'] = $this->language->get('label_approval_request_limit');
        $data['help_text_approval_request_limit'] = $this->language->get('help_text_approval_request_limit');
        $data['help_block_approval_request_limit'] = $this->language->get('help_block_approval_request_limit');
        $data['label_new_product_limit'] = $this->language->get('label_new_product_limit');
        $data['help_text_new_product_limit'] = $this->language->get('help_text_new_product_limit');
        $data['help_block_new_product_limit'] = $this->language->get('help_block_new_product_limit');
        $data['label_seller_registration'] = $this->language->get('label_seller_registration');
        $data['help_text_seller_registration'] = $this->language->get('help_text_seller_registration');
        $data['label_new_product_approval'] = $this->language->get('label_new_product_approval');
        $data['help_text_new_product_approval'] = $this->language->get('help_text_new_product_approval');
        $data['label_send_email_to_seller'] = $this->language->get('label_send_email_to_seller');
        $data['help_text_send_email_to_seller'] = $this->language->get('help_text_send_email_to_seller');
        $data['label_enable_seller_review'] = $this->language->get('label_enable_seller_review');
        $data['help_text_enable_seller_review'] = $this->language->get('help_text_enable_seller_review');
        $data['label_seller_approval_required'] = $this->language->get('label_seller_approval_required');
        $data['help_text_seller_approval_required'] = $this->language->get('help_text_seller_approval_required');
        $data['label_display_sellers_front'] = $this->language->get('label_display_sellers_front');
        $data['help_text_display_sellers_front'] = $this->language->get('help_text_display_sellers_front');
        $data['label_allow_order_handling'] = $this->language->get('label_allow_order_handling');
        $data['help_text_allow_order_handling'] = $this->language->get('help_text_allow_order_handling');
        $data['help_block_allow_order_handling'] = $this->language->get('help_block_allow_order_handling');
        $data['label_include_product_tax'] = $this->language->get('label_include_product_tax');        
        $data['help_text_include_product_tax'] = $this->language->get('help_text_include_product_tax');
        
        
        $data['label_allow_free_shipping'] = $this->language->get('label_allow_free_shipping');
        $data['help_text_allow_free_shipping'] = $this->language->get('help_text_allow_free_shipping');
        $data['help_block_allow_free_shipping'] = $this->language->get('help_block_allow_free_shipping');
        $data['label_display_product_wise_seller'] = $this->language->get('label_display_product_wise_seller');
        $data['help_text_display_product_wise_seller'] = $this->language->get('help_text_display_product_wise_seller');
        $data['help_block_display_product_wise_seller'] = $this->language->get('help_block_display_product_wise_seller');
        $data['label_seller_on_product_page'] = $this->language->get('label_seller_on_product_page');
        $data['help_text_seller_on_product_page'] = $this->language->get('help_text_seller_on_product_page');
        $data['help_block_seller_on_product_page'] = $this->language->get('help_block_seller_on_product_page');
        $data['label_meta_keywords'] = $this->language->get('label_meta_keywords');
        $data['help_text_meta_keywords'] = $this->language->get('help_text_meta_keywords');
        $data['help_block_meta_keywords'] = $this->language->get('help_block_meta_keywords');
        $data['label_meta_description'] = $this->language->get('label_meta_description');
        $data['help_text_meta_description'] = $this->language->get('help_text_meta_description');
        $data['help_block_meta_description'] = $this->language->get('help_block_meta_description');
        $data['label_seller_agreement'] = $this->language->get('label_seller_agreement');
        $data['help_text_seller_agreement'] = $this->language->get('help_text_seller_agreement');
        $data['help_block_seller_agreement'] = $this->language->get('help_block_seller_agreement');
        $data['label_order_email_template'] = $this->language->get('label_order_email_template');
        $data['help_text_order_email_template'] = $this->language->get('help_text_order_email_template');
        $data['help_block_order_email_template'] = $this->language->get('help_block_order_email_template');
        $data['label_categories_allowed'] = $this->language->get('label_categories_allowed');
        $data['help_text_categories_allowed'] = $this->language->get('help_text_categories_allowed');
        $data['help_block_categories_allowed'] = $this->language->get('help_block_categories_allowed');
        
        //Velovalidation Text
        $data['empty_fname'] = $this->language->get('empty_fname');
        $data['maxchar_fname'] = $this->language->get('maxchar_fname');
        $data['minchar_fname'] = $this->language->get('minchar_fname');
        $data['empty_mname'] = $this->language->get('empty_mname');
        $data['maxchar_mname'] = $this->language->get('maxchar_mname');
        $data['minchar_mname'] = $this->language->get('minchar_mname');
        $data['only_alphabet'] = $this->language->get('only_alphabet');
        $data['empty_lname'] = $this->language->get('empty_lname');
        $data['maxchar_lname'] = $this->language->get('maxchar_lname');
        $data['minchar_lname'] = $this->language->get('minchar_lname');
        $data['alphanumeric'] = $this->language->get('alphanumeric');
        $data['empty_pass'] = $this->language->get('empty_pass');
        $data['maxchar_pass'] = $this->language->get('maxchar_pass');
        $data['minchar_pass'] = $this->language->get('minchar_pass');
        $data['specialchar_pass'] = $this->language->get('specialchar_pass');
        $data['alphabets_pass'] = $this->language->get('alphabets_pass');
        $data['capital_alphabets_pass'] = $this->language->get('capital_alphabets_pass');
        $data['small_alphabets_pass'] = $this->language->get('small_alphabets_pass');
        $data['digit_pass'] = $this->language->get('digit_pass');
        $data['empty_field'] = $this->language->get('empty_field');
        $data['number_field'] = $this->language->get('number_field');
        $data['positive_number'] = $this->language->get('positive_number');
        $data['maxchar_field'] = $this->language->get('maxchar_field');
        $data['minchar_field'] = $this->language->get('minchar_field');
        $data['empty_email'] = $this->language->get('empty_email');
        $data['validate_email'] = $this->language->get('validate_email');
        $data['empty_country'] = $this->language->get('empty_country');
        $data['maxchar_country'] = $this->language->get('maxchar_country');
        $data['minchar_country'] = $this->language->get('minchar_country');
        $data['empty_city'] = $this->language->get('empty_city');
        $data['maxchar_city'] = $this->language->get('maxchar_city');
        $data['minchar_city'] = $this->language->get('minchar_city');
        $data['empty_state'] = $this->language->get('empty_state');
        $data['maxchar_state'] = $this->language->get('maxchar_state');
        $data['minchar_state'] = $this->language->get('minchar_state');
        $data['empty_proname'] = $this->language->get('empty_proname');
        $data['maxchar_proname'] = $this->language->get('maxchar_proname');
        $data['minchar_proname'] = $this->language->get('minchar_proname');
        $data['empty_catname'] = $this->language->get('empty_catname');
        $data['maxchar_catname'] = $this->language->get('maxchar_catname');
        $data['minchar_catname'] = $this->language->get('minchar_catname');
        $data['empty_zip'] = $this->language->get('empty_zip');
        $data['maxchar_zip'] = $this->language->get('maxchar_zip');
        $data['minchar_zip'] = $this->language->get('minchar_zip');
        $data['empty_username'] = $this->language->get('empty_username');
        $data['maxchar_username'] = $this->language->get('maxchar_username');
        $data['minchar_username'] = $this->language->get('minchar_username');
        $data['invalid_date'] = $this->language->get('invalid_date');
        $data['maxchar_sku'] = $this->language->get('maxchar_sku');
        $data['minchar_sku'] = $this->language->get('minchar_sku');
        $data['invalid_sku'] = $this->language->get('invalid_sku');
        $data['empty_sku'] = $this->language->get('empty_sku');
        $data['validate_range'] = $this->language->get('validate_range');
        $data['empty_address'] = $this->language->get('empty_address');
        $data['minchar_address'] = $this->language->get('minchar_address');
        $data['maxchar_address'] = $this->language->get('maxchar_address');
        $data['empty_company'] = $this->language->get('empty_company');
        $data['minchar_company'] = $this->language->get('minchar_company');
        $data['maxchar_company'] = $this->language->get('maxchar_company');
        $data['invalid_phone'] = $this->language->get('invalid_phone');
        $data['empty_phone'] = $this->language->get('empty_phone');
        $data['minchar_phone'] = $this->language->get('minchar_phone');
        $data['maxchar_phone'] = $this->language->get('maxchar_phone');
        $data['empty_brand'] = $this->language->get('empty_brand');
        $data['maxchar_brand'] = $this->language->get('maxchar_brand');
        $data['minchar_brand'] = $this->language->get('minchar_brand');
        $data['empty_shipment'] = $this->language->get('empty_shipment');
        $data['maxchar_shipment'] = $this->language->get('maxchar_shipment');
        $data['minchar_shipment'] = $this->language->get('minchar_shipment');
        $data['invalid_ip'] = $this->language->get('invalid_ip');
        $data['invalid_url'] = $this->language->get('invalid_url');
        $data['empty_url'] = $this->language->get('empty_url');
        $data['valid_amount'] = $this->language->get('valid_amount');
        $data['valid_decimal'] = $this->language->get('valid_decimal');
        $data['max_email'] = $this->language->get('max_email');
        $data['specialchar_zip'] = $this->language->get('specialchar_zip');
        $data['specialchar_sku'] = $this->language->get('specialchar_sku');
        $data['max_url'] = $this->language->get('max_url');
        $data['valid_percentage'] = $this->language->get('valid_percentage');
        $data['between_percentage'] = $this->language->get('between_percentage');
        $data['maxchar_size'] = $this->language->get('maxchar_size');
        $data['specialchar_size'] = $this->language->get('specialchar_size');
        $data['specialchar_upc'] = $this->language->get('specialchar_upc');
        $data['maxchar_upc'] = $this->language->get('maxchar_upc');
        $data['specialchar_ean'] = $this->language->get('specialchar_ean');
        $data['maxchar_ean'] = $this->language->get('maxchar_ean');
        $data['specialchar_bar'] = $this->language->get('specialchar_bar');
        $data['maxchar_bar'] = $this->language->get('maxchar_bar');
        $data['positive_amount'] = $this->language->get('positive_amount');
        $data['maxchar_color'] = $this->language->get('maxchar_color');
        $data['invalid_color'] = $this->language->get('invalid_color');
        $data['specialchar'] = $this->language->get('specialchar');
        $data['script'] = $this->language->get('script');
        $data['style'] = $this->language->get('style');
        $data['iframe'] = $this->language->get('iframe');
        $data['not_image'] = $this->language->get('not_image');
        $data['image_size'] = $this->language->get('image_size');
        $data['html_tags'] = $this->language->get('html_tags');
        $data['number_pos'] = $this->language->get('number_pos');
        $data['invalid_separator'] = $this->language->get('invalid_separator');
        
        $data['text_add_tag'] = $this->language->get('text_add_tag');
        $data['text_categories'] = $this->language->get('text_categories');
        $data['text_categories'] = $this->language->get('text_categories');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        
        $data['button_save'] = $this->language->get('button_save');
        //cancel oreder status email template
        $data['help_text_order_cancel_email_template'] = $this->language->get('help_text_order_cancel_email_template');
        $data['label_order_cancel_email_template'] = $this->language->get('label_order_cancel_email_template');
        $data['help_text_send_email_to_seller_cancel'] = $this->language->get('help_text_send_email_to_seller_cancel');
        $data['label_send_email_to_seller_cancel'] = $this->language->get('label_send_email_to_seller_cancel');
        //cancel order status
        $data['text_order_status'] = $this->language->get('text_order_status');
        $data['help_order_status'] = $this->language->get('help_order_status');
        
        
        
        $this->load->model('setting/kbmp_marketplace');
        $this->load->model('localisation/language');
        
        if (isset($this->request->get['store_id'])) {
            $store_id = $this->request->get['store_id'];
        } else {
            $store_id = 0;
        }
        
        //Get All Languages
        $languages = $this->model_localisation_language->getLanguages();
        $data['languages'] = $languages;
        
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
            $module_configuration = array();
            if(isset($settings['kbmp_marketplace_paypal_settings'])){
                $module_configuration['kbmp_marketplace_paypal_settings'] = $settings['kbmp_marketplace_paypal_settings'];
            }
            $module_configuration['kbmp_marketplace_setting'] = $_POST;
            
            /**
             * Custom setting added to set Seller Shipping configurable from Admin - added by Harsh on 11-Dec-2018 for CCIC implementation
             */
            $module_configuration['kbmp_marketplace_setting']['kbmp_seller_shipping'] = 1; //By default keep it true/enabled for sellers shipping options
            //Ends
            
            //Iterate languages to get seller agreement and email template content
            if (isset($languages) && !empty($languages)) {
                foreach ($languages as $language) {
                    $module_configuration['kbmp_marketplace_seller_agreement']['seller_agreement_'.$language['language_id']] = $_POST['seller_agreement_'.$language['language_id']];
                    unset($module_configuration['kbmp_marketplace_setting']['seller_agreement_'.$language['language_id']]);
                    $module_configuration['kbmp_marketplace_order_email_template']['order_email_content_'.$language['language_id']] = $_POST['order_email_content_'.$language['language_id']];
                    unset($module_configuration['kbmp_marketplace_setting']['order_email_content_'.$language['language_id']]);
                    $module_configuration['kbmp_marketplace_order_cancel_email_template']['order_cancel_email_content_'.$language['language_id']] = $_POST['order_cancel_email_content_'.$language['language_id']];
                    
                }
            }
            //Unset unused post value - not to save in database
            unset($module_configuration['kbmp_marketplace_setting']['category']);
            
            if ($this->model_setting_kbmp_marketplace->editSetting('kbmp_marketplace', $module_configuration, $store_id)) {   
                $this->session->data['success'] = $this->language->get('text_setting_success');
                
                $enable_status['module_kbmp_marketplace_status'] = $module_configuration['kbmp_marketplace_setting'];
                $this->model_setting_setting->editSetting('module_kbmp_marketplace', $enable_status, $store_id);
            } else {
                $this->session->data['error'] = $this->language->get('text_setting_error');
            }
            
            $this->response->redirect($this->url->link('extension/module/kbmp_marketplace', $this->session_token_key.'=' . $this->session_token, 'SSL'));
        }
        
        $data['token'] = $this->session_token;
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        //code by gopi for order cancel 27 feb start
        $this->load->model('localisation/order_status');
        $statusorder = $this->model_localisation_order_status->getOrderStatuses('name');
        
        $data['cancel_order_status_value'] = $statusorder;
        
        //Get the module configuration values
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
        
        if (isset($settings) && !empty($settings)) {
            $data['settings'] = $settings;
            $data['order_status_selected'] = $data['settings']['kbmp_marketplace_setting']['cancel_order_status_value'];
        }else {
           $data['order_status_selected'] = array('0' => 'Canceled');
          //setting default template for order cancelled and order created
            foreach ($languages as $language) {
                $data['settings']['kbmp_marketplace_order_cancel_email_template']['order_cancel_email_content_'.$language['language_id']] = $this->load->view('kbmp_marketplace/email_order_cancel');
                $data['settings']['kbmp_marketplace_order_email_template']['order_email_content_'.$language['language_id']] = $this->load->view('kbmp_marketplace/email_order_create');
            }
        }
        
        $this->load->model('catalog/category');
        
        $data['categories'] = array();

        if (isset($settings['kbmp_marketplace_setting']['product_category']) && !empty($settings['kbmp_marketplace_setting']['product_category'])) {
            $categories = $settings['kbmp_marketplace_setting']['product_category'];
            foreach ($categories as $category_id) {
                $category_info = $this->model_catalog_category->getCategory($category_id);

                if ($category_info) {
                    $data['categories'][] = array(
                        'category_id' => $category_info['category_id'],
                        'name' => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
                    );
                }
            }
        }

        $this->response->setOutput($this->load->view('extension/module/kbmp_marketplace', $data));
    }
}
