<?php

class ControllerKbmpMarketplaceSellerProfile extends Controller {

    public function index() {

        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('kbmp_marketplace/seller_profile', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }

                
        $this->load->language('kbmp_marketplace/common');
        $this->load->language('kbmp_marketplace/seller_profile');

        $this->document->setTitle($this->language->get('heading_title'));
        
        $data['title'] = $this->document->getTitle();
        $data['footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('kbmp_marketplace/header');
        $data['text_back_to_site'] = $this->language->get('text_back_to_site');
        $data['text_my_account1'] = $this->language->get('text_my_account1');
        $data['text_seller_profile'] = $this->language->get('text_seller_profile');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['error_account_warning'] = $this->language->get('error_account_warning');
        $data['text_account_warning'] = $this->language->get('text_account_warning');
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        //Handle the Post Request
        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            //Get Seller Information
            $seller = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
            
            $post_data = $this->request->post;
            //Check if logo added to upload
            if (isset($this->request->post['logo_remove']) && !empty($this->request->post['logo_remove'])) {
                //Remove old image if exists
                if (file_exists(DIR_IMAGE . 'sellers_logo/' . $seller['logo'])) {
                    unlink(DIR_IMAGE . 'sellers_logo/' . $seller['logo']);
                }
                $post_data['logo'] = '';
            } else {
                if (isset($this->request->files['logo_file']['name']) && !empty($this->request->files['logo_file']['name'])) {
                    //Remove old image if exists
                    if (file_exists(DIR_IMAGE . 'sellers_logo/' . $seller['logo'])) {
                        unlink(DIR_IMAGE . 'sellers_logo/' . $seller['logo']);
                    }
                    $ext = pathinfo($this->request->files['logo_file']['name'], PATHINFO_EXTENSION);
                    $file = $seller['seller_id'] . '_logo.' . $ext;
                    if (move_uploaded_file($this->request->files['logo_file']['tmp_name'], DIR_IMAGE . 'sellers_logo/' . $file)) {
                        $post_data['logo'] = $file;
                    }
                }
            }
            
            //Check if banner added to upload
            if (isset($this->request->post['banner_remove']) && !empty($this->request->post['banner_remove'])) {
                //Remove old image if exists
                if (file_exists(DIR_IMAGE . 'sellers_banner/' . $seller['banner'])) {
                    unlink(DIR_IMAGE . 'sellers_banner/' . $seller['banner']);
                }
                $post_data['banner'] = '';
            } else {
                if (isset($this->request->files['banner_file']['name']) && !empty($this->request->files['banner_file']['name'])) {
                    //Remove old image if exists
                    if (file_exists(DIR_IMAGE . 'sellers_banner/' . $seller['banner'])) {
                        unlink(DIR_IMAGE . 'sellers_banner/' . $seller['banner']);
                    }
                    $ext = pathinfo($this->request->files['banner_file']['name'], PATHINFO_EXTENSION);
                    $file = $seller['seller_id'] . '_banner.' . $ext;
                    if (move_uploaded_file($this->request->files['banner_file']['tmp_name'], DIR_IMAGE . 'sellers_banner/' . $file)) {
                        $post_data['banner'] = $file;
                    }
                }
            }
            
            $this->model_kbmp_marketplace_kbmp_marketplace->updateSellerProfile($post_data);
            
            $this->session->data['success'] = $this->language->get('text_seller_update_success');
            
            $this->response->redirect($this->url->link('kbmp_marketplace/seller_profile', '', true));
        }
        
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }
        
        if (isset($this->session->data['error'])) {
            $data['error'] = $this->session->data['error'];

            unset($this->session->data['error']);
        } else {
            $data['error'] = '';
        }

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_my_account'] = $this->language->get('text_my_account');

        $data['home_link'] = $this->url->link('common/home');
        $data['account_link'] = $this->url->link('account/account', '', true);
        $data['logout_link'] = $this->url->link('account/logout', '', true);
        
