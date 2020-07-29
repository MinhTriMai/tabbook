<?php

class ControllerKbmpMarketplaceDashboard extends Controller {

    public function index() {

        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('kbmp_marketplace/dashboard', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }
        
        $this->load->language('kbmp_marketplace/common');
        $this->load->language('kbmp_marketplace/dashboard');

        $data['title'] = $this->document->getTitle();
        
        $this->document->setTitle($this->language->get('heading_title'));

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_my_account'] = $this->language->get('text_my_account');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_total_order'] = $this->language->get('text_total_order');
        $data['text_total_sale'] = $this->language->get('text_total_sale');
        $data['text_total_earning'] = $this->language->get('text_total_earning');
        $data['text_total_products_sold'] = $this->language->get('text_total_products_sold');
        $data['text_sales_analytics'] = $this->language->get('text_sales_analytics');
        $data['text_sales_comparison'] = $this->language->get('text_sales_comparison');
        $data['text_today'] = $this->language->get('text_today');
        $data['text_yesterday'] = $this->language->get('text_yesterday');
        $data['text_earning'] = $this->language->get('text_earning');
        $data['text_product_sold'] = $this->language->get('text_product_sold');
        $data['text_this_week'] = $this->language->get('text_this_week');
        $data['text_orders'] = $this->language->get('text_orders');
        $data['text_last_week'] = $this->language->get('text_last_week');
        $data['text_this_month'] = $this->language->get('text_this_month');
        $data['text_last_month'] = $this->language->get('text_last_month');
        $data['text_this_year'] = $this->language->get('text_this_year');
        $data['text_last_year'] = $this->language->get('text_last_year');
        $data['text_last_10_orders'] = $this->language->get('text_last_10_orders');
        $data['text_view_all'] = $this->language->get('text_view_all');
        $data['text_order_id'] = $this->language->get('text_order_id');
        $data['text_order_date'] = $this->language->get('text_order_date');
        $data['text_customer_name'] = $this->language->get('text_customer_name');
        $data['text_customer_email'] = $this->language->get('text_customer_email');
        $data['text_qty'] = $this->language->get('text_qty');
        $data['text_status'] = $this->language->get('text_status');
        $data['text_order_total'] = $this->language->get('text_order_total');
        $data['text_click_to_view'] = $this->language->get('text_click_to_view');
        $data['text_empty'] = $this->language->get('text_empty');
        $data['text_your_revenue'] = $this->language->get('text_your_revenue');
        $data['error_account_warning'] = $this->language->get('error_account_warning');
        $data['text_account_warning'] = $this->language->get('text_account_warning');
        //code added by gopi start
        $data['error_account_request_again'] = $this->language->get('error_account_request_again');
        $data['text_request_again'] = $this->language->get('text_request_again');
        $data['text_here'] = $this->language->get('text_here');
        $data['text_click'] = $this->language->get('text_click');
        $data['request_link']    = $this->url->link($this->request->get['route']).'/request';
        
        
        if (isset($this->session->data['request_approval']) && $this->session->data['request_approval'] != ''){
            $data['request_approval'] = $this->session->data['request_approval'];
            unset($this->session->data['request_approval']);
        }else if (isset($this->session->data['request_approval_deny']) && $this->session->data['request_approval_deny'] != ''){
            $data['request_approval_deny'] = $this->session->data['request_approval_deny'];
            unset($this->session->data['request_approval_deny']);
        }
        
        
        
        //code added by gopi end
        
        
        
        
        
        $data['header'] = $this->load->controller('kbmp_marketplace/header');
        $data['footer'] = $this->load->view('kbmp_marketplace/footer', $data);

        $data['home_link'] = $this->url->link('common/home');
        $data['account_link'] = $this->url->link('account/account', '', true);
        $data['logout_link'] = $this->url->link('account/logout', '', true);

        $this->load->model('kbmp_marketplace/kbmp_marketplace');

