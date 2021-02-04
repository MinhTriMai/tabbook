<?php

class ControllerKbmpMarketplaceEarning extends Controller {

    public function index() {

        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('kbmp_marketplace/earning', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }
        $this->load->language('kbmp_marketplace/common');
        $this->load->language('kbmp_marketplace/earning');
        
        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $this->getList();
    }
    
    /*
     * Function definition to get Transactions List
     */

    protected function getList() {
        
        $data['title'] = $this->document->getTitle();
        $data['sidebar'] = $this->load->controller('kbmp_marketplace/header');
        $data['kbmp_footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('common/header');
        $data['footer'] = $this->load->controller('common/footer');
        $data['text_back_to_site'] = $this->language->get('text_back_to_site');
        $data['text_my_account1'] = $this->language->get('text_my_account1');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_earning'] = $this->language->get('text_earning');
        $data['error_account_warning'] = $this->language->get('error_account_warning');
        $data['text_account_warning'] = $this->language->get('text_account_warning');
        
        $data['home_link'] = $this->url->link('common/home');
        $data['account_link'] = $this->url->link('account/account', '', true);
        $data['logout_link'] = $this->url->link('account/logout', '', true);
        
        $sellerId = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        $data['seller_details'] = $sellerId;
        
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
        
        if (isset($this->request->get['filter_report_format'])) {
            $filter_report_format = $this->request->get['filter_report_format'];
        } else {
            $filter_report_format = null;
        }
        
        if (isset($this->request->get['filter_from_date_2'])) {
            $filter_from_date_2 = $this->request->get['filter_from_date_2'];
        } else {
            $filter_from_date_2 = null;
        }
        
        if (isset($this->request->get['filter_to_date_2'])) {
            $filter_to_date_2 = $this->request->get['filter_to_date_2'];
        } else {
            $filter_to_date_2 = null;
        }
        
        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
        }
        
        if (isset($this->request->get['tab'])) {
            $tab = $this->request->get['tab'];
        } else {
            $tab = '';
        }
        
        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }
        
        $url = '';

