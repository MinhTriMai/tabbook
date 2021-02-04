<?php

class ControllerKbmpMarketplaceReturn extends Controller {

    private $error = array();

    public function index() {
        $this->load->language('kbmp_marketplace/return');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('kbmp_marketplace/kbmp_marketplace');

        $this->getList();
    }

    public function add() {
        $this->load->language('kbmp_marketplace/return');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('kbmp_marketplace/kbmp_marketplace');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_sale_return->addReturn($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_return_id'])) {
                $url .= '&filter_return_id=' . $this->request->get['filter_return_id'];
            }

            if (isset($this->request->get['filter_order_id'])) {
                $url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
            }

            if (isset($this->request->get['filter_customer'])) {
                $url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_product'])) {
                $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_model'])) {
                $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_return_status_id'])) {
                $url .= '&filter_return_status_id=' . $this->request->get['filter_return_status_id'];
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

            $this->response->redirect($this->url->link('kbmp_marketplace/return', $url, true));
        }

        $this->getForm();
    }

    public function edit() {
        $this->load->language('kbmp_marketplace/return');
        $data= array();
        
        $data['sidebar'] = $this->load->controller('kbmp_marketplace/header');
        $data['kbmp_footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('common/header');
        $data['footer'] = $this->load->controller('common/footer');
        $data['error_account_warning'] = $this->language->get('error_account_warning');
        $data['text_account_warning'] = $this->language->get('text_account_warning');
        
        $data['home_link'] = $this->url->link('common/home');
        $data['account_link'] = $this->url->link('account/account', '', true);
        $data['logout_link'] = $this->url->link('account/logout', '', true);

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('kbmp_marketplace/kbmp_marketplace');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_kbmp_marketplace_kbmp_marketplace->editReturn($this->request->get['return_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_return_id'])) {
                $url .= '&filter_return_id=' . $this->request->get['filter_return_id'];
            }

            if (isset($this->request->get['filter_order_id'])) {
                $url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
            }

            if (isset($this->request->get['filter_customer'])) {
                $url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_product'])) {
                $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_model'])) {
                $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_return_status_id'])) {
                $url .= '&filter_return_status_id=' . $this->request->get['filter_return_status_id'];
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

            $this->response->redirect($this->url->link('kbmp_marketplace/return', $url, true));
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language('kbmp_marketplace/return');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('kbmp_marketplace/kbmp_marketplace');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $return_id) {
                $this->model_kbmp_marketplace_kbmp_marketplace->deleteReturn($return_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_return_id'])) {
                $url .= '&filter_return_id=' . $this->request->get['filter_return_id'];
            }

            if (isset($this->request->get['filter_order_id'])) {
                $url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
            }

            if (isset($this->request->get['filter_customer'])) {
                $url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_product'])) {
                $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_model'])) {
                $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_return_status_id'])) {
                $url .= '&filter_return_status_id=' . $this->request->get['filter_return_status_id'];
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

            $this->response->redirect($this->url->link('kbmp_marketplace/return', $url, true));
        }

        $this->getList();
    }

    protected function getList() {
        $this->load->language('kbmp_marketplace/return');
        $data= array();
        
        $data['sidebar'] = $this->load->controller('kbmp_marketplace/header');
        $data['kbmp_footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('common/header');
        $data['footer'] = $this->load->controller('common/footer');
        $data['error_account_warning'] = $this->language->get('error_account_warning');
        $data['text_account_warning'] = $this->language->get('text_account_warning');
        
        $data['home_link'] = $this->url->link('common/home');
        $data['account_link'] = $this->url->link('account/account', '', true);
        $data['logout_link'] = $this->url->link('account/logout', '', true);

        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        if (isset($this->request->get['filter_return_id'])) {
            $filter_return_id = $this->request->get['filter_return_id'];
        } else {
            $filter_return_id = null;
        }

        if (isset($this->request->get['filter_order_id'])) {
            $filter_order_id = $this->request->get['filter_order_id'];
        } else {
            $filter_order_id = null;
        }

        if (isset($this->request->get['filter_customer'])) {
            $filter_customer = $this->request->get['filter_customer'];
        } else {
            $filter_customer = null;
        }

        if (isset($this->request->get['filter_product'])) {
            $filter_product = $this->request->get['filter_product'];
        } else {
            $filter_product = null;
        }

        if (isset($this->request->get['filter_model'])) {
            $filter_model = $this->request->get['filter_model'];
        } else {
            $filter_model = null;
        }

        if (isset($this->request->get['filter_return_status_id'])) {
            $filter_return_status_id = $this->request->get['filter_return_status_id'];
        } else {
            $filter_return_status_id = null;
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

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'r.return_id';
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

        if (isset($this->request->get['filter_return_id'])) {
            $url .= '&filter_return_id=' . $this->request->get['filter_return_id'];
        }

        if (isset($this->request->get['filter_order_id'])) {
            $url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
        }

        if (isset($this->request->get['filter_customer'])) {
            $url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_product'])) {
            $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_model'])) {
            $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_return_status_id'])) {
            $url .= '&filter_return_status_id=' . $this->request->get['filter_return_status_id'];
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

        $data['add'] = $this->url->link('kbmp_marketplace/return/add', $url, true);
        $data['delete'] = $this->url->link('kbmp_marketplace/return/delete', $url, true);

        $data['returns'] = array();

        $filter_data = array(
            'filter_return_id' => $filter_return_id,
            'filter_order_id' => $filter_order_id,
            'filter_customer' => $filter_customer,
            'filter_product' => $filter_product,
            'filter_model' => $filter_model,
            'filter_return_status_id' => $filter_return_status_id,
            'filter_date_added' => $filter_date_added,
            'filter_date_modified' => $filter_date_modified,
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );
        $seller_data = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        $data['seller_details'] = $seller_data;
        
        $return_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalReturns($filter_data);

        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getReturns($filter_data);
        $seller_orders = $this->model_kbmp_marketplace_kbmp_marketplace->getOrders($seller_data['seller_id']);
        
        foreach ($results as $result) {
            if(in_array($result['order_id'], $seller_orders)){
                $data['returns'][] = array(
                    'return_id' => $result['return_id'],
                    'order_id' => $result['order_id'],
                    'customer' => $result['customer'],
                    'product' => $result['product'],
                    'model' => $result['model'],
                    'status' => $result['status'],
                    'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                    'date_modified' => date($this->language->get('date_format_short'), strtotime($result['date_modified'])),
                    'edit' => $this->url->link('kbmp_marketplace/return/edit', '&return_id=' . $result['return_id'] . $url, true)
                );
            }
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');
        $data['text_filter_search'] = $this->language->get('text_filter_search');
        $data['text_my_account1'] = $this->language->get('text_my_account1');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_back_to_site'] = $this->language->get('text_back_to_site');
        $data['text_filter'] = $this->language->get('text_filter');
        $data['text_reset'] = $this->language->get('text_reset');
        $data['text_add'] = $this->language->get('text_add');
        $data['text_delete'] = $this->language->get('text_delete');

        $data['column_return_id'] = $this->language->get('column_return_id');
        $data['column_order_id'] = $this->language->get('column_order_id');
        $data['column_customer'] = $this->language->get('column_customer');
        $data['column_product'] = $this->language->get('column_product');
        $data['column_model'] = $this->language->get('column_model');
        $data['column_status'] = $this->language->get('column_status');

        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_date_modified'] = $this->language->get('column_date_modified');
        $data['column_action'] = $this->language->get('column_action');

        $data['entry_return_id'] = $this->language->get('entry_return_id');
        $data['entry_order_id'] = $this->language->get('entry_order_id');
        $data['entry_customer'] = $this->language->get('entry_customer');
        $data['entry_product'] = $this->language->get('entry_product');
        $data['entry_model'] = $this->language->get('entry_model');
        $data['entry_return_status'] = $this->language->get('entry_return_status');
        $data['entry_date_added'] = $this->language->get('entry_date_added');
        $data['entry_date_modified'] = $this->language->get('entry_date_modified');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_filter'] = $this->language->get('button_filter');

        if (isset($this->session->data['error'])) {
            $data['error_warning'] = $this->session->data['error'];

            unset($this->session->data['error']);
        } elseif (isset($this->error['warning'])) {
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

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array) $this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if (isset($this->request->get['filter_return_id'])) {
            $url .= '&filter_return_id=' . $this->request->get['filter_return_id'];
        }

        if (isset($this->request->get['filter_order_id'])) {
            $url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
        }

        if (isset($this->request->get['filter_customer'])) {
            $url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_product'])) {
            $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_model'])) {
            $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_return_status_id'])) {
            $url .= '&filter_return_status_id=' . $this->request->get['filter_return_status_id'];
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

        $data['sort_return_id'] = $this->url->link('kbmp_marketplace/return', '&sort=r.return_id' . $url, true);
        $data['sort_order_id'] = $this->url->link('kbmp_marketplace/return', '&sort=r.order_id' . $url, true);
        $data['sort_customer'] = $this->url->link('kbmp_marketplace/return', '&sort=customer' . $url, true);
        $data['sort_product'] = $this->url->link('kbmp_marketplace/return', '&sort=r.product' . $url, true);
        $data['sort_model'] = $this->url->link('kbmp_marketplace/return', '&sort=r.model' . $url, true);
        $data['sort_status'] = $this->url->link('kbmp_marketplace/return', '&sort=status' . $url, true);
        $data['sort_date_added'] = $this->url->link('kbmp_marketplace/return', '&sort=r.date_added' . $url, true);
        $data['sort_date_modified'] = $this->url->link('kbmp_marketplace/return', '&sort=r.date_modified' . $url, true);

        $url = '';

        if (isset($this->request->get['filter_return_id'])) {
            $url .= '&filter_return_id=' . $this->request->get['filter_return_id'];
        }

        if (isset($this->request->get['filter_order_id'])) {
            $url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
        }

        if (isset($this->request->get['filter_customer'])) {
            $url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_product'])) {
            $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_model'])) {
            $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_return_status_id'])) {
            $url .= '&filter_return_status_id=' . $this->request->get['filter_return_status_id'];
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
        $pagination->total = $return_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/return', $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($return_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($return_total - $this->config->get('config_limit_admin'))) ? $return_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $return_total, ceil($return_total / $this->config->get('config_limit_admin')));

        $data['filter_return_id'] = $filter_return_id;
        $data['filter_order_id'] = $filter_order_id;
        $data['filter_customer'] = $filter_customer;
        $data['filter_product'] = $filter_product;
        $data['filter_model'] = $filter_model;
        $data['filter_return_status_id'] = $filter_return_status_id;
        $data['filter_date_added'] = $filter_date_added;
        $data['filter_date_modified'] = $filter_date_modified;
        
//        $this->load->model('kbmp_marketplace/return_status');
        
        $data['return_statuses'] = $this->model_kbmp_marketplace_kbmp_marketplace->getReturnStatuses();

        $data['sort'] = $sort;
        $data['order'] = $order;

        $this->response->setOutput($this->load->view('kbmp_marketplace/return_list', $data));
    }

    protected function getForm() {
        
        $this->load->language('kbmp_marketplace/return');
        $data= array();
        
        $data['sidebar'] = $this->load->controller('kbmp_marketplace/header');
        $data['kbmp_footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('common/header');
        $data['footer'] = $this->load->controller('common/footer');
        $data['error_account_warning'] = $this->language->get('error_account_warning');
        $data['text_account_warning'] = $this->language->get('text_account_warning');
        
        $data['home_link'] = $this->url->link('common/home');
        $data['account_link'] = $this->url->link('account/account', '', true);
        $data['logout_link'] = $this->url->link('account/logout', '', true);

        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');
        $data['text_filter_search'] = $this->language->get('text_filter_search');
        $data['text_my_account1'] = $this->language->get('text_my_account1');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_back_to_site'] = $this->language->get('text_back_to_site');
        $data['text_filter'] = $this->language->get('text_filter');
        $data['text_reset'] = $this->language->get('text_reset');
        $data['text_add'] = $this->language->get('text_add');
        $data['tab_history'] = $this->language->get('text_history');
        $data['tab_general'] = $this->language->get('text_general');
        
        $data['text_form'] = !isset($this->request->get['return_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_select'] = $this->language->get('text_select');
        $data['text_opened'] = $this->language->get('text_opened');
        $data['text_unopened'] = $this->language->get('text_unopened');
        $data['text_order'] = $this->language->get('text_order');
        $data['text_product'] = $this->language->get('text_product');
        $data['text_history'] = $this->language->get('text_history');
        $data['text_loading'] = $this->language->get('text_loading');

        $data['entry_customer'] = $this->language->get('entry_customer');
        $data['entry_order_id'] = $this->language->get('entry_order_id');
        $data['entry_date_ordered'] = $this->language->get('entry_date_ordered');
        $data['entry_firstname'] = $this->language->get('entry_firstname');
        $data['entry_lastname'] = $this->language->get('entry_lastname');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_telephone'] = $this->language->get('entry_telephone');
        $data['entry_product'] = $this->language->get('entry_product');
        $data['entry_model'] = $this->language->get('entry_model');
        $data['entry_quantity'] = $this->language->get('entry_quantity');
        $data['entry_opened'] = $this->language->get('entry_opened');
        $data['entry_return_reason'] = $this->language->get('entry_return_reason');
        $data['entry_return_action'] = $this->language->get('entry_return_action');
        $data['entry_return_status'] = $this->language->get('entry_return_status');
        $data['entry_comment'] = $this->language->get('entry_comment');
        $data['entry_notify'] = $this->language->get('entry_notify');

        $data['help_product'] = $this->language->get('help_product');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_add_history'] = $this->language->get('button_add_history');

        if (isset($this->request->get['return_id'])) {
            $data['return_id'] = $this->request->get['return_id'];
        } else {
            $data['return_id'] = 0;
        }

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['order_id'])) {
            $data['error_order_id'] = $this->error['order_id'];
        } else {
            $data['error_order_id'] = '';
        }

        if (isset($this->error['firstname'])) {
            $data['error_firstname'] = $this->error['firstname'];
        } else {
            $data['error_firstname'] = '';
        }

        if (isset($this->error['lastname'])) {
            $data['error_lastname'] = $this->error['lastname'];
        } else {
            $data['error_lastname'] = '';
        }

        if (isset($this->error['email'])) {
            $data['error_email'] = $this->error['email'];
        } else {
            $data['error_email'] = '';
        }

        if (isset($this->error['telephone'])) {
            $data['error_telephone'] = $this->error['telephone'];
        } else {
            $data['error_telephone'] = '';
        }

        if (isset($this->error['product'])) {
            $data['error_product'] = $this->error['product'];
        } else {
            $data['error_product'] = '';
        }

        if (isset($this->error['model'])) {
            $data['error_model'] = $this->error['model'];
        } else {
            $data['error_model'] = '';
        }

        $url = '';

        if (isset($this->request->get['filter_return_id'])) {
            $url .= '&filter_return_id=' . $this->request->get['filter_return_id'];
        }

        if (isset($this->request->get['filter_order_id'])) {
            $url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
        }

        if (isset($this->request->get['filter_customer'])) {
            $url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_product'])) {
            $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_model'])) {
            $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_return_status_id'])) {
            $url .= '&filter_return_status_id=' . $this->request->get['filter_return_status_id'];
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

        if (!isset($this->request->get['return_id'])) {
            $data['action'] = $this->url->link('kbmp_marketplace/return/add', $url, true);
        } else {
            $data['action'] = $this->url->link('kbmp_marketplace/return/edit', '&return_id=' . $this->request->get['return_id'] . $url, true);
        }

        $data['cancel'] = $this->url->link('kbmp_marketplace/return', $url, true);

        if (isset($this->request->get['return_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $return_info = $this->model_kbmp_marketplace_kbmp_marketplace->getReturn($this->request->get['return_id']);
        }

        if (isset($this->request->post['order_id'])) {
            $data['order_id'] = $this->request->post['order_id'];
        } elseif (!empty($return_info)) {
            $data['order_id'] = $return_info['order_id'];
        } else {
            $data['order_id'] = '';
        }

        if (isset($this->request->post['date_ordered'])) {
            $data['date_ordered'] = $this->request->post['date_ordered'];
        } elseif (!empty($return_info)) {
            $data['date_ordered'] = ($return_info['date_ordered'] != '0000-00-00' ? $return_info['date_ordered'] : '');
        } else {
            $data['date_ordered'] = '';
        }

        if (isset($this->request->post['customer'])) {
            $data['customer'] = $this->request->post['customer'];
        } elseif (!empty($return_info)) {
            $data['customer'] = $return_info['customer'];
        } else {
            $data['customer'] = '';
        }

        if (isset($this->request->post['customer_id'])) {
            $data['customer_id'] = $this->request->post['customer_id'];
        } elseif (!empty($return_info)) {
            $data['customer_id'] = $return_info['customer_id'];
        } else {
            $data['customer_id'] = '';
        }

        if (isset($this->request->post['firstname'])) {
            $data['firstname'] = $this->request->post['firstname'];
        } elseif (!empty($return_info)) {
            $data['firstname'] = $return_info['firstname'];
        } else {
            $data['firstname'] = '';
        }

        if (isset($this->request->post['lastname'])) {
            $data['lastname'] = $this->request->post['lastname'];
        } elseif (!empty($return_info)) {
            $data['lastname'] = $return_info['lastname'];
        } else {
            $data['lastname'] = '';
        }

        if (isset($this->request->post['email'])) {
            $data['email'] = $this->request->post['email'];
        } elseif (!empty($return_info)) {
            $data['email'] = $return_info['email'];
        } else {
            $data['email'] = '';
        }

        if (isset($this->request->post['telephone'])) {
            $data['telephone'] = $this->request->post['telephone'];
        } elseif (!empty($return_info)) {
            $data['telephone'] = $return_info['telephone'];
        } else {
            $data['telephone'] = '';
        }

        if (isset($this->request->post['product'])) {
            $data['product'] = $this->request->post['product'];
        } elseif (!empty($return_info)) {
            $data['product'] = $return_info['product'];
        } else {
            $data['product'] = '';
        }

        if (isset($this->request->post['product_id'])) {
            $data['product_id'] = $this->request->post['product_id'];
        } elseif (!empty($return_info)) {
            $data['product_id'] = $return_info['product_id'];
        } else {
            $data['product_id'] = '';
        }

        if (isset($this->request->post['model'])) {
            $data['model'] = $this->request->post['model'];
        } elseif (!empty($return_info)) {
            $data['model'] = $return_info['model'];
        } else {
            $data['model'] = '';
        }

        if (isset($this->request->post['quantity'])) {
            $data['quantity'] = $this->request->post['quantity'];
        } elseif (!empty($return_info)) {
            $data['quantity'] = $return_info['quantity'];
        } else {
            $data['quantity'] = '';
        }

        if (isset($this->request->post['opened'])) {
            $data['opened'] = $this->request->post['opened'];
        } elseif (!empty($return_info)) {
            $data['opened'] = $return_info['opened'];
        } else {
            $data['opened'] = '';
        }

        if (isset($this->request->post['return_reason_id'])) {
            $data['return_reason_id'] = $this->request->post['return_reason_id'];
        } elseif (!empty($return_info)) {
            $data['return_reason_id'] = $return_info['return_reason_id'];
        } else {
            $data['return_reason_id'] = '';
        }

        $this->load->model('kbmp_marketplace/return_reason');

        $data['return_reasons'] = $this->model_kbmp_marketplace_return_reason->getReturnReasons();

        if (isset($this->request->post['return_action_id'])) {
            $data['return_action_id'] = $this->request->post['return_action_id'];
        } elseif (!empty($return_info)) {
            $data['return_action_id'] = $return_info['return_action_id'];
        } else {
            $data['return_action_id'] = '';
        }

        $this->load->model('kbmp_marketplace/return_action');

        $data['return_actions'] = $this->model_kbmp_marketplace_return_action->getReturnActions();

        if (isset($this->request->post['comment'])) {
            $data['comment'] = $this->request->post['comment'];
        } elseif (!empty($return_info)) {
            $data['comment'] = $return_info['comment'];
        } else {
            $data['comment'] = '';
        }

        if (isset($this->request->post['return_status_id'])) {
            $data['return_status_id'] = $this->request->post['return_status_id'];
        } elseif (!empty($return_info)) {
            $data['return_status_id'] = $return_info['return_status_id'];
        } else {
            $data['return_status_id'] = '';
        }
        $sellerId = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        $data['seller_details'] = $sellerId;
        
        $this->load->model('kbmp_marketplace/return_status');

        $data['return_statuses'] = $this->model_kbmp_marketplace_return_status->getReturnStatuses();

        $this->response->setOutput($this->load->view('kbmp_marketplace/return_form', $data));
    }

    protected function validateForm() {
        
        if (empty($this->request->post['order_id'])) {
            $this->error['order_id'] = $this->language->get('error_order_id');
        }

        if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
            $this->error['firstname'] = $this->language->get('error_firstname');
        }

        if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
            $this->error['lastname'] = $this->language->get('error_lastname');
        }

        if ((utf8_strlen($this->request->post['email']) > 96) || !filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
            $this->error['email'] = $this->language->get('error_email');
        }

        if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
            $this->error['telephone'] = $this->language->get('error_telephone');
        }

        if ((utf8_strlen($this->request->post['product']) < 1) || (utf8_strlen($this->request->post['product']) > 255)) {
            $this->error['product'] = $this->language->get('error_product');
        }

        if ((utf8_strlen($this->request->post['model']) < 1) || (utf8_strlen($this->request->post['model']) > 64)) {
            $this->error['model'] = $this->language->get('error_model');
        }

        if (empty($this->request->post['return_reason_id'])) {
            $this->error['reason'] = $this->language->get('error_reason');
        }

        if ($this->error && !isset($this->error['warning'])) {
            $this->error['warning'] = $this->language->get('error_warning');
        }

        return !$this->error;
    }

    protected function validateDelete() {
        
        return !$this->error;
    }

    public function history() {
        $this->load->language('kbmp_marketplace/return');

        $data['error'] = '';
        $data['success'] = '';

        $this->load->model('kbmp_marketplace/kbmp_marketplace');

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {

            if (!$data['error']) {
                $this->model_kbmp_marketplace_kbmp_marketplace->addReturnHistory($this->request->get['return_id'], $this->request->post);

                $data['success'] = $this->language->get('text_success');
            }
        }

        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_notify'] = $this->language->get('column_notify');
        $data['column_comment'] = $this->language->get('column_comment');
        $data['tab_history'] = $this->language->get('text_history');
        $data['tab_general'] = $this->language->get('text_general');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $data['histories'] = array();

        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getReturnHistories($this->request->get['return_id'], ($page - 1) * 10, 10);

        foreach ($results as $result) {
            $data['histories'][] = array(
                'notify' => $result['notify'] ? $this->language->get('text_yes') : $this->language->get('text_no'),
                'status' => $result['status'],
                'comment' => nl2br($result['comment']),
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
            );
        }

        $history_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalReturnHistories($this->request->get['return_id']);

        $pagination = new Pagination();
        $pagination->total = $history_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('kbmp_marketplace/return/history', '&return_id=' . $this->request->get['return_id'] . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($history_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($history_total - 10)) ? $history_total : ((($page - 1) * 10) + 10), $history_total, ceil($history_total / 10));

        $this->response->setOutput($this->load->view('kbmp_marketplace/return_history', $data));
    }

    public function autocompleteCustomer() {
        $json = array();
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_email'])) {
            if (isset($this->request->get['filter_name'])) {
                $filter_name = $this->request->get['filter_name'];
            } else {
                $filter_name = '';
            }

            if (isset($this->request->get['filter_email'])) {
                $filter_email = $this->request->get['filter_email'];
            } else {
                $filter_email = '';
            }

            $filter_data = array(
                'filter_name' => $filter_name,
                'filter_email' => $filter_email,
                'start' => 0,
                'limit' => 5
            );

            $results = $this->model_kbmp_marketplace_kbmp_marketplace->getCustomers($filter_data);

            foreach ($results as $result) {
                $json[] = array(
                    'customer_id' => $result['customer_id'],
                    'customer_group_id' => $result['customer_group_id'],
                    'name' => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
                    'customer_group' => $result['customer_group'],
                    'firstname' => $result['firstname'],
                    'lastname' => $result['lastname'],
                    'email' => $result['email'],
                    'telephone' => $result['telephone'],
                    'fax' => $result['fax'],
                    'custom_field' => json_decode($result['custom_field'], true),
                    'address' => $this->model_kbmp_marketplace_kbmp_marketplace->getAddresses($result['customer_id'])
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
    public function autocompleteProduct() {
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

}