        //Form Labels
        $data['text_general'] = $this->language->get('text_general');
        $data['text_meta_info'] = $this->language->get('text_meta_info');
        $data['text_policy'] = $this->language->get('text_policy');
        $data['text_payout_info'] = $this->language->get('text_payout_info');
        $data['text_view_profile'] = $this->language->get('text_view_profile');
        $data['text_shop_title'] = $this->language->get('text_shop_title');
        $data['text_phone_number'] = $this->language->get('text_phone_number');
        $data['text_business_email'] = $this->language->get('text_business_email');
        $data['text_business_email_both'] = $this->language->get('text_business_email_both');
        $data['text_business_email_primary'] = $this->language->get('text_business_email_primary');
        $data['text_business_email_business'] = $this->language->get('text_business_email_business');
        $data['text_get_notification'] = $this->language->get('text_get_notification');
        $data['text_country'] = $this->language->get('text_country');
        $data['text_select_country'] = $this->language->get('text_select_country');
        $data['text_state'] = $this->language->get('text_state');
        $data['text_select_state'] = $this->language->get('text_select_state');
        $data['text_address'] = $this->language->get('text_address');
        $data['text_description'] = $this->language->get('text_description');
        $data['text_profile_url'] = $this->language->get('text_profile_url');
        $data['text_profile_url_like'] = $this->language->get('text_profile_url_like');
        $data['text_fb_link'] = $this->language->get('text_fb_link');
        $data['text_google_link'] = $this->language->get('text_google_link');
        $data['text_twitter_link'] = $this->language->get('text_twitter_link');
        $data['text_logo'] = $this->language->get('text_logo');
        $data['text_logo_info'] = $this->language->get('text_logo_info');
        $data['text_shop_banner'] = $this->language->get('text_shop_banner');
        $data['text_banner_info'] = $this->language->get('text_banner_info');
        $data['text_meta_keywords'] = $this->language->get('text_meta_keywords');
        $data['text_meta_description'] = $this->language->get('text_meta_description');
        $data['text_return_policy'] = $this->language->get('text_return_policy');
        $data['text_shipping_policy'] = $this->language->get('text_shipping_policy');
        $data['text_select_payout'] = $this->language->get('text_select_payout');
        $data['text_paypal_id'] = $this->language->get('text_paypal_id');
        $data['text_additional_info'] = $this->language->get('text_additional_info');
        $data['text_account_owner'] = $this->language->get('text_account_owner');
        $data['text_details'] = $this->language->get('text_details');
        $data['text_bank_address'] = $this->language->get('text_bank_address');
        $data['text_select_method'] = $this->language->get('text_select_method');
        $data['text_bankwire_method'] = $this->language->get('text_bankwire_method');
        $data['text_paypal_method'] = $this->language->get('text_paypal_method');
        $data['help_text_bank_details'] = $this->language->get('help_text_bank_details');
        
        //Button Text
        $data['button_upload'] = $this->language->get('button_upload');
        $data['button_remove'] = $this->language->get('button_remove');
        $data['button_save'] = $this->language->get('button_save');
        
        //Column Right Text
        $data['text_dashboard'] = $this->language->get('text_dashboard');
        $data['text_seller_profile'] = $this->language->get('text_seller_profile');
        $data['text_seller_products'] = $this->language->get('text_seller_products');
        $data['text_seller_orders'] = $this->language->get('text_seller_orders');
        $data['text_product_reviews'] = $this->language->get('text_product_reviews');
        $data['text_seller_reviews'] = $this->language->get('text_seller_reviews');
        $data['text_seller_earning'] = $this->language->get('text_seller_earning');
        $data['text_seller_transactions'] = $this->language->get('text_seller_transactions');
        $data['text_category_request'] = $this->language->get('text_category_request');
        $data['text_seller_shipping'] = $this->language->get('text_seller_shipping');

