<?php

class ControllerKbmpMarketplacesellerCategory extends Controller {

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

    /*
     * Index function to display default page of controller
     */
    public function index() {

        $this->load->language('kbmp_marketplace/seller_category');

        $this->document->setTitle($this->language->get('heading_title'));
        
        $this->load->model('localisation/country');

        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        if (isset($this->request->get['action']) && $this->request->get['action'] =='delete' ) {
            $this->model_kbmp_marketplace_kbmp_marketplace->deleteCategorySeller($this->request->get['seller_id'],$this->request->get['category_id']);
            $this->session->data['success'] = $this->language->get('category_deleted');
        }
        
        $this->getList();
    }

    /*
     * Function definition to get Sellers List
     */

    protected function getList() {
        
        if (isset($this->request->get['filter_firstname'])) {
            $filter_firstname = $this->request->get['filter_firstname'];
        } else {
            $filter_firstname = null;
        }
        
        if (isset($this->request->get['filter_lastname'])) {
            $filter_lastname = $this->request->get['filter_lastname'];
        } else {
            $filter_lastname = null;
        }
        
        if (isset($this->request->get['filter_email'])) {
            $filter_email = $this->request->get['filter_email'];
        } else {
            $filter_email = null;
        }
        
        if (isset($this->request->get['filter_shop'])) {
            $filter_shop = $this->request->get['filter_shop'];
        } else {
            $filter_shop = null;
        }
        
        if (isset($this->request->get['filter_state'])) {
            $filter_state = $this->request->get['filter_state'];
        } else {
            $filter_state = null;
        }
        
        if (isset($this->request->get['filter_country'])) {
            $filter_country = $this->request->get['filter_country'];
        } else {
            $filter_country = null;
        }
        
        if (isset($this->request->get['filter_category'])) {
            $filter_category = $this->request->get['filter_category'];
        } else {
            $filter_category = null;
        }
        
        if (isset($this->request->get['filter_from_date'])) {
            $filter_from_date = $this->request->get['filter_from_date'];
        } else {
            $filter_from_date = null;
        }
        
        if (isset($this->request->get['filter_to_date'])) {
            $filter_to_date = $this->request->get['filter_to_date'];
        } else {
            $filter_to_date = null;
        }
        
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'ks.date_added';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'DESC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['filter_firstname'])) {
            $url .= '&filter_firstname=' . urlencode(html_entity_decode($this->request->get['filter_firstname'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_lastname'])) {
            $url .= '&filter_lastname=' . urlencode(html_entity_decode($this->request->get['filter_lastname'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_shop'])) {
            $url .= '&filter_shop=' . urlencode(html_entity_decode($this->request->get['filter_shop'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_state'])) {
            $url .= '&filter_state=' . urlencode(html_entity_decode($this->request->get['filter_state'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_country'])) {
            $url .= '&filter_country=' . urlencode(html_entity_decode($this->request->get['filter_country'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_category'])) {
            $url .= '&filter_category=' . urlencode(html_entity_decode($this->request->get['filter_category'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date'])) {
            $url .= '&filter_from_date=' . urlencode(html_entity_decode($this->request->get['filter_from_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date'])) {
            $url .= '&filter_to_date=' . urlencode(html_entity_decode($this->request->get['filter_to_date'], ENT_QUOTES, 'UTF-8'));
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
        
        $countries = $this->model_localisation_country->getCountries();
        $data['countries'] = $countries;

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_knowband_marketplace'),
            'href' => $this->url->link('extension/module/kbmp_marketplace', $this->session_token_key.'=' . $this->session_token, true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('kbmp_marketplace/seller_category', $this->session_token_key.'=' . $this->session_token . $url, true)
        );

        $data['sellers'] = array();

        $filter_data = array(
            'filter_firstname'      => trim($filter_firstname),
            'filter_lastname'       => trim($filter_lastname),
            'filter_email'          => trim($filter_email),
            'filter_shop'           => trim($filter_shop),
            'filter_state'          => trim($filter_state),
            'filter_country'        => trim($filter_country),
            'filter_category'         => trim($filter_category),
            'filter_from_date'      => trim($filter_from_date),
            'filter_to_date'        => trim($filter_to_date),
            'sort'                  => $sort,
            'order'                 => $order,
            'start'                 => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'                 => $this->config->get('config_limit_admin')
        );
        
        $data['filter_data'] = $filter_data;

        $sellers_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalCategorySeller($filter_data);

        $data['sellers_total'] = $sellers_total;
        
        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getCategorySeller($filter_data);

        foreach ($results as $result) {
            
            $data['sellers'][] = array(
                'seller_id' => $result['seller_id'],
                'customer_id' => $result['customer_id'],
                'firstname' => $result['firstname'],
                'lastname' => $result['lastname'],
                'email' => $result['email'],
                'shop' => $result['shop'],
                'category_id' => $result['category_id'],
                'country' => $result['country'],
                'commission' => $result['commission'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'edit' => $this->url->link('kbmp_marketplace/seller_category/addCategoryCommission', $this->session_token_key.'=' . $this->session_token . '&seller_id=' . $result['customer_id'].'&category_id='.(int)$result['category_id'].'&commission='.(int)$result['commission'], true),
                'delete' => $this->url->link('kbmp_marketplace/seller_category',  $this->session_token_key.'=' . $this->session_token . '&seller_id=' . $result['customer_id'].'&category_id='.(int)$result['category_id'].'&action=delete', true),
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        //Menu Options Text
        $data['text_delete_message'] = $this->language->get('text_delete_message');
        $data['text_sellers_list'] = $this->language->get('text_sellers_list');
        $data['text_delete'] = $this->language->get('text_delete');
        $data['column_category'] = $this->language->get('column_category');
        $data['column_commission'] = $this->language->get('column_commission');
        $data['text_settings'] = $this->language->get('text_settings');
$data['text_support'] = $this->language->get('text_support');
        $data['text_seller_category'] = $this->language->get('text_seller_category');
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
        $data['text_button_add'] = $this->language->get('text_button_add');
        
        $data['token'] = $this->session_token;
        
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_from_date'] = $this->language->get('text_from_date');
        $data['text_to_date'] = $this->language->get('text_to_date');
        $data['text_view'] = $this->language->get('text_view');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_filter'] = $this->language->get('text_filter');
        $data['text_reset'] = $this->language->get('text_reset');
        $data['text_active'] = $this->language->get('text_active');
        $data['text_inactive'] = $this->language->get('text_inactive');
        
        $data['column_firstname'] = $this->language->get('column_firstname');
        $data['column_lastname'] = $this->language->get('column_lastname');
        $data['column_email'] = $this->language->get('column_email');
        $data['column_shop'] = $this->language->get('column_shop');
        $data['column_state'] = $this->language->get('column_state');
        $data['column_country'] = $this->language->get('column_country');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_seller_since'] = $this->language->get('column_seller_since');
      
        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        }

        $url = '';

        if (isset($this->request->get['filter_firstname'])) {
            $url .= '&filter_firstname=' . urlencode(html_entity_decode($this->request->get['filter_firstname'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_lastname'])) {
            $url .= '&filter_lastname=' . urlencode(html_entity_decode($this->request->get['filter_lastname'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_shop'])) {
            $url .= '&filter_shop=' . urlencode(html_entity_decode($this->request->get['filter_shop'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_state'])) {
            $url .= '&filter_state=' . urlencode(html_entity_decode($this->request->get['filter_state'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_country'])) {
            $url .= '&filter_country=' . urlencode(html_entity_decode($this->request->get['filter_country'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_category'])) {
            $url .= '&filter_category=' . urlencode(html_entity_decode($this->request->get['filter_category'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date'])) {
            $url .= '&filter_from_date=' . urlencode(html_entity_decode($this->request->get['filter_from_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date'])) {
            $url .= '&filter_to_date=' . urlencode(html_entity_decode($this->request->get['filter_to_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        
        $data['sort_firstname'] = $this->url->link('kbmp_marketplace/seller_category', $this->session_token_key.'=' . $this->session_token . '&sort=c.firstname' . $url, true);
        $data['sort_lastname'] = $this->url->link('kbmp_marketplace/seller_category', $this->session_token_key.'=' . $this->session_token . '&sort=c.lastname' . $url, true);
        $data['sort_email'] = $this->url->link('kbmp_marketplace/seller_category', $this->session_token_key.'=' . $this->session_token . '&sort=c.email' . $url, true);
        $data['sort_shop'] = $this->url->link('kbmp_marketplace/seller_category', $this->session_token_key.'=' . $this->session_token . '&sort=ksd.title' . $url, true);
        $data['sort_state'] = $this->url->link('kbmp_marketplace/seller_category', $this->session_token_key.'=' . $this->session_token . '&sort=ks.state' . $url, true);
        $data['sort_country'] = $this->url->link('kbmp_marketplace/seller_category', $this->session_token_key.'=' . $this->session_token . '&sort=ct.name' . $url, true);
        $data['sort_status'] = $this->url->link('kbmp_marketplace/seller_category', $this->session_token_key.'=' . $this->session_token . '&sort=ks.active' . $url, true);
        $data['sort_seller_since'] = $this->url->link('kbmp_marketplace/seller_category', $this->session_token_key.'=' . $this->session_token . '&sort=ks.date_added' . $url, true);
        
        $url = '';

        if (isset($this->request->get['filter_firstname'])) {
            $url .= '&filter_firstname=' . urlencode(html_entity_decode($this->request->get['filter_firstname'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_lastname'])) {
            $url .= '&filter_lastname=' . urlencode(html_entity_decode($this->request->get['filter_lastname'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_shop'])) {
            $url .= '&filter_shop=' . urlencode(html_entity_decode($this->request->get['filter_shop'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_state'])) {
            $url .= '&filter_state=' . urlencode(html_entity_decode($this->request->get['filter_state'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_country'])) {
            $url .= '&filter_country=' . urlencode(html_entity_decode($this->request->get['filter_country'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_category'])) {
            $url .= '&filter_category=' . urlencode(html_entity_decode($this->request->get['filter_category'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date'])) {
            $url .= '&filter_from_date=' . urlencode(html_entity_decode($this->request->get['filter_from_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date'])) {
            $url .= '&filter_to_date=' . urlencode(html_entity_decode($this->request->get['filter_to_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $sellers_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/seller_category', $this->session_token_key.'=' . $this->session_token . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($sellers_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($sellers_total - $this->config->get('config_limit_admin'))) ? $sellers_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $sellers_total, ceil($sellers_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('kbmp_marketplace/seller_category', $data));
    }
    
    
    public function addCategoryCommission() {
        $this->load->language('kbmp_marketplace/seller_category');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('localisation/country');
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $this->load->model('localisation/language');
        $this->load->model('catalog/category');
        $this->load->model('customer/customer');

        if (isset($this->request->get['store_id'])) {
            $store_id = $this->request->get['store_id'];
        } else {
            $store_id = 0;
        }
    if (isset($this->request->get['commission'])) {
        $data['heading_title'] = $this->language->get('edit_rule');  
    }else {
        $data['heading_title'] = $this->language->get('heading_title_add');  
    }
       
        $this->document->setTitle($this->language->get('heading_title_add'));
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_knowband_marketplace'),
            'href' => $this->url->link('extension/module/kbmp_marketplace', $this->session_token_key.'=' . $this->session_token, true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('kbmp_marketplace/seller_category', $this->session_token_key.'=' . $this->session_token , true)
        );

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        }
        
        $data['languages'] = $this->model_localisation_language->getLanguages();
        $data['text_delete_message'] = $this->language->get('text_delete_message');
        $data['text_delete'] = $this->language->get('text_delete');
        $data['column_category'] = $this->language->get('column_category');
        $data['column_commission'] = $this->language->get('column_commission');
        $data['text_settings'] = $this->language->get('text_settings');
        $data['text_seller_category'] = $this->language->get('text_seller_category');
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
        $data['text_button_add'] = $this->language->get('text_button_add');
        $data['text_button_save'] = $this->language->get('text_button_save');
        $data['text_button_cancel'] = $this->language->get('text_button_cancel');
        $data['entry_default_commission'] = $this->language->get('entry_default_commission');  
        $data['entry_seller'] = $this->language->get('entry_seller');
        
        
        $data['token'] = $this->session_token;
        $data['token_key'] = $this->session_token_key;
        $data['text_required'] = $this->language->get('text_required');
        $data['entry_category'] = $this->language->get('entry_category');
        $data['help_category'] = $this->language->get('help_category');

        if (isset($this->request->post['product_category'])) {
            
            foreach($this->request->post['seller_email'] as $seller){
                if ($seller == null) {
                    continue;
                }
                $categories = $this->request->post['product_category'];
                foreach ($categories as $key => $value) {
                    if ($value == null) {
                        continue;
                    }
                    $result = $this->model_kbmp_marketplace_kbmp_marketplace->checkCategory($value, $store_id, $seller,$this->request->post['kb_category_commission']);
                    if ($result['total'] == 0) {
                        $this->model_kbmp_marketplace_kbmp_marketplace->addCategory($value, $store_id, $seller,$this->request->post['kb_category_commission']);
                    } else {
                        $this->model_kbmp_marketplace_kbmp_marketplace->updateCategory($value, $store_id, $seller,$this->request->post['kb_category_commission']);
                    }
                }      
            }
            $this->session->data['success'] = $this->language->get('category_added');
            
            $this->response->redirect($this->url->link('kbmp_marketplace/seller_category', $this->session_token_key . '=' . $this->session_token . '&store_id=' . $store_id, true));
        }
        
        
        if (isset($this->request->get['commission']) && $this->request->get['commission'] != '') {
            $category_info = $this->model_catalog_category->getCategory($this->request->get['category_id']);
            if ($category_info) {
                $data['category'] = array(
                    'category_id' => $category_info['category_id'],
                    'name' => $category_info['name']
                );
            }
            $seller_info = $this->model_customer_customer->getCustomer($this->request->get['seller_id']);
            if ($seller_info) {
                $data['seller_info'] = array(
                    'seller_id' => $this->request->get['seller_id'],
                    'email' => $seller_info['email']
                );
            }
            $data['commission'] = $this->request->get['commission'];
        } else {
            $data['category'] = array(
                'category_id' => '',
                'name' => ''
            );
            $data['seller_info'] = array(
                'seller_id' => '',
                'email' => ''
            );
            $data['commission'] = '';
        }




        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        if (VERSION < '2.2.0') {
            $this->response->setOutput($this->load->view($this->module_path . '/kbshippingtimer/addcategories.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('kbmp_marketplace/addCategoryCommission', $data));
        }
    }
    
    public function autocomplete() {
            $json = array();

            if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_email'])) {
                    if (isset($this->request->get['filter_name'])) {
                            $filter_name = $this->request->get['filter_name'];
                    } else {
                            $filter_name = '';
                    }

                    if (isset($this->request->get['filter_email'])) {
                            $filter_email = $this->request->get['filter_email'];
                    } else {
                            $filter_email = '';
                    }

                     $this->load->model('kbmp_marketplace/kbmp_marketplace');

                    $filter_data = array(
                            'filter_firstname'  => $filter_name,
                            'filter_email' => $filter_email,
                            'start'        => 0,
                            'limit'        => 5
                    );

                    $results = $this->model_kbmp_marketplace_kbmp_marketplace->getSellers($filter_data);

                    foreach ($results as $result) {
                            $json[] = array(
                                    'customer_id'       => $result['customer_id'],
                                    'firstname'         => $result['firstname'],
                                    'email'             => $result['email'],
                            );
                    }
            }

            $sort_order = array();

            foreach ($json as $key => $value) {
                    $sort_order[$key] = $value['firstname'];
            }

            array_multisort($sort_order, SORT_ASC, $json);

            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
    }

}
