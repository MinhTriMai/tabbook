<?php
class ControllerAccountFixAccountError extends Controller {
	public function index() {
		$this->load->model('account/customer');

		$error_customers = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer c LEFT JOIN " . DB_PREFIX . "address a ON (c.customer_id = a.customer_id) WHERE a.address_id IS NULL");

		if($error_customers->num_rows) {
			foreach ($error_customers->rows as $customer) {
				echo "Fixing customer ID " . $customer . " with email: " . $customer['email'] . "....<br/>";

				$addresses = array();
				$address = array();
		        $address['firstname'] = $this->request->post['firstname'];
		        $address['lastname'] = $this->request->post['lastname'];
		        $address['company'] = 'NOT PROVIDED';
		        $address['address_1'] = 'NOT PROVIDED';
		        $address['address_2'] = 'NOT PROVIDED';
		        $address['city'] = 'NOT PROVIDED';
		        $address['postcode'] = 'NOT PROVIDED';
		        $address['country_id'] = 230;
		        $address['zone_id'] = 3780;//all are HCMC in Phase 1
		        $address['default'] = true;//default address

		        $addresses[] = $address;
		        $this->model_account_customer->addAddressToCustomer($addresses, $customer['customer_id']);
			}
		}

		echo "DONE!";
	}
}
