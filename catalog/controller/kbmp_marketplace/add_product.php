<?php

class ControllerKbmpMarketplaceAddProduct extends Controller {

    public function index() {

        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('kbmp_marketplace/add_product', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }
        
        $this->load->language('kbmp_marketplace/common');
        $this->load->language('kbmp_marketplace/add_product');

        $this->document->addStyle('catalog/view/javascript/marketplace/marketplace.css');
        $this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
        $this->document->addStyle('catalog/view/javascript/summernote/summernote.css');
        $this->document->addScript('catalog/view/javascript/summernote/summernote.js');
        $this->document->addScript('catalog/view/javascript/summernote/opencart.js');
        $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
        $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
        $this->document->addScript('catalog/view/javascript/marketplace/validation/marketPlace-validation.js');
        $this->document->addScript('catalog/view/javascript/marketplace/validation/velovalidation.js');
        $this->document->addScript('catalog/view/javascript/marketplace/marketplace-custom.js');

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_my_account'] = $this->language->get('text_my_account');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_account'),
            'href' => $this->url->link('account/account', '', true)
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_current_title'),
            'href' => $this->url->link('common/home')
        );
        
        //Tabs
        $data['tab_information'] = $this->language->get('tab_information');
        $data['tab_data'] = $this->language->get('tab_data');
        $data['tab_links'] = $this->language->get('tab_links');
        $data['tab_attribute'] = $this->language->get('tab_attribute');
        $data['tab_option'] = $this->language->get('tab_option');
        $data['tab_discount'] = $this->language->get('tab_discount');
        $data['tab_special'] = $this->language->get('tab_special');
        $data['tab_images'] = $this->language->get('tab_images');
        $data['tab_custom_fields'] = $this->language->get('tab_custom_fields');
        
        //Text
        $data['text_name'] = $this->language->get('text_name');
        $data['text_description'] = $this->language->get('text_description');
        $data['text_meta_tag_title'] = $this->language->get('text_meta_tag_title');
        $data['text_mata_tag_description'] = $this->language->get('text_mata_tag_description');
        $data['text_mata_tag_keywords'] = $this->language->get('text_mata_tag_keywords');
        $data['text_product_tags'] = $this->language->get('text_product_tags');
        $data['text_model'] = $this->language->get('text_model');
        $data['text_sku'] = $this->language->get('text_sku');
        $data['text_upc'] = $this->language->get('text_upc');
        $data['text_ean'] = $this->language->get('text_ean');
        $data['text_jan'] = $this->language->get('text_jan');
        $data['text_isbn'] = $this->language->get('text_isbn');
        $data['text_mpn'] = $this->language->get('text_mpn');
        $data['text_location'] = $this->language->get('text_location');
        $data['text_price'] = $this->language->get('text_price');
        $data['text_tax_class'] = $this->language->get('text_tax_class');
        $data['text_quantity'] = $this->language->get('text_quantity');
        $data['text_minimum_quantity'] = $this->language->get('text_minimum_quantity');
        $data['text_subtract_stock'] = $this->language->get('text_subtract_stock');
        $data['text_out_of_stock_status'] = $this->language->get('text_out_of_stock_status');
        $data['text_requires_shipping'] = $this->language->get('text_requires_shipping');
        $data['text_image'] = $this->language->get('text_image');
        $data['text_seo_keyword'] = $this->language->get('text_seo_keyword');
        $data['text_date_available'] = $this->language->get('text_date_available');
        $data['text_length'] = $this->language->get('text_length');
        $data['text_width'] = $this->language->get('text_width');
        $data['text_height'] = $this->language->get('text_height');
        $data['text_weight'] = $this->language->get('text_weight');
        $data['text_length_class'] = $this->language->get('text_length_class');
        $data['text_weight_class'] = $this->language->get('text_weight_class');
        $data['text_sort_order'] = $this->language->get('text_sort_order');
        $data['text_manufacturer'] = $this->language->get('text_manufacturer');
        $data['text_categories'] = $this->language->get('text_categories');
        $data['text_filters'] = $this->language->get('text_filters');
        $data['text_downloads'] = $this->language->get('text_downloads');
        $data['text_related_products'] = $this->language->get('text_related_products');
        $data['text_text'] = $this->language->get('text_text');
        $data['text_required'] = $this->language->get('text_required');
        $data['text_add_option'] = $this->language->get('text_add_option');
        $data['text_option_value'] = $this->language->get('text_option_value');
        $data['text_points'] = $this->language->get('text_points');
        $data['text_customer_group'] = $this->language->get('text_customer_group');
        $data['text_priority'] = $this->language->get('text_priority');
        $data['text_date_start'] = $this->language->get('text_date_start');
        $data['text_date_end'] = $this->language->get('text_date_end');
        $data['text_sort_order'] = $this->language->get('text_sort_order');
        $data['text_newly_added_condition'] = $this->language->get('text_newly_added_condition');
        $data['text_enter_text'] = $this->language->get('text_enter_text');
        $data['text_select'] = $this->language->get('text_select');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_from'] = $this->language->get('text_from');
        $data['text_default'] = $this->language->get('text_default');
        $data['text_used_condition'] = $this->language->get('text_used_condition');
        $data['text_add_new_combination'] = $this->language->get('text_add_new_combination');
        
        //Help Text
        $data['help_text_product_tags'] = $this->language->get('help_text_product_tags');
        $data['help_text_sku'] = $this->language->get('help_text_sku');
        $data['help_text_upc'] = $this->language->get('help_text_upc');
        $data['help_text_ean'] = $this->language->get('help_text_ean');
        $data['help_text_jan'] = $this->language->get('help_text_jan');
        $data['help_text_isbn'] = $this->language->get('help_text_isbn');
        $data['help_text_mpn'] = $this->language->get('help_text_mpn');
        $data['help_text_minimum_quantity'] = $this->language->get('help_text_minimum_quantity');
        $data['help_text_out_of_stock'] = $this->language->get('help_text_out_of_stock');
        $data['help_text_seo_keyword'] = $this->language->get('help_text_seo_keyword');
        $data['text_date_available'] = $this->language->get('text_date_available');
        $data['help_text_autocomplete'] = $this->language->get('help_text_autocomplete');
        $data['error_account_warning'] = $this->language->get('error_account_warning');
        $data['text_account_warning'] = $this->language->get('text_account_warning');
        
        $data['button_back'] = $this->language->get('button_back');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_remove'] = $this->language->get('button_remove');
        $data['button_add'] = $this->language->get('button_add');

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
        
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('kbmp_marketplace/add_product', $data));
    }

}
