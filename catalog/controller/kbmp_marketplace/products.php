<?php

class ControllerKbmpMarketplaceProducts extends Controller {

    private $error = array();
    
    public function index() {

        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('kbmp_marketplace/products', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }

        $this->load->language('kbmp_marketplace/common');
        $this->load->language('kbmp_marketplace/products');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('kbmp_marketplace/kbmp_marketplace');

        $this->getList();
    }

    /*
     * Function definition to get Products List
     */

    protected function getList() {

        $data['title'] = $this->document->getTitle();
        $data['footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('kbmp_marketplace/header');
        $data['text_back_to_site'] = $this->language->get('text_back_to_site');
        $data['text_my_account1'] = $this->language->get('text_my_account1');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_products'] = $this->language->get('text_products');
        $data['error_account_warning'] = $this->language->get('error_account_warning');
        $data['text_account_warning'] = $this->language->get('text_account_warning');
        $data['error_account_warning'] = $this->language->get('error_account_warning');
        $data['text_account_warning'] = $this->language->get('text_account_warning');
        
        $data['home_link'] = $this->url->link('common/home');
        $data['account_link'] = $this->url->link('account/account', '', true);
        $data['logout_link'] = $this->url->link('account/logout', '', true);
        
        if (isset($this->request->get['filter_productname'])) {
            $filter_productname = $this->request->get['filter_productname'];
        } else {
            $filter_productname = null;
        }

        if (isset($this->request->get['filter_model'])) {
            $filter_model = $this->request->get['filter_model'];
        } else {
            $filter_model = null;
        }

        if (isset($this->request->get['filter_price'])) {
            $filter_price = $this->request->get['filter_price'];
        } else {
            $filter_price = null;
        }

        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
        }

        if (isset($this->request->get['filter_category'])) {
            $filter_category = $this->request->get['filter_category'];
        } else {
            $filter_category = null;
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['filter_productname'])) {
            $url .= '&filter_productname=' . urlencode(html_entity_decode($this->request->get['filter_productname'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_model'])) {
            $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_price'])) {
            $url .= '&filter_price=' . urlencode(html_entity_decode($this->request->get['filter_price'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_category'])) {
            $url .= '&filter_category=' . urlencode(html_entity_decode($this->request->get['filter_category'], ENT_QUOTES, 'UTF-8'));
        }

        $data['products'] = array();

        //Get Seller ID
        $sellerId = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        $data['seller_details'] = $sellerId;
        
        $filter_data = array(
            'seller_id' => $sellerId['seller_id'],
            'filter_productname' => trim($filter_productname),
            'filter_model' => trim($filter_model),
            'filter_price' => trim($filter_price),
            'filter_category' => trim($filter_category),
            'filter_status' => trim($filter_status),
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $data['filter_data'] = $filter_data;

        $products_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerProducts($filter_data, 1);

        $data['products_total'] = $products_total;

//        var_dump($filter_data);die;
        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerProducts($filter_data, 1);
//        var_dump($results);die;
        $this->load->model('tool/image');
        
        $this->load->adminmodel('catalog/product');

        foreach ($results as $result) {

            if (is_file(DIR_IMAGE . $result['image'])) {
                $image = $this->model_tool_image->resize($result['image'], 40, 40);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 40, 40);
            }
            
            $product_specials = $this->model_catalog_product->getProductSpecials($result['product_id']);

            $special = '';
            foreach ($product_specials  as $product_special) {
                if (($product_special['date_start'] == '0000-00-00' || strtotime($product_special['date_start']) < time()) && ($product_special['date_end'] == '0000-00-00' || strtotime($product_special['date_end']) > time())) {
                    $special = $product_special['price'];

                    break;
                }
            }

            $data['products'][] = array(
                'product_id' => $result['product_id'],
                'product_name' => $result['name'],
                'image' => $image,
                'model' => $result['model'],
                'special' => !empty($special) ? $this->currency->format($special, $this->session->data['currency']) : '',
                'price' => $this->currency->format($result['price'], $this->session->data['currency']),
                'quantity' => !empty($result['qty_sold']) ? $result['qty_sold'] : 0,
                'earning' => $this->currency->format($result['seller_earning'], $this->session->data['currency']),
                'status' => $result['status'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'edit' => $this->url->link('kbmp_marketplace/products/add', 'product_id=' . $result['product_id'], true),
		//Start Added changes to resolve issue of wrong product link 24-Dec-2018 - Harsh Agarwal
                'link' => $this->url->link('product/product', 'product_id=' . $result['product_id'], true),
		//Ends

                'approval_status' => $result['approved']
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_my_account'] = $this->language->get('text_my_account');

        $data['text_add'] = $this->language->get('text_add');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_delete'] = $this->language->get('text_delete');
        $data['text_filter_search'] = $this->language->get('text_filter_search');
        $data['text_product_name'] = $this->language->get('text_product_name');
        $data['text_price'] = $this->language->get('text_price');
        $data['text_model'] = $this->language->get('text_model');
        $data['text_category'] = $this->language->get('text_category');
        $data['text_status'] = $this->language->get('text_status');

        //start volyminhnhan@gmail modifications
        $data['text_approval_status'] = $this->language->get('text_approval_status');
        $data['text_waiting_approval'] = $this->language->get('text_waiting_approval');
        $data['text_approve'] = $this->language->get('text_approve');
        $data['text_disapprove'] = $this->language->get('text_disapprove');
        $data['text_disapproved'] = $this->language->get('text_disapproved');
        //end volyminhnhan@gmail modifications

        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_filter'] = $this->language->get('text_filter');
        $data['text_reset'] = $this->language->get('text_reset');
        $data['text_quantity_sold'] = $this->language->get('text_quantity_sold');
        $data['text_earned'] = $this->language->get('text_earned');
        $data['text_action'] = $this->language->get('text_action');
        $data['text_select'] = $this->language->get('text_select');
        $data['text_no_record'] = $this->language->get('text_no_record');
        $data['text_selection_error'] = $this->language->get('text_selection_error');
        $data['text_confirm'] = $this->language->get('text_confirm');

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

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['error'])) {
            $data['error'] = $this->session->data['error'];
            unset($this->session->data['error']);
        } else {
            $data['error'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        $url = '';

        if (isset($this->request->get['filter_productname'])) {
            $url .= '&filter_productname=' . urlencode(html_entity_decode($this->request->get['filter_productname'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_model'])) {
            $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_firstname'])) {
            $url .= '&filter_firstname=' . urlencode(html_entity_decode($this->request->get['filter_firstname'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_lastname'])) {
            $url .= '&filter_lastname=' . urlencode(html_entity_decode($this->request->get['filter_lastname'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_quantity'])) {
            $url .= '&filter_quantity=' . urlencode(html_entity_decode($this->request->get['filter_quantity'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
        }

        $pagination = new Pagination();
        $pagination->total = $products_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/products', $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($products_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($products_total - $this->config->get('config_limit_admin'))) ? $products_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $products_total, ceil($products_total / $this->config->get('config_limit_admin')));

//        $data['header'] = $this->load->controller('common/header');
//        $data['footer'] = $this->load->controller('common/footer');

	$this->load->model('setting/kbmp_marketplace');
        //Get the module configuration values
        $store_id = (int) $this->config->get('config_store_id');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
        $data['kbmp_marketplace_settings'] = $settings;
        $sellerId = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        $data['seller_details'] = $sellerId;

        $this->response->setOutput($this->load->view('kbmp_marketplace/products', $data));
    }

    /*
     * Function to handle product deletion request
     */

    public function delete() {

        if (isset($this->request->get['products']) && !empty($this->request->get['products'])) {
            $delete_products = explode("-", $this->request->get['products']);

            $this->load->language('kbmp_marketplace/products');
            $this->load->model('kbmp_marketplace/kbmp_marketplace');

            //Get Seller Information
            $seller = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();

            if (isset($seller['seller_id']) && !empty($seller['seller_id'])) {
                if ($this->model_kbmp_marketplace_kbmp_marketplace->deleteProducts($seller['seller_id'], $delete_products)) {
                    $this->session->data['success'] = $this->language->get('text_delete_success');
                } else {
                    $this->session->data['success'] = $this->language->get('text_delete_error');
                }
            }

            $this->response->redirect($this->url->link('kbmp_marketplace/products', '', true));
        }
    }

    public function add() {
        
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('kbmp_marketplace/products', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }
        
        $this->load->language('kbmp_marketplace/common');
        $this->load->language('kbmp_marketplace/products');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $this->load->model('setting/kbmp_marketplace');
        
        $this->load->adminmodel('catalog/product');
        
        //Get Seller Information
        $seller = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
 
        $store_id = (int) $this->config->get('config_store_id');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
        
        //Get Seller Configuration to overwrite default configuration if set exclusively for seller
        $seller_config = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerConfig($seller['seller_id'], $store_id);
        if (isset($seller_config) && !empty($seller_config)) {
            foreach ($seller_config as $sellerconfig) {
                $settings['kbmp_marketplace_setting'][$sellerconfig['key']] = $sellerconfig['value'];
            }
        }
//        if(isset($seller['approved']) && $seller['approved'] != '1'){
//            if(isset($settings['kbmp_product_limit'])){
//                
//            }
//        }

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

            if (isset($this->request->get['product_id']) && !empty($this->request->get['product_id'])) {
                //Edit Product and its details
                $this->model_catalog_product->editProduct($this->request->get['product_id'], $this->request->post);

                //start volyminhnhan@gmail modifications
                //reset approval status in this case
                $this->model_kbmp_marketplace_kbmp_marketplace->updateProductApprovalStatus($product_id, 0);
                //end volyminhnhan@gmail modifications
            } else {                    
                //Get Seller Products Count
                $seller_data = array('seller_id' => $seller['seller_id']);
                $seller_products_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerNewProducts($seller_data, 1);
                
                if (isset($seller['approved']) && $seller['approved'] != '1') {
                    //Check product limit if seller is not approved
                    if ($seller_products_total < $seller['product_limit']) {
                        //Add Product and its details
                        $product_id = $this->model_catalog_product->addProduct($this->request->post);

                        //Add product entry in seller table of products to map products with seller
                        if (isset($product_id) && !empty($product_id)) {
                            $this->model_kbmp_marketplace_kbmp_marketplace->addSellerProduct($seller['seller_id'], $product_id, $settings['kbmp_marketplace_setting']['kbmp_new_product_approval_required']);
                            
                            //Check if approval required then send email
                            if (isset($settings['kbmp_marketplace_setting']['kbmp_new_product_approval_required']) && !empty($settings['kbmp_marketplace_setting']['kbmp_new_product_approval_required'])) {
                                //Send New Product Approval Request mail to admin
                                $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($seller['seller_id']);
                                $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(6);

                                if (isset($email_template) && !empty($email_template)) {
                                    $message = str_replace("{{seller_title}}", $seller_details['title'], $email_template['email_content']); //Seller Email
                                    $message = str_replace("{{product_name}}", $this->request->post['product_description'][$this->config->get('config_language_id')]['name'], $message); //Product Name
                                    $message = str_replace("{{product_sku}}", $this->request->post['sku'], $message); //Product SKU
                                    $message = str_replace("{{product_price}}", $this->currency->format($this->request->post['price'], $this->session->data['currency']), $message); //Product Price
                                    $message = str_replace("{{seller_name}}", $seller_details['firstname'] . ' ' . $seller_details['lastname'], $message); //Seller Name
                                    $message = str_replace("{{seller_email}}", $seller_details['email'], $message); //Seller Email
                                    $message = str_replace("{{seller_contact}}", $seller_details['telephone'], $message); //Seller Contact
                                    $message = str_replace("{{shop_url}}", HTTPS_SERVER , $message); //Store URL

                                    $email_content  = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">' . "\n";
                                    $email_content .= '<html>' . "\n";
                                    $email_content .= '  <head>' . "\n";
                                    $email_content .= '    <title>' . $email_template['email_subject'] . '</title>' . "\n";
                                    $email_content .= '    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' . "\n";
                                    $email_content .= '  </head>' . "\n";
                                    $email_content .= '  <body>' . html_entity_decode($message, ENT_QUOTES, 'UTF-8') . '</body>' . "\n";
                                    $email_content .= '</html>' . "\n";

                                    if (VERSION < 3.0) {
                                        $mail = new Mail();
                                    } else {
                                        $mail = new Mail($this->config->get('config_mail_engine'));
                                    }
                                    $mail->protocol = $this->config->get('config_mail_protocol');
                                    $mail->parameter = $this->config->get('config_mail_parameter');
                                    $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
                                    $mail->smtp_username = $this->config->get('config_mail_smtp_username');
                                    $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
                                    $mail->smtp_port = $this->config->get('config_mail_smtp_port');
                                    $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

                                    $mail->setTo($this->config->get('config_email'));
                                    $mail->setFrom($this->config->get('config_email'));
                                    $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
                                    $mail->setSubject(html_entity_decode($email_template['email_subject'], ENT_QUOTES, 'UTF-8'));
                                    $mail->setHtml($email_content);
                                    $mail->send();
                                }
                            } else {
                                //Add enabled product in tracking table if approval is not required and seller is not approved
                                if (isset($this->request->post['status']) && !empty($this->request->post['status'])) {
                                    $this->model_kbmp_marketplace_kbmp_marketplace->addSellerProductsForTracking($seller['seller_id'], array('0' => array('product_id' => $product_id)));
                                    
                                    //Set product status as disabled/inactive
                                    $this->model_kbmp_marketplace_kbmp_marketplace->updateProductStatus($product_id, 0);
                                }
                            }
                        }
                    } else {
                        $this->session->data['error'] = $this->language->get('error_product_limit');
                        $this->response->redirect($this->url->link('kbmp_marketplace/products', '', true));
                    }
                } else {
                    //Add Product and its details
                    $product_id = $this->model_catalog_product->addProduct($this->request->post);

                    //Add product entry in seller table of products to map products with seller
                    if (isset($product_id) && !empty($product_id)) {
                        $this->model_kbmp_marketplace_kbmp_marketplace->addSellerProduct($seller['seller_id'], $product_id, $settings['kbmp_marketplace_setting']['kbmp_new_product_approval_required']);

                        //Check if approval required then send email
                        if (isset($settings['kbmp_marketplace_setting']['kbmp_new_product_approval_required']) && !empty($settings['kbmp_marketplace_setting']['kbmp_new_product_approval_required'])) {
                            //Send New Product Approval Request mail to admin
                            $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($seller['seller_id']);
                            $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(6);

                            if (isset($email_template) && !empty($email_template)) {
                                $message = str_replace("{{seller_title}}", $seller_details['title'], $email_template['email_content']); //Seller Email
                                $message = str_replace("{{product_name}}", $this->request->post['product_description'][$this->config->get('config_language_id')]['name'], $message); //Product Name
                                $message = str_replace("{{product_sku}}", $this->request->post['sku'], $message); //Product SKU
                                $message = str_replace("{{product_price}}", $this->currency->format($this->request->post['price'], $this->session->data['currency']), $message); //Product Price
                                $message = str_replace("{{seller_name}}", $seller_details['firstname'] . ' ' . $seller_details['lastname'], $message); //Seller Name
                                $message = str_replace("{{seller_email}}", $seller_details['email'], $message); //Seller Email
                                $message = str_replace("{{seller_contact}}", $seller_details['telephone'], $message); //Seller Contact
                                $message = str_replace("{{shop_url}}", HTTPS_SERVER , $message); //Store URL

                                $email_content  = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">' . "\n";
                                $email_content .= '<html>' . "\n";
                                $email_content .= '  <head>' . "\n";
                                $email_content .= '    <title>' . $email_template['email_subject'] . '</title>' . "\n";
                                $email_content .= '    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' . "\n";
                                $email_content .= '  </head>' . "\n";
                                $email_content .= '  <body>' . html_entity_decode($message, ENT_QUOTES, 'UTF-8') . '</body>' . "\n";
                                $email_content .= '</html>' . "\n";

                                if (VERSION < 3.0) {
                                    $mail = new Mail();
                                } else {
                                    $mail = new Mail($this->config->get('config_mail_engine'));
                                }
                                $mail->protocol = $this->config->get('config_mail_protocol');
                                $mail->parameter = $this->config->get('config_mail_parameter');
                                $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
                                $mail->smtp_username = $this->config->get('config_mail_smtp_username');
                                $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
                                $mail->smtp_port = $this->config->get('config_mail_smtp_port');
                                $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

                                $mail->setTo($this->config->get('config_email'));
                                $mail->setFrom($this->config->get('config_email'));
                                $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
                                $mail->setSubject(html_entity_decode($email_template['email_subject'], ENT_QUOTES, 'UTF-8'));
                                $mail->setHtml($email_content);
                                $mail->send();
                            }
                        }
                    }
                }
            }
            
            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('kbmp_marketplace/products', '', true));
        }

        $this->getForm();
    }

    protected function getForm() {
        
        $this->load->language('kbmp_marketplace/products');
        $this->load->language('kbmp_marketplace/common');
        
        $data['title'] = $this->document->getTitle();
        $data['footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('kbmp_marketplace/header');
        $data['text_back_to_site'] = $this->language->get('text_back_to_site');
        $data['text_my_account1'] = $this->language->get('text_my_account1');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_products'] = $this->language->get('text_products');
        $data['error_account_warning'] = $this->language->get('error_account_warning');
        $data['text_account_warning'] = $this->language->get('text_account_warning');
        $data['error_account_warning'] = $this->language->get('error_account_warning');
        $data['text_account_warning'] = $this->language->get('text_account_warning');
        
        $data['home_link'] = $this->url->link('common/home');
        $data['account_link'] = $this->url->link('account/account', '', true);
        $data['logout_link'] = $this->url->link('account/logout', '', true);
        
        if (isset($this->request->get['product_id']) && !empty($this->request->get['product_id'])) {
            $data['edit'] = true;
        }
        //Get Seller Information
        $seller = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        $data['seller_details'] = $seller;
        
        $store_id = (int) $this->config->get('config_store_id');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
        
        //Get Seller Configuration to overwrite default configuration if set exclusively for seller
        $seller_config = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerConfig($seller['seller_id'], $store_id);
        if (isset($seller_config) && !empty($seller_config)) {
            foreach ($seller_config as $sellerconfig) {
                $settings['kbmp_marketplace_setting'][$sellerconfig['key']] = $sellerconfig['value'];
            }
        }

        $data['kbmp_marketplace_settings'] = $settings;
        
        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_add_product'] = $this->language->get('text_add_product');

        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_save'] = $this->language->get('text_save');
        $data['text_back'] = $this->language->get('text_back');
        
        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_description'] = $this->language->get('entry_description');
        $data['entry_meta_title'] = $this->language->get('entry_meta_title');
        $data['entry_meta_description'] = $this->language->get('entry_meta_description');
        $data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
        $data['entry_keyword'] = $this->language->get('entry_keyword');
        $data['entry_model'] = $this->language->get('entry_model');
        $data['entry_sku'] = $this->language->get('entry_sku');
        $data['entry_upc'] = $this->language->get('entry_upc');
        $data['entry_ean'] = $this->language->get('entry_ean');
        $data['entry_jan'] = $this->language->get('entry_jan');
        $data['entry_isbn'] = $this->language->get('entry_isbn');
        $data['entry_mpn'] = $this->language->get('entry_mpn');
        $data['entry_location'] = $this->language->get('entry_location');
        $data['entry_minimum'] = $this->language->get('entry_minimum');
        $data['entry_shipping'] = $this->language->get('entry_shipping');
        $data['entry_date_available'] = $this->language->get('entry_date_available');
        $data['entry_quantity'] = $this->language->get('entry_quantity');
        $data['entry_stock_status'] = $this->language->get('entry_stock_status');
        $data['entry_price'] = $this->language->get('entry_price');
        $data['entry_tax_class'] = $this->language->get('entry_tax_class');
        $data['entry_points'] = $this->language->get('entry_points');
        $data['entry_option_points'] = $this->language->get('entry_option_points');
        $data['entry_subtract'] = $this->language->get('entry_subtract');
        $data['entry_weight_class'] = $this->language->get('entry_weight_class');
        $data['entry_weight'] = $this->language->get('entry_weight');
        $data['entry_dimension'] = $this->language->get('entry_dimension');
        $data['entry_length_class'] = $this->language->get('entry_length_class');
        $data['entry_length'] = $this->language->get('entry_length');
        $data['entry_width'] = $this->language->get('entry_width');
        $data['entry_height'] = $this->language->get('entry_height');
        $data['entry_image'] = $this->language->get('entry_image');
        $data['entry_additional_image'] = $this->language->get('entry_additional_image');
        $data['entry_store'] = $this->language->get('entry_store');
        $data['entry_manufacturer'] = $this->language->get('entry_manufacturer');
        $data['entry_download'] = $this->language->get('entry_download');
        $data['entry_category'] = $this->language->get('entry_category');
        $data['entry_filter'] = $this->language->get('entry_filter');
        $data['entry_related'] = $this->language->get('entry_related');
        $data['entry_attribute'] = $this->language->get('entry_attribute');
        $data['entry_text'] = $this->language->get('entry_text');
        $data['entry_option'] = $this->language->get('entry_option');
        $data['entry_option_value'] = $this->language->get('entry_option_value');
        $data['entry_required'] = $this->language->get('entry_required');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_date_start'] = $this->language->get('entry_date_start');
        $data['entry_date_end'] = $this->language->get('entry_date_end');
        $data['entry_priority'] = $this->language->get('entry_priority');
        $data['entry_tag'] = $this->language->get('entry_tag');
        $data['entry_customer_group'] = $this->language->get('entry_customer_group');
        
        $data['help_keyword'] = $this->language->get('help_keyword');
        $data['help_sku'] = $this->language->get('help_sku');
        $data['help_upc'] = $this->language->get('help_upc');
        $data['help_ean'] = $this->language->get('help_ean');
        $data['help_jan'] = $this->language->get('help_jan');
        $data['help_isbn'] = $this->language->get('help_isbn');
        $data['help_mpn'] = $this->language->get('help_mpn');
        $data['help_minimum'] = $this->language->get('help_minimum');
        $data['help_manufacturer'] = $this->language->get('help_manufacturer');
        $data['help_stock_status'] = $this->language->get('help_stock_status');
        $data['help_points'] = $this->language->get('help_points');
        $data['help_category'] = $this->language->get('help_category');
        $data['help_filter'] = $this->language->get('help_filter');
        $data['help_download'] = $this->language->get('help_download');
        $data['help_related'] = $this->language->get('help_related');
        $data['help_tag'] = $this->language->get('help_tag');

        $data['button_attribute_add'] = $this->language->get('button_attribute_add');
        $data['button_option_add'] = $this->language->get('button_option_add');
        $data['button_option_value_add'] = $this->language->get('button_option_value_add');
        $data['button_discount_add'] = $this->language->get('button_discount_add');
        $data['button_special_add'] = $this->language->get('button_special_add');
        $data['button_image_add'] = $this->language->get('button_image_add');
        $data['button_remove'] = $this->language->get('button_remove');

        $data['tab_general'] = $this->language->get('tab_general');
        $data['tab_data'] = $this->language->get('tab_data');
        $data['tab_attribute'] = $this->language->get('tab_attribute');
        $data['tab_option'] = $this->language->get('tab_option');
        $data['tab_discount'] = $this->language->get('tab_discount');
        $data['tab_special'] = $this->language->get('tab_special');
        $data['tab_image'] = $this->language->get('tab_image');
        $data['tab_links'] = $this->language->get('tab_links');
        
        $data['back_link'] = $this->url->link('kbmp_marketplace/products');
        
        //Velovalidation Text
        $data['empty_fname'] = $this->language->get('empty_fname');
        $data['maxchar_fname'] = $this->language->get('maxchar_fname');
        $data['minchar_fname'] = $this->language->get('minchar_fname');
        $data['empty_mname'] = $this->language->get('empty_mname');
        $data['maxchar_mname'] = $this->language->get('maxchar_mname');
        $data['minchar_mname'] = $this->language->get('minchar_mname');
        $data['only_alphabet'] = $this->language->get('only_alphabet');
        $data['empty_lname'] = $this->language->get('empty_lname');
        $data['maxchar_lname'] = $this->language->get('maxchar_lname');
        $data['minchar_lname'] = $this->language->get('minchar_lname');
        $data['alphanumeric'] = $this->language->get('alphanumeric');
        $data['empty_pass'] = $this->language->get('empty_pass');
        $data['maxchar_pass'] = $this->language->get('maxchar_pass');
        $data['minchar_pass'] = $this->language->get('minchar_pass');
        $data['specialchar_pass'] = $this->language->get('specialchar_pass');
        $data['alphabets_pass'] = $this->language->get('alphabets_pass');
        $data['capital_alphabets_pass'] = $this->language->get('capital_alphabets_pass');
        $data['small_alphabets_pass'] = $this->language->get('small_alphabets_pass');
        $data['digit_pass'] = $this->language->get('digit_pass');
        $data['empty_field'] = $this->language->get('empty_field');
        $data['empty_field_lang'] = $this->language->get('empty_field_lang');
        $data['number_field'] = $this->language->get('number_field');
        $data['positive_number'] = $this->language->get('positive_number');
        $data['maxchar_field'] = $this->language->get('maxchar_field');
        $data['minchar_field'] = $this->language->get('minchar_field');
        $data['empty_email'] = $this->language->get('empty_email');
        $data['validate_email'] = $this->language->get('validate_email');
        $data['empty_country'] = $this->language->get('empty_country');
        $data['maxchar_country'] = $this->language->get('maxchar_country');
        $data['minchar_country'] = $this->language->get('minchar_country');
        $data['empty_city'] = $this->language->get('empty_city');
        $data['maxchar_city'] = $this->language->get('maxchar_city');
        $data['minchar_city'] = $this->language->get('minchar_city');
        $data['empty_state'] = $this->language->get('empty_state');
        $data['maxchar_state'] = $this->language->get('maxchar_state');
        $data['minchar_state'] = $this->language->get('minchar_state');
        $data['empty_proname'] = $this->language->get('empty_proname');
        $data['maxchar_proname'] = $this->language->get('maxchar_proname');
        $data['minchar_proname'] = $this->language->get('minchar_proname');
        $data['empty_catname'] = $this->language->get('empty_catname');
        $data['maxchar_catname'] = $this->language->get('maxchar_catname');
        $data['minchar_catname'] = $this->language->get('minchar_catname');
        $data['empty_zip'] = $this->language->get('empty_zip');
        $data['maxchar_zip'] = $this->language->get('maxchar_zip');
        $data['minchar_zip'] = $this->language->get('minchar_zip');
        $data['empty_username'] = $this->language->get('empty_username');
        $data['maxchar_username'] = $this->language->get('maxchar_username');
        $data['minchar_username'] = $this->language->get('minchar_username');
        $data['invalid_date'] = $this->language->get('invalid_date');
        $data['maxchar_sku'] = $this->language->get('maxchar_sku');
        $data['minchar_sku'] = $this->language->get('minchar_sku');
        $data['invalid_sku'] = $this->language->get('invalid_sku');
        $data['empty_sku'] = $this->language->get('empty_sku');
        $data['validate_range'] = $this->language->get('validate_range');
        $data['empty_address'] = $this->language->get('empty_address');
        $data['minchar_address'] = $this->language->get('minchar_address');
        $data['maxchar_address'] = $this->language->get('maxchar_address');
        $data['empty_company'] = $this->language->get('empty_company');
        $data['minchar_company'] = $this->language->get('minchar_company');
        $data['maxchar_company'] = $this->language->get('maxchar_company');
        $data['invalid_phone'] = $this->language->get('invalid_phone');
        $data['empty_phone'] = $this->language->get('empty_phone');
        $data['minchar_phone'] = $this->language->get('minchar_phone');
        $data['maxchar_phone'] = $this->language->get('maxchar_phone');
        $data['empty_brand'] = $this->language->get('empty_brand');
        $data['maxchar_brand'] = $this->language->get('maxchar_brand');
        $data['minchar_brand'] = $this->language->get('minchar_brand');
        $data['empty_shipment'] = $this->language->get('empty_shipment');
        $data['maxchar_shipment'] = $this->language->get('maxchar_shipment');
        $data['minchar_shipment'] = $this->language->get('minchar_shipment');
        $data['invalid_ip'] = $this->language->get('invalid_ip');
        $data['invalid_url'] = $this->language->get('invalid_url');
        $data['empty_url'] = $this->language->get('empty_url');
        $data['valid_amount'] = $this->language->get('valid_amount');
        $data['valid_decimal'] = $this->language->get('valid_decimal');
        $data['max_email'] = $this->language->get('max_email');
        $data['specialchar_zip'] = $this->language->get('specialchar_zip');
        $data['specialchar_sku'] = $this->language->get('specialchar_sku');
        $data['max_url'] = $this->language->get('max_url');
        $data['valid_percentage'] = $this->language->get('valid_percentage');
        $data['between_percentage'] = $this->language->get('between_percentage');
        $data['maxchar_size'] = $this->language->get('maxchar_size');
        $data['specialchar_size'] = $this->language->get('specialchar_size');
        $data['specialchar_upc'] = $this->language->get('specialchar_upc');
        $data['maxchar_upc'] = $this->language->get('maxchar_upc');
        $data['specialchar_ean'] = $this->language->get('specialchar_ean');
        $data['maxchar_ean'] = $this->language->get('maxchar_ean');
        $data['specialchar_bar'] = $this->language->get('specialchar_bar');
        $data['maxchar_bar'] = $this->language->get('maxchar_bar');
        $data['positive_amount'] = $this->language->get('positive_amount');
        $data['maxchar_color'] = $this->language->get('maxchar_color');
        $data['invalid_color'] = $this->language->get('invalid_color');
        $data['specialchar'] = $this->language->get('specialchar');
        $data['script'] = $this->language->get('script');
        $data['style'] = $this->language->get('style');
        $data['iframe'] = $this->language->get('iframe');
        $data['not_image'] = $this->language->get('not_image');
        $data['image_size'] = $this->language->get('image_size');
        $data['html_tags'] = $this->language->get('html_tags');
        $data['number_pos'] = $this->language->get('number_pos');
        $data['invalid_separator'] = $this->language->get('invalid_separator');
        
        $data['validate_error_name'] = $this->language->get('validate_error_name');
        $data['validate_error_meta_title'] = $this->language->get('validate_error_meta_title');
        $data['validate_error_model'] = $this->language->get('error_model');
        $data['validate_error_keyword'] = $this->language->get('error_keyword');
        
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['name'])) {
            $data['error_name'] = $this->error['name'];
        } else {
            $data['error_name'] = array();
        }

        if (isset($this->error['meta_title'])) {
            $data['error_meta_title'] = $this->error['meta_title'];
        } else {
            $data['error_meta_title'] = array();
        }

        if (isset($this->error['model'])) {
            $data['error_model'] = $this->error['model'];
        } else {
            $data['error_model'] = '';
        }

        if (isset($this->error['keyword'])) {
            $data['error_keyword'] = $this->error['keyword'];
        } else {
            $data['error_keyword'] = '';
        }
        
        if (isset($this->error['product_category'])) {
            $data['error_product_category'] = $this->error['product_category'];
        } else {
            $data['error_product_category'] = '';
        }

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_model'])) {
            $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_price'])) {
            $url .= '&filter_price=' . $this->request->get['filter_price'];
        }

        if (isset($this->request->get['filter_quantity'])) {
            $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
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

        if (!isset($this->request->get['product_id'])) {
            $data['action'] = $this->url->link('kbmp_marketplace/products/add', $url, true);
        } else {
            $data['action'] = $this->url->link('kbmp_marketplace/products/add', '&product_id=' . $this->request->get['product_id'] . $url, true);
        }

        $data['cancel'] = $this->url->link('kbmp_marketplace/products', $url, true);

        if (isset($this->request->get['product_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $product_info = $this->model_catalog_product->getProduct($this->request->get['product_id']);
        }

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();

        if (isset($this->request->post['product_description'])) {
            $data['product_description'] = $this->request->post['product_description'];
        } elseif (isset($this->request->get['product_id'])) {
            $data['product_description'] = $this->model_catalog_product->getProductDescriptions($this->request->get['product_id']);
        } else {
            $data['product_description'] = array();
        }

        if (isset($this->request->post['model'])) {
            $data['model'] = $this->request->post['model'];
        } elseif (!empty($product_info)) {
            $data['model'] = $product_info['model'];
        } else {
            $data['model'] = '';
        }

        if (isset($this->request->post['sku'])) {
            $data['sku'] = $this->request->post['sku'];
        } elseif (!empty($product_info)) {
            $data['sku'] = $product_info['sku'];
        } else {
            $data['sku'] = '';
        }

        if (isset($this->request->post['upc'])) {
            $data['upc'] = $this->request->post['upc'];
        } elseif (!empty($product_info)) {
            $data['upc'] = $product_info['upc'];
        } else {
            $data['upc'] = '';
        }

        if (isset($this->request->post['ean'])) {
            $data['ean'] = $this->request->post['ean'];
        } elseif (!empty($product_info)) {
            $data['ean'] = $product_info['ean'];
        } else {
            $data['ean'] = '';
        }

        if (isset($this->request->post['jan'])) {
            $data['jan'] = $this->request->post['jan'];
        } elseif (!empty($product_info)) {
            $data['jan'] = $product_info['jan'];
        } else {
            $data['jan'] = '';
        }

        if (isset($this->request->post['isbn'])) {
            $data['isbn'] = $this->request->post['isbn'];
        } elseif (!empty($product_info)) {
            $data['isbn'] = $product_info['isbn'];
        } else {
            $data['isbn'] = '';
        }

        if (isset($this->request->post['mpn'])) {
            $data['mpn'] = $this->request->post['mpn'];
        } elseif (!empty($product_info)) {
            $data['mpn'] = $product_info['mpn'];
        } else {
            $data['mpn'] = '';
        }

        if (isset($this->request->post['location'])) {
            $data['location'] = $this->request->post['location'];
        } elseif (!empty($product_info)) {
            $data['location'] = $product_info['location'];
        } else {
            $data['location'] = '';
        }

        if (isset($this->request->post['keyword'])) {
            $data['keyword'] = $this->request->post['keyword'];
        } elseif (!empty($product_info['keyword'])) {
            $data['keyword'] = $product_info['keyword'];
        } else {
            $data['keyword'] = '';
        }

        if (isset($this->request->post['shipping'])) {
            $data['shipping'] = $this->request->post['shipping'];
        } elseif (!empty($product_info)) {
            $data['shipping'] = $product_info['shipping'];
        } else {
            $data['shipping'] = 1;
        }

        if (isset($this->request->post['price'])) {
            $data['price'] = $this->request->post['price'];
        } elseif (!empty($product_info)) {
            $data['price'] = $product_info['price'];
        } else {
            $data['price'] = '';
        }

        $this->load->adminmodel('localisation/tax_class');

        $data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

        if (isset($this->request->post['tax_class_id'])) {
            $data['tax_class_id'] = $this->request->post['tax_class_id'];
        } elseif (!empty($product_info)) {
            $data['tax_class_id'] = $product_info['tax_class_id'];
        } else {
            $data['tax_class_id'] = 0;
        }

        if (isset($this->request->post['date_available'])) {
            $data['date_available'] = $this->request->post['date_available'];
        } elseif (!empty($product_info)) {
            $data['date_available'] = ($product_info['date_available'] != '0000-00-00') ? $product_info['date_available'] : '';
        } else {
            $data['date_available'] = date('Y-m-d');
        }

        if (isset($this->request->post['quantity'])) {
            $data['quantity'] = $this->request->post['quantity'];
        } elseif (!empty($product_info)) {
            $data['quantity'] = $product_info['quantity'];
        } else {
            $data['quantity'] = 1;
        }

        if (isset($this->request->post['minimum'])) {
            $data['minimum'] = $this->request->post['minimum'];
        } elseif (!empty($product_info)) {
            $data['minimum'] = $product_info['minimum'];
        } else {
            $data['minimum'] = 1;
        }

        if (isset($this->request->post['subtract'])) {
            $data['subtract'] = $this->request->post['subtract'];
        } elseif (!empty($product_info)) {
            $data['subtract'] = $product_info['subtract'];
        } else {
            $data['subtract'] = 1;
        }

        if (isset($this->request->post['sort_order'])) {
            $data['sort_order'] = $this->request->post['sort_order'];
        } elseif (!empty($product_info)) {
            $data['sort_order'] = $product_info['sort_order'];
        } else {
            $data['sort_order'] = 1;
        }

        $this->load->adminmodel('localisation/stock_status');

        $data['stock_statuses'] = $this->model_localisation_stock_status->getStockStatuses();

        if (isset($this->request->post['stock_status_id'])) {
            $data['stock_status_id'] = $this->request->post['stock_status_id'];
        } elseif (!empty($product_info)) {
            $data['stock_status_id'] = $product_info['stock_status_id'];
        } else {
            $data['stock_status_id'] = 0;
        }

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($product_info)) {
            $data['status'] = $product_info['status'];
        } else {
            $data['status'] = true;
        }

        if (isset($this->request->post['weight'])) {
            $data['weight'] = $this->request->post['weight'];
        } elseif (!empty($product_info)) {
            $data['weight'] = $product_info['weight'];
        } else {
            $data['weight'] = 1;
        }

        $this->load->adminmodel('localisation/weight_class');

        $data['weight_classes'] = $this->model_localisation_weight_class->getWeightClasses();

        if (isset($this->request->post['weight_class_id'])) {
            $data['weight_class_id'] = $this->request->post['weight_class_id'];
        } elseif (!empty($product_info)) {
            $data['weight_class_id'] = $product_info['weight_class_id'];
        } else {
            $data['weight_class_id'] = $this->config->get('config_weight_class_id');
        }

        if (isset($this->request->post['length'])) {
            $data['length'] = $this->request->post['length'];
        } elseif (!empty($product_info)) {
            $data['length'] = $product_info['length'];
        } else {
            $data['length'] = '';
        }

        if (isset($this->request->post['width'])) {
            $data['width'] = $this->request->post['width'];
        } elseif (!empty($product_info)) {
            $data['width'] = $product_info['width'];
        } else {
            $data['width'] = '';
        }

        if (isset($this->request->post['height'])) {
            $data['height'] = $this->request->post['height'];
        } elseif (!empty($product_info)) {
            $data['height'] = $product_info['height'];
        } else {
            $data['height'] = '';
        }

        $this->load->adminmodel('localisation/length_class');

        $data['length_classes'] = $this->model_localisation_length_class->getLengthClasses();

        if (isset($this->request->post['length_class_id'])) {
            $data['length_class_id'] = $this->request->post['length_class_id'];
        } elseif (!empty($product_info)) {
            $data['length_class_id'] = $product_info['length_class_id'];
        } else {
            $data['length_class_id'] = $this->config->get('config_length_class_id');
        }

        $this->load->adminmodel('catalog/manufacturer');

        if (isset($this->request->post['manufacturer_id'])) {
            $data['manufacturer_id'] = $this->request->post['manufacturer_id'];
        } elseif (!empty($product_info)) {
            $data['manufacturer_id'] = $product_info['manufacturer_id'];
        } else {
            $data['manufacturer_id'] = 0;
        }

        if (isset($this->request->post['manufacturer'])) {
            $data['manufacturer'] = $this->request->post['manufacturer'];
        } elseif (!empty($product_info)) {
            $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($product_info['manufacturer_id']);

            if ($manufacturer_info) {
                $data['manufacturer'] = $manufacturer_info['name'];
            } else {
                $data['manufacturer'] = '';
            }
        } else {
            $data['manufacturer'] = '';
        }

        // Categories
        if (isset($this->request->post['product_category'])) {
            $categories = $this->request->post['product_category'];
        } elseif (isset($this->request->get['product_id'])) {
            $categories = $this->model_catalog_product->getProductCategories($this->request->get['product_id']);
        } else {
            $categories = array();
        }

        $data['product_categories'] = array();

        foreach ($categories as $category_id) {
            $category_info = $this->model_kbmp_marketplace_kbmp_marketplace->getCategory($category_id);

            if ($category_info) {
                $data['product_categories'][] = array(
                    'category_id' => $category_info['category_id'],
                    'name' => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
                );
            }
        }

        // Filters
        $this->load->adminmodel('catalog/filter');

        if (isset($this->request->post['product_filter'])) {
            $filters = $this->request->post['product_filter'];
        } elseif (isset($this->request->get['product_id'])) {
            $filters = $this->model_catalog_product->getProductFilters($this->request->get['product_id']);
        } else {
            $filters = array();
        }

        $data['product_filters'] = array();

        foreach ($filters as $filter_id) {
            $filter_info = $this->model_catalog_filter->getFilter($filter_id);

            if ($filter_info) {
                $data['product_filters'][] = array(
                    'filter_id' => $filter_info['filter_id'],
                    'name' => $filter_info['group'] . ' &gt; ' . $filter_info['name']
                );
            }
        }

        // Attributes
        $this->load->adminmodel('catalog/attribute');

        if (isset($this->request->post['product_attribute'])) {
            $product_attributes = $this->request->post['product_attribute'];
        } elseif (isset($this->request->get['product_id'])) {
            $product_attributes = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);
        } else {
            $product_attributes = array();
        }

        $data['product_attributes'] = array();

        foreach ($product_attributes as $product_attribute) {
            $attribute_info = $this->model_catalog_attribute->getAttribute($product_attribute['attribute_id']);

            if ($attribute_info) {
                $data['product_attributes'][] = array(
                    'attribute_id' => $product_attribute['attribute_id'],
                    'name' => $attribute_info['name'],
                    'product_attribute_description' => $product_attribute['product_attribute_description']
                );
            }
        }

        // Options
        $this->load->adminmodel('catalog/option');

        if (isset($this->request->post['product_option'])) {
            $product_options = $this->request->post['product_option'];
        } elseif (isset($this->request->get['product_id'])) {
            $product_options = $this->model_catalog_product->getProductOptions($this->request->get['product_id']);
        } else {
            $product_options = array();
        }

        $data['product_options'] = array();

        foreach ($product_options as $product_option) {
            $product_option_value_data = array();

            if (isset($product_option['product_option_value'])) {
                foreach ($product_option['product_option_value'] as $product_option_value) {
                    $product_option_value_data[] = array(
                        'product_option_value_id' => $product_option_value['product_option_value_id'],
                        'option_value_id' => $product_option_value['option_value_id'],
                        'quantity' => $product_option_value['quantity'],
                        'subtract' => $product_option_value['subtract'],
                        'price' => $product_option_value['price'],
                        'price_prefix' => $product_option_value['price_prefix'],
                        'points' => $product_option_value['points'],
                        'points_prefix' => $product_option_value['points_prefix'],
                        'weight' => $product_option_value['weight'],
                        'weight_prefix' => $product_option_value['weight_prefix']
                    );
                }
            }

            $data['product_options'][] = array(
                'product_option_id' => $product_option['product_option_id'],
                'product_option_value' => $product_option_value_data,
                'option_id' => $product_option['option_id'],
                'name' => $product_option['name'],
                'type' => $product_option['type'],
                'value' => isset($product_option['value']) ? $product_option['value'] : '',
                'required' => $product_option['required']
            );
        }

        $data['option_values'] = array();

        foreach ($data['product_options'] as $product_option) {
            if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
                if (!isset($data['option_values'][$product_option['option_id']])) {
                    $data['option_values'][$product_option['option_id']] = $this->model_catalog_option->getOptionValues($product_option['option_id']);
                }
            }
        }

        $this->load->adminmodel('customer/customer_group');

        $data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();

        if (isset($this->request->post['product_discount'])) {
            $product_discounts = $this->request->post['product_discount'];
        } elseif (isset($this->request->get['product_id'])) {
            $product_discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);
        } else {
            $product_discounts = array();
        }

        $data['product_discounts'] = array();

        foreach ($product_discounts as $product_discount) {
            $data['product_discounts'][] = array(
                'customer_group_id' => $product_discount['customer_group_id'],
                'quantity' => $product_discount['quantity'],
                'priority' => $product_discount['priority'],
                'price' => $product_discount['price'],
                'date_start' => ($product_discount['date_start'] != '0000-00-00') ? $product_discount['date_start'] : '',
                'date_end' => ($product_discount['date_end'] != '0000-00-00') ? $product_discount['date_end'] : ''
            );
        }

        if (isset($this->request->post['product_special'])) {
            $product_specials = $this->request->post['product_special'];
        } elseif (isset($this->request->get['product_id'])) {
            $product_specials = $this->model_catalog_product->getProductSpecials($this->request->get['product_id']);
        } else {
            $product_specials = array();
        }

        $data['product_specials'] = array();

        foreach ($product_specials as $product_special) {
            $data['product_specials'][] = array(
                'customer_group_id' => $product_special['customer_group_id'],
                'priority' => $product_special['priority'],
                'price' => $product_special['price'],
                'date_start' => ($product_special['date_start'] != '0000-00-00') ? $product_special['date_start'] : '',
                'date_end' => ($product_special['date_end'] != '0000-00-00') ? $product_special['date_end'] : ''
            );
        }

        // Image
        if (isset($this->request->post['image'])) {
            $data['image'] = $this->request->post['image'];
        } elseif (!empty($product_info)) {
            $data['image'] = $product_info['image'];
        } else {
            $data['image'] = '';
        }

        $this->load->model('tool/image');

        if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
            $data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
        } elseif (!empty($product_info) && is_file(DIR_IMAGE . $product_info['image'])) {
            $data['thumb'] = $this->model_tool_image->resize($product_info['image'], 100, 100);
        } else {
            $data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }

        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

        // Images
        if (isset($this->request->post['product_image'])) {
            $product_images = $this->request->post['product_image'];
        } elseif (isset($this->request->get['product_id'])) {
            $product_images = $this->model_catalog_product->getProductImages($this->request->get['product_id']);
        } else {
            $product_images = array();
        }

        $data['product_images'] = array();

        foreach ($product_images as $product_image) {
            if (is_file(DIR_IMAGE . $product_image['image'])) {
                $image = $product_image['image'];
                $thumb = $product_image['image'];
            } else {
                $image = '';
                $thumb = 'no_image.png';
            }

            $data['product_images'][] = array(
                'image' => $image,
                'thumb' => $this->model_tool_image->resize($thumb, 100, 100),
                'sort_order' => $product_image['sort_order']
            );
        }

        // Downloads
        $this->load->adminmodel('catalog/download');

        if (isset($this->request->post['product_download'])) {
            $product_downloads = $this->request->post['product_download'];
        } elseif (isset($this->request->get['product_id'])) {
            $product_downloads = $this->model_catalog_product->getProductDownloads($this->request->get['product_id']);
        } else {
            $product_downloads = array();
        }

        $data['product_downloads'] = array();

        foreach ($product_downloads as $download_id) {
            $download_info = $this->model_catalog_download->getDownload($download_id);

            if ($download_info) {
                $data['product_downloads'][] = array(
                    'download_id' => $download_info['download_id'],
                    'name' => $download_info['name']
                );
            }
        }

        if (isset($this->request->post['product_related'])) {
            $products = $this->request->post['product_related'];
        } elseif (isset($this->request->get['product_id'])) {
            $products = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);
        } else {
            $products = array();
        }

        $data['product_relateds'] = array();

        foreach ($products as $product_id) {
            $related_info = $this->model_catalog_product->getProduct($product_id);

            if ($related_info) {
                $data['product_relateds'][] = array(
                    'product_id' => $related_info['product_id'],
                    'name' => $related_info['name']
                );
            }
        }

        if (isset($this->request->post['points'])) {
            $data['points'] = $this->request->post['points'];
        } elseif (!empty($product_info)) {
            $data['points'] = $product_info['points'];
        } else {
            $data['points'] = '';
        }

        if (isset($this->request->post['product_reward'])) {
            $data['product_reward'] = $this->request->post['product_reward'];
        } elseif (isset($this->request->get['product_id'])) {
            $data['product_reward'] = $this->model_catalog_product->getProductRewards($this->request->get['product_id']);
        } else {
            $data['product_reward'] = array();
        }

        if (isset($this->request->post['product_layout'])) {
            $data['product_layout'] = $this->request->post['product_layout'];
        } elseif (isset($this->request->get['product_id'])) {
            $data['product_layout'] = $this->model_catalog_product->getProductLayouts($this->request->get['product_id']);
        } else {
            $data['product_layout'] = array();
        }
        $sellerId = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        $data['seller_details'] = $sellerId;

        $this->response->setOutput($this->load->view('kbmp_marketplace/product_form', $data));
    }
    
    /*
     * Function to get list of Manufacturers for Add Product
     */
    public function manufacturerAutocomplete() {
        $json = array();

        if (isset($this->request->get['filter_name'])) {
            $this->load->adminmodel('catalog/manufacturer');

            $filter_data = array(
                'filter_name' => $this->request->get['filter_name'],
                'start' => 0,
                'limit' => 5
            );

            $results = $this->model_catalog_manufacturer->getManufacturers($filter_data);

            foreach ($results as $result) {
                $json[] = array(
                    'manufacturer_id' => $result['manufacturer_id'],
                    'name' => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
                );
            }
        }

        $sort_order = array();

        foreach ($json as $key => $value) {
            $sort_order[$key] = $value['name'];
        }

        array_multisort($sort_order, SORT_ASC, $json);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    
    /*
     * Function to get list of categories for Add Product
     */
    public function categoryAutocomplete() {
        $json = array();

        if (isset($this->request->get['filter_name'])) {
            $this->load->model('kbmp_marketplace/kbmp_marketplace');

            $filter_data = array(
                'filter_name' => $this->request->get['filter_name'],
                'sort' => 'name',
                'order' => 'ASC',
                'start' => 0,
                'limit' => 5
            );

            $results = $this->model_kbmp_marketplace_kbmp_marketplace->getAssignedCategoriesList($filter_data);

            foreach ($results as $result) {
                $json[] = array(
                    'category_id' => $result['category_id'],
                    'name' => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
                );
            }
        }

        $sort_order = array();

        foreach ($json as $key => $value) {
            $sort_order[$key] = $value['name'];
        }

        array_multisort($sort_order, SORT_ASC, $json);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    
    /*
     * Function to get list of categories for dropdowns
     */
    public function completeCategoryList() {
        $json = array();

        $this->load->model('kbmp_marketplace/kbmp_marketplace');

        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getCategories();

        foreach ($results as $result) {
            $json[] = array(
                'category_id' => $result['category_id'],
                'name' => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
            );
        }

        $sort_order = array();

        foreach ($json as $key => $value) {
            $sort_order[$key] = $value['name'];
        }

        array_multisort($sort_order, SORT_ASC, $json);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    
    /*
     * Function to get list of unassigned categories to seller for dropdowns
     */
    public function completeUnassignedCategoryList() {
        $json = array();

        $this->load->model('kbmp_marketplace/kbmp_marketplace');

        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getCategories();
        
        //Get Assigned Categories (Approved)
        $assignedCategories = $this->model_kbmp_marketplace_kbmp_marketplace->getAssignedCategories($this->request->get['seller_id']);

        $assignedCategoryList = array();
        if (isset($assignedCategories) && !empty($assignedCategories)) {
            foreach ($assignedCategories as $assignedCategory) {
                $assignedCategoryList[] = $assignedCategory['category_id'];
            }
        }
        
        //Get Requested Categories (Waiting for Approval)
        $requestedCategories = $this->model_kbmp_marketplace_kbmp_marketplace->getRequestedCategories($this->request->get['seller_id']);

        if (isset($requestedCategories) && !empty($requestedCategories)) {
            foreach ($requestedCategories as $requestedCategory) {
                if (!in_array($requestedCategory['category_id'], $assignedCategoryList)) {
                    $assignedCategoryList[] = $requestedCategory['category_id'];
                }
            }
        }
        
        foreach ($results as $result) {
            if (!in_array($result['category_id'], $assignedCategoryList)) {
                $json[] = array(
                    'category_id' => $result['category_id'],
                    'name' => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
                );
            }
        }

        $sort_order = array();

        foreach ($json as $key => $value) {
            $sort_order[$key] = $value['name'];
        }

        array_multisort($sort_order, SORT_ASC, $json);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    
    /*
     * Function to get list of Filters for Add Product
     */
    public function filterAutocomplete() {
        $json = array();

        if (isset($this->request->get['filter_name'])) {
            $this->load->adminmodel('catalog/filter');

            $filter_data = array(
                'filter_name' => $this->request->get['filter_name'],
                'start' => 0,
                'limit' => 5
            );

            $filters = $this->model_catalog_filter->getFilters($filter_data);

            foreach ($filters as $filter) {
                $json[] = array(
                    'filter_id' => $filter['filter_id'],
                    'name' => strip_tags(html_entity_decode($filter['group'] . ' &gt; ' . $filter['name'], ENT_QUOTES, 'UTF-8'))
                );
            }
        }

        $sort_order = array();

        foreach ($json as $key => $value) {
            $sort_order[$key] = $value['name'];
        }

        array_multisort($sort_order, SORT_ASC, $json);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    
    /*
     * Function to get list of downloads for Add Product
     */
    public function downloadAutocomplete() {
        $json = array();

        if (isset($this->request->get['filter_name'])) {
            $this->load->adminmodel('catalog/download');
            $this->load->model('kbmp_marketplace/kbmp_marketplace');
            
            $seller_data = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
            $seller_downloads = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerDownloads($seller_data['seller_id']);
            $filter_data = array(
                'filter_name' => $this->request->get['filter_name'],
                'start' => 0,
                'limit' => 5
            );

            $results = $this->model_catalog_download->getDownloads($filter_data);
//            var_dump($results,$seller_downloads);die;
            foreach ($results as $result) {
                if(in_array($result['download_id'], $seller_downloads)){
                    $json[] = array(
                        'download_id' => $result['download_id'],
                        'name' => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
                    );
                }
            }
        }

        $sort_order = array();

        foreach ($json as $key => $value) {
            $sort_order[$key] = $value['name'];
        }

        array_multisort($sort_order, SORT_ASC, $json);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    
    /*
     * Function to get list of Related Products for Add Product
     */
//    public function productAutocomplete() {
//        $json = array();
//
//        if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_model'])) {
//            $this->load->adminmodel('catalog/product');
//            $this->load->adminmodel('catalog/option');
//
//            if (isset($this->request->get['filter_name'])) {
//                $filter_name = $this->request->get['filter_name'];
//            } else {
//                $filter_name = '';
//            }
//
//            if (isset($this->request->get['filter_model'])) {
//                $filter_model = $this->request->get['filter_model'];
//            } else {
//                $filter_model = '';
//            }
//
//            if (isset($this->request->get['limit'])) {
//                $limit = $this->request->get['limit'];
//            } else {
//                $limit = 5;
//            }
//
//            $filter_data = array(
//                'filter_name' => $filter_name,
//                'filter_model' => $filter_model,
//                'start' => 0,
//                'limit' => $limit
//            );
//
//            $results = $this->model_catalog_product->getProducts($filter_data);
//
//            foreach ($results as $result) {
//                $option_data = array();
//
//                $product_options = $this->model_catalog_product->getProductOptions($result['product_id']);
//
//                foreach ($product_options as $product_option) {
//                    $option_info = $this->model_catalog_option->getOption($product_option['option_id']);
//
//                    if ($option_info) {
//                        $product_option_value_data = array();
//
//                        foreach ($product_option['product_option_value'] as $product_option_value) {
//                            $option_value_info = $this->model_catalog_option->getOptionValue($product_option_value['option_value_id']);
//
//                            if ($option_value_info) {
//                                $product_option_value_data[] = array(
//                                    'product_option_value_id' => $product_option_value['product_option_value_id'],
//                                    'option_value_id' => $product_option_value['option_value_id'],
//                                    'name' => $option_value_info['name'],
//                                    'price' => (float) $product_option_value['price'] ? $this->currency->format($product_option_value['price'], $this->config->get('config_currency')) : false,
//                                    'price_prefix' => $product_option_value['price_prefix']
//                                );
//                            }
//                        }
//
//                        $option_data[] = array(
//                            'product_option_id' => $product_option['product_option_id'],
//                            'product_option_value' => $product_option_value_data,
//                            'option_id' => $product_option['option_id'],
//                            'name' => $option_info['name'],
//                            'type' => $option_info['type'],
//                            'value' => $product_option['value'],
//                            'required' => $product_option['required']
//                        );
//                    }
//                }
//
//                $json[] = array(
//                    'product_id' => $result['product_id'],
//                    'name' => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
//                    'model' => $result['model'],
//                    'option' => $option_data,
//                    'price' => $result['price']
//                );
//            }
//        }
//
//        $this->response->addHeader('Content-Type: application/json');
//        $this->response->setOutput(json_encode($json));
//    }
    
    public function productAutocomplete() {
        $json = array();

        if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_model'])) {
            $this->load->model('kbmp_marketplace/kbmp_marketplace');
            $this->load->model('kbmp_marketplace/option');

            if (isset($this->request->get['filter_name'])) {
                $filter_name = $this->request->get['filter_name'];
            } else {
                $filter_name = '';
            }

            if (isset($this->request->get['filter_model'])) {
                $filter_model = $this->request->get['filter_model'];
            } else {
                $filter_model = '';
            }

            if (isset($this->request->get['limit'])) {
                $limit = $this->request->get['limit'];
            } else {
                $limit = 5;
            }
            $seller_data = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
            $filter_data = array(
                'seller_id' => $seller_data['seller_id'],
                'filter_name' => $filter_name,
                'filter_model' => $filter_model,
                'start' => 0,
                'limit' => $limit
            );

            $results = $this->model_kbmp_marketplace_kbmp_marketplace->getProducts($filter_data);
            foreach ($results as $result) {
                $option_data = array();

                $product_options = $this->model_kbmp_marketplace_kbmp_marketplace->getProductOptions($result['product_id']);

                foreach ($product_options as $product_option) {
                    $option_info = $this->model_kbmp_marketplace_option->getOption($product_option['option_id']);

                    if ($option_info) {
                        $product_option_value_data = array();

                        foreach ($product_option['product_option_value'] as $product_option_value) {
                            $option_value_info = $this->model_kbmp_marketplace_option->getOptionValue($product_option_value['option_value_id']);

                            if ($option_value_info) {
                                $product_option_value_data[] = array(
                                    'product_option_value_id' => $product_option_value['product_option_value_id'],
                                    'option_value_id' => $product_option_value['option_value_id'],
                                    'name' => $option_value_info['name'],
                                    'price' => (float) $product_option_value['price'] ? $this->currency->format($product_option_value['price'], $this->config->get('config_currency')) : false,
                                    'price_prefix' => $product_option_value['price_prefix']
                                );
                            }
                        }

                        $option_data[] = array(
                            'product_option_id' => $product_option['product_option_id'],
                            'product_option_value' => $product_option_value_data,
                            'option_id' => $product_option['option_id'],
                            'name' => $option_info['name'],
                            'type' => $option_info['type'],
                            'value' => $product_option['value'],
                            'required' => $product_option['required']
                        );
                    }
                }

                $json[] = array(
                    'product_id' => $result['product_id'],
                    'name' => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
                    'model' => $result['model'],
                    'option' => $option_data,
                    'price' => $result['price']
                );
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    
    /*
     * Function to get list of Attributes for Add Product
     */
    public function attributeAutocomplete() {
        $json = array();

        if (isset($this->request->get['filter_name'])) {
            $this->load->adminmodel('catalog/attribute');

            $filter_data = array(
                'filter_name' => $this->request->get['filter_name'],
                'start' => 0,
                'limit' => 5
            );

            $results = $this->model_catalog_attribute->getAttributes($filter_data);

            foreach ($results as $result) {
                $json[] = array(
                    'attribute_id' => $result['attribute_id'],
                    'name' => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
                    'attribute_group' => $result['attribute_group']
                );
            }
        }

        $sort_order = array();

        foreach ($json as $key => $value) {
            $sort_order[$key] = $value['name'];
        }

        array_multisort($sort_order, SORT_ASC, $json);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    
    /*
     * Function to get list of Options for Add Product
     */
    public function optionAutocomplete() {
        $json = array();

        if (isset($this->request->get['filter_name'])) {
            $this->load->language('catalog/option');
            $this->load->language('kbmp_marketplace/products');

            $this->load->adminmodel('catalog/option');

            $this->load->model('tool/image');

            $filter_data = array(
                'filter_name' => $this->request->get['filter_name'],
                'start' => 0,
                'limit' => 5
            );

            $options = $this->model_catalog_option->getOptions($filter_data);

            foreach ($options as $option) {
                $option_value_data = array();

                if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
                    $option_values = $this->model_catalog_option->getOptionValues($option['option_id']);

                    foreach ($option_values as $option_value) {
                        if (is_file(DIR_IMAGE . $option_value['image'])) {
                            $image = $this->model_tool_image->resize($option_value['image'], 50, 50);
                        } else {
                            $image = $this->model_tool_image->resize('no_image.png', 50, 50);
                        }

                        $option_value_data[] = array(
                            'option_value_id' => $option_value['option_value_id'],
                            'name' => strip_tags(html_entity_decode($option_value['name'], ENT_QUOTES, 'UTF-8')),
                            'image' => $image
                        );
                    }

                    $sort_order = array();

                    foreach ($option_value_data as $key => $value) {
                        $sort_order[$key] = $value['name'];
                    }

                    array_multisort($sort_order, SORT_ASC, $option_value_data);
                }

                $type = '';

                if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox') {
                    $type = $this->language->get('text_choose');
                }

                if ($option['type'] == 'text' || $option['type'] == 'textarea') {
                    $type = $this->language->get('text_input');
                }

                if ($option['type'] == 'file') {
                    $type = $this->language->get('text_file');
                }

                if ($option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
                    $type = $this->language->get('text_date');
                }

                $json[] = array(
                    'option_id' => $option['option_id'],
                    'name' => strip_tags(html_entity_decode($option['name'], ENT_QUOTES, 'UTF-8')),
                    'category' => $type,
                    'type' => $option['type'],
                    'option_value' => $option_value_data
                );
            }
        }

        $sort_order = array();

        foreach ($json as $key => $value) {
            $sort_order[$key] = $value['name'];
        }

        array_multisort($sort_order, SORT_ASC, $json);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    
    /*
     * Function to validate Product Form data
     */
    protected function validateForm() {
        
        foreach ($this->request->post['product_description'] as $language_id => $value) {
            if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 255)) {
                $this->error['name'][$language_id] = $this->language->get('error_name');
            }

            if ((utf8_strlen($value['meta_title']) < 3) || (utf8_strlen($value['meta_title']) > 255)) {
                $this->error['meta_title'][$language_id] = $this->language->get('error_meta_title');
            }
        }

        if ((utf8_strlen($this->request->post['model']) < 1) || (utf8_strlen($this->request->post['model']) > 64)) {
            $this->error['model'] = $this->language->get('error_model');
        }

        if (utf8_strlen($this->request->post['keyword']) > 0) {
            $this->load->adminmodel('design/seo_url');

            $url_alias_info = $this->model_design_seo_url->getSeoUrlsByKeyword($this->request->post['keyword']);
            
            if ($url_alias_info && isset($this->request->get['product_id']) && $url_alias_info['query'] != 'product_id=' . $this->request->get['product_id']) {
                $this->error['keyword'] = sprintf($this->language->get('error_keyword'));
            }

            if ($url_alias_info && !isset($this->request->get['product_id'])) {
                $this->error['keyword'] = sprintf($this->language->get('error_keyword'));
            }
        }
        
        if (!isset($this->request->post['product_category']) && empty($this->request->post['product_category'])) {
            $this->error['product_category'] = sprintf($this->language->get('error_product_category'));
        }

        if ($this->error && !isset($this->error['warning'])) {
            $this->error['warning'] = $this->language->get('error_warning');
        }

        return !$this->error;
    }

}
