<?php

class ControllerKbmpMarketplaceAdminCommission extends Controller {

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

    public function index() {
        
        $this->load->language('kbmp_marketplace/admin_commission');
        
        $this->document->setTitle($this->language->get('heading_title'));
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $this->getList();
    }
    
    /*
     * Function definition to get Sellers List
     */

    protected function getList() {
        
        //Get Store Categories List
        $this->load->model('catalog/category');
        $filter_data = array(
            'sort' => 'name',
            'order' => 'ASC'
        );
        $categories = $this->model_catalog_category->getCategories($filter_data);
        foreach ($categories as $categories) {
            $category_list[] = array(
                'category_id' => $categories['category_id'],
                'name'        => strip_tags(html_entity_decode($categories['name'], ENT_QUOTES, 'UTF-8'))
            );
        }
        //End

        if (isset($this->request->get['type'])) {
            $type = $this->request->get['type'];
        } else {
            $type = '';
        }
        
        if (isset($this->request->get['category_id'])) {
            $category_id = $this->request->get['category_id'];
        } else {
            $category_id = '';
        }
        
        if (isset($this->request->get['filter_category'])) {
            $filter_category = $this->request->get['filter_category'];
        } else {
            $filter_category = null;
        }
        
        if (isset($this->request->get['filter_order'])) {
            $filter_order = $this->request->get['filter_order'];
        } else {
            $filter_order = null;
        }
        
        if (isset($this->request->get['filter_seller'])) {
            $filter_seller = $this->request->get['filter_seller'];
        } else {
            $filter_seller = null;
        }
        
        if (isset($this->request->get['filter_email'])) {
            $filter_email = $this->request->get['filter_email'];
        } else {
            $filter_email = null;
        }
        
        if (isset($this->request->get['filter_quantity'])) {
            $filter_quantity = $this->request->get['filter_quantity'];
        } else {
            $filter_quantity = null;
        }
        
        if (isset($this->request->get['filter_total_earning'])) {
            $filter_total_earning = $this->request->get['filter_total_earning'];
        } else {
            $filter_total_earning = null;
        }
        
        if (isset($this->request->get['filter_commission'])) {
            $filter_commission = $this->request->get['filter_commission'];
        } else {
            $filter_commission = null;
        }
        
        if (isset($this->request->get['filter_seller_earning'])) {
            $filter_seller_earning = $this->request->get['filter_seller_earning'];
        } else {
            $filter_seller_earning = null;
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
            $sort = 'ksod.date_added';
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

        if (isset($this->request->get['type'])) {
            $url .= '&type=' . urlencode(html_entity_decode($this->request->get['type'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['category_id'])) {
            $url .= '&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_category'])) {
            $url .= '&filter_category=' . urlencode(html_entity_decode($this->request->get['filter_category'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_order'])) {
            $url .= '&filter_order=' . urlencode(html_entity_decode($this->request->get['filter_order'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_seller'])) {
            $url .= '&filter_seller=' . urlencode(html_entity_decode($this->request->get['filter_seller'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_quantity'])) {
            $url .= '&filter_quantity=' . urlencode(html_entity_decode($this->request->get['filter_quantity'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_total_earning'])) {
            $url .= '&filter_total_earning=' . urlencode(html_entity_decode($this->request->get['filter_total_earning'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_commission'])) {
            $url .= '&filter_commission=' . urlencode(html_entity_decode($this->request->get['filter_commission'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_seller_earning'])) {
            $url .= '&filter_seller_earning=' . urlencode(html_entity_decode($this->request->get['filter_seller_earning'], ENT_QUOTES, 'UTF-8'));
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
        
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_knowband_marketplace'),
            'href' => $this->url->link('extension/module/kbmp_marketplace', $this->session_token_key.'=' . $this->session_token, true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('kbmp_marketplace/admin_commission', $this->session_token_key.'=' . $this->session_token . $url, true)
        );

        $data['admin_commission'] = array();

        $filter_data = array(
            'type'                  => $type,
            'category_id'           => $category_id,
            'categories'            => $category_list,
            'filter_category'       => trim($filter_category),
            'filter_order'          => trim($filter_order),
            'filter_seller'         => trim($filter_seller),
            'filter_email'          => trim($filter_email),
            'filter_quantity'       => trim($filter_quantity),
            'filter_total_earning'  => trim($filter_total_earning),
            'filter_commission'     => trim($filter_commission),
            'filter_seller_earning' => trim($filter_seller_earning),
            'filter_from_date'      => trim($filter_from_date),
            'filter_to_date'        => trim($filter_to_date),
            'sort'                  => $sort,
            'order'                 => $order,
            'start'                 => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'                 => $this->config->get('config_limit_admin')
        );
        
        $data['filter_data'] = $filter_data;

        $admin_commission_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalAdminCommission($filter_data);

        $data['admin_commission_total'] = $admin_commission_total;
        
        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getAdminCommission($filter_data);

        if (isset($type) && !empty($type)) {
            foreach ($results as $result) {

                $data['admin_commission'][] = array(
                    'category' => $result['name'],
                    'quantity' => $result['qty'],
                    'total_earning' => $this->currency->format($result['total_earning']+$result['total_shipping'], $this->config->get('config_currency')),
                    'admin_earning' => $this->currency->format($result['admin_earning'], $this->config->get('config_currency')),
                    'seller_earning' => $this->currency->format($result['seller_earning']+$result['total_shipping'], $this->config->get('config_currency'))
                );
            } 
        } else {
            foreach ($results as $result) {

                $data['admin_commission'][] = array(
                    'order_id' => $result['order_id'],
                    'seller' => $result['title'],
                    'seller_email' => $result['email'],
                    'quantity' => $result['qty'],
                    'total_earning' => $this->currency->format($result['total']+$result['total_shipping'],$this->config->get('config_currency')),
                    'admin_earning' => $this->currency->format($result['admin_earning'],$this->config->get('config_currency')),
                    'seller_earning' => $this->currency->format($result['seller_earning']+$result['total_shipping'], $this->config->get('config_currency')),
                    'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
                );
            }
        }

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
        $data['text_seller_category_request_list'] = $this->language->get('text_seller_category_request_list');
        $data['text_seller_shippings'] = $this->language->get('text_seller_shippings');
        $data['text_admin_commissions'] = $this->language->get('text_admin_commissions');
        $data['text_seller_transactions'] = $this->language->get('text_seller_transactions');
        $data['text_seller_payout_request'] = $this->language->get('text_seller_payout_request');
        $data['text_paypal_payout'] = $this->language->get('text_paypal_payout');
        $data['text_email_templates'] = $this->language->get('text_email_templates');
        $data['text_seller_catgory_commision'] = $this->language->get('text_seller_catgory_commision');
	$data['text_support'] = $this->language->get('text_support');
        $data['token'] = $this->session_token;
        
        $data['view_title'] = $this->language->get('view_title');
        
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_from_date'] = $this->language->get('text_from_date');
        $data['text_to_date'] = $this->language->get('text_to_date');
        $data['text_view'] = $this->language->get('text_view');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_filter'] = $this->language->get('text_filter');
        $data['text_reset'] = $this->language->get('text_reset');
        $data['text_select_type'] = $this->language->get('text_select_type');
        $data['text_select_category'] = $this->language->get('text_select_category');
        $data['text_all_category'] = $this->language->get('text_all_category');
        $data['text_order_wise'] = $this->language->get('text_order_wise');
        $data['text_category_wise'] = $this->language->get('text_category_wise');
        
        $data['column_category'] = $this->language->get('column_category');
        $data['column_order'] = $this->language->get('column_order');
        $data['column_seller'] = $this->language->get('column_seller');
        $data['column_email'] = $this->language->get('column_email');
        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_total_earning'] = $this->language->get('column_total_earning');
        $data['column_admin_earning'] = $this->language->get('column_admin_earning');
        $data['column_seller_earning'] = $this->language->get('column_seller_earning');
        $data['column_date_added'] = $this->language->get('column_date_added');

        $url = '';

        if (isset($this->request->get['type'])) {
            $url .= '&type=' . urlencode(html_entity_decode($this->request->get['type'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['category_id'])) {
            $url .= '&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_category'])) {
            $url .= '&filter_category=' . urlencode(html_entity_decode($this->request->get['filter_category'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_order'])) {
            $url .= '&filter_order=' . urlencode(html_entity_decode($this->request->get['filter_order'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_seller'])) {
            $url .= '&filter_seller=' . urlencode(html_entity_decode($this->request->get['filter_seller'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_quantity'])) {
            $url .= '&filter_quantity=' . urlencode(html_entity_decode($this->request->get['filter_quantity'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_total_earning'])) {
            $url .= '&filter_total_earning=' . urlencode(html_entity_decode($this->request->get['filter_total_earning'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_commission'])) {
            $url .= '&filter_commission=' . urlencode(html_entity_decode($this->request->get['filter_commission'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_seller_earning'])) {
            $url .= '&filter_seller_earning=' . urlencode(html_entity_decode($this->request->get['filter_seller_earning'], ENT_QUOTES, 'UTF-8'));
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
        
        $data['sort_category'] = $this->url->link('kbmp_marketplace/admin_commission', $this->session_token_key.'=' . $this->session_token . '&sort=cd.name' . $url, true);
        $data['sort_order'] = $this->url->link('kbmp_marketplace/admin_commission', $this->session_token_key.'=' . $this->session_token . '&sort=ksod.order_id' . $url, true);
        $data['sort_seller'] = $this->url->link('kbmp_marketplace/admin_commission', $this->session_token_key.'=' . $this->session_token . '&sort=ksd.title' . $url, true);
        $data['sort_email'] = $this->url->link('kbmp_marketplace/admin_commission', $this->session_token_key.'=' . $this->session_token . '&sort=c.email' . $url, true);
        $data['sort_quantity'] = $this->url->link('kbmp_marketplace/admin_commission', $this->session_token_key.'=' . $this->session_token . '&sort=ksod.qty' . $url, true);
        $data['sort_total_earning'] = $this->url->link('kbmp_marketplace/admin_commission', $this->session_token_key.'=' . $this->session_token . '&sort=ksod.total_earning' . $url, true);
        $data['sort_admin_earning'] = $this->url->link('kbmp_marketplace/admin_commission', $this->session_token_key.'=' . $this->session_token . '&sort=ksod.admin_earning' . $url, true);
        $data['sort_seller_earning'] = $this->url->link('kbmp_marketplace/admin_commission', $this->session_token_key.'=' . $this->session_token . '&sort=ksod.seller_earning' . $url, true);
        $data['sort_date_added'] = $this->url->link('kbmp_marketplace/admin_commission', $this->session_token_key.'=' . $this->session_token . '&sort=ksod.date_added' . $url, true);
        
        $url = '';

        if (isset($this->request->get['type'])) {
            $url .= '&type=' . urlencode(html_entity_decode($this->request->get['type'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['category_id'])) {
            $url .= '&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_category'])) {
            $url .= '&filter_category=' . urlencode(html_entity_decode($this->request->get['filter_category'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_order'])) {
            $url .= '&filter_order=' . urlencode(html_entity_decode($this->request->get['filter_order'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_seller'])) {
            $url .= '&filter_seller=' . urlencode(html_entity_decode($this->request->get['filter_seller'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_quantity'])) {
            $url .= '&filter_quantity=' . urlencode(html_entity_decode($this->request->get['filter_quantity'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_total_earning'])) {
            $url .= '&filter_total_earning=' . urlencode(html_entity_decode($this->request->get['filter_total_earning'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_commission'])) {
            $url .= '&filter_commission=' . urlencode(html_entity_decode($this->request->get['filter_commission'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_seller_earning'])) {
            $url .= '&filter_seller_earning=' . urlencode(html_entity_decode($this->request->get['filter_seller_earning'], ENT_QUOTES, 'UTF-8'));
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
        $pagination->total = $admin_commission_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/admin_commission', $this->session_token_key.'=' . $this->session_token . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($admin_commission_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($admin_commission_total - $this->config->get('config_limit_admin'))) ? $admin_commission_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $admin_commission_total, ceil($admin_commission_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('kbmp_marketplace/admin_commission', $data));
    }

}
