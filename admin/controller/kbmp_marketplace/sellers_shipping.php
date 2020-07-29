<?php

class ControllerKbmpMarketplaceSellersShipping extends Controller {

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

        $this->load->language('kbmp_marketplace/sellers_shipping');

        $this->document->setTitle($this->language->get('heading_title'));
        
        $this->load->model('localisation/country');

        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $this->getList();
    }

    /*
     * Function definition to get Sellers List
     */

    protected function getList() {
        
        if (isset($this->request->get['filter_seller'])) {
            $filter_seller = $this->request->get['filter_seller'];
        } else {
            $filter_seller = null;
        }
        
        if (isset($this->request->get['filter_zone'])) {
            $filter_zone = $this->request->get['filter_zone'];
        } else {
            $filter_zone = null;
        }
        
        if (isset($this->request->get['filter_weight_from'])) {
            $filter_weight_from = $this->request->get['filter_weight_from'];
        } else {
            $filter_weight_from = null;
        }
        
        if (isset($this->request->get['filter_weight_to'])) {
            $filter_weight_to = $this->request->get['filter_weight_to'];
        } else {
            $filter_weight_to = null;
        }
        
        if (isset($this->request->get['filter_rate'])) {
            $filter_rate = $this->request->get['filter_rate'];
        } else {
            $filter_rate = null;
        }
        
        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
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
            $sort = 'kss.date_added';
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

        if (isset($this->request->get['filter_seller'])) {
            $url .= '&filter_seller=' . urlencode(html_entity_decode($this->request->get['filter_seller'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_zone'])) {
            $url .= '&filter_zone=' . urlencode(html_entity_decode($this->request->get['filter_zone'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_weight_from'])) {
            $url .= '&filter_weight_from=' . urlencode(html_entity_decode($this->request->get['filter_weight_from'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_weight_to'])) {
            $url .= '&filter_weight_to=' . urlencode(html_entity_decode($this->request->get['filter_weight_to'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_rate'])) {
            $url .= '&filter_rate=' . urlencode(html_entity_decode($this->request->get['filter_rate'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
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
            'href' => $this->url->link('kbmp_marketplace/sellers_shipping', $this->session_token_key.'=' . $this->session_token . $url, true)
        );

        $data['sellers_shipping'] = array();

        $filter_data = array(
            'filter_seller'         => trim($filter_seller),
            'filter_zone'           => trim($filter_zone),
            'filter_weight_from'    => trim($filter_weight_from),
            'filter_weight_to'      => trim($filter_weight_to),
            'filter_rate'           => trim($filter_rate),
            'filter_status'         => trim($filter_status),
            'filter_from_date'      => trim($filter_from_date),
            'filter_to_date'        => trim($filter_to_date),
            'sort'                  => $sort,
            'order'                 => $order,
            'start'                 => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'                 => $this->config->get('config_limit_admin')
        );
        
        $data['filter_data'] = $filter_data;

        $sellers_shipping_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellersShipping($filter_data);

        $data['sellers_shipping_total'] = $sellers_shipping_total;
        
        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getSellersShipping($filter_data);

        foreach ($results as $result) {
            
            $data['sellers_shipping'][] = array(
                'title' => $result['title'],
                'name' => $result['name'],
                'weight_from' => $result['weight_from'],
                'weight_to' => $result['weight_to'],
                'rate' => $result['rate'],
                'status' => $result['status'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
            );
        }

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
        $data['token'] = $this->session_token;
        
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_from_date'] = $this->language->get('text_from_date');
        $data['text_to_date'] = $this->language->get('text_to_date');
        $data['text_filter'] = $this->language->get('text_filter');
        $data['text_reset'] = $this->language->get('text_reset');
        $data['text_active'] = $this->language->get('text_active');
        $data['text_inactive'] = $this->language->get('text_inactive');
        
        $data['column_seller'] = $this->language->get('column_seller');
        $data['column_zone'] = $this->language->get('column_zone');
        $data['column_weight_from'] = $this->language->get('column_weight_from');
        $data['column_weight_to'] = $this->language->get('column_weight_to');
        $data['column_rate'] = $this->language->get('column_rate');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_date_added'] = $this->language->get('column_date_added');

        $url = '';

        if (isset($this->request->get['filter_seller'])) {
            $url .= '&filter_seller=' . urlencode(html_entity_decode($this->request->get['filter_seller'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_zone'])) {
            $url .= '&filter_zone=' . urlencode(html_entity_decode($this->request->get['filter_zone'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_weight_from'])) {
            $url .= '&filter_weight_from=' . urlencode(html_entity_decode($this->request->get['filter_weight_from'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_weight_to'])) {
            $url .= '&filter_weight_to=' . urlencode(html_entity_decode($this->request->get['filter_weight_to'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_rate'])) {
            $url .= '&filter_rate=' . urlencode(html_entity_decode($this->request->get['filter_rate'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
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
        
        $data['sort_seller'] = $this->url->link('kbmp_marketplace/sellers_shipping', $this->session_token_key.'=' . $this->session_token . '&sort=ksd.title' . $url, true);
        $data['sort_zone'] = $this->url->link('kbmp_marketplace/sellers_shipping', $this->session_token_key.'=' . $this->session_token . '&sort=gz.name' . $url, true);
        $data['sort_weight_from'] = $this->url->link('kbmp_marketplace/sellers_shipping', $this->session_token_key.'=' . $this->session_token . '&sort=kss.weight_from' . $url, true);
        $data['sort_weight_to'] = $this->url->link('kbmp_marketplace/sellers_shipping', $this->session_token_key.'=' . $this->session_token . '&sort=kss.weight_to' . $url, true);
        $data['sort_rate'] = $this->url->link('kbmp_marketplace/sellers_shipping', $this->session_token_key.'=' . $this->session_token . '&sort=kss.rate' . $url, true);
        $data['sort_status'] = $this->url->link('kbmp_marketplace/sellers_shipping', $this->session_token_key.'=' . $this->session_token . '&sort=kss.status' . $url, true);
        $data['sort_date_added'] = $this->url->link('kbmp_marketplace/sellers_shipping', $this->session_token_key.'=' . $this->session_token . '&sort=kss.date_added' . $url, true);
        
        $url = '';

        if (isset($this->request->get['filter_seller'])) {
            $url .= '&filter_seller=' . urlencode(html_entity_decode($this->request->get['filter_seller'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_zone'])) {
            $url .= '&filter_zone=' . urlencode(html_entity_decode($this->request->get['filter_zone'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_weight_from'])) {
            $url .= '&filter_weight_from=' . urlencode(html_entity_decode($this->request->get['filter_weight_from'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_weight_to'])) {
            $url .= '&filter_weight_to=' . urlencode(html_entity_decode($this->request->get['filter_weight_to'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_rate'])) {
            $url .= '&filter_rate=' . urlencode(html_entity_decode($this->request->get['filter_rate'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
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
        $pagination->total = $sellers_shipping_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/sellers_shipping', $this->session_token_key.'=' . $this->session_token . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($sellers_shipping_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($sellers_shipping_total - $this->config->get('config_limit_admin'))) ? $sellers_shipping_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $sellers_shipping_total, ceil($sellers_shipping_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('kbmp_marketplace/sellers_shipping', $data));
    }

}
