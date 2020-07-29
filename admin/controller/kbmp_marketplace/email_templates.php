<?php

class ControllerKbmpMarketplaceEmailTemplates extends Controller {

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

    public function index() {
        
        $this->load->language('kbmp_marketplace/email_templates');
        
        $this->document->setTitle($this->language->get('heading_title'));
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $this->getList();
        
    }
    
    /*
     * Function definition to get Email Templates List
     */

    protected function getList() {
        
        if (isset($this->request->get['filter_email_subject'])) {
            $filter_email_subject = $this->request->get['filter_email_subject'];
        } else {
            $filter_email_subject = null;
        }
        
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'template_id';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';
        
        if (isset($this->request->get['filter_email_subject'])) {
            $url .= '&filter_email_subject=' . urlencode(html_entity_decode($this->request->get['filter_email_subject'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        
        $data['heading_title'] = $this->language->get('heading_title');

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
        
        $data['token'] = $this->session_token;
        
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_view'] = $this->language->get('text_view');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_filter'] = $this->language->get('text_filter');
        $data['text_reset'] = $this->language->get('text_reset');
        
        $data['column_email_subject'] = $this->language->get('column_email_subject');
        $data['column_email_description'] = $this->language->get('column_email_description');
        
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_knowband_marketplace'),
            'href' => $this->url->link('extension/module/kbmp_marketplace', $this->session_token_key.'=' . $this->session_token, true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('kbmp_marketplace/email_templates', $this->session_token_key.'=' . $this->session_token . $url, true)
        );

        $data['sellers_balance_history'] = array();

        $filter_data = array(
            'filter_email_subject'          => trim($filter_email_subject),
            'sort'                          => $sort,
            'order'                         => $order,
            'start'                         => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'                         => $this->config->get('config_limit_admin')
        );
        
        $data['filter_data'] = $filter_data;

        
        $email_templates_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalEmailTemplates($filter_data);

        $data['email_templates_total'] = $email_templates_total;

        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplates($filter_data);
        foreach ($results as $result) {

            $data['email_templates'][] = array(
                'email_subject' => $result['email_subject'],
                'email_description' => $result['email_description'],
                'edit' => $this->url->link('kbmp_marketplace/email_templates/edit', $this->session_token_key.'=' . $this->session_token . '&template_id=' . $result['template_id'], true)
            );
        }

        $url = '';

        if (isset($this->request->get['filter_email_subject'])) {
            $url .= '&filter_email_subject=' . urlencode(html_entity_decode($this->request->get['filter_email_subject'], ENT_QUOTES, 'UTF-8'));
        }
        
        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        
        $data['sort_email_subject'] = $this->url->link('kbmp_marketplace/email_templates', $this->session_token_key.'=' . $this->session_token . '&sort=email_subject' . $url, true);
        $data['sort_email_description'] = $this->url->link('kbmp_marketplace/email_templates', $this->session_token_key.'=' . $this->session_token . '&sort=email_description' . $url, true);
        
        $url = '';

        if (isset($this->request->get['filter_email_subject'])) {
            $url .= '&filter_email_subject=' . urlencode(html_entity_decode($this->request->get['filter_email_subject'], ENT_QUOTES, 'UTF-8'));
        }

        $pagination = new Pagination();
        $pagination->total = $email_templates_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/email_templates', $this->session_token_key.'=' . $this->session_token . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($email_templates_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($email_templates_total - $this->config->get('config_limit_admin'))) ? $email_templates_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $email_templates_total, ceil($email_templates_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('kbmp_marketplace/email_templates', $data));
    }

    public function edit() {
        
        $this->load->language('kbmp_marketplace/common');
        $this->load->language('kbmp_marketplace/email_template_edit');
        
        $this->load->model('localisation/language');
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        //Get All Languages
        $languages = $this->model_localisation_language->getLanguages();
        $data['languages'] = $languages;
        
        $url = '';
        
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_knowband_marketplace'),
            'href' => $this->url->link('extension/module/kbmp_marketplace', $this->session_token_key.'=' . $this->session_token, true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('kbmp_marketplace/email_templates', $this->session_token_key.'=' . $this->session_token . $url, true)
        );
        
        $data['heading_title'] = $this->language->get('heading_title');
        $this->document->setTitle($this->language->get('heading_title'));

        $data['editor_title'] = $this->language->get('editor_title');
        $this->document->setTitle($this->language->get('editor_title'));
        
        //Menu Options Text
        $data['text_seller_catgory_commision'] = $this->language->get('text_seller_catgory_commision');
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
        
        $data['text_subject'] = $this->language->get('text_subject');
        $data['text_email_content'] = $this->language->get('text_email_content');
        $data['text_help'] = $this->language->get('text_help');
        
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
        $data['error_for_language'] = $this->language->get('error_for_language');
        
        $data['button_save'] = $this->language->get('button_save');
        
        $data['action'] = $this->url->link('kbmp_marketplace/email_templates/edit', $this->session_token_key.'=' . $this->session_token . '&template_id=' . $this->request->get['template_id'], true);
        
        //handle Post Request
        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            //Iterate languages to get seller agreement and email template content
            if (isset($languages) && !empty($languages)) {
                foreach ($languages as $language) {
                    $data = array(
                        'template_id' => $this->request->get['template_id'],
                        'language_id' => $language['language_id'],
                        'subject' => addslashes($this->request->post['subject_'.$language['language_id']]),
                        'content' => addslashes($this->request->post['content_'.$language['language_id']]),
                    );
                    if (!$this->model_kbmp_marketplace_kbmp_marketplace->updateEmailTemplate($data)) {
                        $this->error['warning'] = $this->language->get('text_error');
                    }
                }
            }
            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect($this->url->link('kbmp_marketplace/email_templates', $this->session_token_key.'=' . $this->session_token, true));
        }
        
        //Get Email Template details
        if (isset($this->request->get['template_id']) && !empty($this->request->get['template_id'])) {
            $emailTemplateDetails = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate($this->request->get['template_id']);
        }
        
        
        
        
        if (isset($languages) && !empty($languages)) {
            foreach ($languages as $language) {
                //Set Email Subject
                if (isset($this->request->post['subject_'.$language['language_id']])) {
                    $data['email_subject']['subject_'.$language['language_id']] = $this->request->post['subject_'.$language['language_id']];
                } else if (!empty($emailTemplateDetails)) {
                    foreach ($emailTemplateDetails as $emailTemplateDetail) {
                        if ($emailTemplateDetail['language_id'] == $language['language_id']) {
                            $data['email_subject']['subject_'.$language['language_id']] = stripslashes($emailTemplateDetail['email_subject']);
                        }
                    }
                } else {
                    $data['email_subject']['subject_'.$language['language_id']] = '';
                }
                
                //Set Email Content
                if (isset($this->request->post['content_'.$language['language_id']])) {
                    $data['email_template']['content_'.$language['language_id']] = $this->request->post['content_'.$language['language_id']];
                } else if (!empty($emailTemplateDetails)) {
                    foreach ($emailTemplateDetails as $emailTemplateDetail) {
                        if ($emailTemplateDetail['language_id'] == $language['language_id']) {
                            $data['email_template']['content_'.$language['language_id']] = stripslashes($emailTemplateDetail['email_content']);
                        }
                    }
                } else {
                    $data['email_template']['content_'.$language['language_id']] = '';
                }
            }
        }
        
        $data['token'] = $this->session_token;
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        $this->response->setOutput($this->load->view('kbmp_marketplace/email_template_edit', $data));
        
    }

}
