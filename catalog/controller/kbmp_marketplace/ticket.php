<?php

class ControllerKbmpMarketplaceTicket extends Controller {

    public function index() {

        $this->load->language('kbmp_marketplace/ticket');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('kbmp_marketplace/support');
        $this->load->model('setting/kbmp_marketplace');
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $this->load->model('account/customer');

        $this->load->model('tool/image');

        $this->document->addStyle('catalog/view/theme/default/stylesheet/kbmp_marketplace/custom.css');

        $seller_id = 0;
        if(isset($this->request->get['seller_id'])){
            $seller_id = $this->request->get['seller_id'];
        }
        $data['seller_id'] = $seller_id;
        $store_id = (int) $this->config->get('config_store_id');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);

        if(isset($this->request->post) && !empty($this->request->post)){
            $this->request->post['status'] = '1';
            $this->request->post['priority'] = '1';
            $ticket_id = $this->model_kbmp_marketplace_support->addTicket($this->request->post,$seller_id);
            $this->session->data['success'] = sprintf($this->language->get('success_msg_ticket'),$ticket_id);
            $this->response->redirect($this->url->link('kbmp_marketplace/ticket', 'seller_id=' . $seller_id, true));
        }
        
        if(isset($this->session->data['success'])){
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        }
        
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_seller'),
            'href' => $this->url->link('kbmp_marketplace/sellers/view', 'seller_id=' . $seller_id, true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_ticket'),
            'href' => $this->url->link('kbmp_marketplace/ticket', 'seller_id=' . $seller_id, true)
        );
        $data['action'] = $this->url->link('kbmp_marketplace/ticket', 'seller_id=' . $seller_id, true);
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_new_ticket'] = $this->language->get('text_new_ticket');
        $data['text_heading_hint'] = $this->language->get('text_heading_hint');
        $data['text_email_address'] = $this->language->get('text_email_address');
        $data['text_first_name'] = $this->language->get('text_first_name');
        $data['text_last_name'] = $this->language->get('text_last_name');
        $data['text_phone_no'] = $this->language->get('text_phone_no');
        $data['text_subject'] = $this->language->get('text_subject');
        $data['text_issue'] = $this->language->get('text_issue');
        $data['text_submit'] = $this->language->get('text_submit');
        
        $data['error_minchar_field'] = $this->language->get('error_minchar_field');
        $data['error_mmaxchar_field'] = $this->language->get('error_mmaxchar_field');
        $data['error_empty_field'] = $this->language->get('error_empty_field');
        $data['error_max_email'] = $this->language->get('error_max_email');
        $data['error_validate_email'] = $this->language->get('error_validate_email');
        $data['error_maxchar_phone'] = $this->language->get('error_maxchar_phone');
        $data['error_invalid_phone'] = $this->language->get('error_invalid_phone');
        
        $this->load->model('account/customer');
        $customer = $this->model_account_customer->getCustomer($this->customer->getId());
        
//        var_dump($customer);die;
        if(isset($this->request->post['customer_id'])){
            $data['customer_id'] = $this->request->post['customer_id'];
        }else if(isset ($customer['customer_id'])){
            $data['customer_id'] = $customer['customer_id'];
        }else{
            $data['customer_id'] = 0;
        }
        if(isset($this->request->post['email'])){
            $data['email'] = $this->request->post['email'];
        }else if(isset ($customer['email'])){
            $data['email'] = $customer['email'];
        }else{
            $data['email'] = '';
        }
        
        if(isset($this->request->post['firstname'])){
            $data['firstname'] = $this->request->post['firstname'];
        }else if(isset ($customer['firstname'])){
            $data['firstname'] = $customer['firstname'];
        }else{
            $data['firstname'] = '';
        }
        
        if(isset($this->request->post['lastname'])){
            $data['lastname'] = $this->request->post['lastname'];
        }else if(isset ($customer['lastname'])){
            $data['lastname'] = $customer['lastname'];
        }else{
            $data['lastname'] = '';
        }
        
        if(isset($this->request->post['phone'])){
            $data['phone'] = $this->request->post['phone'];
        }else {
            $data['phone'] = '';
        }
        
        if(isset($this->request->post['subject'])){
            $data['subject'] = $this->request->post['subject'];
        }else {
            $data['subject'] = '';
        }
        