        //Get Stats - Total Orders
        $total_orders_stat = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrders('all');
        $data['total_orders_stat'] = $total_orders_stat;

        //Get Stats - Total Sale
        $total_sale_stat = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerSale('all');
        $data['total_sale_stat'] = $this->currency->format($total_sale_stat, $this->session->data['currency']);

        //Get Stats - Total Earning
        $total_earning_stat = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerEarning('all');
        $data['total_earning_stat'] = $this->currency->format($total_earning_stat, $this->session->data['currency']);

        //Get Stats - Total Products Sold
        $total_products_sold_stat = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrderedProducts('all');
        $data['total_products_sold_stat'] = $total_products_sold_stat;

        //Get orders details for today
        $today_orders = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrders('today');
        $last_day_orders = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrders('lastday');
        $data['today_orders'] = $today_orders;
        $data['last_day_orders'] = $last_day_orders;
        //Calculate Improvements
        $improvement = 0;
        if ($today_orders > $last_day_orders) {
            if (!empty($last_day_orders)) {
                $improvement = round(($today_orders / $last_day_orders) * 100, 2);
            } else {
                $improvement = round(($today_orders) * 100, 2);
            }
        } else if ($today_orders < $last_day_orders) {
            if (!empty($today_orders)) {
                $improvement = '-' . round((100 - ($today_orders / $last_day_orders) * 100), 2);
            } else {
                $improvement = '-' . round(($last_day_orders) * 100, 2);
            }
        }
        $data['today_orders_improvements'] = $improvement;

        //Get orders details for week
        $week_orders = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrders('week');
        $last_week_orders = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrders('lastweek');
        $data['week_orders'] = $week_orders;
        $data['last_week_orders'] = $last_week_orders;
        //Calculate Improvements
        $improvement = 0;
        if ($week_orders > $last_week_orders) {
            if (!empty($last_week_orders)) {
                $improvement = round(($week_orders / $last_week_orders) * 100, 2);
            } else {
                $improvement = round(($week_orders) * 100, 2);
            }
        } else if ($week_orders < $last_week_orders) {
            if (!empty($week_orders)) {
                $improvement = '-' . round((100 - ($week_orders / $last_week_orders) * 100), 2);
            } else {
                $improvement = '-' . round(($last_week_orders) * 100, 2);
            }
        }
        $data['week_orders_improvements'] = $improvement;

        //Get orders details for month
        $month_orders = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrders('month');
        $last_month_orders = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrders('lastmonth');
        $data['month_orders'] = $month_orders;
        $data['last_month_orders'] = $last_month_orders;
        //Calculate Improvements
        $improvement = 0;
        if ($month_orders > $last_month_orders) {
            if (!empty($last_month_orders)) {
                $improvement = round(($month_orders / $last_month_orders) * 100, 2);
            } else {
                $improvement = round(($month_orders) * 100, 2);
            }
        } else if ($month_orders < $last_month_orders) {
            if (!empty($month_orders)) {
                $improvement = '-' . round((100 - ($month_orders / $last_month_orders) * 100), 2);
            } else {
                $improvement = '-' . round(($last_month_orders) * 100, 2);
            }
        }
        $data['month_orders_improvements'] = $improvement;

        //Get orders details for year
        $year_orders = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrders('year');
        $last_year_orders = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrders('lastyear');
        $data['year_orders'] = $year_orders;
        $data['last_year_orders'] = $last_year_orders;
        //Calculate Improvements
        $improvement = 0;
        if ($year_orders > $last_year_orders) {
            if (!empty($last_year_orders)) {
                $improvement = round(($year_orders / $last_year_orders) * 100, 2);
            } else {
                $improvement = round(($year_orders) * 100, 2);
            }
        } else if ($year_orders < $last_year_orders) {
            if (!empty($year_orders)) {
                $improvement = '-' . round((100 - ($year_orders / $last_year_orders) * 100), 2);
            } else {
                $improvement = '-' . round(($last_year_orders) * 100, 2);
            }
        }
        $data['year_orders_improvements'] = $improvement;


