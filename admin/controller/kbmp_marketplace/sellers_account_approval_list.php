<?php

class ControllerKbmpMarketplaceSellersAccountApprovalList extends Controller {

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
        $this->document->addStyle('view/stylesheet/kbmp_marketplace/kbmp_validation.css');
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
        
        $this->load->language('kbmp_marketplace/sellers_account_approval_list');
        
        $data['heading_title'] = $this->language->get('heading_title');
        $this->document->setTitle($this->language->get('heading_title'));
        
        $this->load->model('localisation/country');
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $this->getList();
        
    }
    
    /*
     * Function definition to get Sellers List
     */

    protected function getList() {
        
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
        
        if (isset($this->request->get['filter_email'])) {
            $filter_email = $this->request->get['filter_email'];
        } else {
            $filter_email = null;
        }
        
        if (isset($this->request->get['filter_shop'])) {
            $filter_shop = $this->request->get['filter_shop'];
        } else {
            $filter_shop = null;
        }
        
        if (isset($this->request->get['filter_country'])) {
            $filter_country = $this->request->get['filter_country'];
        } else {
            $filter_country = null;
        }
        
        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
        }
        
        if (isset($this->request->get['filter_approval_status'])) {
            $filter_approval_status = $this->request->get['filter_approval_status'];
        } else {
            $filter_approval_status = null;
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

        if (isset($this->request->get['filter_firstname'])) {
            $url .= '&filter_firstname=' . urlencode(html_entity_decode($this->request->get['filter_firstname'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_lastname'])) {
            $url .= '&filter_lastname=' . urlencode(html_entity_decode($this->request->get['filter_lastname'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_shop'])) {
            $url .= '&filter_shop=' . urlencode(html_entity_decode($this->request->get['filter_shop'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_country'])) {
            $url .= '&filter_country=' . urlencode(html_entity_decode($this->request->get['filter_country'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_approval_status'])) {
            $url .= '&filter_approval_status=' . urlencode(html_entity_decode($this->request->get['filter_approval_status'], ENT_QUOTES, 'UTF-8'));
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
        
        $countries = $this->model_localisation_country->getCountries();
        $data['countries'] = $countries;
        
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_knowband_marketplace'),
            'href' => $this->url->link('extension/module/kbmp_marketplace', $this->session_token_key.'=' . $this->session_token, true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('kbmp_marketplace/sellers_account_approval_list', $this->session_token_key.'=' . $this->session_token, true)
        );
        
        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }
        
        //Set Error Message to display
        if (isset($this->session->data['error'])) {
            $data['error'] = $this->session->data['error'];
            unset($this->session->data['error']);
        } else {
            $data['error'] = '';
        }
        
        //Set Success Message to display
        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }
        
        $data['pending_approvals'] = array();

        $filter_data = array(
            'filter_firstname'      => trim($filter_firstname),
            'filter_lastname'       => trim($filter_lastname),
            'filter_email'          => trim($filter_email),
            'filter_shop'           => trim($filter_shop),
            'filter_country'        => trim($filter_country),
            'filter_status'         => trim($filter_status),
            'filter_approval_status'=> trim($filter_approval_status),
            'filter_from_date'      => trim($filter_from_date),
            'filter_to_date'        => trim($filter_to_date),
            'sort'                  => $sort,
            'order'                 => $order,
            'start'                 => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'                 => $this->config->get('config_limit_admin')
        );
        
        $data['filter_data'] = $filter_data;
        
        $pending_approvals_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalPendingApprovals($filter_data);

        $data['pending_approvals_total'] = $pending_approvals_total;
        
        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getPendingApprovals($filter_data);
        
        foreach ($results as $result) {
            
            $data['pending_approvals'][] = array(
                'seller_id' => $result['seller_id'],
                'customer_id' => $result['customer_id'],
                'firstname' => $result['firstname'],
                'lastname' => $result['lastname'],
                'email' => $result['email'],
                'shop' => $result['shop'],
                'country' => $result['country'],
                'status' => $result['active'],
                'approval_status' => $result['approved'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'edit' => $this->url->link('customer/customer/edit', $this->session_token_key.'=' . $this->session_token . '&customer_id='.$result['customer_id'] . '&redirect=sellers_account_approval_list', true)
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
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_waiting_approval'] = $this->language->get('text_waiting_approval');
        $data['text_approve'] = $this->language->get('text_approve');
        $data['text_disapprove'] = $this->language->get('text_disapprove');
        $data['text_disapproved'] = $this->language->get('text_disapproved');
        $data['text_active'] = $this->language->get('text_active');
        $data['text_inactive'] = $this->language->get('text_inactive');
        $data['text_filter'] = $this->language->get('text_filter');
        $data['text_reset'] = $this->language->get('text_reset');
        $data['text_from_date'] = $this->language->get('text_from_date');
        $data['text_to_date'] = $this->language->get('text_to_date');
        $data['text_submit'] = $this->language->get('text_submit');
        $data['text_cancel'] = $this->language->get('text_cancel');
        $data['text_disapproval_popup'] = $this->language->get('text_disapproval_popup');
        
        $data['text_approval_confirmation'] = $this->language->get('text_approval_confirmation');
        $data['text_disapproval_confirmation'] = $this->language->get('text_disapproval_confirmation');
        $data['text_disapproval'] = $this->language->get('text_disapproval');
        $data['disapprove_comment_error'] = $this->language->get('disapprove_comment_error');
        
        $data['column_firstname'] = $this->language->get('column_firstname');
        $data['column_lastname'] = $this->language->get('column_lastname');
        $data['column_email'] = $this->language->get('column_email');
        $data['column_shop'] = $this->language->get('column_shop');
        $data['column_approval'] = $this->language->get('column_approval');
        $data['column_country'] = $this->language->get('column_country');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_request_date'] = $this->language->get('column_request_date');

        $url = '';

        if (isset($this->request->get['filter_firstname'])) {
            $url .= '&filter_firstname=' . urlencode(html_entity_decode($this->request->get['filter_firstname'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_lastname'])) {
            $url .= '&filter_lastname=' . urlencode(html_entity_decode($this->request->get['filter_lastname'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_shop'])) {
            $url .= '&filter_shop=' . urlencode(html_entity_decode($this->request->get['filter_shop'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_country'])) {
            $url .= '&filter_country=' . urlencode(html_entity_decode($this->request->get['filter_country'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_approval_status'])) {
            $url .= '&filter_approval_status=' . urlencode(html_entity_decode($this->request->get['filter_approval_status'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date'])) {
            $url .= '&filter_from_date=' . urlencode(html_entity_decode($this->request->get['filter_from_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date'])) {
            $url .= '&filter_to_date=' . urlencode(html_entity_decode($this->request->get['filter_to_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        
        $data['sort_firstname'] = $this->url->link('kbmp_marketplace/sellers_account_approval_list', $this->session_token_key.'=' . $this->session_token . '&sort=c.firstname' . $url, true);
        $data['sort_lastname'] = $this->url->link('kbmp_marketplace/sellers_account_approval_list', $this->session_token_key.'=' . $this->session_token . '&sort=c.lastname' . $url, true);
        $data['sort_email'] = $this->url->link('kbmp_marketplace/sellers_account_approval_list', $this->session_token_key.'=' . $this->session_token . '&sort=c.email' . $url, true);
        $data['sort_shop'] = $this->url->link('kbmp_marketplace/sellers_account_approval_list', $this->session_token_key.'=' . $this->session_token . '&sort=ksd.title' . $url, true);
        $data['sort_country'] = $this->url->link('kbmp_marketplace/sellers_account_approval_list', $this->session_token_key.'=' . $this->session_token . '&sort=ct.name' . $url, true);
        $data['sort_status'] = $this->url->link('kbmp_marketplace/sellers_account_approval_list', $this->session_token_key.'=' . $this->session_token . '&sort=ks.active' . $url, true);
        $data['sort_approval_status'] = $this->url->link('kbmp_marketplace/sellers_account_approval_list', $this->session_token_key.'=' . $this->session_token . '&sort=ks.approved' . $url, true);
        $data['sort_request_date'] = $this->url->link('kbmp_marketplace/sellers_account_approval_list', $this->session_token_key.'=' . $this->session_token . '&sort=ks.date_added' . $url, true);
        
        $url = '';

        if (isset($this->request->get['filter_firstname'])) {
            $url .= '&filter_firstname=' . urlencode(html_entity_decode($this->request->get['filter_firstname'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_lastname'])) {
            $url .= '&filter_lastname=' . urlencode(html_entity_decode($this->request->get['filter_lastname'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_shop'])) {
            $url .= '&filter_shop=' . urlencode(html_entity_decode($this->request->get['filter_shop'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_country'])) {
            $url .= '&filter_country=' . urlencode(html_entity_decode($this->request->get['filter_country'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . urlencode(html_entity_decode($this->request->get['filter_status'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_approval_status'])) {
            $url .= '&filter_approval_status=' . urlencode(html_entity_decode($this->request->get['filter_approval_status'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_from_date'])) {
            $url .= '&filter_from_date=' . urlencode(html_entity_decode($this->request->get['filter_from_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_to_date'])) {
            $url .= '&filter_to_date=' . urlencode(html_entity_decode($this->request->get['filter_to_date'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $pending_approvals_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/sellers_account_approval_list', $this->session_token_key.'=' . $this->session_token . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($pending_approvals_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($pending_approvals_total - $this->config->get('config_limit_admin'))) ? $pending_approvals_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $pending_approvals_total, ceil($pending_approvals_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;
        
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('kbmp_marketplace/sellers_account_approval_list', $data));
    }

    /*
     * Function to approve seller
     */
    public function approve() {
        
        $this->load->language('kbmp_marketplace/sellers_account_approval_list');
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $data['text_approval_success'] = $this->language->get('text_approval_success');
        $data['text_approval_error'] = $this->language->get('text_approval_error');
        
        if (isset($this->request->get['seller_id']) && !empty($this->request->get['seller_id'])) {
            if ($this->model_kbmp_marketplace_kbmp_marketplace->approveSeller($this->request->get['seller_id'])) {   
                
                //Send Account Approval Mail
                $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($this->request->get['seller_id']);
                $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(2, $this->config->get('config_language_id'));

                if (isset($email_template) && !empty($email_template)) {
                    $message = str_replace("{{email}}", $seller_details['email'] , $email_template['email_content']); //Seller Email
                    $message = str_replace("{{full_name}}", $seller_details['firstname'] . ' ' . $seller_details['lastname'] , $message); //Seller Full Name

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
                
                $this->session->data['success'] = $this->language->get('text_approval_success');
            } else {
                $this->session->data['error'] = $this->language->get('text_approval_error');
            }
        }
        $this->response->redirect($this->url->link('kbmp_marketplace/sellers_account_approval_list', $this->session_token_key.'=' . $this->session_token, true));
    }
    
    /*
     * Function to disapprove seller
     */
    public function disapprove() {
     
        $this->load->language('kbmp_marketplace/sellers_account_approval_list');
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $data['text_disapproval_success'] = $this->language->get('text_disapproval_success');
        $data['text_disapproval_error'] = $this->language->get('text_disapproval_error');
        
        if (isset($this->request->get['seller_id']) && !empty($this->request->get['seller_id']) && isset($this->request->get['comment']) && !empty($this->request->get['comment'])) {
            if ($this->model_kbmp_marketplace_kbmp_marketplace->disapproveSeller($this->request->get['seller_id'], $this->request->get['comment'])) {   
                
                //Send Account Approval Mail
                $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($this->request->get['seller_id']);
                $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(3, $this->config->get('config_language_id'));

                if (isset($email_template) && !empty($email_template)) {
                    $message = str_replace("{{disapproval_reason}}", $seller_details['disapprove_comment'] , $email_template['email_content']); //Seller Email
                    $message = str_replace("{{full_name}}", $seller_details['firstname'] . ' ' . $seller_details['lastname'] , $message); //Seller Full Name

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
                
                $this->session->data['success'] = $this->language->get('text_disapproval_success');
            } else {
                $this->session->data['error'] = $this->language->get('text_disapproval_error');
            }
        }
        $this->response->redirect($this->url->link('kbmp_marketplace/sellers_account_approval_list', $this->session_token_key.'=' . $this->session_token, true));
    }
}
