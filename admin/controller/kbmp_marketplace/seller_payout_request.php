<?php
require DIR_SYSTEM.'library/kbmp_marketplace/paypal/autoload.php';

use PayPal\Api;
use PayPal\Rest\ApiContext;

class ControllerKbmpMarketplaceSellerPayoutRequest extends Controller {

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

        $this->load->language('kbmp_marketplace/seller_payout_request');

        $this->document->setTitle($this->language->get('heading_title'));
        
        $this->load->model('localisation/country');

        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $this->getList();
    }

    /*
     * Function definition to get Sellers List
     */

    protected function getList() {
        
        if(isset($this->session->data['error']) && $this->session->data['error'] !=''){
            $data['error'] = $this->session->data['error'];
            unset($this->session->data['error']);
        }else{
            $data['error'] = '';
        }
        if (isset($this->request->get['filter_name'])) {
            $filter_name = $this->request->get['filter_name'];
        } else {
            $filter_name = null;
        }
        
        if (isset($this->request->get['filter_email'])) {
            $filter_email = $this->request->get['filter_email'];
        } else {
            $filter_email = null;
        }
        
        if (isset($this->request->get['filter_comment'])) {
            $filter_comment = $this->request->get['filter_comment'];
        } else {
            $filter_comment = null;
        }
        
        if (isset($this->request->get['filter_amount'])) {
            $filter_amount = $this->request->get['filter_amount'];
        } else {
            $filter_amount = null;
        }
        
        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
        }
        
        if (isset($this->request->get['filter_date'])) {
            $filter_date = $this->request->get['filter_date'];
        } else {
            $filter_date = null;
        }
        
        if (isset($this->request->get['filter_to_date'])) {
            $filter_to_date = $this->request->get['filter_to_date'];
        } else {
            $filter_to_date = null;
        }
        
        if (isset($this->request->get['filter_from_date'])) {
            $filter_from_date = $this->request->get['filter_from_date'];
        } else {
            $filter_from_date = null;
        }
        
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'id';
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

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_amount'])) {
            $url .= '&filter_amount=' . urlencode(html_entity_decode($this->request->get['filter_amount'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_date=' . urlencode(html_entity_decode($this->request->get['filter_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_comment'])) {
            $url .= '&filter_comment=' . urlencode(html_entity_decode($this->request->get['filter_comment'], ENT_QUOTES, 'UTF-8'));
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
            'href' => $this->url->link('kbmp_marketplace/seller_payout_request', $this->session_token_key.'=' . $this->session_token . $url, true)
        );

        $data['sellers'] = array();

        $filter_data = array(
            'filter_email'      => trim($filter_email),
            'filter_name'       => trim($filter_name),
            'filter_to_date'          => trim($filter_to_date),
            'filter_from_date'          => trim($filter_from_date),
            'filter_amount'           => trim($filter_amount),
            'filter_status'          => trim($filter_status),
            'filter_comment'          => trim($filter_comment),
            'sort'                  => $sort,
            'order'                 => $order,
            'start'                 => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'                 => $this->config->get('config_limit_admin')
        );
        
        $data['filter_data'] = $filter_data;

        $this->load->model('localisation/zone');
        $sellers_request = $this->model_kbmp_marketplace_kbmp_marketplace->getSellersPayoutRequest($filter_data);
//        var_dump($sellers_request);die;
        
        $filter_data = array(
            'sort'                  => $sort,
            'order'                 => $order,
            'start'                 => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'                 => $this->config->get('config_limit_admin')
        );
        $sellers_request_total = count($this->model_kbmp_marketplace_kbmp_marketplace->getSellersPayoutRequest($filter_data));
        $data['sellers_request_total'] = $sellers_request_total;
        
        foreach ($sellers_request as $result) {
            if($result['status'] == '0'){
                $status = $this->language->get('text_waiting_for_approval');
            }else if($result['status'] == '1'){
                $status = $this->language->get('text_approved');
            }else{
                $status = $this->language->get('text_disapproved');
            }
//            var_dump($sellers_request);die;
            $data['sellers_request'][] = array(
                'name' => $result['firstname'].' '.$result['lastname'],
                'id' => $result['id'],
                'seller_id' => $result['seller_id'],
                'email' => $result['email'],
                'amount_value' => $result['amount'],
                'amount' => $this->currency->format($result['amount'], $this->config->get('config_currency')),
                'comment' => $result['comment'],
                'approve_link' => $this->url->link('kbmp_marketplace/seller_payout_request/approve&id='.$result['id'], $this->session_token_key.'=' . $this->session_token . $url, true),
                'disapprove_link' => $this->url->link('kbmp_marketplace/seller_payout_request/disapprove&id='.$result['id'], $this->session_token_key.'=' . $this->session_token . $url, true),
                'status' => $status,
                'status_value' => $result['status'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'payout_type' => $result['payout_type'],
                'paypal_id' => $result['paypal_id'],
                'paypal_additional_info' => $result['paypal_additional_info'],
                'bankwire_additional_info' => $result['bankwire_additional_info'],
                'bankwire_bank_address' => $result['bankwire_bank_address'],
                'bankwire_bank_details' => $result['bankwire_bank_details'],
                'bankwire_account_info' => $result['bankwire_account_info'],
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        //Menu Options Text
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
        $data['text_waiting_for_approval'] = $this->language->get('text_waiting_for_approval');
        $data['text_approved'] = $this->language->get('text_approved');
        $data['text_approve'] = $this->language->get('text_approve');
        $data['text_disapproved'] = $this->language->get('text_disapproved');
        $data['text_disapprove'] = $this->language->get('text_disapprove');
        $data['error_empty_field'] = $this->language->get('error_empty_field');
        $data['text_seller_catgory_commision'] = $this->language->get('text_seller_catgory_commision');
        
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
        $data['text_name'] = $this->language->get('text_name');
        $data['text_email'] = $this->language->get('text_email');
        $data['text_amount'] = $this->language->get('text_amount');
        $data['text_status'] = $this->language->get('text_status');
        $data['text_id'] = $this->language->get('text_id');
        $data['text_transaction_date'] = $this->language->get('text_transaction_date');
        $data['text_comment'] = $this->language->get('text_comment');
        $data['text_payout_transaction_request'] = $this->language->get('text_payout_transaction_request');
        $data['text_payout_requested_details'] = $this->language->get('text_payout_requested_details');
        $data['text_payment_information'] = $this->language->get('text_payment_information');
        $data['text_payment_methhod'] = $this->language->get('text_payment_methhod');
        $data['text_owner_name'] = $this->language->get('text_owner_name');
        $data['text_additional_info'] = $this->language->get('text_additional_info');
        $data['text_transaction'] = $this->language->get('text_transaction');
        $data['text_transaction_id'] = $this->language->get('text_transaction_id');
        $data['text_cancel'] = $this->language->get('text_cancel');
        $data['text_submit'] = $this->language->get('text_submit');
        $data['text_address'] = $this->language->get('text_address');
        $data['text_details'] = $this->language->get('text_details');
        $data['text_paypal_id'] = $this->language->get('text_paypal_id');
        
        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_amount'])) {
            $url .= '&filter_amount=' . urlencode(html_entity_decode($this->request->get['filter_amount'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date'])) {
            $url .= '&filter_to_date=' . urlencode(html_entity_decode($this->request->get['filter_to_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date'])) {
            $url .= '&filter_from_date=' . urlencode(html_entity_decode($this->request->get['filter_from_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_comment'])) {
            $url .= '&filter_comment=' . urlencode(html_entity_decode($this->request->get['filter_comment'], ENT_QUOTES, 'UTF-8'));
        }
        
        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        
        $data['sort_id'] = $this->url->link('kbmp_marketplace/seller_payout_request', $this->session_token_key.'=' . $this->session_token . '&sort=sp.id' . $url, true);
        $data['sort_name'] = $this->url->link('kbmp_marketplace/seller_payout_request', $this->session_token_key.'=' . $this->session_token . '&sort=c.firstname' . $url, true);
        $data['sort_status'] = $this->url->link('kbmp_marketplace/seller_payout_request', $this->session_token_key.'=' . $this->session_token . '&sort=sp.status' . $url, true);
        $data['sort_email'] = $this->url->link('kbmp_marketplace/seller_payout_request', $this->session_token_key.'=' . $this->session_token . '&sort=c.email' . $url, true);
        $data['sort_comment'] = $this->url->link('kbmp_marketplace/seller_payout_request', $this->session_token_key.'=' . $this->session_token . '&sort=sp.comment' . $url, true);
        $data['sort_amount'] = $this->url->link('kbmp_marketplace/seller_payout_request', $this->session_token_key.'=' . $this->session_token . '&sort=sp.amount' . $url, true);
        $data['sort_date'] = $this->url->link('kbmp_marketplace/seller_payout_request', $this->session_token_key.'=' . $this->session_token . '&sort=sp.date_added' . $url, true);
        
        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date'])) {
            $url .= '&filter_to_date=' . urlencode(html_entity_decode($this->request->get['filter_to_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date'])) {
            $url .= '&filter_from_date=' . urlencode(html_entity_decode($this->request->get['filter_from_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_comment'])) {
            $url .= '&filter_comment=' . urlencode(html_entity_decode($this->request->get['filter_comment'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_amount'])) {
            $url .= '&filter_amount=' . urlencode(html_entity_decode($this->request->get['filter_amount'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $sellers_request_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/seller_payout_request', $this->session_token_key.'=' . $this->session_token . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($sellers_request_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($sellers_request_total - $this->config->get('config_limit_admin'))) ? $sellers_request_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $sellers_request_total, ceil($sellers_request_total / $this->config->get('config_limit_admin')));

        $data['filter_name'] = $filter_name;
        $data['filter_amount'] = $filter_amount;
        $data['filter_status'] = $filter_status;
        $data['filter_comment'] = $filter_comment;
        $data['filter_email'] = $filter_email;
        $data['filter_from_date'] = $filter_from_date;
        $data['filter_to_date'] = $filter_to_date;
        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('kbmp_marketplace/seller_payout_request', $data));
    }
    public function approve() {
//        var_dump($this->request->post);die;
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        if(isset($this->request->post['id']) && $this->request->post['id'] != ''){
            if($this->request->post['transaction_type'] == 'paypal'){
                $result = $this->payPaypal($this->request->post);
                if(isset($result['transaction_status']) && isset($result['transaction_id'])){
                    $transaction_id = $result['transaction_id'];
                }else if(isset($result['transaction_status'])){
                    $error = $this->language->get('error_transaction_failed');
                }else{
                    $error = $result;
                }
                if(isset($transaction_id)){
                    $this->request->post['transaction_id'] = $transaction_id;
                    $this->model_kbmp_marketplace_kbmp_marketplace->payoutApproove($this->request->post);
                }else{
                    if($error == 'error_setting'){
                        $this->session->data['error'] = $this->language->get('error_paypal_creadentials');
                    }else if($error == 'error_paypal_disabled'){
                        $this->session->data['error'] = $this->language->get('error_paypal_disabled');
                    }else if($error == 'error'){
                        $this->session->data['error'] = $this->language->get('error_paypal_unknown');
                    }else{
                        $this->session->data['error'] = $error;
                    }
                }
            }else{
                $this->model_kbmp_marketplace_kbmp_marketplace->payoutApproove($this->request->post);
            }
        }
        $this->response->redirect($this->url->link('kbmp_marketplace/seller_payout_request',$this->session_token_key.'=' . $this->session_token,true));
    }
    public function disapprove() {
//        var_dump($this->request->post);die;
        if(isset($this->request->post['id']) && $this->request->post['id'] != ''){
            $this->load->model('kbmp_marketplace/kbmp_marketplace');
            $this->model_kbmp_marketplace_kbmp_marketplace->payoutDisapproove($this->request->post);
        }
        $this->response->redirect($this->url->link('kbmp_marketplace/seller_payout_request',$this->session_token_key.'=' . $this->session_token,true));
    }
    public function payPaypal($data = array()) {
        $this->load->language('kbmp_marketplace/seller_payout_request');
        $this->load->model('setting/kbmp_marketplace');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $this->config->get('config_store_id'));

        if (isset($settings['kbmp_marketplace_paypal_settings']['enable']) && $settings['kbmp_marketplace_paypal_settings']['enable']) {
            $client_id = $settings['kbmp_marketplace_paypal_settings']['client_id'];
            $client_secret = $settings['kbmp_marketplace_paypal_settings']['client_secret'];
            $subject = $settings['kbmp_marketplace_paypal_settings']['subject'];
            $currency = $settings['kbmp_marketplace_paypal_settings']['currency'];
        }else if (isset($settings['kbmp_marketplace_paypal_settings']['enable']) && $settings['kbmp_marketplace_paypal_settings']['enable'] == '0') {
            return 'error_paypal_disabled';
        }else{
            return 'error_setting';
        }
        
        $amount = $data['amount_value'];
        
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);
        
        $apiContext = new \PayPal\Rest\ApiContext(
                new \PayPal\Auth\OAuthTokenCredential(
                    $client_id,     // ClientID
                    $client_secret      // ClientSecret
                )
        );
//        $apiContext->setConfig([
//            'mode'=>'sandbox',
//            'http.ConnectionTimeOut'=>30,
//            'log.LogEnabled'=>false,
//            'log.FileName'=>'',
//            'log.LogLevel'=>'FINE',
//            'validation.level'=>'log'
//        ]);
        $payouts = new \PayPal\Api\Payout();


        $senderBatchHeader = new \PayPal\Api\PayoutSenderBatchHeader();
        $senderBatchHeader->setSenderBatchId(uniqid())->setEmailSubject($subject);

        $senderItem = new \PayPal\Api\PayoutItem();

        $senderItem->setRecipientType('Email')
            ->setNote($data['transaction_comment'])
            ->setReceiver($data['paypal_id'])
            ->setSenderItemId($data['id'])
            ->setAmount(new \PayPal\Api\Currency('{
                        "value":"'.$amount.'",
                        "currency":"'.$currency.'"
                    }'));

        $payouts->setSenderBatchHeader($senderBatchHeader)->addItem($senderItem);
        $request = clone $payouts;
        try {
            $output = $payouts->createSynchronous($apiContext);
            $s =(array)$output;
            $error = $s["\0" . 'PayPal\Common\PayPalModel' . "\0" . '_propMap'];
            $a = (array)$error['items'][0];
            $transaction_data = $a["\0" . 'PayPal\Common\PayPalModel' . "\0" . '_propMap'];
            return $transaction_data;

        } catch (Exception $ex) {
            $s =(array)$ex;
            $error = json_decode($s["\0" . 'PayPal\Exception\PayPalConnectionException' . "\0" . 'data'], true);
            if(!isset($error['message'])){
                $error['message'] = 'error';
            }
            if(isset($error['details'])){
                foreach ($error['details'] as $key => $value) {
                    $error['message'] .= '</br>'.$value['issue'];
                }
            }
            return $error['message'];
        }
    }
}