        //Get seller earning for today
        $today_earning = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerEarning('today');
        $last_day_earning = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerEarning('lastday');
        $data['today_earning'] = $this->currency->format($today_earning, $this->session->data['currency']);
        $data['last_day_earning'] = $this->currency->format($last_day_earning, $this->session->data['currency']);
        //Calculate Improvements
        $improvement = 0;
        if ($today_earning > $last_day_earning) {
            if (!empty($last_day_earning)) {
                $improvement = round(($today_earning / $last_day_earning) * 100, 2);
            } else {
                $improvement = round(($today_earning) * 100, 2);
            }
        } else if ($today_earning < $last_day_earning) {
            if (!empty($today_earning)) {
                $improvement = '-' . round((100 - ($today_earning / $last_day_earning) * 100), 2);
            } else {
                $improvement = '-' . round(($last_day_earning) * 100, 2);
            }
        }
        $data['today_earning_improvements'] = $improvement;

        //Get seller earning for week
        $week_earning = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerEarning('week');
        $last_week_earning = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerEarning('lastweek');
        $data['week_earning'] = $this->currency->format($week_earning, $this->session->data['currency']);
        $data['last_week_earning'] = $this->currency->format($last_week_earning, $this->session->data['currency']);
        //Calculate Improvements
        $improvement = 0;
        if ($week_earning > $last_week_earning) {
            if (!empty($last_week_earning)) {
                $improvement = round(($week_earning / $last_week_earning) * 100, 2);
            } else {
                $improvement = round(($week_earning) * 100, 2);
            }
        } else if ($week_earning < $last_week_earning) {
            if (!empty($week_earning)) {
                $improvement = '-' . round((100 - ($week_earning / $last_week_earning) * 100), 2);
            } else {
                $improvement = '-' . round(($last_week_earning) * 100, 2);
            }
        }
        $data['week_earning_improvements'] = $improvement;

        //Get seller earning for month
        $month_earning = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerEarning('month');
        $last_month_earning = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerEarning('lastmonth');
        $data['month_earning'] = $this->currency->format($month_earning, $this->session->data['currency']);
        $data['last_month_earning'] = $this->currency->format($last_month_earning, $this->session->data['currency']);
        //Calculate Improvements
        $improvement = 0;
        if ($month_earning > $last_month_earning) {
            if (!empty($last_month_earning)) {
                $improvement = round(($month_earning / $last_month_earning) * 100, 2);
            } else {
                $improvement = round(($month_earning) * 100, 2);
            }
        } else if ($month_earning < $last_month_earning) {
            if (!empty($month_earning)) {
                $improvement = '-' . round((100 - ($month_earning / $last_month_earning) * 100), 2);
            } else {
                $improvement = '-' . round(($last_month_earning) * 100, 2);
            }
        }
        $data['month_earning_improvements'] = $improvement;

        //Get seller earning for year
        $year_earning = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerEarning('year');
        $last_year_earning = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerEarning('lastyear');
        $data['year_earning'] = $this->currency->format($year_earning, $this->session->data['currency']);
        $data['last_year_earning'] = $this->currency->format($last_year_earning, $this->session->data['currency']);
        //Calculate Improvements
        $improvement = 0;
        if ($year_earning > $last_year_earning) {
            if (!empty($last_year_earning)) {
                $improvement = round(($year_earning / $last_year_earning) * 100, 2);
            } else {
                $improvement = round(($year_earning) * 100, 2);
            }
        } else if ($year_earning < $last_year_earning) {
            if (!empty($year_earning)) {
                $improvement = '-' . round((100 - ($year_earning / $last_year_earning) * 100), 2);
            } else {
                $improvement = '-' . round(($last_year_earning) * 100, 2);
            }
        }
        $data['year_earning_improvements'] = $improvement;