        if(isset($this->request->post['issue'])){
            $data['issue'] = $this->request->post['issue'];
        }else {
            $data['issue'] = '';
        }
        
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('kbmp_marketplace/ticket_form', $data));
    }
    
    public function checkTicket() {
        $this->load->language('kbmp_marketplace/ticket');

        $this->load->model('kbmp_marketplace/support');
        $this->load->model('setting/kbmp_marketplace');

        $this->load->model('tool/image');

        $this->document->addStyle('catalog/view/theme/default/stylesheet/kbmp_marketplace/custom.css');

        if(isset($this->request->post['ticketId']) && !empty($this->request->post['ticketId'])){
            $ticketId = $this->request->post['ticketId'];
            $email = $this->request->post['email'];
            if(isset($this->request->post['reply'])){
                $this->model_kbmp_marketplace_support->reply($this->request->post);
                $this->response->redirect($this->url->link('kbmp_marketplace/ticket/checkTicket&ticketId='.$ticketId.'&email='.urlencode($email), '', true));
            }
        }else{
            if(isset($this->request->get['ticketId']) && !empty($this->request->get['ticketId'])){
                $ticketId = $this->request->get['ticketId'];
                $email = ($this->request->get['email']);
            }else{
                $this->response->redirect($this->url->link('common/home'));
            }
        }
        $this->document->setTitle($this->language->get('text_ticket').'#'.$ticketId);
        
        $store_id = (int) $this->config->get('config_store_id');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
        
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_ticket'),
            'href' => $this->url->link('kbmp_marketplace/ticket/checkTicket&ticketId='.$ticketId.'&email='.urlencode($email))
        );

        $data['another_ticket_link'] = $this->url->link('kbmp_marketplace/ticket/viewTicket', true);
        $data['all_ticket_link'] = $this->url->link('kbmp_marketplace/ticket/checkAllTicket&email='. urlencode($email), true);
        $data['action'] = $this->url->link('kbmp_marketplace/ticket/checkTicket', true);
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_ticket'] = $this->language->get('text_ticket');
        $data['text_status'] = $this->language->get('text_status');
        $data['text_email'] = $this->language->get('text_email');
        $data['text_name'] = $this->language->get('text_name');
        $data['text_phone_no'] = $this->language->get('text_phone_no');
        $data['text_created_date'] = $this->language->get('text_created_date');
        $data['text_subject'] = $this->language->get('text_subject');
        $data['text_issue'] = $this->language->get('text_issue');
        $data['text_submit'] = $this->language->get('text_submit');
        $data['text_post_reply'] = $this->language->get('text_post_reply');
        $data['text_check_another_ticket'] = $this->language->get('text_check_another_ticket');
        $data['text_search_ticket'] = $this->language->get('text_search_ticket');
        $data['text_check_all_ticket'] = $this->language->get('text_check_all_ticket');
        
        $data['error_minchar_field'] = $this->language->get('error_minchar_field');
        $data['error_mmaxchar_field'] = $this->language->get('error_mmaxchar_field');
        $data['error_empty_field'] = $this->language->get('error_empty_field');
        $data['error_max_email'] = $this->language->get('error_max_email');
        $data['error_validate_email'] = $this->language->get('error_validate_email');
        
        $this->load->model('account/customer');
        $ticket_data = $this->model_kbmp_marketplace_support->getTicketByEmail($ticketId,$email);
        
        if(!empty($ticket_data)){
            $data['id'] = $ticket_data['id'];
            $data['ticket_id'] = $ticket_data['ticket_id'];
            $data['email'] = $ticket_data['email'];
            $data['name'] = $ticket_data['name'];
            $data['subject'] = $ticket_data['subject'];
            $data['phone'] = $ticket_data['phone'];
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
        }else{
            $this->session->data['error_warning'] = $this->language->get('error_view_ticket');
            $this->response->redirect($this->url->link('kbmp_marketplace/ticket/viewTicket'));
        }
        $conversation = $this->model_kbmp_marketplace_support->getConversation($ticketId);
        foreach ($conversation as $key => $value) {
            $data['conversation'][$key]['text'] = html_entity_decode($value['text']);
            $data['conversation'][$key]['date_added'] = date("M d, Y H:i:s A", strtotime($value['date_added']));
            
            $data['conversation'][$key]['type'] = $value['type'];
            if($value['type'] == '1'){
                $data['conversation'][$key]['type_name'] = $this->language->get('text_customer');
                $data['conversation'][$key]['color'] = 'rgb(215, 73, 53)';
                $data['conversation'][$key]['date_added'] = sprintf($this->language->get('text_posted_on_you'),date("M d, Y H:i:s A", strtotime($value['date_added'])));
            }else{
                $data['conversation'][$key]['type_name'] = $this->language->get('text_seller');
                $data['conversation'][$key]['color'] = 'green';
                $data['conversation'][$key]['date_added'] = sprintf($this->language->get('text_posted_on_seller'),date("M d, Y H:i:s A", strtotime($value['date_added'])));
            }
        }
        
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('kbmp_marketplace/checkTicket', $data));
    }
    
    public function checkAllTicket() {
        $this->load->language('kbmp_marketplace/ticket');

        $this->document->setTitle($this->language->get('text_all_tickets'));

        $this->load->model('kbmp_marketplace/support');
        $this->load->model('setting/kbmp_marketplace');

        $this->load->model('tool/image');

        $this->document->addStyle('catalog/view/theme/default/stylesheet/kbmp_marketplace/custom.css');

        if(isset($this->request->get['email']) && !empty($this->request->get['email'])){
            $email = $this->request->get['email'];
        }else{
            $this->response->redirect($this->url->link('common/home'));
        }
        
        $store_id = (int) $this->config->get('config_store_id');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
        
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_all_tickets'),
            'href' => $this->url->link('kbmp_marketplace/ticket/checkAllTicket&email='.urldecode($email))
        );
        $data['another_ticket_link'] = $this->url->link('kbmp_marketplace/ticket/viewTicket', true);
        
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_ticket'] = $this->language->get('text_ticket');
        $data['text_status'] = $this->language->get('text_status');
        $data['text_email'] = $this->language->get('text_email');
        $data['text_name'] = $this->language->get('text_name');
        $data['text_phone_no'] = $this->language->get('text_phone_no');
        $data['text_created_date'] = $this->language->get('text_created_date');
        $data['text_subject'] = $this->language->get('text_subject');
        $data['text_issue'] = $this->language->get('text_issue');
        $data['text_submit'] = $this->language->get('text_submit');
        $data['text_post_reply'] = $this->language->get('text_post_reply');
        $data['text_seller'] = $this->language->get('text_seller');
        $data['text_ticket_no'] = $this->language->get('text_ticket_no');
        $data['text_last_reply'] = $this->language->get('text_last_reply');
        $data['text_all_tickets'] = $this->language->get('text_all_tickets');
        $data['text_check_another_ticket'] = $this->language->get('text_check_another_ticket');
        $data['text_search_ticket'] = $this->language->get('text_search_ticket');
        $data['text_check_all_ticket'] = $this->language->get('text_check_all_ticket');
        
        $data['error_minchar_field'] = $this->language->get('error_minchar_field');
        $data['error_mmaxchar_field'] = $this->language->get('error_mmaxchar_field');
        $data['error_empty_field'] = $this->language->get('error_empty_field');
        $data['error_max_email'] = $this->language->get('error_max_email');
        $data['error_validate_email'] = $this->language->get('error_validate_email');
        
        $this->load->model('account/customer');
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $ticket_data = $this->model_kbmp_marketplace_support->getAllTicketByEmail($email);
        $data['tickets'] = array();
        
        if(!empty($ticket_data)){
            foreach ($ticket_data as $key => $value) {
                
                $data['tickets'][$key]['id'] = $value['id'];
                $data['tickets'][$key]['ticket_id'] = $value['ticket_id'];
                $data['tickets'][$key]['email'] = $value['email'];
                $data['tickets'][$key]['name'] = $value['name'];
                $data['tickets'][$key]['subject'] = $value['subject'];
                $data['tickets'][$key]['phone'] = $value['phone'];
                $data['tickets'][$key]['status_value'] = $value['status'];
                $data['tickets'][$key]['priority_value'] = $value['priority'];
                $seller = $this->model_kbmp_marketplace_kbmp_marketplace->getSeller($value['seller_id']);
                $data['tickets'][$key]['seller'] = $seller['title'];
                $data['tickets'][$key]['checkTicket_url'] = $this->url->link('kbmp_marketplace/ticket/checkTicket&ticketId='.$value['ticket_id'].'&email='. urlencode($value['email']), true);

                if($value['status'] == '1')
                    $data['tickets'][$key]['status'] = $this->language->get('text_open');
                elseif($value['status'] == '2')
                    $data['tickets'][$key]['status'] = $this->language->get('text_in_progress');
                elseif($value['status'] == '3')
                    $data['tickets'][$key]['status'] = $this->language->get('text_awaiting_reply');
                elseif($value['status'] == '4')
                    $data['tickets'][$key]['status'] = $this->language->get('text_replied');
                elseif($value['status'] == '5')
                    $data['tickets'][$key]['status'] = $this->language->get('text_on_hold');
                else
                    $data['tickets'][$key]['status'] = $this->language->get('text_closed');

                if($value['priority'] == '1')
                    $data['tickets'][$key]['priority'] = $this->language->get('text_low');
                elseif($value['priority'] == '2')
                    $data['tickets'][$key]['priority'] = $this->language->get('text_medium');
                elseif($value['priority'] == '3')
                    $data['tickets'][$key]['priority'] = $this->language->get('text_high');

                $data['tickets'][$key]['issue'] = html_entity_decode($value['issue']);
                $data['tickets'][$key]['phone'] = $value['phone'];
                $data['tickets'][$key]['date_added'] = date("M d, Y H:i:s A", strtotime($value['date_added']));
                $data['tickets'][$key]['date_updated'] = date("M d, Y H:i:s A", strtotime($value['date_updated']));
            }
        }else{
            $this->response->redirect($this->url->link('common/home'));
        }
        
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['sidebar'] = $this->load->controller('kbmp_marketplace/header');
        $data['kbmp_footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('common/header');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('kbmp_marketplace/checkAllTicket', $data));
    }
    
    public function viewTicket() {
        $this->load->language('kbmp_marketplace/ticket');

        $this->document->setTitle($this->language->get('text_view_ticket'));

        $this->load->model('kbmp_marketplace/support');
        $this->load->model('setting/kbmp_marketplace');

        $this->load->model('tool/image');

        $this->document->addStyle('catalog/view/theme/default/stylesheet/kbmp_marketplace/custom.css');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_view_ticket'),
            'href' => $this->url->link('kbmp_marketplace/ticket/viewTicket')
        );
        
        if(isset($this->session->data['error_warning'])){
            $data['error_warning'] = $this->session->data['error_warning'];
            unset($this->session->data['error_warning']);
        }
        
        $data['action'] = $this->url->link('kbmp_marketplace/ticket/checkTicket', true);
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_new_ticket'] = $this->language->get('text_new_ticket');
        $data['text_heading_hint'] = $this->language->get('text_heading_hint');
        $data['text_email_address'] = $this->language->get('text_email_address');
        $data['text_first_name'] = $this->language->get('text_first_name');
        $data['text_last_name'] = $this->language->get('text_last_name');
        $data['text_phone_no'] = $this->language->get('text_phone_no');
        $data['text_subject'] = $this->language->get('text_subject');
        $data['text_issue'] = $this->language->get('text_issue');
        $data['text_submit'] = $this->language->get('text_submit');
        $data['text_contact_this_seller'] = $this->language->get('text_contact_this_seller');
        $data['text_view_ticket'] = $this->language->get('text_view_ticket');
        $data['text_heading_hint2'] = $this->language->get('text_heading_hint2');
        $data['text_check'] = $this->language->get('text_check');
        $data['text_email'] = $this->language->get('text_email');
        $data['text_ticket_id'] = $this->language->get('text_ticket_id');
        
        $data['error_minchar_field'] = $this->language->get('error_minchar_field');
        $data['error_mmaxchar_field'] = $this->language->get('error_mmaxchar_field');
        $data['error_empty_field'] = $this->language->get('error_empty_field');
        $data['error_max_email'] = $this->language->get('error_max_email');
        $data['error_validate_email'] = $this->language->get('error_validate_email');
        
        $this->load->model('account/customer');
        
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['sidebar'] = $this->load->controller('kbmp_marketplace/header');
        $data['kbmp_footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('common/header');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('kbmp_marketplace/viewTicket', $data));
    }
}
