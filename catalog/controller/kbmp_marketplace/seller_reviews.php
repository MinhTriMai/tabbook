<?php

class ControllerKbmpMarketplaceSellerReviews extends Controller {

    public function index() {

        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('kbmp_marketplace/seller_reviews', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }

        $this->load->language('kbmp_marketplace/common');
        $this->load->language('kbmp_marketplace/seller_reviews');

        $this->document->setTitle($this->language->get('heading_title'));
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $this->getList();
    }

    /*
     * Function definition to get Product Reviews List
     */

    protected function getList() {
        
        $data['title'] = $this->document->getTitle();
        $data['footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('kbmp_marketplace/header');
        $data['text_back_to_site'] = $this->language->get('text_back_to_site');
        $data['text_my_account1'] = $this->language->get('text_my_account1');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_reviews'] = $this->language->get('text_reviews');
        $data['error_account_warning'] = $this->language->get('error_account_warning');
        $data['text_account_warning'] = $this->language->get('text_account_warning');
        
        $data['home_link'] = $this->url->link('common/home');
        $data['account_link'] = $this->url->link('account/account', '', true);
        $data['logout_link'] = $this->url->link('account/logout', '', true);
        
        if (isset($this->request->get['filter_rating'])) {
            $filter_rating = $this->request->get['filter_rating'];
        } else {
            $filter_rating = null;
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
        
        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
        }
        
        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }
        
        $url = '';

        if (isset($this->request->get['filter_rating'])) {
            $url .= '&filter_rating=' . urlencode(html_entity_decode($this->request->get['filter_rating'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date'])) {
            $url .= '&filter_from_date=' . urlencode(html_entity_decode($this->request->get['filter_from_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date'])) {
            $url .= '&filter_to_date=' . urlencode(html_entity_decode($this->request->get['filter_to_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
        }
        
        $data['reviews'] = array();
        
        //Get Seller ID
        $sellerId = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        $data['seller_details'] = $sellerId;
        
        $filter_data = array(
            'seller_id'                 => $sellerId['seller_id'],
            'filter_rating'             => trim($filter_rating),
            'filter_from_date'          => trim($filter_from_date),
            'filter_to_date'            => trim($filter_to_date),
            'filter_status'             => trim($filter_status),
            'start'                     => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'                     => $this->config->get('config_limit_admin')
        );
        
        $data['filter_data'] = $filter_data;

        $reviews_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerReviews($filter_data);

        $data['reviews_total'] = $reviews_total;
        
        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerReviews($filter_data);

        foreach ($results as $result) {
            
            $data['reviews'][] = array(
                'review_id' => $result['seller_review_id'],
                'author' => $result['author'],
                'comment' => mb_strimwidth($result['text'], 0, 100, "..."),
                'status' => (isset($result['approved']) && $result['approved'] == '1') ? $this->language->get('text_approved') : ((isset($result['approved']) && $result['approved'] == '2') ? $this->language->get('text_disapproved') : $this->language->get('text_waiting_for_approval')),
                'rating' => $result['rating'],
                'rating_value' => ($result['rating'] * 20),
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'delete' => $this->url->link('kbmp_marketplace/seller_reviews/delete', 'review_id='.$result['seller_review_id'], true),
            );
        }
        
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
        
        $data['text_filter_search'] = $this->language->get('text_filter_search');
        $data['text_from_date'] = $this->language->get('text_from_date');
        $data['text_to_date'] = $this->language->get('text_to_date');
        $data['text_status'] = $this->language->get('text_status');
        $data['text_rating'] = $this->language->get('text_rating');
        $data['text_select'] = $this->language->get('text_select');
        $data['text_delete'] = $this->language->get('text_delete');
        $data['text_approved'] = $this->language->get('text_approved');
        $data['text_disapproved'] = $this->language->get('text_disapproved');
        $data['text_waiting_for_approval'] = $this->language->get('text_waiting_for_approval');
        $data['text_confirm'] = $this->language->get('text_confirm');
        $data['text_no_record'] = $this->language->get('text_no_record');
        $data['text_read_more'] = $this->language->get('text_read_more');
        
        $data['text_date_error'] = $this->language->get('text_date_error');
        
        //Button Text
        $data['button_filter'] = $this->language->get('button_filter');
        $data['button_reset'] = $this->language->get('button_reset');
        
        //Column Text
        $data['column_id'] = $this->language->get('column_id');
        $data['column_posted_on'] = $this->language->get('column_posted_on');
        $data['column_customer'] = $this->language->get('column_customer');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_comment'] = $this->language->get('column_comment');
        $data['column_rating'] = $this->language->get('column_rating');
        $data['column_action'] = $this->language->get('column_action');
        
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
        
        $url = '';

        if (isset($this->request->get['filter_rating'])) {
            $url .= '&filter_rating=' . urlencode(html_entity_decode($this->request->get['filter_rating'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date'])) {
            $url .= '&filter_from_date=' . urlencode(html_entity_decode($this->request->get['filter_from_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_firstname'])) {
            $url .= '&filter_firstname=' . urlencode(html_entity_decode($this->request->get['filter_firstname'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
        }

        $pagination = new Pagination();
        $pagination->total = $reviews_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/seller_reviews', $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($reviews_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($reviews_total - $this->config->get('config_limit_admin'))) ? $reviews_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $reviews_total, ceil($reviews_total / $this->config->get('config_limit_admin')));

        $this->response->setOutput($this->load->view('kbmp_marketplace/seller_reviews', $data));
    }
    
    /*
     * Function to handle delete review request
     */
    public function delete() {
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('kbmp_marketplace/order_details', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }
        
        $this->load->language('kbmp_marketplace/seller_reviews');
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        //Get Seller ID
        $sellerId = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        
        if (isset($this->request->get['review_id']) && !empty($this->request->get['review_id'])) {
            $this->model_kbmp_marketplace_kbmp_marketplace->deleteSellerReview($this->request->get['review_id'], $sellerId['seller_id']);
                    
            $this->session->data['success'] = $this->language->get('text_delete_review_success');
        }
        
        $this->response->redirect($this->url->link('kbmp_marketplace/seller_reviews', '', true));
    }
}
