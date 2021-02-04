<?php
class ControllerAccountSeller extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/seller', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->language('account/seller');

                $this->load->model('kbmp_marketplace/kbmp_marketplace');
                
                $this->load->model('setting/kbmp_marketplace');
                
                $this->load->model('account/customer');
                
                $this->load->model('account/address');
                
		$this->document->setTitle($this->language->get('heading_title'));

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if (isset($this->request->post['seller']) && !empty($this->request->post['seller'])) {
                            $customer_id = (int) $this->customer->getId();
                            $customer_details = $this->model_account_customer->getCustomer($customer_id);
                            
                            //if (isset($customer_details['address_id']) && !empty($customer_details['address_id'])) {
                                //$customer_address_details = $this->model_account_address->getAddress($customer_details['address_id']);
                                $customer_address_details = array();
                                //Get the module configuration values
                                $store_id = (int) $this->config->get('config_store_id');
                                $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
                                if ($this->model_kbmp_marketplace_kbmp_marketplace->addSeller($customer_id, $customer_address_details, $settings, $store_id)) {
                                    $this->session->data['success'] = $this->language->get('text_success');
                                } else {

                                }
                            //}
                        }
                        
			$this->response->redirect($this->url->link('account/account', '', true));
		}

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
			'text' => $this->language->get('text_seller'),
			'href' => $this->url->link('account/seller', '', true)
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');

		$data['entry_seller'] = $this->language->get('entry_seller');

		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_back'] = $this->language->get('button_back');

		$data['action'] = $this->url->link('account/seller', '', true);

                $data['seller'] = $this->model_kbmp_marketplace_kbmp_marketplace->is_seller();
                
		$data['back'] = $this->url->link('account/account', '', true);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/seller', $data));
	}
}