        //Get ordered products details for today
        $today_ordered_products = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrderedProducts('today');
        $last_day_ordered_products = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrderedProducts('lastday');
        $data['today_ordered_products'] = $today_ordered_products;
        $data['last_day_ordered_products'] = $last_day_ordered_products;
        //Calculate Improvements
        $improvement = 0;
        if ($today_ordered_products > $last_day_ordered_products) {
            if (!empty($last_day_ordered_products)) {
                $improvement = round(($today_ordered_products / $last_day_ordered_products) * 100, 2);
            } else {
                $improvement = round(($today_ordered_products) * 100, 2);
            }
        } else if ($today_ordered_products < $last_day_ordered_products) {
            if (!empty($today_ordered_products)) {
                $improvement = '-' . round((100 - ($today_ordered_products / $last_day_ordered_products) * 100), 2);
            } else {
                $improvement = '-' . round(($last_day_ordered_products) * 100, 2);
            }
        }
        $data['today_ordered_products_improvements'] = $improvement;

        //Get ordered products details for week
        $week_ordered_products = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrderedProducts('week');
        $last_week_ordered_products = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrderedProducts('lastweek');
        $data['week_ordered_products'] = $week_ordered_products;
        $data['last_week_ordered_products'] = $last_week_ordered_products;
        //Calculate Improvements
        $improvement = 0;
        if ($week_ordered_products > $last_week_ordered_products) {
            if (!empty($last_week_ordered_products)) {
                $improvement = round(($week_ordered_products / $last_week_ordered_products) * 100, 2);
            } else {
                $improvement = round(($week_ordered_products) * 100, 2);
            }
        } else if ($week_ordered_products < $last_week_ordered_products) {
            if (!empty($week_ordered_products)) {
                $improvement = '-' . round((100 - ($week_ordered_products / $last_week_ordered_products) * 100), 2);
            } else {
                $improvement = '-' . round(($last_week_ordered_products) * 100, 2);
            }
        }
        $data['week_ordered_products_improvements'] = $improvement;

        //Get ordered products details for month
        $month_ordered_products = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrderedProducts('month');
        $last_month_ordered_products = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrderedProducts('lastmonth');
        $data['month_ordered_products'] = $month_ordered_products;
        $data['last_month_ordered_products'] = $last_month_ordered_products;
        //Calculate Improvements
        $improvement = 0;
        if ($month_ordered_products > $last_month_ordered_products) {
            if (!empty($last_month_ordered_products)) {
                $improvement = round(($month_ordered_products / $last_month_ordered_products) * 100, 2);
            } else {
                $improvement = round(($month_ordered_products) * 100, 2);
            }
        } else if ($month_ordered_products < $last_month_ordered_products) {
            if (!empty($month_ordered_products)) {
                $improvement = '-' . round((100 - ($month_ordered_products / $last_month_ordered_products) * 100), 2);
            } else {
                $improvement = '-' . round(($last_month_ordered_products) * 100, 2);
            }
        }
        $data['month_ordered_products_improvements'] = $improvement;

        //Get ordered products details for year
        $year_ordered_products = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrderedProducts('year');
        $last_year_ordered_products = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrderedProducts('lastyear');
        $data['year_ordered_products'] = $year_ordered_products;
        $data['last_year_ordered_products'] = $last_year_ordered_products;
        //Calculate Improvements
        $improvement = 0;
        if ($year_ordered_products > $last_year_ordered_products) {
            if (!empty($last_year_ordered_products)) {
                $improvement = round(($year_ordered_products / $last_year_ordered_products) * 100, 2);
            } else {
                $improvement = round(($year_ordered_products) * 100, 2);
            }
        } else if ($year_ordered_products < $last_year_ordered_products) {
            if (!empty($year_ordered_products)) {
                $improvement = '-' . round((100 - ($year_ordered_products / $last_year_ordered_products) * 100), 2);
            } else {
                $improvement = '-' . round(($last_year_ordered_products) * 100, 2);
            }
        }
        $data['year_ordered_products_improvements'] = $improvement;

