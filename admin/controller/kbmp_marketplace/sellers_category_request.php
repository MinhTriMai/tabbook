<?php

class ControllerKbmpMarketplaceSellersCategoryRequest extends Controller {

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
        
        $this->load->language('kbmp_marketplace/sellers_category_request');
        
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
        
        if (isset($this->request->get['filter_seller_email'])) {
            $filter_seller_email = $this->request->get['filter_seller_email'];
        } else {
            $filter_seller_email = null;
        }
        
        if (isset($this->request->get['filter_category'])) {
            $filter_category = $this->request->get['filter_category'];
        } else {
            $filter_category = null;
        }
        
        if (isset($this->request->get['filter_comment'])) {
            $filter_comment = $this->request->get['filter_comment'];
        } else {
            $filter_comment = null;
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
            $sort = 'kscr.date_added';
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
        
        if (isset($this->request->get['filter_seller_email'])) {
            $url .= '&filter_seller_email=' . urlencode(html_entity_decode($this->request->get['filter_seller_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_category'])) {
            $url .= '&filter_category=' . urlencode(html_entity_decode($this->request->get['filter_category'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_comment'])) {
            $url .= '&filter_comment=' . urlencode(html_entity_decode($this->request->get['filter_comment'], ENT_QUOTES, 'UTF-8'));
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
            'href' => $this->url->link('kbmp_marketplace/sellers_category_request', $this->session_token_key.'=' . $this->session_token . $url, true)
        );
        
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
        
        $data['sellers_category_request'] = array();

        $filter_data = array(
            'filter_seller'             => trim($filter_seller),
            'filter_seller_email'       => trim($filter_seller_email),
            'filter_category'           => trim($filter_category),
            'filter_comment'            => trim($filter_comment),
            'filter_status'             => trim($filter_status),
            'filter_from_date_added'    => trim($filter_from_date_added),
            'filter_to_date_added'      => trim($filter_to_date_added),
            'sort'                      => $sort,
            'order'                     => $order,
            'start'                     => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'                     => $this->config->get('config_limit_admin')
        );
        
        $data['filter_data'] = $filter_data;

        $sellers_category_request_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellersCategoryRequest($filter_data);

        $data['sellers_category_request_total'] = $sellers_category_request_total;
        
        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getSellersCategoryRequest($filter_data);

        foreach ($results as $result) {
            
            $data['sellers_category_request'][] = array(
                'seller_category_request_id' => $result['seller_category_request_id'],
                'seller' => $result['title'],
                'seller_email' => $result['email'],
                'category' => $result['name'],
                'comment' => $result['comment'],
                'status' => $result['approved'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
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
        
        $data['token'] = $this->session_token;
        
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_from_date'] = $this->language->get('text_from_date');
        $data['text_to_date'] = $this->language->get('text_to_date');
        $data['text_view'] = $this->language->get('text_view');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_approve'] = $this->language->get('text_approve');
        $data['text_disapprove'] = $this->language->get('text_disapprove');
        $data['text_filter'] = $this->language->get('text_filter');
        $data['text_reset'] = $this->language->get('text_reset');
        $data['text_approved'] = $this->language->get('text_approved');
        $data['text_waiting_for_approval'] = $this->language->get('text_waiting_for_approval');
        $data['text_disapproved'] = $this->language->get('text_disapproved');
        $data['text_submit'] = $this->language->get('text_submit');
        $data['text_cancel'] = $this->language->get('text_cancel');
        $data['text_disapproval_popup'] = $this->language->get('text_disapproval_popup');
        $data['text_seller_catgory_commision'] = $this->language->get('text_seller_catgory_commision');
        
        $data['text_approval_confirmation'] = $this->language->get('text_approval_confirmation');
        $data['text_disapproval_confirmation'] = $this->language->get('text_disapproval_confirmation');
        $data['text_disapproval'] = $this->language->get('text_disapproval');
        $data['disapprove_comment_error'] = $this->language->get('disapprove_comment_error');
        
        $data['column_seller'] = $this->language->get('column_seller');
        $data['column_seller_email'] = $this->language->get('column_seller_email');
        $data['column_category'] = $this->language->get('column_category');
        $data['column_comment'] = $this->language->get('column_comment');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_date_added'] = $this->language->get('column_date_added');

        $url = '';

        if (isset($this->request->get['filter_seller'])) {
            $url .= '&filter_seller=' . urlencode(html_entity_decode($this->request->get['filter_seller'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_seller_email'])) {
            $url .= '&filter_seller_email=' . urlencode(html_entity_decode($this->request->get['filter_seller_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_category'])) {
            $url .= '&filter_category=' . urlencode(html_entity_decode($this->request->get['filter_category'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_comment'])) {
            $url .= '&filter_comment=' . urlencode(html_entity_decode($this->request->get['filter_comment'], ENT_QUOTES, 'UTF-8'));
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
        
        $data['sort_seller'] = $this->url->link('kbmp_marketplace/sellers_category_request', $this->session_token_key.'=' . $this->session_token . '&sort=ksd.title' . $url, true);
        $data['sort_seller_email'] = $this->url->link('kbmp_marketplace/sellers_category_request', $this->session_token_key.'=' . $this->session_token . '&sort=c.email' . $url, true);
        $data['sort_category'] = $this->url->link('kbmp_marketplace/sellers_category_request', $this->session_token_key.'=' . $this->session_token . '&sort=cd.name' . $url, true);
        $data['sort_comment'] = $this->url->link('kbmp_marketplace/sellers_category_request', $this->session_token_key.'=' . $this->session_token . '&sort=kscr.comment' . $url, true);
        $data['sort_status'] = $this->url->link('kbmp_marketplace/sellers_category_request', $this->session_token_key.'=' . $this->session_token . '&sort=kscr.approved' . $url, true);
        $data['sort_date_added'] = $this->url->link('kbmp_marketplace/sellers_category_request', $this->session_token_key.'=' . $this->session_token . '&sort=kscr.date_added' . $url, true);
        
        $url = '';
        
        if (isset($this->request->get['filter_seller'])) {
            $url .= '&filter_seller=' . urlencode(html_entity_decode($this->request->get['filter_seller'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_seller_email'])) {
            $url .= '&filter_seller_email=' . urlencode(html_entity_decode($this->request->get['filter_seller_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_category'])) {
            $url .= '&filter_category=' . urlencode(html_entity_decode($this->request->get['filter_category'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_comment'])) {
            $url .= '&filter_comment=' . urlencode(html_entity_decode($this->request->get['filter_comment'], ENT_QUOTES, 'UTF-8'));
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
        $pagination->total = $sellers_category_request_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/sellers_category_request', $this->session_token_key.'=' . $this->session_token . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($sellers_category_request_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($sellers_category_request_total - $this->config->get('config_limit_admin'))) ? $sellers_category_request_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $sellers_category_request_total, ceil($sellers_category_request_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('kbmp_marketplace/sellers_category_request', $data));
    }
    
    /*
     * Function to approve category request
     */
    public function approve() {
        
        $this->load->language('kbmp_marketplace/sellers_category_request');
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $data['text_approval_success'] = $this->language->get('text_approval_success');
        $data['text_approval_error'] = $this->language->get('text_approval_error');
        
        if (isset($this->request->get['seller_category_request_id']) && !empty($this->request->get['seller_category_request_id'])) {
            if ($this->model_kbmp_marketplace_kbmp_marketplace->approveCategoryRequest($this->request->get['seller_category_request_id'])) {   
                
                //Send category approval notification to seller
                $category_request_details = $this->model_kbmp_marketplace_kbmp_marketplace->getCategoryRequestDetails($this->request->get['seller_category_request_id']);
                $category_details = $this->model_kbmp_marketplace_kbmp_marketplace->getCategory($category_request_details['category_id']);
                $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($category_request_details['seller_id']);
                $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(8, $this->config->get('config_language_id'));

                if (isset($email_template) && !empty($email_template)) {
                    $message = str_replace("{{requested_category}}", $category_details['path'] . ' > ' . $category_details['name'], $email_template['email_content']); //Seller Email
                    $message = str_replace("{{shop_title}}", $seller_details['title'], $message); //Shop Title
                    $message = str_replace("{{seller_name}}", $seller_details['firstname'] . ' ' . $seller_details['lastname'], $message); //Seller Name
                    $message = str_replace("{{seller_email}}", $seller_details['email'], $message); //Seller Email
                    $message = str_replace("{{seller_contact}}", $seller_details['telephone'], $message); //Seller Contact
                    
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

                $this->session->data['success'] = $this->language->get('text_approval_success');
            } else {
                $this->session->data['error'] = $this->language->get('text_approval_error');
            }
        }
        $this->response->redirect($this->url->link('kbmp_marketplace/sellers_category_request', $this->session_token_key.'=' . $this->session_token, true));
    }
    
    /*
     * Function to disapprove category request
     */
    public function disapprove() {
     
        $this->load->language('kbmp_marketplace/sellers_category_request');
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $data['text_disapproval_success'] = $this->language->get('text_disapproval_success');
        $data['text_disapproval_error'] = $this->language->get('text_disapproval_error');
        
        if (isset($this->request->get['seller_category_request_id']) && !empty($this->request->get['seller_category_request_id']) && isset($this->request->get['comment']) && !empty($this->request->get['comment'])) {
            if ($this->model_kbmp_marketplace_kbmp_marketplace->disapproveCategoryRequest($this->request->get['seller_category_request_id'], $this->request->get['comment'])) {   
                
                //Send category approval notification to seller
                $category_request_details = $this->model_kbmp_marketplace_kbmp_marketplace->getCategoryRequestDetails($this->request->get['seller_category_request_id']);
                $category_details = $this->model_kbmp_marketplace_kbmp_marketplace->getCategory($category_request_details['category_id']);
                $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($category_request_details['seller_id']);
                $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(9, $this->config->get('config_language_id'));

                if (isset($email_template) && !empty($email_template)) {
                    $message = str_replace("{{requested_category}}", $category_details['path'] . ' > ' . $category_details['name'], $email_template['email_content']); //Requested Category
                    $message = str_replace("{{comment}}", $this->request->get['comment'], $message); //Reason
                    $message = str_replace("{{shop_title}}", $seller_details['title'], $message); //Shop Title
                    $message = str_replace("{{seller_name}}", $seller_details['firstname'] . ' ' . $seller_details['lastname'], $message); //Seller Name
                    $message = str_replace("{{seller_email}}", $seller_details['email'], $message); //Seller Email
                    $message = str_replace("{{seller_contact}}", $seller_details['telephone'], $message); //Seller Contact
                    $message = str_replace("{{shop_url}}", HTTPS_CATALOG, $message); //Seller Contact
                    
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
                
                $this->session->data['success'] = $this->language->get('text_disapproval_success');
            } else {
                $this->session->data['error'] = $this->language->get('text_disapproval_error');
            }
        }
        $this->response->redirect($this->url->link('kbmp_marketplace/sellers_category_request', $this->session_token_key.'=' . $this->session_token, true));
    }

}
