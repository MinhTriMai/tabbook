<?php
class ModelAccountToken extends Model {
    public function addToken($customer_id, $token, $expired_at) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "customer_token SET 
		customer_id = '" . (int)$customer_id . "'
		, token = '" . $token . "'
		, expired_at = '" . $expired_at . "'
		");
	}

    public function getToken($token) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_token WHERE token = '" . $token . "'");

        return $query->row;
    }

    public function activeCustomerById($customer_id) {
        $this->db->query("UPDATE " . DB_PREFIX . "customer SET status = '" . 1 . "' WHERE customer_id = '" . $customer_id . "'");
    }
}