        //Get Seller Orders - Last 10
        $filter = array(
            'limit' => 10
        );
        $seller_orders = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerOrders($filter);
        $data['seller_orders'] = array();

        $this->load->language('kbmp_marketplace/checkout');
        
        //Get Seller ID
        $sellerId = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        $data['seller_details'] = $sellerId;
        if (isset($seller_orders) && !empty($seller_orders)) {
            foreach ($seller_orders as $seller_order) {
                $order_total_amount = $seller_order['order_total'];
                $totals = $this->model_kbmp_marketplace_kbmp_marketplace->getOrderTotals($seller_order['order_id']);

                foreach ($totals as $total) {
                    if (strpos($total['title'], $this->language->get('text_marketplace')) !== false) {

                        //Get Order Shipping by seller
                        $order_shipping = $this->model_kbmp_marketplace_kbmp_marketplace->getOrderShipping($seller_order['order_id'], $sellerId['seller_id']);

                        $order_total_amount = $order_total_amount + $order_shipping['shipping'];
                    }
                }
                
                $data['seller_orders'][] = array(
                    'order_id' => $seller_order['order_id'],
                    'customer_name' => $seller_order['firstname'] . ' ' . $seller_order['lastname'],
                    'customer_email' => $seller_order['email'],
                    'total' => $this->currency->format($order_total_amount, $seller_order['currency_code'], $seller_order['currency_value']),
                    'order_date' => date($this->language->get('date_format_short'), strtotime($seller_order['date_added'])),
                    'qty' => $seller_order['qty'],
                    'status' => $seller_order['name'],
                    'view' => $this->url->link('kbmp_marketplace/order_details', '&order_id='.$seller_order['order_id'], true)
                );
            }
        }
        
	//Start Changes to show Sales Analytics for current week 24-Dec-2018 - Harsh Agarwal
        //Get details of Orders, Products and Revenue for graph
        $lastMonday = strtotime('monday this week') * 1000;
        $lastTuesday = strtotime('tuesday this week') * 1000;
        $lastWednesday = strtotime('wednesday this week') * 1000;
        $lastThursday = strtotime('thursday this week') * 1000;
        $lastFriday = strtotime('friday this week') * 1000;
        $lastSaturday = strtotime('saturday this week') * 1000;
        $lastSunday = strtotime('sunday this week') * 1000;
	//Ends

        //Get orders details for last week
        $last_week_orders_list[$lastMonday] = 0;
        $last_week_orders_list[$lastTuesday] = 0;
        $last_week_orders_list[$lastWednesday] = 0;
        $last_week_orders_list[$lastThursday] = 0;
        $last_week_orders_list[$lastFriday] = 0;
        $last_week_orders_list[$lastSaturday] = 0;
        $last_week_orders_list[$lastSunday] = 0;
        $last_week_orders_graph = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrdersList('lastweek');
        if (isset($last_week_orders_graph) && !empty($last_week_orders_graph)) {
            foreach ($last_week_orders_graph as $last_week_orders_graph) {
                $timestamp = strtotime($last_week_orders_graph['DATE(ksod.date_added)']) * 1000;
                //Last Monday
                if ($timestamp == $lastMonday) {
                    $last_week_orders_list[$lastMonday] = $last_week_orders_graph['total'];
                }
                //Last Tuesday
                if ($timestamp == $lastTuesday) {
                    $last_week_orders_list[$lastTuesday] = $last_week_orders_graph['total'];
                }
                //Last Wednesday
                if ($timestamp == $lastWednesday) {
                    $last_week_orders_list[$lastWednesday] = $last_week_orders_graph['total'];
                }
                //Last Thursday
                if ($timestamp == $lastThursday) {
                    $last_week_orders_list[$lastThursday] = $last_week_orders_graph['total'];
                }
                //Last Friday
                if ($timestamp == $lastFriday) {
                    $last_week_orders_list[$lastFriday] = $last_week_orders_graph['total'];
                }
                //Last Saturday
                if ($timestamp == $lastSaturday) {
                    $last_week_orders_list[$lastSaturday] = $last_week_orders_graph['total'];
                }
                //Last Sunday
                if ($timestamp == $lastSunday) {
                    $last_week_orders_list[$lastSunday] = $last_week_orders_graph['total'];
                }
            }
        }
        $data['last_week_orders_list'] = '['. $lastMonday .', ' . $last_week_orders_list[$lastMonday] . '], ['. $lastTuesday .', ' . $last_week_orders_list[$lastTuesday] . '], ['. $lastWednesday .', ' . $last_week_orders_list[$lastWednesday] . '], ['. $lastThursday .', ' . $last_week_orders_list[$lastThursday] . '], ['. $lastFriday .', ' . $last_week_orders_list[$lastFriday] . '], ['. $lastSaturday .', ' . $last_week_orders_list[$lastSaturday] . '], ['. $lastSunday .', ' . $last_week_orders_list[$lastSunday] . ']';

