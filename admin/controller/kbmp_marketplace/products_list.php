<?php

class ControllerKbmpMarketplaceProductsList extends Controller {

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
        
        $this->load->language('kbmp_marketplace/products_list');
        
        $data['heading_title'] = $this->language->get('heading_title');
        $this->document->setTitle($this->language->get('heading_title'));
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $this->getList();
        
    }
    
    /*
     * Function definition to get Products List
     */

    protected function getList() {
        
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
        
        if (isset($this->request->get['filter_firstname'])) {
            $filter_firstname = $this->request->get['filter_firstname'];
        } else {
            $filter_firstname = null;
        }
        
        if (isset($this->request->get['filter_lastname'])) {
            $filter_lastname = $this->request->get['filter_lastname'];
        } else {
            $filter_lastname = null;
        }
        
        if (isset($this->request->get['filter_quantity'])) {
            $filter_quantity = $this->request->get['filter_quantity'];
        } else {
            $filter_quantity = null;
        }
        
        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
        }
        
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'ks.date_added';
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
            'href' => $this->url->link('kbmp_marketplace/products_list', $this->session_token_key.'=' . $this->session_token . $url, true)
        );
        
        $data['products'] = array();

        $filter_data = array(
            'filter_productname'        => trim($filter_productname),
            'filter_model'              => trim($filter_model),
            'filter_firstname'          => trim($filter_firstname),
            'filter_lastname'           => trim($filter_lastname),
            'filter_quantity'           => trim($filter_quantity),
            'filter_status'             => trim($filter_status),
            'sort'                      => $sort,
            'order'                     => $order,
            'start'                     => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'                     => $this->config->get('config_limit_admin')
        );
        
        $data['filter_data'] = $filter_data;

        $products_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellersProducts($filter_data);

        $data['products_total'] = $products_total;
        
        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getSellersProducts($filter_data);

        $this->load->model('tool/image');
        
        foreach ($results as $result) {
            
            if (is_file(DIR_IMAGE . $result['image'])) {
                $image = $this->model_tool_image->resize($result['image'], 40, 40);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 40, 40);
            }
            $data['products'][] = array(
                'seller_id' => $result['seller_id'],
                'product_id' => $result['product_id'],
                'product_name' => $result['product_name'],
                'image' => $image,
                'model' => $result['model'],
                'firstname' => $result['firstname'],
                'lastname' => $result['lastname'],
                'quantity' => $result['quantity'],
                'status' => $result['status'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'edit' => $this->url->link('catalog/product/edit', $this->session_token_key.'=' . $this->session_token . '&product_id='.$result['product_id'] . '&redirect=products_list', true),
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
        $data['text_view'] = $this->language->get('text_view');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_delete'] = $this->language->get('text_delete');
        $data['text_active'] = $this->language->get('text_active');
        $data['text_inactive'] = $this->language->get('text_inactive');
        $data['text_reset'] = $this->language->get('text_reset');
        $data['text_filter'] = $this->language->get('text_filter');
        $data['text_cancel'] = $this->language->get('text_cancel');
        $data['text_submit'] = $this->language->get('text_submit');
        
        $data['column_image'] = $this->language->get('column_image');
        $data['column_productname'] = $this->language->get('column_productname');
        $data['column_model'] = $this->language->get('column_model');
        $data['column_firstname'] = $this->language->get('column_firstname');
        $data['column_lastname'] = $this->language->get('column_lastname');
        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_status'] = $this->language->get('column_status');
        
        $data['delete_comment_error'] = $this->language->get('delete_comment_error');
        $data['text_delete_popup'] = $this->language->get('text_delete_popup');
        
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
        
        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        
        $data['sort_productname'] = $this->url->link('kbmp_marketplace/products_list', $this->session_token_key.'=' . $this->session_token . '&sort=pd.name' . $url, true);
        $data['sort_model'] = $this->url->link('kbmp_marketplace/products_list', $this->session_token_key.'=' . $this->session_token . '&sort=p.model' . $url, true);
        $data['sort_firstname'] = $this->url->link('kbmp_marketplace/products_list', $this->session_token_key.'=' . $this->session_token . '&sort=c.firstname' . $url, true);
        $data['sort_lastname'] = $this->url->link('kbmp_marketplace/products_list', $this->session_token_key.'=' . $this->session_token . '&sort=c.lastname' . $url, true);
        $data['sort_quantity'] = $this->url->link('kbmp_marketplace/products_list', $this->session_token_key.'=' . $this->session_token . '&sort=p.quantity' . $url, true);
        $data['sort_status'] = $this->url->link('kbmp_marketplace/products_list', $this->session_token_key.'=' . $this->session_token . '&sort=p.status' . $url, true);
        
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
        
        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }
        
        //Set Success Message to display
        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }
        
        //Set Error Message to display
        if (isset($this->session->data['error'])) {
            $data['error'] = $this->session->data['error'];
            unset($this->session->data['error']);
        } else {
            $data['error'] = '';
        }

        $pagination = new Pagination();
        $pagination->total = $products_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/products_list', $this->session_token_key.'=' . $this->session_token . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($products_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($products_total - $this->config->get('config_limit_admin'))) ? $products_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $products_total, ceil($products_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;
        
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        
        $this->response->setOutput($this->load->view('kbmp_marketplace/products_list', $data));
    }
    
    /*
     * Function to delete products
     */
    public function delete() {
        $this->load->language('kbmp_marketplace/products_list');
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $data['text_delete_success'] = $this->language->get('text_delete_success');
        $data['text_delete_error'] = $this->language->get('text_delete_error');
        
        if (isset($this->request->get['seller_id']) && !empty($this->request->get['seller_id']) && isset($this->request->get['product_id']) && !empty($this->request->get['product_id']) && isset($this->request->get['comment']) && !empty($this->request->get['comment'])) {
            $product_details = $this->model_kbmp_marketplace_kbmp_marketplace->getProductRequestDetails($this->request->get['product_id']);
            if ($this->model_kbmp_marketplace_kbmp_marketplace->deleteProduct($this->request->get['seller_id'], $this->request->get['product_id'], $this->request->get['comment'])) {   
                
                //Send Product deltion mail to seller
                $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($this->request->get['seller_id']);
                $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(12, $this->config->get('config_language_id'));

                if (isset($email_template) && !empty($email_template)) {
                    $message = str_replace("{{product_name}}", $product_details['name'], $email_template['email_content']); //Product Name
                    $message = str_replace("{{product_sku}}", $product_details['sku'], $message); //Product SKU
                    $message = str_replace("{{product_price}}", $this->currency->format($product_details['price'], $this->config->get('config_currency')), $message); //Product Price
                    $message = str_replace("{{reason}}", $this->request->get['comment'], $message); //Reason
                    $message = str_replace("{{seller_name}}", $seller_details['firstname'] . ' ' . $seller_details['lastname'], $message); //Seller Full Name
                    $message = str_replace("{{shop_title}}", $seller_details['title'], $message); //Shop Title
                    $message = str_replace("{{seller_email}}", $seller_details['email'], $message); //Seller Full Name
                    $message = str_replace("{{seller_contact}}", $seller_details['telephone'], $message); //Seller Full Name
                    $message = str_replace("{{shop_name}}", $seller_details['title'], $message); //Shop Name

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

                    //Send Email to seller on the basis of notification type
                    if (isset($seller_details['notification_type'])) {
                        switch ($seller_details['notification_type']) {
                            case 0:
                                if (isset($seller_details['email']) && !empty($seller_details['email'])) {
                                    $mail->setTo($seller_details['email']);
                                    $mail->setFrom($this->config->get('config_email'));
                                    $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
                                    $mail->setSubject(html_entity_decode($email_template['email_subject'], ENT_QUOTES, 'UTF-8'));
                                    $mail->setHtml($email_content);
                                    $mail->send();
                                }

                                if (isset($seller_details['business_email']) && !empty($seller_details['business_email'])) {
                                    $mail->setTo($seller_details['business_email']);
                                    $mail->setFrom($this->config->get('config_email'));
                                    $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
                                    $mail->setSubject(html_entity_decode($email_template['email_subject'], ENT_QUOTES, 'UTF-8'));
                                    $mail->setHtml($email_content);
                                    $mail->send();
                                }
                                break;
                            case 1:
                                if (isset($seller_details['email']) && !empty($seller_details['email'])) {
                                    $mail->setTo($seller_details['email']);
                                    $mail->setFrom($this->config->get('config_email'));
                                    $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
                                    $mail->setSubject(html_entity_decode($email_template['email_subject'], ENT_QUOTES, 'UTF-8'));
                                    $mail->setHtml($email_content);
                                    $mail->send();
                                }
                                break;
                            case 2:
                                if (isset($seller_details['business_email']) && !empty($seller_details['business_email'])) {
                                    $mail->setTo($seller_details['business_email']);
                                    $mail->setFrom($this->config->get('config_email'));
                                    $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
                                    $mail->setSubject(html_entity_decode($email_template['email_subject'], ENT_QUOTES, 'UTF-8'));
                                    $mail->setHtml($email_content);
                                    $mail->send();
                                }
                                break;
                        }
                    }
                }
                //Ends
                
                $this->session->data['success'] = $this->language->get('text_delete_success');
            } else {
                $this->session->data['error'] = $this->language->get('text_delete_error');
            }
        }
        $this->response->redirect($this->url->link('kbmp_marketplace/products_list', $this->session_token_key.'=' . $this->session_token, true));
    }

}
