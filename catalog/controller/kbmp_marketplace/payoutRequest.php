<?php

class ControllerKbmpMarketplacePayoutRequest extends Controller {

    private $error = array();

    public function index() {
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('kbmp_marketplace/payoutRequest', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }
        $this->load->language('kbmp_marketplace/payoutRequest');
        $this->load->language('kbmp_marketplace/common');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('kbmp_marketplace/kbmp_marketplace');

        $this->getList();
    }

    public function add() {
        $this->load->language('kbmp_marketplace/common');
        $this->load->language('kbmp_marketplace/payoutRequest');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('kbmp_marketplace/kbmp_marketplace');

        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
//            var_dump($this->request->post);die;
            $this->model_kbmp_marketplace_kbmp_marketplace->addPayoutRequest($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('kbmp_marketplace/payoutRequest', $url, true));
        }
    }

    protected function getList() {
        $this->load->language('kbmp_marketplace/payoutRequest');
        $data= array();
        
        $data['footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('kbmp_marketplace/header');
        $data['error_account_warning'] = $this->language->get('error_account_warning');
        $data['text_account_warning'] = $this->language->get('text_account_warning');
        
        $data['home_link'] = $this->url->link('common/home');
        $data['account_link'] = $this->url->link('account/account', '', true);
        $data['logout_link'] = $this->url->link('account/logout', '', true);

        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $seller_data = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        $data['seller_details'] = $seller_data;
        
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

        if (isset($this->request->get['filter_amount'])) {
            $url .= '&filter_amount=' . $this->request->get['filter_amount'];
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
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

        $data['action'] = $this->url->link('kbmp_marketplace/payoutRequest/add', true);

        $data['returns'] = array();
        $data['seller_id'] = $seller_data['seller_id'];
        
        $filter_data = array(
            'seller_id' => $seller_data['seller_id'],
            'filter_status' => $filter_status,
            'filter_amount' => $filter_amount,
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );
        
        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getPayoutRequest($filter_data);
        $data['payouts'] = array();
        foreach ($results as $key => $value) {
            $data['payouts'][$key]['id'] = $value['id'];
            $data['payouts'][$key]['comment'] = html_entity_decode($value['comment']);
            $data['payouts'][$key]['amount'] = $this->currency->format($value['amount'], $this->config->get('config_currency'));
            if($value['status'] == '1'){
                $data['payouts'][$key]['status'] = $this->language->get('text_approved');
            }elseif($value['status'] == '2'){
                $data['payouts'][$key]['status'] = $this->language->get('text_disapproved');
            }else{
                $data['payouts'][$key]['status'] = $this->language->get('text_waiting_for_approval');
            }
            $data['payouts'][$key]['date_added'] = $value['date_added'];
            $data['payouts'][$key]['date'] = date("M d,Y",strtotime($value['date_added']));
        }
        
        $filter_data = array(
            'seller_id' => $seller_data['seller_id'],
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );
        $payout_total = count($this->model_kbmp_marketplace_kbmp_marketplace->getPayoutRequest($filter_data));
//        foreach ($results as $result) {
//            $data['returns'][] = array(
//                'return_id' => $result['return_id'],
//                'order_id' => $result['order_id'],
//                'customer' => $result['customer'],
//                'product' => $result['product'],
//                'model' => $result['model'],
//                'status' => $result['status'],
//                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
//                'date_modified' => date($this->language->get('date_format_short'), strtotime($result['date_modified'])),
//                'edit' => $this->url->link('kbmp_marketplace/return/edit', '&return_id=' . $result['return_id'] . $url, true)
//            );
//        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');
        $data['text_filter_search'] = $this->language->get('text_filter_search');
        $data['text_my_account1'] = $this->language->get('text_my_account1');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_back_to_site'] = $this->language->get('text_back_to_site');
        $data['text_filter'] = $this->language->get('text_filter');
        $data['text_reset'] = $this->language->get('text_reset');
        $data['text_add'] = $this->language->get('text_add');
        $data['text_delete'] = $this->language->get('text_delete');
        
        $data['text_amount'] = $this->language->get('text_amount');
        $data['text_request_reason'] = $this->language->get('text_request_reason');
        $data['text_submit'] = $this->language->get('text_submit');
        $data['text_new_payout_request'] = $this->language->get('text_new_payout_request');
        $data['text_status'] = $this->language->get('text_status');
        $data['text_id'] = $this->language->get('text_id');
        $data['text_date'] = $this->language->get('text_date');
        $data['text_choose'] = $this->language->get('text_choose');
        $data['text_waiting_for_approval'] = $this->language->get('text_waiting_for_approval');
        $data['text_approved'] = $this->language->get('text_approved');
        $data['text_disapproved'] = $this->language->get('text_disapproved');
        $data['text_payout_details'] = $this->language->get('text_payout_details');
        $data['text_your_comment'] = $this->language->get('text_your_comment');
        $data['text_request_on'] = $this->language->get('text_request_on');

        $data['entry_return_id'] = $this->language->get('entry_return_id');
        $data['entry_order_id'] = $this->language->get('entry_order_id');
        $data['entry_customer'] = $this->language->get('entry_customer');
        $data['entry_product'] = $this->language->get('entry_product');
        $data['entry_model'] = $this->language->get('entry_model');
        $data['entry_return_status'] = $this->language->get('entry_return_status');
        $data['entry_date_added'] = $this->language->get('entry_date_added');
        $data['entry_date_modified'] = $this->language->get('entry_date_modified');
        
        $data['error_number_field'] = $this->language->get('error_number_field');
        $data['error_positive_number'] = $this->language->get('error_positive_number');
        $data['error_minchar_field'] = $this->language->get('error_minchar_field');
        $data['error_maxchar_field'] = $this->language->get('error_maxchar_field');
        $data['error_empty_field'] = $this->language->get('error_empty_field');
        $data['error_positive_amount'] = $this->language->get('error_positive_amount');
        $data['error_valid_decimal'] = $this->language->get('error_valid_decimal');
        $data['error_valid_amount'] = $this->language->get('error_valid_amount');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_filter'] = $this->language->get('button_filter');

        if (isset($this->session->data['error'])) {
            $data['error_warning'] = $this->session->data['error'];

            unset($this->session->data['error']);
        } elseif (isset($this->error['warning'])) {
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

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array) $this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if (isset($this->request->get['filter_amount'])) {
            $url .= '&filter_amount=' . $this->request->get['filter_amount'];
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_id'] = $this->url->link('kbmp_marketplace/payoutRequest', '&sort=id' . $url, true);
        $data['sort_amount'] = $this->url->link('kbmp_marketplace/payoutRequest', '&sort=amount' . $url, true);
        $data['sort_status'] = $this->url->link('kbmp_marketplace/payoutRequest', '&sort=status' . $url, true);
        $data['sort_date'] = $this->url->link('kbmp_marketplace/payoutRequest', '&sort=date_added' . $url, true);

        $url = '';

        if (isset($this->request->get['filter_amount'])) {
            $url .= '&filter_amount=' . $this->request->get['filter_amount'];
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $payout_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/payoutRequest', $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($payout_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($payout_total - $this->config->get('config_limit_admin'))) ? $payout_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $payout_total, ceil($payout_total / $this->config->get('config_limit_admin')));

        $data['filter_status'] = $filter_status;
        $data['filter_amount'] = $filter_amount;
        $data['sort'] = $sort;
        $data['order'] = $order;

        $this->response->setOutput($this->load->view('kbmp_marketplace/payoutRequest', $data));
    }
}