        $data['dashboard_link'] = $this->url->link('kbmp_marketplace/dashboard');
        $data['seller_profile_link'] = $this->url->link('kbmp_marketplace/seller_profile');
        $data['products_link'] = $this->url->link('kbmp_marketplace/products');
        $data['orders_link'] = $this->url->link('kbmp_marketplace/orders');
        $data['product_reviews_link'] = $this->url->link('kbmp_marketplace/product_reviews');
        $data['seller_reviews_link'] = $this->url->link('kbmp_marketplace/seller_reviews');
        $data['earning_link'] = $this->url->link('kbmp_marketplace/earning');
        $data['transactions_link'] = $this->url->link('kbmp_marketplace/transactions');
        $data['category_request_link'] = $this->url->link('kbmp_marketplace/category_request');
        $data['shipping_link'] = $this->url->link('kbmp_marketplace/shipping');
        
        $this->load->model('localisation/country');

        $data['countries'] = $this->model_localisation_country->getCountries();
        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();
        
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
        $data['empty_field_lang'] = $this->language->get('empty_field_lang');
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
        $data['policy_error_message'] = $this->language->get('policy_error_message');
        
        //Get Seller Information
        $seller = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        
        if (isset($seller['seller_id']) && !empty($seller['seller_id'])) {
            $this->load->model('tool/image');
            
            //Set Seller Logo
            if (is_file(DIR_IMAGE . 'sellers_logo/' . $seller['logo'])) {
                $seller_logo = $this->model_tool_image->resize('sellers_logo/' . $seller['logo'], 150, 150);
            } else {
                $seller_logo = $this->model_tool_image->resize('no_image.png', 150, 150);
            }
            $data['seller_logo'] = $seller_logo;
            
            //Set Seller Banner
            if (is_file(DIR_IMAGE . 'sellers_banner/' . $seller['banner'])) {
                $seller_banner = $this->model_tool_image->resize('sellers_banner/' . $seller['banner'], 800, 100);
            } else {
                $seller_banner = $this->model_tool_image->resize('no_image.png', 800, 100);
            }
            $data['seller_banner'] = $seller_banner;
            
            $data['seller_details'] = $this->model_kbmp_marketplace_kbmp_marketplace->getSeller($seller['seller_id']);
            $langs = $this->model_localisation_language->getLanguages();
            $id_seller = $seller['seller_id'];
            foreach($langs as $lang){
                $lang_id = $lang['language_id'];
                $sellerDetails = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerbylang($id_seller,$lang_id); 
                
                $data['seller_title'][$lang_id]=$sellerDetails['title'];
                $data['seller_meta_description'][$lang_id]=$sellerDetails['meta_description'];
                $data['seller_description'][$lang_id]=trim($sellerDetails['description']);
                $data['seller_meta_keywords'][$lang_id]=  trim($sellerDetails['meta_keyword']);
                $data['shipping_policy'][$lang_id]=$sellerDetails['shipping_policy'];
                $data['return_policy'][$lang_id]=$sellerDetails['return_policy'];     

            }

            $data['seller_details']['phone_number'] = trim($data['seller_details']['phone_number']);
            $data['seller_details']['address'] = trim($data['seller_details']['phone_number']);
            $data['seller_view_link'] = $this->url->link('kbmp_marketplace/sellers/view', '&seller_id='.$seller['seller_id']);
            
            $data['text_seller_approval_request'] = sprintf($this->language->get('text_seller_approval_request'), $this->url->link('kbmp_marketplace/sellers/approval_request'));
        }

//        $data['footer'] = $this->load->controller('common/footer');
//        $data['header'] = $this->load->controller('common/header');

	$this->load->model('setting/kbmp_marketplace');
        //Get the module configuration values
        $store_id = (int) $this->config->get('config_store_id');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
        $data['kbmp_marketplace_settings'] = $settings;
        $sellerId = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
//        $data['seller_details2'] = $sellerId;

        $this->response->setOutput($this->load->view('kbmp_marketplace/seller_profile', $data));
    }

}
