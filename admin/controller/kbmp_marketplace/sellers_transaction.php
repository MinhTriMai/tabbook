<?php

class ControllerKbmpMarketplaceSellersTransaction extends Controller {

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
        
        $this->load->language('kbmp_marketplace/sellers_transaction');
        
        $this->document->setTitle($this->language->get('heading_title'));
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $this->getList();
    }
    
    /*
     * Function definition to get Sellers List
     */

    protected function getList() {
        
        if (isset($this->request->get['type'])) {
            $type = $this->request->get['type'];
        } else {
            $type = '';
        }
        
        if (isset($this->request->get['filter_seller'])) {
            $filter_seller = $this->request->get['filter_seller'];
        } else {
            $filter_seller = null;
        }
        
        if (isset($this->request->get['filter_email'])) {
            $filter_email = $this->request->get['filter_email'];
        } else {
            $filter_email = null;
        }
        
        if (isset($this->request->get['filter_transaction_id'])) {
            $filter_transaction_id = $this->request->get['filter_transaction_id'];
        } else {
            $filter_transaction_id = null;
        }
        
        if (isset($this->request->get['filter_type'])) {
            $filter_type = $this->request->get['filter_type'];
        } else {
            $filter_type = null;
        }

        if (isset($this->request->get['filter_comment'])) {
            $filter_comment = $this->request->get['filter_comment'];
        } else {
            $filter_comment = null;
        }
        
        if (isset($this->request->get['filter_amount'])) {
            $filter_amount = $this->request->get['filter_amount'];
        } else {
            $filter_amount = null;
        }
        
        if (isset($this->request->get['filter_transaction_date_from'])) {
            $filter_transaction_date_from = $this->request->get['filter_transaction_date_from'];
        } else {
            $filter_transaction_date_from = null;
        }
        
        if (isset($this->request->get['filter_transaction_date_to'])) {
            $filter_transaction_date_to = $this->request->get['filter_transaction_date_to'];
        } else {
            $filter_transaction_date_to = null;
        }
        
        if (isset($this->request->get['filter_total_earning'])) {
            $filter_total_earning = $this->request->get['filter_total_earning'];
        } else {
            $filter_total_earning = null;
        }
        
        if (isset($this->request->get['filter_commission'])) {
            $filter_commission = $this->request->get['filter_commission'];
        } else {
            $filter_commission = null;
        }
        
        if (isset($this->request->get['filter_seller_earning'])) {
            $filter_seller_earning = $this->request->get['filter_seller_earning'];
        } else {
            $filter_seller_earning = null;
        }
        
        if (isset($this->request->get['filter_amount_transferred'])) {
            $filter_amount_transferred = $this->request->get['filter_amount_transferred'];
        } else {
            $filter_amount_transferred = null;
        }
        
        if (isset($this->request->get['filter_balance'])) {
            $filter_balance = $this->request->get['filter_balance'];
        } else {
            $filter_balance = null;
        }
        
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'ksod.seller_id';
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
        
        if (isset($this->request->get['type']) && !empty($this->request->get['type'])) {
            $url .= '&type=1';
        }
        
        if (isset($this->request->get['filter_seller'])) {
            $url .= '&filter_seller=' . urlencode(html_entity_decode($this->request->get['filter_seller'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_transaction_id'])) {
            $url .= '&filter_transaction_id=' . urlencode(html_entity_decode($this->request->get['filter_transaction_id'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_type'])) {
            $url .= '&filter_type=' . urlencode(html_entity_decode($this->request->get['filter_type'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_comment'])) {
            $url .= '&filter_comment=' . urlencode(html_entity_decode($this->request->get['filter_comment'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_amount'])) {
            $url .= '&filter_amount=' . urlencode(html_entity_decode($this->request->get['filter_amount'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_transaction_date_from'])) {
            $url .= '&filter_transaction_date_from=' . urlencode(html_entity_decode($this->request->get['filter_transaction_date_from'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_transaction_date_to'])) {
            $url .= '&filter_transaction_date_to=' . urlencode(html_entity_decode($this->request->get['filter_transaction_date_to'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_total_earning'])) {
            $url .= '&filter_total_earning=' . urlencode(html_entity_decode($this->request->get['filter_total_earning'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_commission'])) {
            $url .= '&filter_commission=' . urlencode(html_entity_decode($this->request->get['filter_commission'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_seller_earning'])) {
            $url .= '&filter_seller_earning=' . urlencode(html_entity_decode($this->request->get['filter_seller_earning'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_amount_transferred'])) {
            $url .= '&filter_amount_transferred=' . urlencode(html_entity_decode($this->request->get['filter_amount_transferred'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_balance'])) {
            $url .= '&filter_balance=' . urlencode(html_entity_decode($this->request->get['filter_balance'], ENT_QUOTES, 'UTF-8'));
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
        
        $data['heading_title'] = $this->language->get('heading_title');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            if ($this->model_kbmp_marketplace_kbmp_marketplace->addNewTransaction($this->request->post)) {
                
                //Send email to seller in case of amount debit
                if (isset($this->request->post['new_transaction_send_mail']) && $this->request->post['new_transaction_send_mail']) {
                    if (isset($this->request->post['transaction_type']) && $this->request->post['transaction_type'] == '1') {
                        $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(19, $this->config->get('config_language_id'));
                    } else {
                        $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(24, $this->config->get('config_language_id'));
                    }
                    $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($this->request->post['seller_id']);


                    if (isset($email_template) && !empty($email_template)) {
                        $message = str_replace("{{seller_name}}", $seller_details['firstname'] . ' ' . $seller_details['lastname'], $email_template['email_content']); //Seller Full Name
                        $message = str_replace("{{shop_title}}", $seller_details['title'], $message); //Shop Title
                        $message = str_replace("{{seller_email}}", $seller_details['email'], $message); //Seller Full Name
                        $message = str_replace("{{seller_contact}}", $seller_details['telephone'], $message); //Seller Full Name
                        $message = str_replace("{{amount}}", $this->currency->format($this->request->post['amount'], $this->config->get('config_currency')), $message); //Amount
                        $message = str_replace("{{comment}}", $this->request->post['comment'], $message); //Comment
                        $message = str_replace("{{shop_url}}", HTTPS_CATALOG, $message); //Shop URL

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
                }
                $this->session->data['success'] = $this->language->get('text_success');
                $this->response->redirect($this->url->link('kbmp_marketplace/sellers_transaction', $this->session_token_key.'=' . $this->session_token, true));
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

        if (isset($this->error['seller_id'])) {
            $data['error_seller_id'] = $this->error['seller_id'];
        } else {
            $data['error_seller_id'] = '';
        }

        if (isset($this->error['transaction_number'])) {
            $data['error_transaction_number'] = $this->error['transaction_number'];
        } else {
            $data['error_transaction_number'] = '';
        }

        if (isset($this->error['amount'])) {
            $data['error_amount'] = $this->error['amount'];
        } else {
            $data['error_amount'] = '';
        }

        $data['action'] = $this->url->link('kbmp_marketplace/sellers_transaction', $this->session_token_key.'=' . $this->session_token, true);
        
        if (isset($this->request->post['seller_id'])) {
            $data['seller_id'] = $this->request->post['seller_id'];
        } else {
            $data['seller_id'] = '';
        }
        
        if (isset($this->request->post['transaction_number'])) {
            $data['transaction_number'] = $this->request->post['transaction_number'];
        } else {
            $data['transaction_number'] = '';
        }
        
        if (isset($this->request->post['transaction_type'])) {
            $data['transaction_type'] = $this->request->post['transaction_type'];
        } else {
            $data['transaction_type'] = '';
        }
        
        if (isset($this->request->post['amount'])) {
            $data['amount'] = $this->request->post['amount'];
        } else {
            $data['amount'] = '';
        }
        
        if (isset($this->request->post['comment'])) {
            $data['comment'] = $this->request->post['comment'];
        } else {
            $data['comment'] = '';
        }
        
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
        
        $data['view_title'] = $this->language->get('view_title');
        $data['new_transaction_title'] = $this->language->get('new_transaction_title');
        $data['add_transaction_title'] = $this->language->get('add_transaction_title');
        $data['close_transaction_form'] = $this->language->get('close_transaction_form');
        
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_from_date'] = $this->language->get('text_from_date');
        $data['text_to_date'] = $this->language->get('text_to_date');
        $data['text_view'] = $this->language->get('text_view');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_filter'] = $this->language->get('text_filter');
        $data['text_reset'] = $this->language->get('text_reset');
        $data['text_select_type'] = $this->language->get('text_select_type');
        $data['text_balance_history'] = $this->language->get('text_balance_history');
        $data['text_transaction_history'] = $this->language->get('text_transaction_history');
        $data['text_credit'] = $this->language->get('text_credit');
        $data['text_debit'] = $this->language->get('text_debit');
        $data['text_select_seller'] = $this->language->get('text_select_seller');
        $data['text_choose_seller'] = $this->language->get('text_choose_seller');
        $data['text_transaction_id'] = $this->language->get('text_transaction_id');
        $data['text_transaction_type'] = $this->language->get('text_transaction_type');
        $data['text_amount'] = $this->language->get('text_amount');
        $data['text_comment'] = $this->language->get('text_comment');
        $data['text_notification'] = $this->language->get('text_notification');
        
        $data['column_seller'] = $this->language->get('column_seller');
        $data['column_email'] = $this->language->get('column_email');
        $data['column_total_earning'] = $this->language->get('column_total_earning');
        $data['column_admin_earning'] = $this->language->get('column_admin_earning');
        $data['column_seller_earning'] = $this->language->get('column_seller_earning');
        $data['column_amount_transferred'] = $this->language->get('column_amount_transferred');
        $data['column_balance'] = $this->language->get('column_balance');
        $data['column_transaction_id'] = $this->language->get('column_transaction_id');
        $data['column_type'] = $this->language->get('column_type');
        $data['column_comment'] = $this->language->get('column_comment');
        $data['column_amount'] = $this->language->get('column_amount');
        $data['column_transaction_date'] = $this->language->get('column_transaction_date');
        
        $data['button_save'] = $this->language->get('button_save');
        
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_knowband_marketplace'),
            'href' => $this->url->link('extension/module/kbmp_marketplace', $this->session_token_key.'=' . $this->session_token, true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('kbmp_marketplace/sellers_transaction', $this->session_token_key.'=' . $this->session_token . $url, true)
        );

        $data['sellers_balance_history'] = array();

        $filter_data = array(
            'type'                          => trim($type),
            'filter_seller'                 => trim($filter_seller),
            'filter_email'                  => trim($filter_email),
            'filter_transaction_id'         => trim($filter_transaction_id),
            'filter_type'                   => trim($filter_type),
            'filter_comment'                => trim($filter_comment),
            'filter_amount'                 => trim($filter_amount),
            'filter_transaction_date_from'  => trim($filter_transaction_date_from),
            'filter_transaction_date_to'    => trim($filter_transaction_date_to),
            'filter_total_earning'          => trim($filter_total_earning),
            'filter_commission'             => trim($filter_commission),
            'filter_seller_earning'         => trim($filter_seller_earning),
            'filter_amount_transferred'     => trim($filter_amount_transferred),
            'filter_balance'                => trim($filter_balance),
            'sort'                          => $sort,
            'order'                         => $order,
            'start'                         => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'                         => $this->config->get('config_limit_admin')
        );
        
        $data['filter_data'] = $filter_data;

        if (isset($type) && !empty($type)) {
            $sellers_balance_history_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellersTransactionHistory($filter_data);

            $data['sellers_balance_history_total'] = $sellers_balance_history_total;
        
            $results = $this->model_kbmp_marketplace_kbmp_marketplace->getSellersTransactionHistory($filter_data);
            foreach ($results as $result) {

                $data['sellers_balance_history'][] = array(
                    'seller' => !empty($result['title']) ? $result['title'] : $this->language->get('text_not_available'),
                    'seller_email' => $result['email'],
                    'transaction_number' => $result['transaction_number'],
                    'transaction_type' => isset($result['transaction_type']) && !empty($result['transaction_type']) ? $this->language->get('text_debit') : $this->language->get('text_credit'),
                    'comment' => $result['comment'],
                    'amount' => $this->currency->format($result['amount'], $this->config->get('config_currency'), $this->config->get('config_currency_auto')),
                    'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
                );
            } 
        } else {
            $sellers_balance_history_total = $this->model_kbmp_marketplace_kbmp_marketplace->getSellersBalanceHistory($filter_data);
            $sellers_balance_history_total = $sellers_balance_history_total->num_rows;          
            $data['sellers_balance_history_total'] = $sellers_balance_history_total;
            
            $results = $this->model_kbmp_marketplace_kbmp_marketplace->getSellersBalanceHistory($filter_data);
            $results = $results->rows;
            foreach ($results as $result) {

                $data['sellers_balance_history'][] = array(
                    'seller' => !empty($result['title']) ? $result['title'] : $this->language->get('text_not_available'),
                    'seller_email' => $result['email'],
                    'total_earning' => $this->currency->format($result['total_earning'], $this->config->get('config_currency')),
                    'admin_earning' => $this->currency->format($result['admin_earning'], $this->config->get('config_currency')),
                    'seller_earning' => $this->currency->format($result['seller_earning'],$this->config->get('config_currency') ),
                    'amount_transferred' => $this->currency->format($result['amount_transferred'], $this->config->get('config_currency')),
                    'balance' => $this->currency->format($result['balance'],$this->config->get('config_currency'))
                );
            }
        }

        $url = '';

        if (isset($this->request->get['type']) && !empty($this->request->get['type'])) {
            $url .= '&type=1';
        }
        
        if (isset($this->request->get['filter_seller'])) {
            $url .= '&filter_seller=' . urlencode(html_entity_decode($this->request->get['filter_seller'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_transaction_id'])) {
            $url .= '&filter_transaction_id=' . urlencode(html_entity_decode($this->request->get['filter_transaction_id'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_type'])) {
            $url .= '&filter_type=' . urlencode(html_entity_decode($this->request->get['filter_type'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_comment'])) {
            $url .= '&filter_comment=' . urlencode(html_entity_decode($this->request->get['filter_comment'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_amount'])) {
            $url .= '&filter_amount=' . urlencode(html_entity_decode($this->request->get['filter_amount'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_transaction_date_from'])) {
            $url .= '&filter_transaction_date_from=' . urlencode(html_entity_decode($this->request->get['filter_transaction_date_from'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_transaction_date_to'])) {
            $url .= '&filter_transaction_date_to=' . urlencode(html_entity_decode($this->request->get['filter_transaction_date_to'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_total_earning'])) {
            $url .= '&filter_total_earning=' . urlencode(html_entity_decode($this->request->get['filter_total_earning'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_commission'])) {
            $url .= '&filter_commission=' . urlencode(html_entity_decode($this->request->get['filter_commission'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_seller_earning'])) {
            $url .= '&filter_seller_earning=' . urlencode(html_entity_decode($this->request->get['filter_seller_earning'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_amount_transferred'])) {
            $url .= '&filter_amount_transferred=' . urlencode(html_entity_decode($this->request->get['filter_amount_transferred'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_balance'])) {
            $url .= '&filter_balance=' . urlencode(html_entity_decode($this->request->get['filter_balance'], ENT_QUOTES, 'UTF-8'));
        }
        
        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        
        $data['sort_seller'] = $this->url->link('kbmp_marketplace/sellers_transaction', $this->session_token_key.'=' . $this->session_token . '&sort=ksd.title' . $url, true);
        $data['sort_email'] = $this->url->link('kbmp_marketplace/sellers_transaction', $this->session_token_key.'=' . $this->session_token . '&sort=c.email' . $url, true);
        $data['sort_transaction_id'] = $this->url->link('kbmp_marketplace/sellers_transaction', $this->session_token_key.'=' . $this->session_token . '&sort=kst.transaction_id' . $url, true);
        $data['sort_transaction_type'] = $this->url->link('kbmp_marketplace/sellers_transaction', $this->session_token_key.'=' . $this->session_token . '&sort=kst.transaction_type' . $url, true);
        $data['sort_comment'] = $this->url->link('kbmp_marketplace/sellers_transaction', $this->session_token_key.'=' . $this->session_token . '&sort=kst.comment' . $url, true);
        $data['sort_amount'] = $this->url->link('kbmp_marketplace/sellers_transaction', $this->session_token_key.'=' . $this->session_token . '&sort=kst.amount' . $url, true);
        $data['sort_transaction_date'] = $this->url->link('kbmp_marketplace/sellers_transaction', $this->session_token_key.'=' . $this->session_token . '&sort=kst.date_added' . $url, true);
        $data['sort_total_earning'] = $this->url->link('kbmp_marketplace/sellers_transaction', $this->session_token_key.'=' . $this->session_token . '&sort=total_earning' . $url, true);
        $data['sort_admin_earning'] = $this->url->link('kbmp_marketplace/sellers_transaction', $this->session_token_key.'=' . $this->session_token . '&sort=admin_earning' . $url, true);
        $data['sort_seller_earning'] = $this->url->link('kbmp_marketplace/sellers_transaction', $this->session_token_key.'=' . $this->session_token . '&sort=seller_earning' . $url, true);
        $data['sort_amount_transferred'] = $this->url->link('kbmp_marketplace/sellers_transaction', $this->session_token_key.'=' . $this->session_token . '&sort=amount_transferred' . $url, true);
        $data['sort_balance'] = $this->url->link('kbmp_marketplace/sellers_transaction', $this->session_token_key.'=' . $this->session_token . '&sort=balance' . $url, true);
        
        $url = '';

        if (isset($this->request->get['type']) && !empty($this->request->get['type'])) {
            $url .= '&type=1';
        }
        
        if (isset($this->request->get['filter_seller'])) {
            $url .= '&filter_seller=' . urlencode(html_entity_decode($this->request->get['filter_seller'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_transaction_id'])) {
            $url .= '&filter_transaction_id=' . urlencode(html_entity_decode($this->request->get['filter_transaction_id'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_type'])) {
            $url .= '&filter_type=' . urlencode(html_entity_decode($this->request->get['filter_type'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_comment'])) {
            $url .= '&filter_comment=' . urlencode(html_entity_decode($this->request->get['filter_comment'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_amount'])) {
            $url .= '&filter_amount=' . urlencode(html_entity_decode($this->request->get['filter_amount'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_transaction_date_from'])) {
            $url .= '&filter_transaction_date_from=' . urlencode(html_entity_decode($this->request->get['filter_transaction_date_from'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_transaction_date_to'])) {
            $url .= '&filter_transaction_date_to=' . urlencode(html_entity_decode($this->request->get['filter_transaction_date_to'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_total_earning'])) {
            $url .= '&filter_total_earning=' . urlencode(html_entity_decode($this->request->get['filter_total_earning'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_commission'])) {
            $url .= '&filter_commission=' . urlencode(html_entity_decode($this->request->get['filter_commission'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_seller_earning'])) {
            $url .= '&filter_seller_earning=' . urlencode(html_entity_decode($this->request->get['filter_seller_earning'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_amount_transferred'])) {
            $url .= '&filter_amount_transferred=' . urlencode(html_entity_decode($this->request->get['filter_amount_transferred'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['filter_balance'])) {
            $url .= '&filter_balance=' . urlencode(html_entity_decode($this->request->get['filter_balance'], ENT_QUOTES, 'UTF-8'));
        }
        
        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $sellers_balance_history_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/sellers_transaction', $this->session_token_key.'=' . $this->session_token . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($sellers_balance_history_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($sellers_balance_history_total - $this->config->get('config_limit_admin'))) ? $sellers_balance_history_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $sellers_balance_history_total, ceil($sellers_balance_history_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        
        //Get Sellers List
        $sellersList = $this->model_kbmp_marketplace_kbmp_marketplace->getSellersList();
        $data['sellers_list'] = array();
        if ($sellersList && !empty($sellersList)) {
            foreach ($sellersList as $sellersList) {
                $data['sellers_list'][] = array(
                    'seller_id' => $sellersList['seller_id'],
                    'title' => $sellersList['title'] . ' (' . $sellersList['email'] . ')'
                );
            }
        }

        $this->response->setOutput($this->load->view('kbmp_marketplace/sellers_transaction', $data));
    }
    
    protected function validateForm() {
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        if (!$this->user->hasPermission('modify', 'kbmp_marketplace/sellers_transaction')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (empty($this->request->post['seller_id'])) {
            $this->error['seller_id'] = $this->language->get('error_seller_id');
        }

        if (utf8_strlen($this->request->post['transaction_number']) < 1 || utf8_strlen($this->request->post['transaction_number']) > 255) {
            $this->error['transaction_number'] = $this->language->get('error_transaction_number');
        } else {
            //Check for Unique Transaction Number
            if ($this->model_kbmp_marketplace_kbmp_marketplace->isUniqueTransactionNumber($this->request->post['transaction_number'])) {
                $this->error['transaction_number'] = $this->language->get('error_transaction_number');
            }
        }

        $pattern = '/^\d+(?:\.\d{2})?$/';
        if (preg_match($pattern, $this->request->post['amount']) == '0') {
           $this->error['amount'] = $this->language->get('error_amount');
        }

        return !$this->error;
    }

}
