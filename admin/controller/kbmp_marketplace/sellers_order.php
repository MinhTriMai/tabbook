<?php

class ControllerKbmpMarketplaceSellersOrder extends Controller {

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
        
        $this->load->language('kbmp_marketplace/sellers_order');
        
        $this->document->setTitle($this->language->get('heading_title'));
        
        $this->load->model('localisation/order_status');

        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $this->getList();
        
    }
    
    /*
     * Function definition to get Sellers Orders List
     */

    protected function getList() {
        
        if (isset($this->request->get['filter_order'])) {
            $filter_order = $this->request->get['filter_order'];
        } else {
            $filter_order = null;
        }
        
        if (isset($this->request->get['filter_customer'])) {
            $filter_customer = $this->request->get['filter_customer'];
        } else {
            $filter_customer = null;
        }
        
        if (isset($this->request->get['filter_seller_email'])) {
            $filter_seller_email = $this->request->get['filter_seller_email'];
        } else {
            $filter_seller_email = null;
        }
        
        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
        }
        
        if (isset($this->request->get['filter_total'])) {
            $filter_total = $this->request->get['filter_total'];
        } else {
            $filter_total = null;
        }
        
        if (isset($this->request->get['filter_from_date_added'])) {
            $filter_from_date_added = $this->request->get['filter_from_date_added'];
        } else {
            $filter_from_date_added = null;
        }
        
        if (isset($this->request->get['filter_to_date_added'])) {
            $filter_to_date_added = $this->request->get['filter_to_date_added'];
        } else {
            $filter_to_date_added = null;
        }
        
        if (isset($this->request->get['filter_from_date_updated'])) {
            $filter_from_date_updated = $this->request->get['filter_from_date_updated'];
        } else {
            $filter_from_date_updated = null;
        }
        
        if (isset($this->request->get['filter_to_date_updated'])) {
            $filter_to_date_updated = $this->request->get['filter_to_date_updated'];
        } else {
            $filter_to_date_updated = null;
        }
        
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'ksod.date_updated';
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

        if (isset($this->request->get['filter_order'])) {
            $url .= '&filter_order=' . urlencode(html_entity_decode($this->request->get['filter_order'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_customer'])) {
            $url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_seller_email'])) {
            $url .= '&filter_seller_email=' . urlencode(html_entity_decode($this->request->get['filter_seller_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_total'])) {
            $url .= '&filter_total=' . urlencode(html_entity_decode($this->request->get['filter_total'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date_added'])) {
            $url .= '&filter_from_date_added=' . urlencode(html_entity_decode($this->request->get['filter_from_date_added'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date_added'])) {
            $url .= '&filter_to_date_added=' . urlencode(html_entity_decode($this->request->get['filter_to_date_added'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date_updated'])) {
            $url .= '&filter_from_date_updated=' . urlencode(html_entity_decode($this->request->get['filter_from_date_updated'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date_updated'])) {
            $url .= '&filter_to_date_updated=' . urlencode(html_entity_decode($this->request->get['filter_to_date_updated'], ENT_QUOTES, 'UTF-8'));
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
            'href' => $this->url->link('kbmp_marketplace/sellers_order', $this->session_token_key.'=' . $this->session_token . $url, true)
        );
        
        $order_statuses = $this->model_localisation_order_status->getOrderStatuses();
        $data['statuses'] = $order_statuses;

        $data['sellers'] = array();

        $filter_data = array(
            'filter_order'              => trim($filter_order),
            'filter_customer'           => trim($filter_customer),
            'filter_seller_email'       => trim($filter_seller_email),
            'filter_status'             => trim($filter_status),
            'filter_total'              => trim($filter_total),
            'filter_from_date_added'    => trim($filter_from_date_added),
            'filter_to_date_added'      => trim($filter_to_date_added),
            'filter_from_date_updated'  => trim($filter_from_date_updated),
            'filter_to_date_updated'    => trim($filter_to_date_updated),
            'sort'                      => $sort,
            'order'                     => $order,
            'start'                     => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'                     => $this->config->get('config_limit_admin')
        );
        
        $data['filter_data'] = $filter_data;

        $sellers_order_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellersOrders($filter_data);

        $data['sellers_order_total'] = $sellers_order_total;
        
        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getSellersOrders($filter_data);

        foreach ($results as $result) {
            
            $data['sellers_order'][] = array(
                'order_id' => $result['order_id'],
                'customer_name' => $result['firstname'] . ' ' . $result['lastname'],
                'seller_email' => $result['email'],
                'status' => $result['name'],
                'total' => $this->currency->format($result['total']+$result['total_shipping'],$this->config->get('config_currency')),
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'date_modified' => date($this->language->get('date_format_short'), strtotime($result['date_modified'])),
                'view' => $this->url->link('sale/order/info', $this->session_token_key.'=' . $this->session_token . '&order_id=' . $result['order_id'], true),
                'edit' => $this->url->link('sale/order/edit', $this->session_token_key.'=' . $this->session_token . '&order_id=' . $result['order_id'], true)
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        //Menu Options Text
        $data['text_seller_catgory_commision'] = $this->language->get('text_seller_catgory_commision');
        $data['text_settings'] = $this->language->get('text_settings');
$data['text_support'] = $this->language->get('text_support');
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
        
        $data['token'] = $this->session_token;
        
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_from_date'] = $this->language->get('text_from_date');
        $data['text_to_date'] = $this->language->get('text_to_date');
        $data['text_view'] = $this->language->get('text_view');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_filter'] = $this->language->get('text_filter');
        $data['text_reset'] = $this->language->get('text_reset');
        
        $data['column_order_id'] = $this->language->get('column_order_id');
        $data['column_customer_name'] = $this->language->get('column_customer_name');
        $data['column_seller_email'] = $this->language->get('column_seller_email');
        $data['column_total'] = $this->language->get('column_total');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_date_updated'] = $this->language->get('column_date_updated');

        $url = '';

        if (isset($this->request->get['filter_order'])) {
            $url .= '&filter_order=' . urlencode(html_entity_decode($this->request->get['filter_order'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_customer'])) {
            $url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_seller_email'])) {
            $url .= '&filter_seller_email=' . urlencode(html_entity_decode($this->request->get['filter_seller_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_total'])) {
            $url .= '&filter_total=' . urlencode(html_entity_decode($this->request->get['filter_total'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date_added'])) {
            $url .= '&filter_from_date_added=' . urlencode(html_entity_decode($this->request->get['filter_from_date_added'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date_added'])) {
            $url .= '&filter_to_date_added=' . urlencode(html_entity_decode($this->request->get['filter_to_date_added'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date_updated'])) {
            $url .= '&filter_from_date_updated=' . urlencode(html_entity_decode($this->request->get['filter_from_date_updated'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date_updated'])) {
            $url .= '&filter_from_date_updated=' . urlencode(html_entity_decode($this->request->get['filter_from_date_updated'], ENT_QUOTES, 'UTF-8'));
        }
        
        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        
        $data['sort_order_id'] = $this->url->link('kbmp_marketplace/sellers_order', $this->session_token_key.'=' . $this->session_token . '&sort=o.order_id' . $url, true);
        $data['sort_customer'] = $this->url->link('kbmp_marketplace/sellers_order', $this->session_token_key.'=' . $this->session_token . '&sort=o.firstname' . $url, true);
        $data['sort_seller_email'] = $this->url->link('kbmp_marketplace/sellers_order', $this->session_token_key.'=' . $this->session_token . '&sort=c.email' . $url, true);
        $data['sort_status'] = $this->url->link('kbmp_marketplace/sellers_order', $this->session_token_key.'=' . $this->session_token . '&sort=os.name' . $url, true);
        $data['sort_total'] = $this->url->link('kbmp_marketplace/sellers_order', $this->session_token_key.'=' . $this->session_token . '&sort=o.total' . $url, true);
        $data['sort_date_added'] = $this->url->link('kbmp_marketplace/sellers_order', $this->session_token_key.'=' . $this->session_token . '&sort=o.date_added' . $url, true);
        $data['sort_date_updated'] = $this->url->link('kbmp_marketplace/sellers_order', $this->session_token_key.'=' . $this->session_token . '&sort=o.date_mmodified' . $url, true);
        
        $url = '';

        if (isset($this->request->get['filter_order'])) {
            $url .= '&filter_order=' . urlencode(html_entity_decode($this->request->get['filter_order'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_customer'])) {
            $url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_seller_email'])) {
            $url .= '&filter_seller_email=' . urlencode(html_entity_decode($this->request->get['filter_seller_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_total'])) {
            $url .= '&filter_total=' . urlencode(html_entity_decode($this->request->get['filter_total'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date_added'])) {
            $url .= '&filter_from_date_added=' . urlencode(html_entity_decode($this->request->get['filter_from_date_added'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date_added'])) {
            $url .= '&filter_to_date_added=' . urlencode(html_entity_decode($this->request->get['filter_to_date_added'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date_updated'])) {
            $url .= '&filter_from_date_updated=' . urlencode(html_entity_decode($this->request->get['filter_from_date_updated'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date_updated'])) {
            $url .= '&filter_to_date_updated=' . urlencode(html_entity_decode($this->request->get['filter_to_date_updated'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $sellers_order_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/sellers_order', $this->session_token_key.'=' . $this->session_token . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($sellers_order_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($sellers_order_total - $this->config->get('config_limit_admin'))) ? $sellers_order_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $sellers_order_total, ceil($sellers_order_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('kbmp_marketplace/sellers_order', $data));
    }

}
