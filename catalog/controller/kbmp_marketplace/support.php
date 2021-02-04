<?php

class ControllerKbmpMarketplaceSupport extends Controller {

    public function index() {

        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('kbmp_marketplace/support', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }
        
        $this->load->language('kbmp_marketplace/common');
        $this->load->language('kbmp_marketplace/support');

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
        $data['text_filter_search'] = $this->language->get('text_filter_search');
        $data['text_open'] = $this->language->get('text_open');
        $data['text_in_progress'] = $this->language->get('text_in_progress');
        $data['text_awaiting_reply'] = $this->language->get('text_awaiting_reply');
        $data['text_replied'] = $this->language->get('text_replied');
        $data['text_on_hold'] = $this->language->get('text_on_hold');
        $data['text_closed'] = $this->language->get('text_closed');
        $data['text_low'] = $this->language->get('text_low');
        $data['text_medium'] = $this->language->get('text_medium');
        $data['text_high'] = $this->language->get('text_high');
        
        $data['text_all_tickets'] = $this->language->get('text_all_tickets');
        $data['text_created_date'] = $this->language->get('text_created_date');
        $data['text_last_updated'] = $this->language->get('text_last_updated');
        $data['text_priority'] = $this->language->get('text_priority');
        $data['text_status'] = $this->language->get('text_status');
        $data['text_subject'] = $this->language->get('text_subject');
        $data['text_customer_name'] = $this->language->get('text_customer_name');
        $data['text_customer_email'] = $this->language->get('text_customer_email');
        $data['text_ticket_id'] = $this->language->get('text_ticket_id');
        $data['text_open_tickets'] = $this->language->get('text_open_tickets');
        $data['text_closed_tickets'] = $this->language->get('text_closed_tickets');
        $data['text_customer'] = $this->language->get('text_customer');
        $data['text_seller'] = $this->language->get('text_seller');
        $data['text_post_reply'] = $this->language->get('text_post_reply');
        $data['text_enter_your_reply'] = $this->language->get('text_enter_your_reply');
        $data['text_reply'] = $this->language->get('text_reply');
        $data['text_issue'] = $this->language->get('text_issue');
        $data['text_issue_details'] = $this->language->get('text_issue_details');
        $data['text_ticket_number'] = $this->language->get('text_ticket_number');
        $data['text_details'] = $this->language->get('text_details');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_tickets'] = $this->language->get('text_tickets');
        $data['error_account_warning'] = $this->language->get('error_account_warning');
        $data['text_account_warning'] = $this->language->get('text_account_warning');
        $data['text_filter'] = $this->language->get('text_filter');
        $data['text_reset'] = $this->language->get('text_reset');
        
        $data['sidebar'] = $this->load->controller('kbmp_marketplace/header');
        $data['kbmp_footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['sidebar'] = $this->load->controller('kbmp_marketplace/header');
        $data['kbmp_footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('common/header');
        $data['footer'] = $this->load->controller('common/footer');

        $data['home_link'] = $this->url->link('common/home');
        $data['account_link'] = $this->url->link('account/account', '', true);
        $data['logout_link'] = $this->url->link('account/logout', '', true);

        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $this->load->model('kbmp_marketplace/support');

        //Get Seller ID
        $sellerId = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        $data['seller_details'] = $sellerId;
        
        $total_tickets = $this->model_kbmp_marketplace_support->getTotalTicket($sellerId['seller_id']);
        $data['total_tickets'] = $total_tickets;

        $total_open_tickets = $this->model_kbmp_marketplace_support->getTotalOpenTicket($sellerId['seller_id']);
        $data['total_open_tickets'] = $total_open_tickets;

        $total_closed_tickets = $this->model_kbmp_marketplace_support->getTotalClosedTicket($sellerId['seller_id']);
        $data['total_closed_tickets'] = $total_closed_tickets;
        
        $data['selected'] = array();

        if (isset($this->request->get['filter_ticket_id'])) {
            $filter_ticket_id = $this->request->get['filter_ticket_id'];
        } else {
            $filter_ticket_id = null;
        }

        if (isset($this->request->get['filter_email'])) {
            $filter_email = $this->request->get['filter_email'];
        } else {
            $filter_email = null;
        }

        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
        }

        if (isset($this->request->get['filter_priority'])) {
            $filter_priority = $this->request->get['filter_priority'];
        } else {
            $filter_priority = null;
        }
        if (isset($this->request->get['filter_customer'])) {
            $filter_customer = $this->request->get['filter_customer'];
        } else {
            $filter_customer = null;
        }
        if (isset($this->request->get['filter_subject'])) {
            $filter_subject = $this->request->get['filter_subject'];
        } else {
            $filter_subject = null;
        }
        if (isset($this->request->get['filter_date_added'])) {
            $filter_date_added = $this->request->get['filter_date_added'];
        } else {
            $filter_date_added = null;
        }
        if (isset($this->request->get['filter_date_modified'])) {
            $filter_date_modified = $this->request->get['filter_date_modified'];
        } else {
            $filter_date_modified = null;
        }
        
        if (isset($this->request->get['filter_reset'])) {
            $filter_priority = null;
            $filter_status = null;
            $filter_ticket_id = null;
            $filter_email = null;
            $filter_subject = null;
            $filter_customer = null;
            $filter_date_added = null;
            $filter_date_modified = null;
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'id';
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

        if (isset($this->request->get['filter_ticket_id'])) {
            $url .= '&filter_ticket_id=' . $this->request->get['filter_ticket_id'];
        }

        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . $this->request->get['filter_email'];
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if (isset($this->request->get['filter_priority'])) {
            $url .= '&filter_priority=' . $this->request->get['filter_priority'];
        }
        if (isset($this->request->get['filter_customer'])) {
            $url .= '&filter_customer=' . $this->request->get['filter_customer'];
        }
        if (isset($this->request->get['filter_subject'])) {
            $url .= '&filter_subject=' . $this->request->get['filter_subject'];
        }
        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
        }
        if (isset($this->request->get['filter_date_modified'])) {
            $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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

        $data['tickets'] = array();

        $filter_data = array(
            'seller_id' => $sellerId['seller_id'],
            'filter_ticket_id' => $filter_ticket_id,
            'filter_email' => $filter_email,
            'filter_customer' => $filter_customer,
            'filter_status' => $filter_status,
            'filter_priority' => $filter_priority,
            'filter_subject' => $filter_subject,
            'filter_date_added' => $filter_date_added,
            'filter_date_modified' => $filter_date_modified,
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );
        
        $tickets = $this->model_kbmp_marketplace_support->getTickets($filter_data);
        foreach ($tickets as $result) {
            if($result['status'] == '1')
                $status = $this->language->get('text_open');
            elseif($result['status'] == '2')
                $status = $this->language->get('text_in_progress');
            elseif($result['status'] == '3')
                $status = $this->language->get('text_awaiting_reply');
            elseif($result['status'] == '4')
                $status = $this->language->get('text_replied');
            elseif($result['status'] == '5')
                $status = $this->language->get('text_on_hold');
            else
                $status = $this->language->get('text_closed');
            
            if($result['priority'] == '1')
                $priority = $this->language->get('text_low');
            elseif($result['priority'] == '2')
                $priority = $this->language->get('text_medium');
            elseif($result['priority'] == '3')
                $priority = $this->language->get('text_high');
            
            $data['tickets'][] = array(
                'id' => $result['id'],
                'ticket_id' => $result['ticket_id'],
                'email' => $result['email'],
                'name' => $result['name'],
                'subject' => $result['subject'],
                'status' => $status,
                'priority' => $priority,
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'date_updated' => date($this->language->get('date_format_short'), strtotime($result['date_updated'])),
            );
        }
        
        $filter_data = array(
            'seller_id' => $sellerId['seller_id'],
            'filter_ticket_id' => $filter_ticket_id,
            'filter_email' => $filter_email,
            'filter_customer' => $filter_customer,
            'filter_status' => $filter_status,
            'filter_priority' => $filter_priority,
            'filter_subject' => $filter_subject,
            'filter_date_added' => $filter_date_added,
            'filter_date_modified' => $filter_date_modified,
        );
        $total_tickets = count($this->model_kbmp_marketplace_support->getTickets($filter_data));

        $url = '';

        if (isset($this->request->get['filter_ticket_id'])) {
            $url .= '&filter_ticket_id=' . $this->request->get['filter_ticket_id'];
        }

        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . $this->request->get['filter_email'];
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if (isset($this->request->get['filter_priority'])) {
            $url .= '&filter_priority=' . $this->request->get['filter_priority'];
        }
        if (isset($this->request->get['filter_customer'])) {
            $url .= '&filter_customer=' . $this->request->get['filter_customer'];
        }
        if (isset($this->request->get['filter_subject'])) {
            $url .= '&filter_subject=' . $this->request->get['filter_subject'];
        }
        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
        }
        if (isset($this->request->get['filter_date_modified'])) {
            $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
        }

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_id'] = $this->url->link('kbmp_marketplace/support', '&sort=id' . $url, true);
        $data['sort_email'] = $this->url->link('kbmp_marketplace/support', '&sort=email' . $url, true);
        $data['sort_name'] = $this->url->link('kbmp_marketplace/support', '&sort=name' . $url, true);
        $data['sort_subject'] = $this->url->link('kbmp_marketplace/support', '&sort=subject' . $url, true);
        $data['sort_status'] = $this->url->link('kbmp_marketplace/support', '&sort=status' . $url, true);
        $data['sort_priority'] = $this->url->link('kbmp_marketplace/support', '&sort=priority' . $url, true);
        $data['sort_date_added'] = $this->url->link('kbmp_marketplace/support', '&sort=date_added' . $url, true);
        $data['sort_date_updated'] = $this->url->link('kbmp_marketplace/support', '&sort=date_updated' . $url, true);

        $url = '';

        if (isset($this->request->get['filter_ticket_id'])) {
            $url .= '&filter_ticket_id=' . $this->request->get['filter_ticket_id'];
        }

        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email=' . $this->request->get['filter_email'];
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if (isset($this->request->get['filter_priority'])) {
            $url .= '&filter_priority=' . $this->request->get['filter_priority'];
        }
        if (isset($this->request->get['filter_customer'])) {
            $url .= '&filter_customer=' . $this->request->get['filter_customer'];
        }
        if (isset($this->request->get['filter_subject'])) {
            $url .= '&filter_subject=' . $this->request->get['filter_subject'];
        }
        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
        }
        if (isset($this->request->get['filter_date_modified'])) {
            $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $total_tickets;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/support', $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($total_tickets) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total_tickets - $this->config->get('config_limit_admin'))) ? $total_tickets : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total_tickets, ceil($total_tickets / $this->config->get('config_limit_admin')));

        $data['filter_ticket_id'] = $filter_ticket_id;
        $data['filter_email'] = $filter_email;
        $data['filter_customer'] = $filter_customer;
        $data['filter_status'] = $filter_status;
        $data['filter_priority'] = $filter_priority;
        $data['filter_subject'] = $filter_subject;
        $data['filter_date_added'] = $filter_date_added;
        $data['filter_date_modified'] = $filter_date_modified;
        $data['sort'] = $sort;
        
        $data['view_ticket'] = $this->url->link('kbmp_marketplace/support/ticket');

	$this->load->model('setting/kbmp_marketplace');
        //Get the module configuration values
        $store_id = (int) $this->config->get('config_store_id');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
        $data['kbmp_marketplace_settings'] = $settings;

        $this->response->setOutput($this->load->view('kbmp_marketplace/support', $data));
    }
    
    public function ticket() {
        $this->load->language('kbmp_marketplace/common');
        $this->load->language('kbmp_marketplace/support');

        $data['title'] = $this->document->getTitle();
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $this->load->model('kbmp_marketplace/support');
        $this->document->setTitle($this->language->get('heading_title'));

        $ticket_id = 0;
        if(isset($this->request->get['ticket_id'])){
            $ticket_id = $this->request->get['ticket_id'];
        }
        $data['ticket_id'] = $ticket_id;
        if(isset($this->request->post) && !empty($this->request->post)){
            $this->model_kbmp_marketplace_support->reply($this->request->post);
            $this->response->redirect($this->url->link('kbmp_marketplace/support/ticket&ticket_id='.$ticket_id, '', true));
        }
        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_my_account'] = $this->language->get('text_my_account');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_total_order'] = $this->language->get('text_total_order');
        $data['text_ticket'] = $this->language->get('text_ticket');
        $data['text_ticket_number'] = $this->language->get('text_ticket_number');
        $data['text_details'] = $this->language->get('text_details');
        $data['text_customer_email'] = $this->language->get('text_customer_email');
        $data['text_customer_name'] = $this->language->get('text_customer_name');
        $data['text_subject'] = $this->language->get('text_subject');
        $data['text_status'] = $this->language->get('text_status');
        $data['text_priority'] = $this->language->get('text_priority');
        $data['text_issue'] = $this->language->get('text_issue');
        $data['text_issue_details'] = $this->language->get('text_issue_details');
        $data['text_post_reply'] = $this->language->get('text_post_reply');
        $data['text_reply'] = $this->language->get('text_reply');
        $data['text_customer'] = $this->language->get('text_customer');
        $data['text_my_account1'] = $this->language->get('text_my_account');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_last_updated'] = $this->language->get('text_last_updated');
        $data['text_created_date'] = $this->language->get('text_created_date');
        $data['text_open'] = $this->language->get('text_open');
        $data['text_in_progress'] = $this->language->get('text_in_progress');
        $data['text_awaiting_reply'] = $this->language->get('text_awaiting_reply');
        $data['text_replied'] = $this->language->get('text_replied');
        $data['text_on_hold'] = $this->language->get('text_on_hold');
        $data['text_closed'] = $this->language->get('text_closed');
        $data['text_low'] = $this->language->get('text_low');
        $data['text_medium'] = $this->language->get('text_medium');
        $data['text_high'] = $this->language->get('text_high');
        $data['text_enter_your_reply'] = $this->language->get('text_enter_your_reply');
        $data['text_phone_no'] = $this->language->get('text_phone_no');
        $data['error_empty_field'] = $this->language->get('error_empty_field');
        
        $data['sidebar'] = $this->load->controller('kbmp_marketplace/header');
        $data['kbmp_footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('common/header');
        $data['footer'] = $this->load->controller('common/footer');

        $data['home_link'] = $this->url->link('common/home');
        $data['account_link'] = $this->url->link('account/account', '', true);
        $data['logout_link'] = $this->url->link('account/logout', '', true);
        $data['action'] = $this->url->link('kbmp_marketplace/support/ticket', '', true);

        
        $ticket_data = $this->model_kbmp_marketplace_support->getTicket($ticket_id);

        if(!empty($ticket_data)){
            $data['id'] = $ticket_data['id'];
            $data['ticket_id'] = $ticket_data['ticket_id'];
            $data['email'] = $ticket_data['email'];
            $data['name'] = $ticket_data['name'];
            $data['phone'] = $ticket_data['phone'];
            $data['subject'] = $ticket_data['subject'];
            $data['status_value'] = $ticket_data['status'];
            $data['priority_value'] = $ticket_data['priority'];
            
            if($ticket_data['status'] == '1')
                $data['status'] = $this->language->get('text_open');
            elseif($ticket_data['status'] == '2')
                $data['status'] = $this->language->get('text_in_progress');
            elseif($ticket_data['status'] == '3')
                $data['status'] = $this->language->get('text_awaiting_reply');
            elseif($ticket_data['status'] == '4')
                $data['status'] = $this->language->get('text_replied');
            elseif($ticket_data['status'] == '5')
                $data['status'] = $this->language->get('text_on_hold');
            else
                $data['status'] = $this->language->get('text_closed');
            
            if($ticket_data['priority'] == '1')
                $data['priority'] = $this->language->get('text_low');
            elseif($ticket_data['priority'] == '2')
                $data['priority'] = $this->language->get('text_medium');
            elseif($ticket_data['priority'] == '3')
                $data['priority'] = $this->language->get('text_high');
            
            $data['issue'] = html_entity_decode($ticket_data['issue']);
            $data['phone'] = $ticket_data['phone'];
            $data['date_added'] = date("M d, Y H:i:s A", strtotime($ticket_data['date_added']));
            $data['date_updated'] = date("M d, Y H:i:s A", strtotime($ticket_data['date_updated']));
        }
        
        $conversation = $this->model_kbmp_marketplace_support->getConversation($ticket_id);
        foreach ($conversation as $key => $value) {
            $data['conversation'][$key]['text'] = html_entity_decode($value['text']);
            $data['conversation'][$key]['date_added'] = date("M d, Y H:i:s A", strtotime($value['date_added']));
            $data['conversation'][$key]['type'] = $value['type'];
            if($value['type'] == '1'){
                $data['conversation'][$key]['type_name'] = $this->language->get('text_customer');
                $data['conversation'][$key]['color'] = 'rgb(215, 73, 53)';
            }else{
                $data['conversation'][$key]['type_name'] = $this->language->get('text_seller');
                $data['conversation'][$key]['color'] = 'green';
            }
        }
//        var_dump($data['conversation']);die;
        $this->response->setOutput($this->load->view('kbmp_marketplace/ticket_view', $data));
    }
}