        //Get ordered products details for last week
        $last_week_ordered_products_list[$lastMonday] = 0;
        $last_week_ordered_products_list[$lastTuesday] = 0;
        $last_week_ordered_products_list[$lastWednesday] = 0;
        $last_week_ordered_products_list[$lastThursday] = 0;
        $last_week_ordered_products_list[$lastFriday] = 0;
        $last_week_ordered_products_list[$lastSaturday] = 0;
        $last_week_ordered_products_list[$lastSunday] = 0;
        $last_week_ordered_products_graph = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerOrderedProductsList('lastweek');
        if (isset($last_week_ordered_products_graph) && !empty($last_week_ordered_products_graph)) {
            foreach ($last_week_ordered_products_graph as $last_week_ordered_products_graph) {
                $timestamp = strtotime($last_week_ordered_products_graph['DATE(ksod.date_added)']) * 1000;
                //Last Monday
                if ($timestamp == $lastMonday) {
                    $last_week_ordered_products_list[$lastMonday] = $last_week_ordered_products_graph['total'];
                }
                //Last Tuesday
                if ($timestamp == $lastTuesday) {
                    $last_week_ordered_products_list[$lastTuesday] = $last_week_ordered_products_graph['total'];
                }
                //Last Wednesday
                if ($timestamp == $lastWednesday) {
                    $last_week_ordered_products_list[$lastWednesday] = $last_week_ordered_products_graph['total'];
                }
                //Last Thursday
                if ($timestamp == $lastThursday) {
                    $last_week_ordered_products_list[$lastThursday] = $last_week_ordered_products_graph['total'];
                }
                //Last Friday
                if ($timestamp == $lastFriday) {
                    $last_week_ordered_products_list[$lastFriday] = $last_week_ordered_products_graph['total'];
                }
                //Last Saturday
                if ($timestamp == $lastSaturday) {
                    $last_week_ordered_products_list[$lastSaturday] = $last_week_ordered_products_graph['total'];
                }
                //Last Sunday
                if ($timestamp == $lastSunday) {
                    $last_week_ordered_products_list[$lastSunday] = $last_week_ordered_products_graph['total'];
                }
            }
        } 
        $data['last_week_ordered_products_list'] = '['. $lastMonday .', ' . $last_week_ordered_products_list[$lastMonday] . '], ['. $lastTuesday .', ' . $last_week_ordered_products_list[$lastTuesday] . '], ['. $lastWednesday .', ' . $last_week_ordered_products_list[$lastWednesday] . '], ['. $lastThursday .', ' . $last_week_ordered_products_list[$lastThursday] . '], ['. $lastFriday .', ' . $last_week_ordered_products_list[$lastFriday] . '], ['. $lastSaturday .', ' . $last_week_ordered_products_list[$lastSaturday] . '], ['. $lastSunday .', ' . $last_week_ordered_products_list[$lastSunday] . ']';
        