        if (isset($this->request->get['filter_from_date'])) {
            $url .= '&filter_from_date=' . urlencode(html_entity_decode($this->request->get['filter_from_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date'])) {
            $url .= '&filter_to_date=' . urlencode(html_entity_decode($this->request->get['filter_to_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_report_format'])) {
            $url .= '&filter_report_format=' . urlencode(html_entity_decode($this->request->get['filter_report_format'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date_2'])) {
            $url .= '&filter_from_date_2=' . urlencode(html_entity_decode($this->request->get['filter_from_date_2'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date_2'])) {
            $url .= '&filter_to_date_2=' . urlencode(html_entity_decode($this->request->get['filter_to_date_2'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
        }
        
        $data['earning'] = array();
        $data['earning_order_wise'] = array();
        
        if (isset($this->request->get['tab'])) {
            $page_1 = 1;
        } else {
            $page_1 = $page;
        }
        
        //Get Seller ID
        $sellerId = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();

        $filter_data = array(
            'seller_id'                 => $sellerId['seller_id'],
            'filter_from_date'          => trim($filter_from_date),
            'filter_to_date'            => trim($filter_to_date),
            'filter_report_format'      => trim($filter_report_format),
            'tab'                       => trim($tab),
            'start'                     => ($page_1 - 1) * $this->config->get('config_limit_admin'),
            'limit'                     => $this->config->get('config_limit_admin')
        );
        
        $filter_data_2 = array(
            'seller_id'                 => $sellerId['seller_id'],
            'filter_from_date_2'        => trim($filter_from_date_2),
            'filter_to_date_2'          => trim($filter_to_date_2),
            'filter_status'             => trim($filter_status),
            'tab'                       => trim($tab),
            'start'                     => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'                     => $this->config->get('config_limit_admin')
        );
        
        $data['filter_data'] = $filter_data;
        $data['filter_data_2'] = $filter_data_2;

        $earning_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerEarningHistory($filter_data);

        $data['earning_total'] = (int)$earning_total;
        
        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerEarningHistory($filter_data);
        $results = $results->rows;
        foreach ($results as $result) {
            if (!empty($filter_report_format)) {
                switch ($filter_report_format) {
                    case 1:
                        $data['earning'][] = array(
                            'date' => date($this->language->get('date_format_short'), strtotime($result['date'])),
                            'total_order' => $result['total_order'],
                            'products_sold' => $result['products_sold'],
                            'order_total' => $this->currency->format($result['order_total'], $this->session->data['currency']),
                            'seller_earning' => $this->currency->format($result['seller_earning'], $this->session->data['currency'])                
                        );
                        break;
                    case 2:
                        $dates = $this->datesofWeek($result['week'], $result['year']);
                        $data['earning'][] = array(
                            'date' => $dates[0] .' - '. $dates[1],
                            'total_order' => $result['total_order'],
                            'products_sold' => $result['products_sold'],
                            'order_total' => $this->currency->format($result['order_total'], $this->session->data['currency']),
                            'seller_earning' => $this->currency->format($result['seller_earning'], $this->session->data['currency'])                
                        );
                        break;
                    case 3:
                        $data['earning'][] = array(
                            'date' => date("M", mktime(0, 0, 0, $result['month'], 10)) .'-'.$result['year'],
                            'total_order' => $result['total_order'],
                            'products_sold' => $result['products_sold'],
                            'order_total' => $this->currency->format($result['order_total'], $this->session->data['currency']),
                            'seller_earning' => $this->currency->format($result['seller_earning'], $this->session->data['currency'])                
                        );
                        break;
                    case 4:
                        $data['earning'][] = array(
                            'date' => $result['year'],
                            'total_order' => $result['total_order'],
                            'products_sold' => $result['products_sold'],
                            'order_total' => $this->currency->format($result['order_total'], $this->session->data['currency']),
                            'seller_earning' => $this->currency->format($result['seller_earning'], $this->session->data['currency'])                
                        );
                        break;
                }
            } else {
                $data['earning'][] = array(
                    'date' => date($this->language->get('date_format_short'), strtotime($result['date'])),
                    'total_order' => $result['total_order'],
                    'products_sold' => $result['products_sold'],
                    'order_total' => $this->currency->format($result['order_total'], $this->session->data['currency']),
                    'seller_earning' => $this->currency->format($result['seller_earning'], $this->session->data['currency'])                
                );
            }
            
        }
        
        //Earning Order-Wise
        $earning_order_wise_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerEarningOrderWise($filter_data_2);

        $data['earning_order_wise_total'] = $earning_order_wise_total;
        
        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerEarningOrderWise($filter_data_2);

        foreach ($results as $result) {
            $data['earning_order_wise'][] = array(
                'order_id' => $result['order_id'],
                'date' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'quantity' => $result['quantity'],
                'status' => $result['order_status'],
                'order_total' => $this->currency->format($result['order_total'], $this->session->data['currency']),
                'seller_earning' => $this->currency->format($result['seller_earning'], $this->session->data['currency'])                
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
        
        $data['text_tab_history'] = $this->language->get('text_tab_history');
        $data['text_tab_order'] = $this->language->get('text_tab_order');
        $data['text_filter_search'] = $this->language->get('text_filter_search');
        $data['text_from_date'] = $this->language->get('text_from_date');
        $data['text_to_date'] = $this->language->get('text_to_date');
        $data['text_report_format'] = $this->language->get('text_report_format');
        $data['text_status'] = $this->language->get('text_status');
        $data['text_select'] = $this->language->get('text_select');
        $data['text_daily'] = $this->language->get('text_daily');
        $data['text_weekly'] = $this->language->get('text_weekly');
        $data['text_monthly'] = $this->language->get('text_monthly');
        $data['text_yearly'] = $this->language->get('text_yearly');
        $data['text_no_record'] = $this->language->get('text_no_record');
        
        $data['text_date_error'] = $this->language->get('text_date_error');
        
        $data['button_filter'] = $this->language->get('button_filter');
        $data['button_reset'] = $this->language->get('button_reset');
        
        //Column
        $data['column_interval'] = $this->language->get('column_interval');
        $data['column_orders'] = $this->language->get('column_orders');
        $data['column_product_sold'] = $this->language->get('column_product_sold');
        $data['column_order_total'] = $this->language->get('column_order_total');
        $data['column_your_earning'] = $this->language->get('column_your_earning');
        $data['column_order_id'] = $this->language->get('column_order_id');
        $data['column_order_date'] = $this->language->get('column_order_date');
        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_status'] = $this->language->get('column_status');
        
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
        
        $data['order_statuses'] = $this->model_kbmp_marketplace_kbmp_marketplace->getOrderStatuses();
        
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

        if (isset($this->request->get['filter_from_date'])) {
            $url .= '&filter_from_date=' . urlencode(html_entity_decode($this->request->get['filter_from_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date'])) {
            $url .= '&filter_to_date=' . urlencode(html_entity_decode($this->request->get['filter_to_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_report_format'])) {
            $url .= '&filter_report_format=' . urlencode(html_entity_decode($this->request->get['filter_report_format'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date_2'])) {
            $url .= '&filter_from_date_2=' . urlencode(html_entity_decode($this->request->get['filter_from_date_2'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date_2'])) {
            $url .= '&filter_to_date_2=' . urlencode(html_entity_decode($this->request->get['filter_to_date_2'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
        }
        
        $pagination = new Pagination();
        $pagination->total = $earning_total;
        $pagination->page = $page_1;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/earning', $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($earning_total) ? (($page_1 - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page_1 - 1) * $this->config->get('config_limit_admin')) > ($earning_total - $this->config->get('config_limit_admin'))) ? $earning_total : ((($page_1 - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $earning_total, ceil($earning_total / $this->config->get('config_limit_admin')));
        
        $pagination_2 = new Pagination();
        $pagination_2->total = $earning_order_wise_total;
        $pagination_2->page = $page;
        $pagination_2->limit = $this->config->get('config_limit_admin');
        $pagination_2->url = $this->url->link('kbmp_marketplace/earning&tab=1', '&page={page}', true);

        $data['pagination_2'] = $pagination_2->render();

        $data['results_2'] = sprintf($this->language->get('text_pagination'), ($earning_order_wise_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($earning_order_wise_total - $this->config->get('config_limit_admin'))) ? $earning_order_wise_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $earning_order_wise_total, ceil($earning_order_wise_total / $this->config->get('config_limit_admin')));

	$this->load->model('setting/kbmp_marketplace');
        //Get the module configuration values
        $store_id = (int) $this->config->get('config_store_id');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
        $data['kbmp_marketplace_settings'] = $settings;

        $this->response->setOutput($this->load->view('kbmp_marketplace/earning', $data));
    }
    
    /*
     * Function to get start end end date of week by week number and year
     */
    public function datesofWeek($week, $year)
    {
        $time = strtotime("1 January $year", time());
        $day = date('w', $time);
        $time += ((7 * $week) + 1 - $day) * 24 * 3600;
        $dates[0] = date($this->language->get('date_format_short'), $time);
        $time += 6 * 24 * 3600;
        $dates[1] = date($this->language->get('date_format_short'), $time);

        return $dates;
    }

}
