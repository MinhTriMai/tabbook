<?php

class ControllerKbmpMarketplaceOrderDetails extends Controller {

    private $error = array();
    
    public function index() {
        $this->load->language('kbmp_marketplace/common');
        $this->load->language('kbmp_marketplace/order_details');

        $data['title'] = $this->document->getTitle();
        $data['footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('kbmp_marketplace/header');
        $data['text_back_to_site'] = $this->language->get('text_back_to_site');
        $data['text_my_account1'] = $this->language->get('text_my_account1');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_products'] = $this->language->get('text_products');
        
        $data['home_link'] = $this->url->link('common/home');
        $data['account_link'] = $this->url->link('account/account', '', true);
        $data['logout_link'] = $this->url->link('account/logout', '', true);
        
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('kbmp_marketplace/order_details', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }


        $this->document->setTitle($this->language->get('heading_title'));

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_my_account'] = $this->language->get('text_my_account');

        $data['text_back'] = $this->language->get('text_back');
        $data['text_print_invoice'] = $this->language->get('text_print_invoice');
        $data['text_cancel_order_product'] = $this->language->get('text_cancel_order_product');
        $data['text_summary'] = $this->language->get('text_summary');
        $data['text_order_id'] = $this->language->get('text_order_id');
        $data['text_status'] = $this->language->get('text_status');
        $data['text_date_added'] = $this->language->get('text_date_added');
        $data['text_payment_method'] = $this->language->get('text_payment_method');
        $data['text_shipping_method'] = $this->language->get('text_shipping_method');
        $data['text_email'] = $this->language->get('text_email');
        $data['text_payment_address'] = $this->language->get('text_payment_address');
        $data['text_shipping_address'] = $this->language->get('text_shipping_address');
        $data['text_sub_total'] = $this->language->get('text_sub_total');
        $data['text_total'] = $this->language->get('text_order_total');
        $data['text_comment_info'] = $this->language->get('text_comment_info');
        $data['text_order_history'] = $this->language->get('text_order_history');
        $data['text_no_record'] = $this->language->get('text_no_record');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_order_details'] = $this->language->get('text_order_details');
        $data['error_account_warning'] = $this->language->get('error_account_warning');
        $data['text_account_warning'] = $this->language->get('text_account_warning');
        
        $data['label_order_status'] = $this->language->get('label_order_status');
        $data['label_comment'] = $this->language->get('label_comment');

        $data['column_product_name'] = $this->language->get('column_product_name');
        $data['column_model'] = $this->language->get('column_model');
        $data['column_cancel'] = $this->language->get('column_cancel');
        $data['column_tracking_number'] = $this->language->get('column_tracking_number');
        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_unit_price'] = $this->language->get('column_unit_price');
        $data['column_total'] = $this->language->get('column_total');
        $data['column_action'] = $this->language->get('column_action');
        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_comment'] = $this->language->get('column_comment');

        $data['tab_order_status'] = $this->language->get('tab_order_status');
        $data['tab_add_comment'] = $this->language->get('tab_add_comment');

        $data['button_submit'] = $this->language->get('button_submit');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_update'] = $this->language->get('button_update');

        $data['error_tracking_number'] = $this->language->get('error_tracking_number');

        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $this->load->model('setting/kbmp_marketplace');

        if (isset($this->request->get['order_id']) && !empty($this->request->get['order_id'])) {
            
            //Handle the Post Request to add/update status/comment
            if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
//                var_dump($this->request->post);die;
                if (isset($this->request->post['product']) && !empty($this->request->post['product'])) {
                    //Check if non-canceled product exists in the order else throw error
                    $nonCanceledProducts = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalNonCanceledProducts($this->request->get['order_id']);

                    if (isset($nonCanceledProducts) && !empty($nonCanceledProducts)) {
                        $this->load->model('checkout/order');

                        foreach ($this->request->post['product'] as $product) {
                            //Get Product
                            $product_details = $this->model_kbmp_marketplace_kbmp_marketplace->getProduct($product);
                            
                            $update_order_status_info = $this->model_kbmp_marketplace_kbmp_marketplace->getOrderStatus($this->request->post['order_status_id']);

                            if (isset($this->request->post['comment']) && empty($this->request->post['comment'])) {
                                $this->request->post['comment'] = $product_details['name'] . ' ' . $this->language->get('text_default_comment') . $update_order_status_info['name'];
                            }
                            
                            //Update order product status in Marketplace table
                            $this->model_kbmp_marketplace_kbmp_marketplace->updateOrderProductStatus($this->request->get['order_id'], $product, $update_order_status_info['name']);

                            //Add Comment into order history
                            $this->model_kbmp_marketplace_kbmp_marketplace->addOrderHistory($this->request->get['order_id'], $this->request->post['comment']);
                            
                            //Check if all ordered products have been marked complete then update order status
                            $checkComplete = $this->model_kbmp_marketplace_kbmp_marketplace->checkOrderedProductStatus($this->request->get['order_id']);
                            
                            if ($checkComplete) {
                                //Save comment into DB with order
                                $this->model_checkout_order->addOrderHistory($this->request->get['order_id'], $this->request->post['order_status_id'], $this->request->post['comment'], true);
                            }
                        }
                        
                        $this->session->data['success'] = $this->language->get('text_order_update_success');

                        $this->response->redirect($this->url->link('kbmp_marketplace/order_details', '&order_id='.$this->request->get['order_id'], true));
                    } else {
                        $this->error['warning'] = $this->language->get('error_order_update');
                    }
                } else {
                    $this->error['warning'] = $this->language->get('error_order_update_selection');
                }
            }
            
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
            
            //Get Seller ID
            $sellerId = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
            $data['seller_details'] = $sellerId;
            
            $store_id = (int) $this->config->get('config_store_id');
            $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);

            //Get Seller Configuration to overwrite default configuration if set exclusively for seller
            $seller_config = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerConfig($sellerId['seller_id'], $store_id);
            if (isset($seller_config) && !empty($seller_config)) {
                foreach ($seller_config as $sellerconfig) {
                    $settings['kbmp_marketplace_setting'][$sellerconfig['key']] = $sellerconfig['value'];
                }
            }

            $data['kbmp_marketplace_settings'] = $settings;

            $order_info = $this->model_kbmp_marketplace_kbmp_marketplace->getOrder($this->request->get['order_id'], $sellerId['seller_id']);

            if (isset($order_info) && !empty($order_info)) {
                $data['order_id'] = $this->request->get['order_id'];

                $data['back'] = $this->url->link("kbmp_marketplace/orders", '', true);
                $data['invoice'] = $this->url->link("kbmp_marketplace/order_details/invoice", "&order_id=".$this->request->get['order_id'], true);
                $data['store_id'] = $order_info['store_id'];
                $data['store_name'] = $order_info['store_name'];

                if ($order_info['store_id'] == 0) {
                    $data['store_url'] = $this->request->server['HTTPS'] ? HTTPS_SERVER : HTTP_SERVER;
                } else {
                    $data['store_url'] = $order_info['store_url'];
                }

                $data['date_added'] = date($this->language->get('date_format_short'), strtotime($order_info['date_added']));

                $data['firstname'] = $order_info['firstname'];
                $data['lastname'] = $order_info['lastname'];
                $data['email'] = $order_info['email'];
                $data['telephone'] = $order_info['telephone'];

                $data['shipping_method'] = $order_info['shipping_method'];
                $data['payment_method'] = $order_info['payment_method'];

                // Payment Address
                if ($order_info['payment_address_format']) {
                    $format = $order_info['payment_address_format'];
                } else {
                    $format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
                }

                $find = array(
                    '{firstname}',
                    '{lastname}',
                    '{company}',
                    '{address_1}',
                    '{address_2}',
                    '{city}',
                    '{postcode}',
                    '{zone}',
                    '{zone_code}',
                    '{country}'
                );

                $replace = array(
                    'firstname' => $order_info['payment_firstname'],
                    'lastname' => $order_info['payment_lastname'],
                    'company' => $order_info['payment_company'],
                    'address_1' => $order_info['payment_address_1'],
                    'address_2' => $order_info['payment_address_2'],
                    'city' => $order_info['payment_city'],
                    'postcode' => $order_info['payment_postcode'],
                    'zone' => $order_info['payment_zone'],
                    'zone_code' => $order_info['payment_zone_code'],
                    'country' => $order_info['payment_country']
                );

                $data['payment_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

                // Shipping Address
                if ($order_info['shipping_address_format']) {
                    $format = $order_info['shipping_address_format'];
                } else {
                    $format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
                }

                $find = array(
                    '{firstname}',
                    '{lastname}',
                    '{company}',
                    '{address_1}',
                    '{address_2}',
                    '{city}',
                    '{postcode}',
                    '{zone}',
                    '{zone_code}',
                    '{country}'
                );

                $replace = array(
                    'firstname' => $order_info['shipping_firstname'],
                    'lastname' => $order_info['shipping_lastname'],
                    'company' => $order_info['shipping_company'],
                    'address_1' => $order_info['shipping_address_1'],
                    'address_2' => $order_info['shipping_address_2'],
                    'city' => $order_info['shipping_city'],
                    'postcode' => $order_info['shipping_postcode'],
                    'zone' => $order_info['shipping_zone'],
                    'zone_code' => $order_info['shipping_zone_code'],
                    'country' => $order_info['shipping_country']
                );

                $data['shipping_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

                $data['products'] = array();

                $products = $this->model_kbmp_marketplace_kbmp_marketplace->getOrderProducts($this->request->get['order_id'], $sellerId['seller_id']);
                
                $order_total_amount = 0;

                foreach ($products as $product) {
                    $option_data = array();

                    $options = $this->model_kbmp_marketplace_kbmp_marketplace->getOrderOptions($this->request->get['order_id'], $product['order_product_id']);

                    foreach ($options as $option) {
                        if ($option['type'] != 'file') {
                            $option_data[] = array(
                                'name' => $option['name'],
                                'value' => $option['value'],
                                'type' => $option['type']
                            );
                        } else {
                            $upload_info = $this->model_kbmp_marketplace_kbmp_marketplace->getUploadByCode($option['value']);

                            if ($upload_info) {
                                $option_data[] = array(
                                    'name' => $option['name'],
                                    'value' => $upload_info['name'],
                                    'type' => $option['type'],
                                    'href' => $this->url->link('tool/upload/download', '&code=' . $upload_info['code'], true)
                                );
                            }
                        }
                    }
                    
                    //Calculate Order Total Amount
                    $order_total_amount = $order_total_amount + ($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0));
                    $data['products'][] = array(
                        'order_product_id' => $product['order_product_id'],
                        'product_id' => $product['product_id'],
                        'name' => $product['name'],
                        'model' => $product['model'],
                        'option' => $option_data,
                        'quantity' => $product['quantity'],
                        'price' => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $this->session->data['currency']),
                        'total' => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $this->session->data['currency']),
                        'is_canceled' => $product['is_canceled'],
                        'date_canceled' => !empty($product['date_canceled']) ? date($this->language->get('date_format_short'), strtotime($product['date_canceled'])) : '',
                        'tracking_number' => $product['tracking_number'],
                        'status' => $product['status'],
                        'cancel' => $this->url->link('kbmp_marketplace/order_details/cancel', '&order_id=' . $this->request->get['order_id'] . '&product_id=' . $product['product_id'], true)
                    );
                }
                    $data['order_change'] = 0;
                    foreach ($products as $product) {
                        if (isset($product['is_canceled']) && $product['is_canceled'] != '1'){
                            if (is_null($product['status'])){
                                $data['order_change'] = 1;
                                break;
                            }elseif(isset($product['status'])){
                                if($product['status'] == 'Pending' || empty($product['status'])){
                                    $data['order_change'] = 1;
                                    break;
                                }

                            }

                        }    
                    }
                $data['vouchers'] = array();

                $vouchers = $this->model_kbmp_marketplace_kbmp_marketplace->getOrderVouchers($this->request->get['order_id']);

                foreach ($vouchers as $voucher) {
                    $data['vouchers'][] = array(
                        'description' => $voucher['description'],
                        'amount' => $this->currency->format($voucher['amount'], $this->session->data['currency'])
                    );
                }

                $data['totals'] = array();

                $this->load->language('kbmp_marketplace/checkout');
                
                $totals = $this->model_kbmp_marketplace_kbmp_marketplace->getOrderTotals($this->request->get['order_id']);

                foreach ($totals as $total) {
                    if (strpos($total['title'], $this->language->get('text_marketplace')) !== false) {
                        
                        //Get Order Shipping by seller
                        $order_shipping = $this->model_kbmp_marketplace_kbmp_marketplace->getOrderShipping($this->request->get['order_id'], $sellerId['seller_id']);

                        $data['totals'][] = array(
                            'title' => substr($total['title'], 0, strpos($total['title'], '(') - 1), //Removed weight details as order is showing only seller products details
                            'text' => $this->currency->format($order_shipping['shipping'], $this->session->data['currency'])
                        );

                        $order_total_amount = $order_total_amount + $order_shipping['shipping'];
                    }
                }
                
                $data['totals'][] = array(
                    'title' => $this->language->get('text_order_total'),
                    'text' => $this->currency->format($order_total_amount, $this->session->data['currency'])
                );

                $data['comment'] = nl2br($order_info['comment']);

                $order_status_info = $this->model_kbmp_marketplace_kbmp_marketplace->getOrderStatus($order_info['order_status_id']);
                $data['allowed_status'] = array('1', '5', '8');
                
                if ($order_status_info) {
                    $data['order_status'] = $order_status_info['name'];
                } else {
                    $data['order_status'] = '';
                }

                $data['order_statuses'] = $this->model_kbmp_marketplace_kbmp_marketplace->getOrderStatuses();

                $data['order_status_id'] = $order_info['order_status_id'];

                
                $histories = $this->model_kbmp_marketplace_kbmp_marketplace->getOrderHistories($this->request->get['order_id']);
                $data['histories'] = array();
                if (isset($histories) && !empty($histories)) {
                    foreach ($histories as $history) {
                        $data['histories'][] = array(
                            'notify' => $history['notify'] ? $this->language->get('text_yes') : $this->language->get('text_no'),
                            'status' => $history['status'],
                            'comment' => nl2br($history['comment']),
                            'date_added' => date($this->language->get('date_format_short'), strtotime($history['date_added']))
                        );
                    }
                }

                $this->response->setOutput($this->load->view('kbmp_marketplace/order_details', $data));
            }
        }
    }

    /*
     * Function to show order invoice
     */

    public function invoice() {
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('kbmp_marketplace/order_details', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }

        $this->load->language('kbmp_marketplace/order_details');

        $data['title'] = $this->language->get('text_invoice');

        if ($this->request->server['HTTPS']) {
            $data['base'] = HTTPS_SERVER;
        } else {
            $data['base'] = HTTP_SERVER;
        }

        $data['direction'] = $this->language->get('direction');
        $data['lang'] = $this->language->get('code');

        $data['text_invoice'] = $this->language->get('text_invoice');
        $data['text_order_detail'] = $this->language->get('text_order_detail');
        $data['text_order_id'] = $this->language->get('text_order_id');
        $data['text_invoice_no'] = $this->language->get('text_invoice_no');
        $data['text_invoice_date'] = $this->language->get('text_invoice_date');
        $data['text_date_added'] = $this->language->get('text_date_added');
        $data['text_telephone'] = $this->language->get('text_telephone');
        $data['text_fax'] = $this->language->get('text_fax');
        $data['text_email'] = $this->language->get('text_email');
        $data['text_website'] = $this->language->get('text_website');
        $data['text_payment_address'] = $this->language->get('text_payment_address');
        $data['text_shipping_address'] = $this->language->get('text_shipping_address');
        $data['text_payment_method'] = $this->language->get('text_payment_method');
        $data['text_shipping_method'] = $this->language->get('text_shipping_method');
        $data['text_comment'] = $this->language->get('text_comment');

        $data['column_product'] = $this->language->get('column_product_name');
        $data['column_model'] = $this->language->get('column_model');
        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_price'] = $this->language->get('column_unit_price');
        $data['column_total'] = $this->language->get('column_total');

        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $this->load->model('setting/setting');
        
        if (isset($this->request->get['order_id']) && !empty($this->request->get['order_id'])) {
            //Get Seller ID
            $sellerId = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
            
            $order_info = $this->model_kbmp_marketplace_kbmp_marketplace->getOrder($this->request->get['order_id'], $sellerId['seller_id']);

            if ($order_info) {
                $store_info = $this->model_setting_setting->getSetting('config', $order_info['store_id']);

                if ($store_info) {
                    $store_address = $store_info['config_address'];
                    $store_email = $store_info['config_email'];
                    $store_telephone = $store_info['config_telephone'];
                    $store_fax = $store_info['config_fax'];
                } else {
                    $store_address = $this->config->get('config_address');
                    $store_email = $this->config->get('config_email');
                    $store_telephone = $this->config->get('config_telephone');
                    $store_fax = $this->config->get('config_fax');
                }

                if ($order_info['invoice_no']) {
                    $invoice_no = $order_info['invoice_prefix'] . $order_info['invoice_no'];
                } else {
                    $invoice_no = '';
                }

                if ($order_info['payment_address_format']) {
                    $format = $order_info['payment_address_format'];
                } else {
                    $format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
                }

                $find = array(
                    '{firstname}',
                    '{lastname}',
                    '{company}',
                    '{address_1}',
                    '{address_2}',
                    '{city}',
                    '{postcode}',
                    '{zone}',
                    '{zone_code}',
                    '{country}'
                );

                $replace = array(
                    'firstname' => $order_info['payment_firstname'],
                    'lastname' => $order_info['payment_lastname'],
                    'company' => $order_info['payment_company'],
                    'address_1' => $order_info['payment_address_1'],
                    'address_2' => $order_info['payment_address_2'],
                    'city' => $order_info['payment_city'],
                    'postcode' => $order_info['payment_postcode'],
                    'zone' => $order_info['payment_zone'],
                    'zone_code' => $order_info['payment_zone_code'],
                    'country' => $order_info['payment_country']
                );

                $payment_address = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

                if ($order_info['shipping_address_format']) {
                    $format = $order_info['shipping_address_format'];
                } else {
                    $format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
                }

                $find = array(
                    '{firstname}',
                    '{lastname}',
                    '{company}',
                    '{address_1}',
                    '{address_2}',
                    '{city}',
                    '{postcode}',
                    '{zone}',
                    '{zone_code}',
                    '{country}'
                );

                $replace = array(
                    'firstname' => $order_info['shipping_firstname'],
                    'lastname' => $order_info['shipping_lastname'],
                    'company' => $order_info['shipping_company'],
                    'address_1' => $order_info['shipping_address_1'],
                    'address_2' => $order_info['shipping_address_2'],
                    'city' => $order_info['shipping_city'],
                    'postcode' => $order_info['shipping_postcode'],
                    'zone' => $order_info['shipping_zone'],
                    'zone_code' => $order_info['shipping_zone_code'],
                    'country' => $order_info['shipping_country']
                );

                $shipping_address = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

                $product_data = array();

                $products = $this->model_kbmp_marketplace_kbmp_marketplace->getOrderProducts($this->request->get['order_id'], $sellerId['seller_id']);

                foreach ($products as $product) {
                    $option_data = array();

                    $options = $this->model_kbmp_marketplace_kbmp_marketplace->getOrderOptions($this->request->get['order_id'], $product['order_product_id']);

                    foreach ($options as $option) {
                        if ($option['type'] != 'file') {
                            $value = $option['value'];
                        } else {
                            $upload_info = $this->model_kbmp_marketplace_kbmp_marketplace->getUploadByCode($option['value']);

                            if ($upload_info) {
                                $value = $upload_info['name'];
                            } else {
                                $value = '';
                            }
                        }

                        $option_data[] = array(
                            'name' => $option['name'],
                            'value' => $value
                        );
                    }

                    $product_data[] = array(
                        'name' => $product['name'],
                        'model' => $product['model'],
                        'option' => $option_data,
                        'quantity' => $product['quantity'],
                        'price' => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $this->session->data['currency']),
                        'total' => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $this->session->data['currency'])
                    );
                }

                $voucher_data = array();

                $vouchers = $this->model_kbmp_marketplace_kbmp_marketplace->getOrderVouchers($this->request->get['order_id']);

                foreach ($vouchers as $voucher) {
                    $voucher_data[] = array(
                        'description' => $voucher['description'],
                        'amount' => $this->currency->format($voucher['amount'], $this->session->data['currency'])
                    );
                }

                $total_data = array();

                $totals = $this->model_kbmp_marketplace_kbmp_marketplace->getOrderTotals($this->request->get['order_id']);

                foreach ($totals as $total) {
                    $total_data[] = array(
                        'title' => $total['title'],
                        'text' => $this->currency->format($total['value'], $this->session->data['currency'])
                    );
                }

                $data['order'] = array(
                    'order_id' => $this->request->get['order_id'],
                    'invoice_no' => $invoice_no,
                    'date_added' => date($this->language->get('date_format_short'), strtotime($order_info['date_added'])),
                    'store_name' => $order_info['store_name'],
                    'store_url' => rtrim($order_info['store_url'], '/'),
                    'store_address' => nl2br($store_address),
                    'store_email' => $store_email,
                    'store_telephone' => $store_telephone,
                    'store_fax' => $store_fax,
                    'email' => $order_info['email'],
                    'telephone' => $order_info['telephone'],
                    'shipping_address' => $shipping_address,
                    'shipping_method' => $order_info['shipping_method'],
                    'payment_address' => $payment_address,
                    'payment_method' => $order_info['payment_method'],
                    'product' => $product_data,
                    'voucher' => $voucher_data,
                    'total' => $total_data,
                    'comment' => nl2br($order_info['comment'])
                );

                $this->response->setOutput($this->load->view('kbmp_marketplace/invoice', $data));
            }
        }
    }
    
    /*
     * Function to cancel order product
     */
    public function cancel() {
        
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('kbmp_marketplace/order_details', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }
        
        $this->load->language('kbmp_marketplace/order_details');
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        //Get Seller ID
        $sellerId = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        
        //Get Order details to verfy that order is related to seller
        $order_info = $this->model_kbmp_marketplace_kbmp_marketplace->getOrder($this->request->get['order_id'], $sellerId['seller_id']);

        if ($order_info) {
            if (isset($this->request->get['order_id']) && !empty($this->request->get['order_id'])) {
                if (isset($this->request->get['product_id']) && !empty($this->request->get['product_id'])) {
                    $this->model_kbmp_marketplace_kbmp_marketplace->cancelOrderProduct($this->request->get['order_id'], $this->request->get['product_id'], $sellerId['seller_id']);
                    
                    $this->session->data['success'] = $this->language->get('text_order_cancel_success');
                }
            }
        }
        
        $this->response->redirect($this->url->link('kbmp_marketplace/order_details', '&order_id='.$this->request->get['order_id'], true));
    }
    
    /*
     * Function to update tracking number of a ordered product
     */
    public function updateTracking() {
        
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('kbmp_marketplace/order_details', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }
        
        $this->load->language('kbmp_marketplace/order_details');
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        //Get Seller ID
        $sellerId = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        
        //Get Order details to verfy that order is related to seller
        $order_info = $this->model_kbmp_marketplace_kbmp_marketplace->getOrder($this->request->get['order_id'], $sellerId['seller_id']);

        if ($order_info) {
            if (isset($this->request->get['order_id']) && !empty($this->request->get['order_id'])) {
                if (isset($this->request->get['product_id']) && !empty($this->request->get['product_id'])) {
                    if (isset($this->request->get['tracking_number']) && !empty($this->request->get['tracking_number'])) {
                        $this->model_kbmp_marketplace_kbmp_marketplace->updateTrackingNumber($this->request->get['order_id'], $this->request->get['product_id'], $this->request->get['tracking_number'], $sellerId['seller_id']);
                    
                        $this->session->data['success'] = $this->language->get('text_order_tracking_success');
                    }
                }
            }
        }
        
        $this->response->redirect($this->url->link('kbmp_marketplace/order_details', '&order_id='.$this->request->get['order_id'], true));
    }

}