        //Get seller earning for last week
        $last_week_earning_list[$lastMonday] = 0;
        $last_week_earning_list[$lastTuesday] = 0;
        $last_week_earning_list[$lastWednesday] = 0;
        $last_week_earning_list[$lastThursday] = 0;
        $last_week_earning_list[$lastFriday] = 0;
        $last_week_earning_list[$lastSaturday] = 0;
        $last_week_earning_list[$lastSunday] = 0;
        $last_week_earning_graph = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerEarningList('lastweek');
        if (isset($last_week_earning_graph) && !empty($last_week_earning_graph)) {
            foreach ($last_week_earning_graph as $last_week_earning_graph) {
                $timestamp = strtotime($last_week_earning_graph['DATE(ksod.date_added)']) * 1000;
                //Last Monday
                if ($timestamp == $lastMonday) {
                    $last_week_earning_list[$lastMonday] = $last_week_earning_graph['total'];
                }
                //Last Tuesday
                if ($timestamp == $lastTuesday) {
                    $last_week_earning_list[$lastTuesday] = $last_week_earning_graph['total'];
                }
                //Last Wednesday
                if ($timestamp == $lastWednesday) {
                    $last_week_earning_list[$lastWednesday] = $last_week_earning_graph['total'];
                }
                //Last Thursday
                if ($timestamp == $lastThursday) {
                    $last_week_earning_list[$lastThursday] = $last_week_earning_graph['total'];
                }
                //Last Friday
                if ($timestamp == $lastFriday) {
                    $last_week_earning_list[$lastFriday] = $last_week_earning_graph['total'];
                }
                //Last Saturday
                if ($timestamp == $lastSaturday) {
                    $last_week_earning_list[$lastSaturday] = $last_week_earning_graph['total'];
                }
                //Last Sunday
                if ($timestamp == $lastSunday) {
                    $last_week_earning_list[$lastSunday] = $last_week_earning_graph['total'];
                }
            }
        } 
        $data['last_week_earning_list'] = '['. $lastMonday .', ' . $last_week_earning_list[$lastMonday] . '], ['. $lastTuesday .', ' . $last_week_earning_list[$lastTuesday] . '], ['. $lastWednesday .', ' . $last_week_earning_list[$lastWednesday] . '], ['. $lastThursday .', ' . $last_week_earning_list[$lastThursday] . '], ['. $lastFriday .', ' . $last_week_earning_list[$lastFriday] . '], ['. $lastSaturday .', ' . $last_week_earning_list[$lastSaturday] . '], ['. $lastSunday .', ' . $last_week_earning_list[$lastSunday] . ']';
        
        
        $data['view_all_order'] = $this->url->link('kbmp_marketplace/orders');

	$this->load->model('setting/kbmp_marketplace');
        //Get the module configuration values
        $store_id = (int) $this->config->get('config_store_id');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
        $data['kbmp_marketplace_settings'] = $settings;

        $this->response->setOutput($this->load->view('kbmp_marketplace/dashboard', $data));
    }
    //function added by gopi to check request approval
    public function request(){
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $this->load->language('kbmp_marketplace/common');
        $sellerIdDetails = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        if ($sellerIdDetails['approved'] == 2){
            if ($sellerIdDetails['disapproval_count'] < $sellerIdDetails['approval_request_limit'] ) {
                $update_request = $this->model_kbmp_marketplace_kbmp_marketplace->requestApproval($sellerIdDetails['seller_id']);
                $this->session->data['request_approval'] = $this->language->get('text_success_request');       
            }elseif($sellerIdDetails['disapproval_count'] >= $sellerIdDetails['approval_request_limit']) {
            
                $this->session->data['request_approval_deny'] = $this->language->get('text_success_request_deny');
            }
            $this->response->redirect($this->url->link('kbmp_marketplace/dashboard', '', true));
            
        }
        
    }
}
