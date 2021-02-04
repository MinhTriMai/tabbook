<?php

class ControllerKbmpMarketplaceSellersReview extends Controller {

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
        
        $this->load->language('kbmp_marketplace/sellers_review');
        
        $this->document->setTitle($this->language->get('heading_title'));
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $this->getList();
        
    }
    
    /*
     * Function definition to get Admin Orders List
     */

    protected function getList() {
        
        if (isset($this->request->get['filter_seller'])) {
            $filter_seller = $this->request->get['filter_seller'];
        } else {
            $filter_seller = null;
        }
        
        if (isset($this->request->get['filter_author'])) {
            $filter_author = $this->request->get['filter_author'];
        } else {
            $filter_author = null;
        }
        
        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
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
        
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'ksr.date_added';
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
        
        if (isset($this->request->get['filter_author'])) {
            $url .= '&filter_author=' . urlencode(html_entity_decode($this->request->get['filter_author'], ENT_QUOTES, 'UTF-8'));
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
            'href' => $this->url->link('kbmp_marketplace/sellers_review', $this->session_token_key.'=' . $this->session_token . $url, true)
        );
        
        $data['product_reviews'] = array();

        $filter_data = array(
            'filter_seller'             => trim($filter_seller),
            'filter_author'             => trim($filter_author),
            'filter_status'             => trim($filter_status),
            'filter_from_date_added'    => trim($filter_from_date_added),
            'filter_to_date_added'      => trim($filter_to_date_added),
            'sort'                      => $sort,
            'order'                     => $order,
            'start'                     => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'                     => $this->config->get('config_limit_admin')
        );
        
        $data['filter_data'] = $filter_data;

        $sellers_reviews_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellersReviews($filter_data);

        $data['sellers_reviews_total'] = $sellers_reviews_total;
        
        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getSellersReviews($filter_data);

        foreach ($results as $result) {
            $data['sellers_reviews'][] = array(
                'seller_review_id' => $result['seller_review_id'],
                'seller_id' => $result['seller_id'],
                'seller' => !empty($result['title']) ? $result['title'] : $this->language->get('text_not_available'),
                'author' => $result['author'],
                'status' => (isset($result['approved']) && !empty($result['approved'])) ? $this->language->get('text_approved') : $this->language->get('text_disapproved'),
                'rating' => $result['rating'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'edit' => $this->url->link('kbmp_marketplace/sellers_review/edit', $this->session_token_key.'=' . $this->session_token . '&seller_review_id=' . $result['seller_review_id'], true)
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
        $data['text_seller_catgory_commision'] = $this->language->get('text_seller_catgory_commision');
        
        $data['token'] = $this->session_token;
        
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_from_date'] = $this->language->get('text_from_date');
        $data['text_to_date'] = $this->language->get('text_to_date');
        $data['text_view'] = $this->language->get('text_view');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_filter'] = $this->language->get('text_filter');
        $data['text_reset'] = $this->language->get('text_reset');
        $data['text_approved'] = $this->language->get('text_approved');
        $data['text_waiting_for_approval'] = $this->language->get('text_waiting_for_approval');
        $data['text_disapproved'] = $this->language->get('text_disapproved');
        $data['text_cancel'] = $this->language->get('text_cancel');
        $data['text_submit'] = $this->language->get('text_submit');
        $data['text_delete'] = $this->language->get('text_delete');
        
        $data['column_seller'] = $this->language->get('column_seller');
        $data['column_author'] = $this->language->get('column_author');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_rating'] = $this->language->get('column_rating');
        $data['column_date_added'] = $this->language->get('column_date_added');

        $data['delete_comment_error'] = $this->language->get('delete_comment_error');
        $data['text_delete_popup'] = $this->language->get('text_delete_popup');
        
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
        
        if (isset($this->session->data['error'])) {
            $data['error'] = $this->session->data['error'];

            unset($this->session->data['error']);
        } else {
            $data['error'] = '';
        }

        $url = '';

        if (isset($this->request->get['filter_seller'])) {
            $url .= '&filter_seller=' . urlencode(html_entity_decode($this->request->get['filter_seller'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_author'])) {
            $url .= '&filter_author=' . urlencode(html_entity_decode($this->request->get['filter_author'], ENT_QUOTES, 'UTF-8'));
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
        
        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        
        $data['sort_seller'] = $this->url->link('kbmp_marketplace/products_review', $this->session_token_key.'=' . $this->session_token . '&sort=ksd.title' . $url, true);
        $data['sort_author'] = $this->url->link('kbmp_marketplace/products_review', $this->session_token_key.'=' . $this->session_token . '&sort=ksr.author' . $url, true);
        $data['sort_status'] = $this->url->link('kbmp_marketplace/products_review', $this->session_token_key.'=' . $this->session_token . '&sort=ksr.approved' . $url, true);
        $data['sort_rating'] = $this->url->link('kbmp_marketplace/products_review', $this->session_token_key.'=' . $this->session_token . '&sort=ksr.rating' . $url, true);
        $data['sort_date_added'] = $this->url->link('kbmp_marketplace/products_review', $this->session_token_key.'=' . $this->session_token . '&sort=ksr.date_added' . $url, true);
        
        $url = '';
        
        if (isset($this->request->get['filter_seller'])) {
            $url .= '&filter_seller=' . urlencode(html_entity_decode($this->request->get['filter_seller'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_author'])) {
            $url .= '&filter_author=' . urlencode(html_entity_decode($this->request->get['filter_author'], ENT_QUOTES, 'UTF-8'));
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
        
        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $sellers_reviews_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/sellers_review', $this->session_token_key.'=' . $this->session_token . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($sellers_reviews_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($sellers_reviews_total - $this->config->get('config_limit_admin'))) ? $sellers_reviews_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $sellers_reviews_total, ceil($sellers_reviews_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('kbmp_marketplace/sellers_review', $data));
    }
    
    /*
     * Function to edit the Seller Review
     */
    public function edit() {
        
        $this->load->language('kbmp_marketplace/sellers_review_edit');
        
        $this->document->setTitle($this->language->get('heading_title'));
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $this->load->model('customer/customer');

        $url = '';
        
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_knowband_marketplace'),
            'href' => $this->url->link('extension/module/kbmp_marketplace', $this->session_token_key.'=' . $this->session_token, true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('kbmp_marketplace/sellers_review_edit', $this->session_token_key.'=' . $this->session_token . $url, true)
        );
        
        $data['heading_title'] = $this->language->get('heading_title');
        
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            if ($this->model_kbmp_marketplace_kbmp_marketplace->editSellerReview($this->request->get['seller_review_id'], $this->request->post)) {
                
                //Send Review approval notification to customer who posted review
                if ($this->request->post['status'] == '1') {
                    $review_request_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerReview($this->request->get['seller_review_id']);
                    $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($review_request_details['seller_id']);
                    
                    if (isset($review_request_details['customer_id']) && !empty($review_request_details['customer_id'])) {
                        $customer_details = $this->model_customer_customer->getCustomer($review_request_details['customer_id']);
                        $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(15, $this->config->get('config_language_id'));

                        if (isset($email_template) && !empty($email_template)) {
                            $message = str_replace("{{customer_name}}", $review_request_details['author'], $email_template['email_content']); //Customer Name
                            $message = str_replace("{{store_name}}", $this->config->get('config_name'), $message); //Store Name
                            $message = str_replace("{{shop_name}}", $seller_details['title'], $message); //Shop Title
                            $message = str_replace("{{comment}}", $review_request_details['text'], $message); //Comment

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

                            $mail->setTo($customer_details['email']);
                            $mail->setFrom($this->config->get('config_email'));
                            $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
                            $mail->setSubject(html_entity_decode($email_template['email_subject'], ENT_QUOTES, 'UTF-8'));
                            $mail->setHtml($email_content);
                            $mail->send();
                        }
                    }
                    
                    //Send notification of approval to seller
                    $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(16, $this->config->get('config_language_id'));

                    if (isset($email_template) && !empty($email_template)) {
                        $message = str_replace("{{seller_name}}", $seller_details['firstname'] . ' ' . $seller_details['lastname'], $email_template['email_content']); //Customer Name
                        $message = str_replace("{{store_name}}", $this->config->get('config_name'), $message); //Store Name
                        $message = str_replace("{{comment}}", $review_request_details['text'], $message); //Comment

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
                } else {
                    //Send Review disapproval notification to seller
                    $review_request_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerReview($this->request->get['seller_review_id']);
                    $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($review_request_details['seller_id']);
                    $customer_details = $this->model_customer_customer->getCustomer($review_request_details['customer_id']);
                    $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(17, $this->config->get('config_language_id'));

                    if (isset($email_template) && !empty($email_template)) {
                        $message = str_replace("{{seller_name}}", $seller_details['firstname'] . ' ' . $seller_details['lastname'], $email_template['email_content']); //Customer Name
                        $message = str_replace("{{store_name}}", $this->config->get('config_name'), $message); //Store Name
                        $message = str_replace("{{comment}}", $review_request_details['text'], $message); //Comment

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
                    
                    //Send Disapproval notification to customer
                    $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(18, $this->config->get('config_language_id'));

                    if (isset($email_template) && !empty($email_template)) {
                        $message = str_replace("{{customer_name}}", $review_request_details['author'], $email_template['email_content']); //Customer Name
                        $message = str_replace("{{store_name}}", $this->config->get('config_name'), $message); //Store Name
                        $message = str_replace("{{shop_name}}", $seller_details['title'], $message); //Shop Title
                        $message = str_replace("{{comment}}", $review_request_details['text'], $message); //Comment

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

                        $mail->setTo($customer_details['email']);
                        $mail->setFrom($this->config->get('config_email'));
                        $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
                        $mail->setSubject(html_entity_decode($email_template['email_subject'], ENT_QUOTES, 'UTF-8'));
                        $mail->setHtml($email_content);
                        $mail->send();
                    }
                }
               $this->session->data['success'] = $this->language->get('text_success');
               $this->response->redirect($this->url->link('kbmp_marketplace/sellers_review', $this->session_token_key.'=' . $this->session_token, true));
            } else {
                $this->error['warning'] = $this->language->get('text_error');
            }
        }
        
        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }
        
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['author'])) {
            $data['error_author'] = $this->error['author'];
        } else {
            $data['error_author'] = '';
        }

        if (isset($this->error['text'])) {
            $data['error_text'] = $this->error['text'];
        } else {
            $data['error_text'] = '';
        }

        if (isset($this->error['rating'])) {
            $data['error_rating'] = $this->error['rating'];
        } else {
            $data['error_rating'] = '';
        }

        $data['action'] = $this->url->link('kbmp_marketplace/sellers_review/edit', $this->session_token_key.'=' . $this->session_token . '&seller_review_id=' . $this->request->get['seller_review_id'], true);
        
        //Menu Options Text
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
        $data['text_paypal_payout'] = $this->language->get('text_paypal_payout');
        $data['text_email_templates'] = $this->language->get('text_email_templates');
        $data['text_approved'] = $this->language->get('text_approved');
        $data['text_disapproved'] = $this->language->get('text_disapproved');
        
        if (isset($this->request->get['seller_review_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $review_info = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerReview($this->request->get['seller_review_id']);
        }

        $data['token'] = $this->session_token;
        
        $data['entry_author'] = $this->language->get('entry_author');
        $data['entry_rating'] = $this->language->get('entry_rating');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_text'] = $this->language->get('entry_text');
        $data['entry_date_added'] = $this->language->get('entry_date_added');
        
        $data['button_save'] = $this->language->get('button_save');
        
        if (isset($this->request->post['author'])) {
            $data['author'] = $this->request->post['author'];
        } elseif (!empty($review_info)) {
            $data['author'] = $review_info['author'];
        } else {
            $data['author'] = '';
        }

        if (isset($this->request->post['text'])) {
            $data['text'] = $this->request->post['text'];
        } elseif (!empty($review_info)) {
            $data['text'] = stripslashes($review_info['text']);
        } else {
            $data['text'] = '';
        }

        if (isset($this->request->post['rating'])) {
            $data['rating'] = $this->request->post['rating'];
        } elseif (!empty($review_info)) {
            $data['rating'] = $review_info['rating'];
        } else {
            $data['rating'] = '';
        }

        if (isset($this->request->post['date_added'])) {
            $data['date_added'] = $this->request->post['date_added'];
        } elseif (!empty($review_info)) {
            $data['date_added'] = ($review_info['date_added'] != '0000-00-00 00:00' ? $review_info['date_added'] : '');
        } else {
            $data['date_added'] = '';
        }

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($review_info)) {
            $data['status'] = $review_info['approved'];
        } else {
            $data['status'] = '';
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        
        $this->response->setOutput($this->load->view('kbmp_marketplace/sellers_review_edit', $data));
        
    }
    
    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'kbmp_marketplace/sellers_review')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ((utf8_strlen($this->request->post['author']) < 3) || (utf8_strlen($this->request->post['author']) > 64)) {
            $this->error['author'] = $this->language->get('error_author');
        }

        if (utf8_strlen($this->request->post['text']) < 1) {
            $this->error['text'] = $this->language->get('error_text');
        }

        if (!isset($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
            $this->error['rating'] = $this->language->get('error_rating');
        }

        return !$this->error;
    }
    
    /*
     * Function to delete review
     */
    public function delete() {
        $this->load->language('kbmp_marketplace/sellers_review');
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $this->load->model('customer/customer');
        
        $data['text_delete_success'] = $this->language->get('text_delete_success');
        $data['text_delete_error'] = $this->language->get('text_delete_error');
        
        if (isset($this->request->get['seller_id']) && !empty($this->request->get['seller_id']) && isset($this->request->get['review_id']) && !empty($this->request->get['review_id']) && isset($this->request->get['comment']) && !empty($this->request->get['comment'])) {
            $review_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerReview($this->request->get['review_id']);
            if ($this->model_kbmp_marketplace_kbmp_marketplace->deleteReview($this->request->get['seller_id'], $this->request->get['review_id'])) {   
                
                //Send Review deletion mail to seller
                $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($this->request->get['seller_id']);
                $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(20, $this->config->get('config_language_id'));

                if (isset($email_template) && !empty($email_template)) {
                    $message = str_replace("{{seller_name}}", $seller_details['firstname'] . ' ' . $seller_details['lastname'], $email_template['email_content']); //Seller Full Name
                    $message = str_replace("{{store_name}}", $this->config->get('config_name'), $message); //Store Name
                    $message = str_replace("{{comment}}", $review_details['text'], $message); //Comment
                    $message = str_replace("{{reason}}", $this->request->get['comment'], $message); //Reason

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
                
                //Send Review deletion mail to customer who posted it
                $customer_details = $this->model_customer_customer->getCustomer($review_details['customer_id']);
                $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(21, $this->config->get('config_language_id'));

                if (isset($email_template) && !empty($email_template)) {
                    $message = str_replace("{{customer_name}}", $review_details['author'], $email_template['email_content']); //Customer Name
                    $message = str_replace("{{store_name}}", $this->config->get('config_name'), $message); //Store Name
                    $message = str_replace("{{shop_name}}", $seller_details['title'], $message); //Shop Name
                    $message = str_replace("{{comment}}", $review_details['text'], $message); //Comment
                    $message = str_replace("{{reason}}", $this->request->get['comment'], $message); //Reason

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

                    $mail->setTo($customer_details['email']);
                    $mail->setFrom($this->config->get('config_email'));
                    $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
                    $mail->setSubject(html_entity_decode($email_template['email_subject'], ENT_QUOTES, 'UTF-8'));
                    $mail->setHtml($email_content);
                    $mail->send();
                }
                //Ends
                
                $this->session->data['success'] = $this->language->get('text_delete_success');
            } else {
                $this->session->data['error'] = $this->language->get('text_delete_error');
            }
        }
        $this->response->redirect($this->url->link('kbmp_marketplace/sellers_review', $this->session_token_key.'=' . $this->session_token, true));
    }

}
