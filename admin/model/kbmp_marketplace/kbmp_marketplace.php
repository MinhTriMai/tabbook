<?php

class ModelKbmpMarketplaceKbmpMarketplace extends Model {
    
    /*
     * Function definition to get the list of sellers
     */
    
    public function checkCategory($id, $store_id, $seller,$commission) {

        $count = $this->db->query("SELECT COUNT(id) AS total FROM " . DB_PREFIX . "kb_mp_category_commission WHERE category_id= " . (int) $id . " && store_id=" . (int) $store_id." && seller_cust_id =".(int)$seller);
        return $count->rows[0];
    }

    public function addCategory($id, $store_id ,$seller ,$commission) {
        $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_category_commission SET store_id=" . (int) $store_id .",category_id=" . (int) $id . ", seller_cust_id = ".(int)$seller .",commission=".(int)$commission;
        $this->db->query($sql);
                
    }
    public function deleteCategorySeller($seller_id ,$id ) {
        
        $sql = "DELETE FROM ".DB_PREFIX."kb_mp_category_commission WHERE category_id=" . (int) $id . " AND seller_cust_id =".(int)$seller_id;
        $this->db->query($sql);
        
    }
    public function updateCategory($id, $store_id ,$seller ,$commission) {
        $sql = "UPDATE  " . DB_PREFIX . "kb_mp_category_commission SET store_id=" . (int) $store_id . " ,"
                . "category_id=" . (int) $id . ",commission=".(int)$commission." WHERE category_id = " .(int)$id." && seller_cust_id=".(int)$seller;
        $this->db->query($sql);
    }
    
    public function getSellers($data = array()) {
        $sql = "SELECT c.customer_id, c.firstname, c.lastname, c.email, ksd.title as shop, ks.seller_id, ks.state, ks.country_id, ks.active, ks.date_added, ct.name as country, s.name as state_name FROM " . DB_PREFIX . "kb_mp_seller ks LEFT JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ks.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (c.customer_id = ks.customer_id) INNER JOIN " . DB_PREFIX . "country ct ON (ks.country_id = ct.country_id) INNER JOIN " . DB_PREFIX . "zone s ON (s.zone_id = ks.state) WHERE ksd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND ks.approved = '1'";

        if (!empty($data['filter_firstname'])) {
            $sql .= " AND c.firstname LIKE '" . $this->db->escape($data['filter_firstname']) . "%'";
        }
        
        if (!empty($data['filter_lastname'])) {
            $sql .= " AND c.lastname LIKE '" . $this->db->escape($data['filter_lastname']) . "%'";
        }
        
        if (!empty($data['filter_email'])) {
            $sql .= " AND c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
        }
        
        if (!empty($data['filter_shop'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_shop']) . "%'";
        }
        
        if (!empty($data['filter_state'])) {
            $sql .= " AND s.name LIKE '" . $this->db->escape($data['filter_state']) . "%'";
        }
        
        if (!empty($data['filter_country'])) {
            $sql .= " AND ks.country_id = '" . $this->db->escape($data['filter_country']) . "'";
        }
        
        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND ks.active = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(ks.date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }
        
        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(ks.date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }

        $sql .= " GROUP BY ks.seller_id";

        $sort_data = array(
            'c.firstname',
            'c.lastname',
            'c.email',
            'ksd.title',
            'ks.state',
            'ct.name',
            'ks.active',
            'ks.date_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY ks.date_added";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    public function getCategorySeller($data = array()) {
        
        $sql = "SELECT c.customer_id, c.firstname, c.lastname, c.email, ksd.title as shop, ks.seller_id, ks.state, ks.country_id, ks.active, ks.date_added, ct.name as country, s.name as state_name,kcc.category_id,kcc.commission FROM 
                " . DB_PREFIX . "kb_mp_category_commission kcc LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON(kcc.seller_cust_id = ks.customer_id) INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ks.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (c.customer_id = ks.customer_id)
                INNER JOIN " . DB_PREFIX . "country ct ON (ks.country_id = ct.country_id) INNER JOIN " . DB_PREFIX . "zone s ON (s.zone_id = ks.state) WHERE ksd.language_id = '1' AND ks.approved = '1'";

        if (!empty($data['filter_firstname'])) {
            $sql .= " AND c.firstname LIKE '" . $this->db->escape($data['filter_firstname']) . "%'";
        }
        
        if (!empty($data['filter_lastname'])) {
            $sql .= " AND c.lastname LIKE '" . $this->db->escape($data['filter_lastname']) . "%'";
        }
        
        if (!empty($data['filter_email'])) {
            $sql .= " AND c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
        }
        
        if (!empty($data['filter_shop'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_shop']) . "%'";
        }
        
        if (!empty($data['filter_state'])) {
            $sql .= " AND s.name LIKE '" . $this->db->escape($data['filter_state']) . "%'";
        }
        
        if (!empty($data['filter_country'])) {
            $sql .= " AND ks.country_id = '" . $this->db->escape($data['filter_country']) . "'";
        }
        if (!empty($data['filter_category'])) {
            $sql .= " AND kcc.category_id = '" . $this->db->escape($data['filter_category']) . "'";
        }
    
        $sort_data = array(
            'c.firstname',
            'c.lastname',
            'c.email',
            'ksd.title',
            'ks.state',
            'ct.name',
            'ks.active',
            'ks.date_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY ks.date_added";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to get total sellers count
     */
    public function getTotalCategorySeller($data = array()) {
        $sql = "SELECT COUNT(kcc.seller_cust_id) AS total FROM 
                " . DB_PREFIX . "kb_mp_category_commission kcc LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON(kcc.seller_cust_id = ks.customer_id) INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ks.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (c.customer_id = ks.customer_id)
                INNER JOIN " . DB_PREFIX . "country ct ON (ks.country_id = ct.country_id) INNER JOIN " . DB_PREFIX . "zone s ON (s.zone_id = ks.state) WHERE ksd.language_id = '1' AND ks.approved = '1'";

        if (!empty($data['filter_firstname'])) {
            $sql .= " AND c.firstname LIKE '" . $this->db->escape($data['filter_firstname']) . "%'";
        }
        
        if (!empty($data['filter_lastname'])) {
            $sql .= " AND c.lastname LIKE '" . $this->db->escape($data['filter_lastname']) . "%'";
        }
        
        if (!empty($data['filter_email'])) {
            $sql .= " AND c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
        }
        
        if (!empty($data['filter_shop'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_shop']) . "%'";
        }
        
        if (!empty($data['filter_state'])) {
            $sql .= " AND s.name LIKE '" . $this->db->escape($data['filter_state']) . "%'";
        }
        
        if (!empty($data['filter_country'])) {
            $sql .= " AND ks.country_id = '" . $this->db->escape($data['filter_country']) . "'";
        }
        if (!empty($data['filter_category'])) {
            $sql .= " AND kcc.category_id = '" . $this->db->escape($data['filter_category']) . "'";
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }
    
    public function getTotalSellers($data = array()) {
        $sql = "SELECT COUNT(DISTINCT ks.seller_id) AS total FROM " . DB_PREFIX . "kb_mp_seller ks LEFT JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ks.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (c.customer_id = ks.customer_id) INNER JOIN " . DB_PREFIX . "country ct ON (ks.country_id = ct.country_id) INNER JOIN " . DB_PREFIX . "zone s ON (s.zone_id = ks.state) WHERE ksd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND ks.approved = '1'";

        if (!empty($data['filter_firstname'])) {
            $sql .= " AND c.firstname LIKE '" . $this->db->escape($data['filter_firstname']) . "%'";
        }
        
        if (!empty($data['filter_lastname'])) {
            $sql .= " AND c.lastname LIKE '" . $this->db->escape($data['filter_lastname']) . "%'";
        }
        
        if (!empty($data['filter_email'])) {
            $sql .= " AND c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
        }
        
        if (!empty($data['filter_shop'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_shop']) . "%'";
        }
        
        if (!empty($data['filter_state'])) {
            $sql .= " AND s.name LIKE '" . $this->db->escape($data['filter_state']) . "%'";
        }
        
        if (!empty($data['filter_country'])) {
            $sql .= " AND ks.country_id = '" . $this->db->escape($data['filter_country']) . "'";
        }
        
        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND ks.active = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(ks.date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }
        
        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(ks.date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }
        
        $query = $this->db->query($sql);

        return $query->row['total'];
    }
    
    
    /*
     * Function definition to get the list of sellers account approvals request
     */
    public function getPendingApprovals($data = array()) {
        $sql = "SELECT c.customer_id, c.firstname, c.lastname, c.email, ksd.title as shop, ks.seller_id, ks.state, ks.country_id, ks.active, ks.approved, ks.date_added, ct.name as country FROM " . DB_PREFIX . "kb_mp_seller ks LEFT JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ks.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (c.customer_id = ks.customer_id) INNER JOIN " . DB_PREFIX . "country ct ON (ks.country_id = ct.country_id) WHERE ksd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND ks.approved != '1'";
        
        if (!empty($data['filter_firstname'])) {
            $sql .= " AND c.firstname LIKE '" . $this->db->escape($data['filter_firstname']) . "%'";
        }
        
        if (!empty($data['filter_lastname'])) {
            $sql .= " AND c.lastname LIKE '" . $this->db->escape($data['filter_lastname']) . "%'";
        }
        
        if (!empty($data['filter_email'])) {
            $sql .= " AND c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
        }
        
        if (!empty($data['filter_shop'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_shop']) . "%'";
        }
        
        if (!empty($data['filter_country'])) {
            $sql .= " AND ks.country_id = '" . $this->db->escape($data['filter_country']) . "'";
        }
        
        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND ks.active = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (isset($data['filter_approval_status']) && $data['filter_approval_status'] != '') {
            $sql .= " AND ks.approved = '" . $this->db->escape($data['filter_approval_status']) . "'";
        }
        
        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(ks.date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }
        
        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(ks.date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }
        
        $sql .= " GROUP BY ks.seller_id";

        $sort_data = array();

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY ks.date_added";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to get total pending approvals of sellers account
     */
    public function getTotalPendingApprovals($data = array()) {
        $sql = "SELECT COUNT(DISTINCT ks.seller_id) AS total FROM " . DB_PREFIX . "kb_mp_seller ks LEFT JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ks.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (c.customer_id = ks.customer_id) INNER JOIN " . DB_PREFIX . "country ct ON (ks.country_id = ct.country_id) WHERE ksd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND ks.approved != '1'";

        if (!empty($data['filter_firstname'])) {
            $sql .= " AND c.firstname LIKE '" . $this->db->escape($data['filter_firstname']) . "%'";
        }
        
        if (!empty($data['filter_lastname'])) {
            $sql .= " AND c.lastname LIKE '" . $this->db->escape($data['filter_lastname']) . "%'";
        }
        
        if (!empty($data['filter_email'])) {
            $sql .= " AND c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
        }
        
        if (!empty($data['filter_shop'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_shop']) . "%'";
        }
        
        if (!empty($data['filter_country'])) {
            $sql .= " AND ks.country_id = '" . $this->db->escape($data['filter_country']) . "'";
        }
        
        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND ks.active = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (isset($data['filter_approval_status']) && $data['filter_approval_status'] != '') {
            $sql .= " AND ks.approved = '" . $this->db->escape($data['filter_approval_status']) . "'";
        }
        
        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(ks.date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }
        
        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(ks.date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }
        
        $query = $this->db->query($sql);

        return $query->row['total'];
    }
    
    /*
     * Function definition to get the list of products approvals
     */
    public function getProductsApproval($data = array()) {
        $sql = "SELECT ksp.seller_id, ksp.product_id, ksp.approved, ksp.date_added, p.model, p.quantity, p.image, p.status, pd.name as product_name, c.firstname, c.lastname FROM " . DB_PREFIX . "customer c INNER JOIN " . DB_PREFIX . "kb_mp_seller ks ON (c.customer_id = ks.customer_id) INNER JOIN " . DB_PREFIX . "kb_mp_seller_product ksp ON (ks.seller_id = ksp.seller_id) INNER JOIN " . DB_PREFIX . "product p ON (ksp.product_id = p.product_id) INNER JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND ksp.deleted != '1' AND ksp.approved != '1'";

        if (!empty($data['filter_productname'])) {
            $sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_productname']) . "%'";
        }
        
        if (!empty($data['filter_model'])) {
            $sql .= " AND p.model LIKE '" . $this->db->escape($data['filter_model']) . "%'";
        }
        
        if (!empty($data['filter_firstname'])) {
            $sql .= " AND c.firstname LIKE '" . $this->db->escape($data['filter_firstname']) . "%'";
        }
        
        if (!empty($data['filter_lastname'])) {
            $sql .= " AND c.lastname LIKE '" . $this->db->escape($data['filter_lastname']) . "%'";
        }
        
        if (!empty($data['filter_quantity'])) {
            $sql .= " AND p.quantity = '" . $this->db->escape($data['filter_quantity']) . "'";
        }
        
        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND p.status = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (isset($data['filter_approval_status']) && $data['filter_approval_status'] != '') {
            $sql .= " AND ksp.approved = '" . $this->db->escape($data['filter_approval_status']) . "'";
        }
        
        $sql .= " GROUP BY ksp.product_id";

        $sort_data = array(
            'pd.name',
            'p.model',
            'c.firstname',
            'c.lastname',
            'p.quantity',
            'p.status',
            'ksp.approved'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY ks.date_added";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to get total product approvals of sellers
     */
    public function getTotalProductsApproval($data = array()) {
        $sql = "SELECT COUNT(DISTINCT ksp.product_id) AS total FROM " . DB_PREFIX . "customer c INNER JOIN " . DB_PREFIX . "kb_mp_seller ks ON (c.customer_id = ks.customer_id) INNER JOIN " . DB_PREFIX . "kb_mp_seller_product ksp ON (ks.seller_id = ksp.seller_id) INNER JOIN " . DB_PREFIX . "product p ON (ksp.product_id = p.product_id) INNER JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND ksp.deleted != '1' AND ksp.approved != '1'";

        if (!empty($data['filter_productname'])) {
            $sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_productname']) . "%'";
        }
        
        if (!empty($data['filter_model'])) {
            $sql .= " AND p.model LIKE '" . $this->db->escape($data['filter_model']) . "%'";
        }
        
        if (!empty($data['filter_firstname'])) {
            $sql .= " AND c.firstname LIKE '" . $this->db->escape($data['filter_firstname']) . "%'";
        }
        
        if (!empty($data['filter_lastname'])) {
            $sql .= " AND c.lastname LIKE '" . $this->db->escape($data['filter_lastname']) . "%'";
        }
        
        if (!empty($data['filter_quantity'])) {
            $sql .= " AND p.quantity = '" . $this->db->escape($data['filter_quantity']) . "'";
        }
        
        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND p.status = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (isset($data['filter_approval_status']) && $data['filter_approval_status'] != '') {
            $sql .= " AND ksp.approved = '" . $this->db->escape($data['filter_approval_status']) . "'";
        }
        
        $query = $this->db->query($sql);

        return $query->row['total'];
    }
    
    /*
     * Function definition to get the list of products of sellers
     */
    public function getSellersProducts($data = array()) {
        $sql = "SELECT ksp.seller_id, ksp.product_id, ksp.approved, ksp.date_added, p.model, p.quantity, p.image, p.status, pd.name as product_name, c.firstname, c.lastname FROM " . DB_PREFIX . "customer c INNER JOIN " . DB_PREFIX . "kb_mp_seller ks ON (c.customer_id = ks.customer_id) INNER JOIN " . DB_PREFIX . "kb_mp_seller_product ksp ON (ks.seller_id = ksp.seller_id) INNER JOIN " . DB_PREFIX . "product p ON (ksp.product_id = p.product_id) INNER JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND ksp.deleted != '1' AND ksp.approved = '1'";

        if (!empty($data['filter_productname'])) {
            $sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_productname']) . "%'";
        }
        
        if (!empty($data['filter_model'])) {
            $sql .= " AND p.model LIKE '" . $this->db->escape($data['filter_model']) . "%'";
        }
        
        if (!empty($data['filter_firstname'])) {
            $sql .= " AND c.firstname LIKE '" . $this->db->escape($data['filter_firstname']) . "%'";
        }
        
        if (!empty($data['filter_lastname'])) {
            $sql .= " AND c.lastname LIKE '" . $this->db->escape($data['filter_lastname']) . "%'";
        }
        
        if (!empty($data['filter_quantity'])) {
            $sql .= " AND p.quantity = '" . $this->db->escape($data['filter_quantity']) . "'";
        }
        
        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND p.status = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        $sql .= " GROUP BY ksp.product_id";

        $sort_data = array(
            'pd.name',
            'p.model',
            'c.firstname',
            'c.lastname',
            'p.quantity',
            'p.status'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY ks.date_added";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to get total product of sellers
     */
    public function getTotalSellersProducts($data = array()) {
        $sql = "SELECT COUNT(DISTINCT ksp.product_id) AS total FROM " . DB_PREFIX . "customer c INNER JOIN " . DB_PREFIX . "kb_mp_seller ks ON (c.customer_id = ks.customer_id) INNER JOIN " . DB_PREFIX . "kb_mp_seller_product ksp ON (ks.seller_id = ksp.seller_id) INNER JOIN " . DB_PREFIX . "product p ON (ksp.product_id = p.product_id) INNER JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND ksp.deleted != '1' AND ksp.approved = '1'";

        if (!empty($data['filter_productname'])) {
            $sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_productname']) . "%'";
        }
        
        if (!empty($data['filter_model'])) {
            $sql .= " AND p.model LIKE '" . $this->db->escape($data['filter_model']) . "%'";
        }
        
        if (!empty($data['filter_firstname'])) {
            $sql .= " AND c.firstname LIKE '" . $this->db->escape($data['filter_firstname']) . "%'";
        }
        
        if (!empty($data['filter_lastname'])) {
            $sql .= " AND c.lastname LIKE '" . $this->db->escape($data['filter_lastname']) . "%'";
        }
        
        if (!empty($data['filter_quantity'])) {
            $sql .= " AND p.quantity = '" . $this->db->escape($data['filter_quantity']) . "'";
        }
        
        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND p.status = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        $query = $this->db->query($sql);

        return $query->row['total'];
    }
    
    /*
     * Function definition to get the list of sellers orders
     */
    public function getSellersOrders($data = array()) {
        $sql = "SELECT o.order_id, o.firstname, o.lastname, o.order_status_id, SUM(ksod.total_earning) as total,SUM(ksod.shipping) as total_shipping ,o.date_added, o.date_modified, c.email, ksod.seller_id, os.name FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod INNER JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ks.seller_id = ksod.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (c.customer_id = ks.customer_id) INNER JOIN " . DB_PREFIX . "order o ON (ksod.order_id = o.order_id) INNER JOIN " . DB_PREFIX . "order_status os ON (o.order_status_id = os.order_status_id and os.language_id = '" . (int) $this->config->get('config_language_id') . "') WHERE 1";

        if (!empty($data['filter_order'])) {
            $sql .= " AND o.order_id = '" . $this->db->escape($data['filter_order']) . "'";
        }
        
        if (!empty($data['filter_customer'])) {
            $sql .= " AND o.firstname LIKE '" . $this->db->escape($data['filter_customer']) . "%'";
        }
        
        if (!empty($data['filter_seller_email'])) {
            $sql .= " AND c.email LIKE '" . $this->db->escape($data['filter_seller_email']) . "%'";
        }
        
        if (!empty($data['filter_status'])) {
            $sql .= " AND o.order_status_id = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (!empty($data['filter_total'])) {
            $sql .= " AND o.total = '" . $this->db->escape($data['filter_total']) . "'";
        }
        
        if (!empty($data['filter_from_date_added'])) {
            $sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_from_date_added']) . "'";
        }
        
        if (!empty($data['filter_to_date_added'])) {
            $sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_to_date_added']) . "'";
        }
        
        if (!empty($data['filter_from_date_updated'])) {
            $sql .= " AND DATE(o.date_modified) >= '" . $this->db->escape($data['filter_from_date_updated']) . "'";
        }
        
        if (!empty($data['filter_to_date_updated'])) {
            $sql .= " AND DATE(o.date_modified) <= '" . $this->db->escape($data['filter_to_date_updated']) . "'";
        }

        $sql .= " GROUP BY o.order_id, ksod.seller_id";

        $sort_data = array(
            'o.order_id',
            'o.firstname',
            'c.email',
            'os.name',
            'o.total',
            'o.date_added',
            'o.date_modified'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY o.date_modified";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to get total sellers orders count
     */
    public function getTotalSellersOrders($data = array()) {
        $sql = "SELECT COUNT(DISTINCT ksod.seller_order_detail_id) AS total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod INNER JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ks.seller_id = ksod.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (c.customer_id = ks.customer_id) INNER JOIN " . DB_PREFIX . "order o ON (ksod.order_id = o.order_id) WHERE 1";

        if (!empty($data['filter_order'])) {
            $sql .= " AND o.order_id = '" . $this->db->escape($data['filter_order']) . "'";
        }
        
        if (!empty($data['filter_customer'])) {
            $sql .= " AND o.firstname LIKE '" . $this->db->escape($data['filter_customer']) . "%'";
        }
        
        if (!empty($data['filter_seller_email'])) {
            $sql .= " AND c.email LIKE '" . $this->db->escape($data['filter_seller_email']) . "%'";
        }
        
        if (!empty($data['filter_status'])) {
            $sql .= " AND o.order_status_id = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (!empty($data['filter_total'])) {
            $sql .= " AND o.total = '" . $this->db->escape($data['filter_total']) . "'";
        }
        
        if (!empty($data['filter_from_date_added'])) {
            $sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_from_date_added']) . "'";
        }
        
        if (!empty($data['filter_to_date_added'])) {
            $sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_to_date_added']) . "'";
        }
        
        if (!empty($data['filter_from_date_updated'])) {
            $sql .= " AND DATE(o.date_modified) >= '" . $this->db->escape($data['filter_from_date_updated']) . "'";
        }
        
        if (!empty($data['filter_to_date_updated'])) {
            $sql .= " AND DATE(o.date_modified) <= '" . $this->db->escape($data['filter_to_date_updated']) . "'";
        }
        
        $query = $this->db->query($sql);

        return $query->row['total'];
    }
    
    /*
     * Function definition to get the list of admin orders
     */
    public function getAdminOrders($data = array()) {
        $sql = "SELECT o.order_id, o.firstname, o.lastname, o.order_status_id, o.total, o.currency_id, o.currency_code, o.currency_value, o.date_added, o.date_modified, os.name FROM " . DB_PREFIX . "order_product op LEFT JOIN " . DB_PREFIX . "kb_mp_seller_order_detail ksod ON (op.order_product_id = ksod.order_detail_id) INNER JOIN " . DB_PREFIX . "order o ON (op.order_id = o.order_id) INNER JOIN " . DB_PREFIX . "order_status os ON (o.order_status_id = os.order_status_id and os.language_id = '" . (int) $this->config->get('config_language_id') . "') WHERE ksod.order_detail_id IS NULL AND o.order_status_id > 0";

        if (!empty($data['filter_order'])) {
            $sql .= " AND o.order_id = '" . $this->db->escape($data['filter_order']) . "'";
        }
        
        if (!empty($data['filter_customer'])) {
            $sql .= " AND o.firstname LIKE '" . $this->db->escape($data['filter_customer']) . "%'";
        }
        
        if (!empty($data['filter_status'])) {
            $sql .= " AND o.order_status_id = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (!empty($data['filter_total'])) {
            $sql .= " AND o.total = '" . $this->db->escape($data['filter_total']) . "'";
        }
        
        if (!empty($data['filter_from_date_added'])) {
            $sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_from_date_added']) . "'";
        }
        
        if (!empty($data['filter_to_date_added'])) {
            $sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_to_date_added']) . "'";
        }
        
        if (!empty($data['filter_from_date_updated'])) {
            $sql .= " AND DATE(o.date_modified) >= '" . $this->db->escape($data['filter_from_date_updated']) . "'";
        }
        
        if (!empty($data['filter_to_date_updated'])) {
            $sql .= " AND DATE(o.date_modified) <= '" . $this->db->escape($data['filter_to_date_updated']) . "'";
        }

        $sql .= " GROUP BY op.order_id";

        $sort_data = array(
            'o.order_id',
            'o.firstname',
            'c.email',
            'os.name',
            'o.total',
            'o.date_added',
            'o.date_modified'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY o.date_modified";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to get total admin orders count
     */
    public function getTotalAdminOrders($data = array()) {
        $sql = "SELECT COUNT(DISTINCT o.order_id) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN " . DB_PREFIX . "kb_mp_seller_order_detail ksod ON (op.order_product_id = ksod.order_detail_id) INNER JOIN " . DB_PREFIX . "order o ON (op.order_id = o.order_id) INNER JOIN " . DB_PREFIX . "order_status os ON (o.order_status_id = os.order_status_id and os.language_id = '" . (int) $this->config->get('config_language_id') . "') WHERE ksod.order_detail_id IS NULL AND o.order_status_id > 0";
        
        if (!empty($data['filter_order'])) {
            $sql .= " AND o.order_id = '" . $this->db->escape($data['filter_order']) . "'";
        }
        
        if (!empty($data['filter_customer'])) {
            $sql .= " AND o.firstname LIKE '" . $this->db->escape($data['filter_customer']) . "%'";
        }
        
        if (!empty($data['filter_status'])) {
            $sql .= " AND o.order_status_id = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (!empty($data['filter_total'])) {
            $sql .= " AND o.total = '" . $this->db->escape($data['filter_total']) . "'";
        }
        
        if (!empty($data['filter_from_date_added'])) {
            $sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_from_date_added']) . "'";
        }
        
        if (!empty($data['filter_to_date_added'])) {
            $sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_to_date_added']) . "'";
        }
        
        if (!empty($data['filter_from_date_updated'])) {
            $sql .= " AND DATE(o.date_modified) >= '" . $this->db->escape($data['filter_from_date_updated']) . "'";
        }
        
        if (!empty($data['filter_to_date_updated'])) {
            $sql .= " AND DATE(o.date_modified) <= '" . $this->db->escape($data['filter_to_date_updated']) . "'";
        }
        
        $query = $this->db->query($sql);

        return $query->row['total'];
    }
    
    /*
     * Function definition to get the list of sellers products reviews
     */
    public function getSellersProductReviews($data = array()) {
        $sql = "SELECT pd.name, r.review_id, r.author, r.rating, r.status, ksd.title, kspr.product_id, kspr.seller_id, kspr.date_added FROM " . DB_PREFIX . "kb_mp_seller_product_review kspr INNER JOIN " . DB_PREFIX . "review r ON (kspr.product_review_id = r.review_id) INNER JOIN " . DB_PREFIX . "product_description pd ON (r.product_id = pd.product_id and pd.language_id = '" . (int) $this->config->get('config_language_id') . "') INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (kspr.seller_id = ksd.seller_id) WHERE 1";

        if (!empty($data['filter_product'])) {
            $sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_product']) . "%'";
        }
        
        if (!empty($data['filter_seller'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_seller']) . "%'";
        }
        
        if (!empty($data['filter_author'])) {
            $sql .= " AND r.author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
        }
        
        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND r.status = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (!empty($data['filter_from_date_added'])) {
            $sql .= " AND DATE(kspr.date_added) >= '" . $this->db->escape($data['filter_from_date_added']) . "'";
        }
        
        if (!empty($data['filter_to_date_added'])) {
            $sql .= " AND DATE(kspr.date_added) <= '" . $this->db->escape($data['filter_to_date_added']) . "'";
        }

        $sql .= " GROUP BY r.review_id";

        $sort_data = array(
            'pd.name',
            'ksd.title',
            'r.author',
            'r.status',
            'r.rating',
            'kspr.date_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY kspr.date_added";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to get total sellers products reviews count
     */
    public function getTotalSellersProductReviews($data = array()) {
        $sql = "SELECT COUNT(DISTINCT r.review_id) AS total FROM " . DB_PREFIX . "kb_mp_seller_product_review kspr INNER JOIN " . DB_PREFIX . "review r ON (kspr.product_review_id = r.review_id) INNER JOIN " . DB_PREFIX . "product_description pd ON (r.product_id = pd.product_id and pd.language_id = '" . (int) $this->config->get('config_language_id') . "') INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (kspr.seller_id = ksd.seller_id) WHERE 1";

        if (!empty($data['filter_product'])) {
            $sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_product']) . "%'";
        }
        
        if (!empty($data['filter_seller'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_seller']) . "%'";
        }
        
        if (!empty($data['filter_author'])) {
            $sql .= " AND r.author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
        }
        
        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND r.status = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (!empty($data['filter_from_date_added'])) {
            $sql .= " AND DATE(kspr.date_added) >= '" . $this->db->escape($data['filter_from_date_added']) . "'";
        }
        
        if (!empty($data['filter_to_date_added'])) {
            $sql .= " AND DATE(kspr.date_added) <= '" . $this->db->escape($data['filter_to_date_added']) . "'";
        }
        
        $query = $this->db->query($sql);

        return $query->row['total'];
    }
    
    /*
     * Function definition to get the list of sellers reviews
     */
    public function getSellersReviews($data = array()) {
        $sql = "SELECT ksr.seller_review_id, ksr.seller_id, ksr.author, ksr.rating, ksr.approved, ksd.title, ksr.date_added FROM " . DB_PREFIX . "kb_mp_seller_review ksr INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ksr.seller_id = ksd.seller_id) WHERE ksr.approved = '1'";

        if (!empty($data['filter_seller'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_seller']) . "%'";
        }
        
        if (!empty($data['filter_author'])) {
            //to resolve the issue to search name which have space in it
            $data['filter_author'] = substr($data['filter_author'],0,3);
            $sql .= " AND ksr.author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
        }
        
        if (!empty($data['filter_status'])) {
            $sql .= " AND ksr.approved = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (!empty($data['filter_from_date_added'])) {
            $sql .= " AND DATE(ksr.date_added) >= '" . $this->db->escape($data['filter_from_date_added']) . "'";
        }
        
        if (!empty($data['filter_to_date_added'])) {
            $sql .= " AND DATE(ksr.date_added) <= '" . $this->db->escape($data['filter_to_date_added']) . "'";
        }

        $sql .= " GROUP BY ksr.seller_review_id";

        $sort_data = array(
            'ksd.title',
            'ksr.author',
            'ksr.approved',
            'ksr.rating',
            'ksr.date_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY ksr.date_added";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to get total sellers reviews count
     */
    public function getTotalSellersReviews($data = array()) {
        $sql = "SELECT COUNT(DISTINCT ksr.seller_review_id) AS total FROM " . DB_PREFIX . "kb_mp_seller_review ksr INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ksr.seller_id = ksd.seller_id) WHERE ksr.approved = '1'";

        if (!empty($data['filter_seller'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_seller']) . "%'";
        }
        
        if (!empty($data['filter_author'])) {
            $sql .= " AND ksr.author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
        }
        
        if (!empty($data['filter_status'])) {
            $sql .= " AND ksr.approved = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (!empty($data['filter_from_date_added'])) {
            $sql .= " AND DATE(ksr.date_added) >= '" . $this->db->escape($data['filter_from_date_added']) . "'";
        }
        
        if (!empty($data['filter_to_date_added'])) {
            $sql .= " AND DATE(ksr.date_added) <= '" . $this->db->escape($data['filter_to_date_added']) . "'";
        }
        
        $query = $this->db->query($sql);

        return $query->row['total'];
    }
    
    /*
     * Function definition to get the list of pending sellers reviews
     */
    public function getPendingSellersReviews($data = array()) {
        $sql = "SELECT ksr.seller_review_id, ksr.seller_id, ksr.author, ksr.rating, ksr.approved, ksd.title, ksr.date_added FROM " . DB_PREFIX . "kb_mp_seller_review ksr INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ksr.seller_id = ksd.seller_id) WHERE ksr.approved != '1'";

        if (!empty($data['filter_seller'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_seller']) . "%'";
        }
        
        if (!empty($data['filter_author'])) {
            $sql .= " AND ksr.author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
        }
        
        if (!empty($data['filter_status'])) {
            $sql .= " AND ksr.approved = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (!empty($data['filter_from_date_added'])) {
            $sql .= " AND DATE(ksr.date_added) >= '" . $this->db->escape($data['filter_from_date_added']) . "'";
        }
        
        if (!empty($data['filter_to_date_added'])) {
            $sql .= " AND DATE(ksr.date_added) <= '" . $this->db->escape($data['filter_to_date_added']) . "'";
        }

        $sql .= " GROUP BY ksr.seller_review_id";

        $sort_data = array(
            'ksd.title',
            'ksr.author',
            'ksr.approved',
            'ksr.rating',
            'ksr.date_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY ksr.date_added";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to get total pending sellers reviews count
     */
    public function getTotalPendingSellersReviews($data = array()) {
        $sql = "SELECT COUNT(DISTINCT ksr.seller_review_id) AS total FROM " . DB_PREFIX . "kb_mp_seller_review ksr INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ksr.seller_id = ksd.seller_id) WHERE ksr.approved != '1'";

        if (!empty($data['filter_seller'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_seller']) . "%'";
        }
        
        if (!empty($data['filter_author'])) {
            $sql .= " AND ksr.author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
        }
        
        if (!empty($data['filter_status'])) {
            $sql .= " AND ksr.approved = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (!empty($data['filter_from_date_added'])) {
            $sql .= " AND DATE(ksr.date_added) >= '" . $this->db->escape($data['filter_from_date_added']) . "'";
        }
        
        if (!empty($data['filter_to_date_added'])) {
            $sql .= " AND DATE(ksr.date_added) <= '" . $this->db->escape($data['filter_to_date_added']) . "'";
        }
        
        $query = $this->db->query($sql);

        return $query->row['total'];
    }
    
    /*
     * Function definition to get the list of sellers category requests
     */
    public function getSellersCategoryRequest($data = array()) {
        $sql = "SELECT kscr.seller_category_request_id, kscr.seller_id, ksd.title, c.email, cd.name, kscr.comment, kscr.approved, kscr.date_added FROM " . DB_PREFIX . "kb_mp_seller_category_request kscr INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (kscr.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ks.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (ks.customer_id = c.customer_id) INNER JOIN " . DB_PREFIX . "category_description cd ON (kscr.category_id = cd.category_id AND cd.language_id = '" . (int) $this->config->get('config_language_id') . "') WHERE kscr.approved != '1'";

        if (!empty($data['filter_seller'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_seller']) . "%'";
        }
        
        if (!empty($data['filter_seller_email'])) {
            $sql .= " AND c.email LIKE '" . $this->db->escape($data['filter_seller_email']) . "%'";
        }
        
        if (!empty($data['filter_category'])) {
            $sql .= " AND cd.name LIKE '" . $this->db->escape($data['filter_category']) . "%'";
        }
        
        if (!empty($data['filter_comment'])) {
            $sql .= " AND kscr.comment LIKE '" . $this->db->escape($data['filter_comment']) . "%'";
        }
        
        if (!empty($data['filter_status'])) {
            $sql .= " AND kscr.approved = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (!empty($data['filter_from_date_added'])) {
            $sql .= " AND DATE(kscr.date_added) >= '" . $this->db->escape($data['filter_from_date_added']) . "'";
        }
        
        if (!empty($data['filter_to_date_added'])) {
            $sql .= " AND DATE(kscr.date_added) <= '" . $this->db->escape($data['filter_to_date_added']) . "'";
        }

        $sql .= " GROUP BY kscr.seller_category_request_id";

        $sort_data = array(
            'ksd.title',
            'c.email',
            'cd.name',
            'kscr.comment',
            'kscr.approved',
            'kscr.date_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY kscr.date_added";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to get total sellers category requests count
     */
    public function getTotalSellersCategoryRequest($data = array()) {
        
        $sql = "SELECT COUNT(DISTINCT kscr.seller_category_request_id) AS total FROM " . DB_PREFIX . "kb_mp_seller_category_request kscr INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (kscr.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ks.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (ks.customer_id = c.customer_id) INNER JOIN " . DB_PREFIX . "category_description cd ON (kscr.category_id = cd.category_id AND cd.language_id = '" . (int) $this->config->get('config_language_id') . "') WHERE 1";

        if (!empty($data['filter_seller'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_seller']) . "%'";
        }
        
        if (!empty($data['filter_seller_email'])) {
            $sql .= " AND c.email LIKE '" . $this->db->escape($data['filter_seller_email']) . "%'";
        }
        
        if (!empty($data['filter_category'])) {
            $sql .= " AND cd.name LIKE '" . $this->db->escape($data['filter_category']) . "%'";
        }
        
        if (!empty($data['filter_comment'])) {
            $sql .= " AND kscr.comment LIKE '" . $this->db->escape($data['filter_comment']) . "%'";
        }
        
        if (!empty($data['filter_status'])) {
            $sql .= " AND kscr.approved = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (!empty($data['filter_from_date_added'])) {
            $sql .= " AND DATE(kscr.date_added) >= '" . $this->db->escape($data['filter_from_date_added']) . "'";
        }
        
        if (!empty($data['filter_to_date_added'])) {
            $sql .= " AND DATE(kscr.date_added) <= '" . $this->db->escape($data['filter_to_date_added']) . "'";
        }
        
        $query = $this->db->query($sql);

        return $query->row['total'];
    }
    
    /*
     * Function definition to get the Admin Commissions Details
     */
    public function getAdminCommission($data = array()) {
        
        if (!empty($data['type'])) {
            
            $sql = "SELECT cd.name, SUM(ksod.total_earning) as total_earning, SUM(ksod.seller_earning) as seller_earning, SUM(ksod.admin_earning) as admin_earning, SUM(ksod.qty) as qty,SUM(ksod.shipping) as total_shipping , o.currency_code, o.currency_value FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod INNER JOIN " . DB_PREFIX . "category_description cd ON (ksod.category_id = cd.category_id) INNER JOIN " . DB_PREFIX . "order o ON (ksod.order_id = o.order_id) WHERE ksod.is_consider = '1' AND ksod.is_canceled = '0' AND cd.language_id = '" . (int) $this->config->get('config_language_id') . "'";

            if (!empty($data['category_id'])) {
                $sql .= " AND ksod.category_id = '" . (int)$data['category_id'] . "'";
            }
            
            if (!empty($data['filter_category'])) {
                $sql .= " AND cd.name = '" . $this->db->escape($data['filter_category']) . "'";
            }

            if (!empty($data['filter_quantity'])) {
                $sql .= " AND qty = '" . $this->db->escape($data['filter_quantity']) . "'";
            }

            if (!empty($data['filter_total_earning'])) {
                $sql .= " AND total_earning = '" . $this->db->escape($data['filter_total_earning']) . "'";
            }

            if (!empty($data['filter_commission'])) {
                $sql .= " AND admin_earning = '" . $this->db->escape($data['filter_commission']) . "'";
            }

            if (!empty($data['filter_seller_earning'])) {
                $sql .= " AND seller_earning = '" . $this->db->escape($data['filter_seller_earning']) . "'";
            }

            $sql .= " GROUP BY ksod.category_id";
            
            $sort_data = array(
                'cd.name',
                'qty',
                'total_earning',
                'admin_earning',
                'seller_earning'
            );
            
        } else {
            
            $sql = "SELECT o.order_id, o.firstname, o.lastname, o.order_status_id,kspd.title,SUM(ksod.qty) as qty,SUM(ksod.shipping) as total_shipping , SUM(ksod.total_earning) as total,SUM(ksod.seller_earning)as seller_earning,SUM(ksod.admin_earning) as admin_earning,o.currency_id, o.currency_code, o.currency_value, o.date_added, o.date_modified, c.email, ksod.seller_id, os.name FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod INNER JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ks.seller_id = ksod.seller_id) INNER JOIN ".DB_PREFIX."kb_mp_seller_details kspd ON (ks.seller_id = kspd.seller_id AND kspd.language_id='" . (int)$this->config->get('config_language_id') . "' ) INNER JOIN " . DB_PREFIX . "customer c ON (c.customer_id = ks.customer_id) INNER JOIN " . DB_PREFIX . "order o ON (ksod.order_id = o.order_id) INNER JOIN " . DB_PREFIX . "order_status os ON (o.order_status_id = os.order_status_id and os.language_id = '" . (int) $this->config->get('config_language_id') . "') WHERE ksod.is_consider = '1' AND ksod.is_canceled = '0'";
            //condition for not taking cancelled order
            $this->load->model('setting/kbmp_marketplace');
            //store condition
            if (isset($this->request->get['store_id'])) {
                $store_id = $this->request->get['store_id'];
            } else {
                $store_id = 0;
            }
            $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id); 
            $cancelled = $settings['kbmp_marketplace_setting']['cancel_order_status_value'];
            if (!empty($cancelled)){
               //condition to ignore cancelled order 
               $sql .= "AND os.name NOT IN ('".implode("','", $cancelled)."')";
            }

            if (!empty($data['filter_order'])) {
                $sql .= " AND ksod.order_id = '" . $this->db->escape($data['filter_order']) . "'";
            }

            if (!empty($data['filter_seller'])) {
                $sql .= " AND kspd.title LIKE '" . $this->db->escape($data['filter_seller']) . "%'";
            }

            if (!empty($data['filter_email'])) {
                $sql .= " AND c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
            }

            if (!empty($data['filter_quantity'])) {
                $sql .= " AND ksod.qty = '" . $this->db->escape($data['filter_quantity']) . "'";
            }

            if (!empty($data['filter_total_earning'])) {
                $sql .= " AND ksod.total_earning = '" . $this->db->escape($data['filter_total_earning']) . "'";
            }

            if (!empty($data['filter_commission'])) {
                $sql .= " AND ksod.admin_earning = '" . $this->db->escape($data['filter_commission']) . "'";
            }

            if (!empty($data['filter_seller_earning'])) {
                $sql .= " AND ksod.seller_earning = '" . $this->db->escape($data['filter_seller_earning']) . "'";
            }

            if (!empty($data['filter_from_date_added'])) {
                $sql .= " AND DATE(ksod.date_added) >= '" . $this->db->escape($data['filter_from_date_added']) . "'";
            }

            if (!empty($data['filter_to_date_added'])) {
                $sql .= " AND DATE(ksod.date_added) <= '" . $this->db->escape($data['filter_to_date_added']) . "'";
            }
            $sql .= " GROUP BY o.order_id, ksod.seller_id";
            
            $sort_data = array(
                'ksod.order_id',
                'ksd.title',
                'c.email',
                'ksod.qty',
                'ksod.total_earning',
                'ksod.admin_earning',
                'ksod.seller_earning',
                'ksod.date_added'
            );
        }

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY ksod.date_added";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to get total count of Admin Commissions list
     */
    public function getTotalAdminCommission($data = array()) {
        
        if (!empty($data['type'])) {
            
            $sql = "SELECT COUNT(DISTINCT ksod.category_id) AS total, SUM(ksod.total_earning) as total_earning, SUM(ksod.seller_earning) as seller_earning, SUM(ksod.admin_earning) as admin_earning, SUM(ksod.qty) as qty FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod INNER JOIN " . DB_PREFIX . "category_description cd ON (ksod.category_id = cd.category_id) INNER JOIN " . DB_PREFIX . "order o ON (ksod.order_id = o.order_id) WHERE ksod.is_consider = '1' AND ksod.is_canceled = '0' AND cd.language_id = '" . (int) $this->config->get('config_language_id') . "'";
            
            if (!empty($data['category_id'])) {
                $sql .= " AND ksod.category_id = '" . (int)$data['category_id'] . "'";
            }
            
            if (!empty($data['filter_category'])) {
                $sql .= " AND cd.name = '" . $this->db->escape($data['filter_category']) . "'";
            }

            if (!empty($data['filter_quantity'])) {
                $sql .= " AND qty = '" . $this->db->escape($data['filter_quantity']) . "'";
            }

            if (!empty($data['filter_total_earning'])) {
                $sql .= " AND total_earning = '" . $this->db->escape($data['filter_total_earning']) . "'";
            }

            if (!empty($data['filter_commission'])) {
                $sql .= " AND admin_earning = '" . $this->db->escape($data['filter_commission']) . "'";
            }

            if (!empty($data['filter_seller_earning'])) {
                $sql .= " AND seller_earning = '" . $this->db->escape($data['filter_seller_earning']) . "'";
            }

            $sql .= " GROUP BY ksod.category_id";
            
        } else {
            $sql = "SELECT seller_order_detail_id FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ksod.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ks.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (ks.customer_id = c.customer_id) WHERE ksod.is_consider = '1' AND ksod.is_canceled = '0'";

            if (!empty($data['filter_order'])) {
                $sql .= " AND ksod.order_id = '" . $this->db->escape($data['filter_order']) . "'";
            }

            if (!empty($data['filter_seller'])) {
                $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_seller']) . "%'";
            }

            if (!empty($data['filter_email'])) {
                $sql .= " AND c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
            }

            if (!empty($data['filter_quantity'])) {
                $sql .= " AND ksod.qty = '" . $this->db->escape($data['filter_quantity']) . "'";
            }

            if (!empty($data['filter_total_earning'])) {
                $sql .= " AND ksod.total_earning = '" . $this->db->escape($data['filter_total_earning']) . "'";
            }

            if (!empty($data['filter_commission'])) {
                $sql .= " AND ksod.admin_earning = '" . $this->db->escape($data['filter_commission']) . "'";
            }

            if (!empty($data['filter_seller_earning'])) {
                $sql .= " AND ksod.seller_earning = '" . $this->db->escape($data['filter_seller_earning']) . "'";
            }

            if (!empty($data['filter_from_date_added'])) {
                $sql .= " AND DATE(ksod.date_added) >= '" . $this->db->escape($data['filter_from_date_added']) . "'";
            }

            if (!empty($data['filter_to_date_added'])) {
                $sql .= " AND DATE(ksod.date_added) <= '" . $this->db->escape($data['filter_to_date_added']) . "'";
            }
            
            $sql .= " GROUP BY ksod.order_id, ksod.seller_id";
        }
        
        $query = $this->db->query($sql);

        if (isset($query->num_rows)) {
            return $query->num_rows;
        } else {
            return 0;
        }
    }
    
    /*
     * Function definition to get the Seller Balance History
     */
    public function getSellersBalanceHistory($data = array()) {
        //get cancelled order status
        
            //condition for not taking cancelled order
            $this->load->model('setting/kbmp_marketplace');
            //store condition
            if (isset($this->request->get['store_id'])) {
                $store_id = $this->request->get['store_id'];
            } else {
                $store_id = 0;
            }
            $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id); 
            $cancelled = $settings['kbmp_marketplace_setting']['cancel_order_status_value'];
            if (!empty($cancelled)){
               //condition to ignore cancelled order 
               $statusSql = "AND os.name NOT IN ('".implode("','", $cancelled)."')";
            }else{
               $statusSql = " "; 
            }
        
        
        
        //code by gopi 28 feb to fix the issue in query
        $sql = "SELECT c.email, ksd.title, ksod.total_earning as total_earning, ksod.seller_earning as seller_earning, ksod.admin_earning as admin_earning, kst.amount as amount_transferred, ksod.seller_earning - kst.amount as balance , o.currency_code, o.currency_value FROM "
                . "(SELECT kmsod.seller_order_detail_id,  kmsod.seller_id, kmsod.order_id, SUM(kmsod.total_earning) as total_earning, SUM(kmsod.seller_earning) as seller_earning,"
                . " SUM(kmsod.admin_earning) as admin_earning, kmsod.is_consider, kmsod.is_canceled "
                . "FROM " . DB_PREFIX . "kb_mp_seller_order_detail kmsod INNER JOIN `".DB_PREFIX."order` o "
                . "ON (o.order_id = kmsod.order_id) INNER JOIN ".DB_PREFIX."order_status os ON (o.order_status_id = os.order_status_id AND os.language_id='" . (int)$this->config->get('config_language_id') . "')"
                . "WHERE  kmsod.is_consider = '1' AND kmsod.is_canceled = '0' ".$statusSql." group by kmsod.seller_id) ksod "
                . "INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ksod.seller_id = ksd.seller_id AND ksd.language_id='" . (int)$this->config->get('config_language_id') . "' ) "
                . "INNER JOIN " . DB_PREFIX . "order o ON (ksod.order_id = o.order_id) "
                . "INNER JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ks.seller_id = ksd.seller_id) "
                . "INNER JOIN " . DB_PREFIX . "customer c ON (ks.customer_id = c.customer_id) "
                . "INNER JOIN (SELECT SUM(amount) as amount, seller_id FROM " . DB_PREFIX . "kb_mp_seller_transaction "
                . "group by seller_id) kst ON (ksod.seller_id = kst.seller_id)";

        if (!empty($data['filter_seller'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_seller']) . "%'";
        }

        if (!empty($data['filter_email'])) {
            $sql .= " AND c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
        }

        if (!empty($data['filter_total_earning'])) {
            $sql .= " AND total_earning = '" . $this->db->escape($data['filter_total_earning']) . "'";
        }

        if (!empty($data['filter_commission'])) {
            $sql .= " AND admin_earning = '" . $this->db->escape($data['filter_commission']) . "'";
        }

        if (!empty($data['filter_seller_earning'])) {
            $sql .= " AND seller_earning = '" . $this->db->escape($data['filter_seller_earning']) . "'";
        }

        $sql .= " GROUP BY kst.seller_id";

        if (!empty($data['filter_amount_transferred']) || !empty($data['filter_balance'])) {
            $sql .= ' having 1';
        }
        
        if (!empty($data['filter_amount_transferred'])) {
            $sql .= " AND amount_transferred = '" . $this->db->escape($data['filter_amount_transferred']) . "'";
        }
        
        if (!empty($data['filter_balance'])) {
            $sql .= " AND balance = '" . $this->db->escape($data['filter_balance']) . "'";
        }
        
        $sort_data = array(
            'ksd.title',
            'c.email',
            'total_earning',
            'admin_earning',
            'seller_earning',
            'amount_transferred',
            'balance'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY ksod.seller_id";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);
      
        return $query;
    }
    
    /*
     * Function to get total count of Sellers Balance History
     */
    public function getTotalSellersBalanceHistory($data = array()) {
        
        $sql = "SELECT COUNT(DISTINCT ksod.seller_id) AS total, SUM(ksod.total_earning) as total_earning, SUM(ksod.seller_earning) as seller_earning, SUM(ksod.admin_earning) as admin_earning, SUM(kst.amount) as amount_transferred, SUM(ksod.seller_earning) - SUM(kst.amount) as balance FROM (SELECT seller_id, order_id, SUM(total_earning) as total_earning, SUM(seller_earning) as seller_earning, SUM(admin_earning) as admin_earning, is_consider, is_canceled FROM " . DB_PREFIX . "kb_mp_seller_order_detail WHERE is_canceled = '0' AND is_consider = '1' group by seller_id) ksod INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ksod.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "order o ON (ksod.order_id = o.order_id) INNER JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ks.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (ks.customer_id = c.customer_id) INNER JOIN (SELECT * FROM " . DB_PREFIX . "kb_mp_seller_transaction group by seller_id) kst ON (ksod.seller_id = kst.seller_id)";
      
        if (!empty($data['filter_seller'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_seller']) . "%'";
        }

        if (!empty($data['filter_email'])) {
            $sql .= " AND c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
        }

        if (!empty($data['filter_total_earning'])) {
            $sql .= " AND total_earning = '" . $this->db->escape($data['filter_total_earning']) . "'";
        }

        if (!empty($data['filter_commission'])) {
            $sql .= " AND admin_earning = '" . $this->db->escape($data['filter_commission']) . "'";
        }

        if (!empty($data['filter_seller_earning'])) {
            $sql .= " AND seller_earning = '" . $this->db->escape($data['filter_seller_earning']) . "'";
        }

        $sql .= " GROUP BY kst.seller_id";
        
        if (!empty($data['filter_amount_transferred']) || !empty($data['filter_balance'])) {
            $sql .= ' having 1';
        }
        
        if (!empty($data['filter_amount_transferred'])) {
            $sql .= " AND amount_transferred = '" . $this->db->escape($data['filter_amount_transferred']) . "'";
        }
        
        if (!empty($data['filter_balance'])) {
            $sql .= " AND balance = '" . $this->db->escape($data['filter_balance']) . "'";
        }
        
        $query = $this->db->query($sql);

        if (isset($query->row['total'])) {
            return $query->row['total'];
        } else {
            return 0;
        }
    }
    
    /*
     * Function definition to get the Seller Transaction History
     */
    public function getSellersTransactionHistory($data = array()) {
        
        $sql = "SELECT c.email, ksd.title, kst.transaction_number, kst.transaction_type, kst.comment, kst.amount, kst.date_added FROM " . DB_PREFIX . "kb_mp_seller_transaction kst INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (kst.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ks.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (ks.customer_id = c.customer_id) WHERE 1";

        if (!empty($data['filter_seller'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_seller']) . "%'";
        }

        if (!empty($data['filter_email'])) {
            $sql .= " AND c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
        }

        if (!empty($data['filter_transaction_id'])) {
            $sql .= " AND kst.transaction_number = '" . $this->db->escape($data['filter_transaction_id']) . "'";
        }

        if (isset($data['filter_type']) && $data['filter_type'] != '') {
            $sql .= " AND kst.transaction_type = '" . $this->db->escape($data['filter_type']) . "'";
        }
        
        if (!empty($data['filter_comment'])) {
            $sql .= " AND kst.comment LIKE '" . $this->db->escape($data['filter_comment']) . "%'";
        }
        
        if (!empty($data['filter_amount'])) {
            $sql .= " AND kst.amount = '" . $this->db->escape($data['filter_amount']) . "'";
        }
        
        if (!empty($data['filter_transaction_date_from'])) {
            $sql .= " AND DATE(kst.date_added) >= '" . $this->db->escape($data['filter_transaction_date_from']) . "'";
        }
        
        if (!empty($data['filter_transaction_date_to'])) {
            $sql .= " AND DATE(kst.date_added) <= '" . $this->db->escape($data['filter_transaction_date_to']) . "'";
        }

        $sort_data = array(
            'ksd.title',
            'c.email',
            'kst.transaction_number',
            'kst.transaction_type',
            'kst.comment',
            'kst.amount',
            'kst.date_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY kst.date_added";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to get total count of Sellers Transaction History
     */
    public function getTotalSellersTransactionHistory($data = array()) {
        
        $sql = "SELECT COUNT(DISTINCT kst.seller_transaction_id) AS total FROM " . DB_PREFIX . "kb_mp_seller_transaction kst INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (kst.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ks.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (ks.customer_id = c.customer_id) WHERE 1";
        
        if (!empty($data['filter_seller'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_seller']) . "%'";
        }

        if (!empty($data['filter_email'])) {
            $sql .= " AND c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
        }

        if (!empty($data['filter_transaction_id'])) {
            $sql .= " AND kst.transaction_number = '" . $this->db->escape($data['filter_transaction_id']) . "'";
        }

        if (!empty($data['filter_type'])) {
            $sql .= " AND kst.transaction_type = '" . $this->db->escape($data['filter_type']) . "'";
        }
        
        if (!empty($data['filter_comment'])) {
            $sql .= " AND kst.comment LIKE '" . $this->db->escape($data['filter_comment']) . "%'";
        }
        
        if (!empty($data['filter_amount'])) {
            $sql .= " AND kst.amount = '" . $this->db->escape($data['filter_amount']) . "'";
        }
        
        if (!empty($data['filter_transaction_date_from'])) {
            $sql .= " AND DATE(kst.date_added) >= '" . $this->db->escape($data['filter_transaction_date_from']) . "'";
        }
        
        if (!empty($data['filter_transaction_date_to'])) {
            $sql .= " AND DATE(kst.date_added) <= '" . $this->db->escape($data['filter_transaction_date_to']) . "'";
        }

        $query = $this->db->query($sql);

        if (isset($query->row['total'])) {
            return $query->row['total'];
        } else {
            return 0;
        }
    }
    
    /*
     * Function definition to get the Email Templates
     */
    public function getEmailTemplates($data = array()) {
        
        $sql = "SELECT distinct * FROM " . DB_PREFIX . "kb_mp_email_templates WHERE language_id = '" . (int) $this->config->get('config_language_id') . "'";

        if (!empty($data['filter_email_subject'])) {
            $sql .= " AND email_subject LIKE '" . $this->db->escape($data['filter_email_subject']) . "%'";
        }

        $sort_data = array(
            'email_subject',
            'email_description'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY template_id";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to get total count of Email Templates
     */
    public function getTotalEmailTemplates($data = array()) {
        
        $sql = "SELECT COUNT(DISTINCT template_id) AS total FROM " . DB_PREFIX . "kb_mp_email_templates WHERE language_id = '" . (int) $this->config->get('config_language_id') . "'";
        
        if (!empty($data['filter_email_subject'])) {
            $sql .= " AND email_subject LIKE '" . $this->db->escape($data['filter_email_subject']) . "%'";
        }

        $query = $this->db->query($sql);

        if (isset($query->row['total'])) {
            return $query->row['total'];
        } else {
            return 0;
        }
    }
    
    /*
     * Function definition to get the Seller Shipping
     */
    public function getSellersShipping($data = array()) {
        
        $sql = "SELECT ksd.title, gz.name, kss.* FROM " . DB_PREFIX . "kb_mp_seller_shipping kss INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (kss.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "geo_zone gz ON (kss.geo_zone_id = gz.geo_zone_id) WHERE 1";

        if (!empty($data['filter_seller'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_seller']) . "%'";
        }

        if (!empty($data['filter_zone'])) {
            $sql .= " AND gz.name LIKE '" . $this->db->escape($data['filter_zone']) . "%'";
        }

        if (isset($data['filter_weight_from']) && $data['filter_weight_from'] != '') {
            $sql .= " AND kss.weight_from = '" . $this->db->escape($data['filter_weight_from']) . "'";
        }
        
        if (isset($data['filter_weight_to']) && $data['filter_weight_to'] != '') {
            $sql .= " AND kss.weight_to = '" . $this->db->escape($data['filter_weight_to']) . "'";
        }

        if (isset($data['filter_rate']) && $data['filter_rate'] != '') {
            $sql .= " AND kss.rate = '" . $this->db->escape($data['filter_type']) . "'";
        }
        
        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND kss.status = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(kss.date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }
        
        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(kss.date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }

        $sort_data = array(
            'ksd.title',
            'gz.name',
            'kss.weight_from',
            'kss.weight_to',
            'kss.rate',
            'kss.status',
            'kss.date_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY kss.date_added";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to get total count of Sellers Shipping
     */
    public function getTotalSellersShipping($data = array()) {
        
        $sql = "SELECT COUNT(DISTINCT kss.shipping_id) AS total FROM " . DB_PREFIX . "kb_mp_seller_shipping kss INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (kss.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "geo_zone gz ON (kss.geo_zone_id = gz.geo_zone_id) WHERE 1";

        if (!empty($data['filter_seller'])) {
            $sql .= " AND ksd.title LIKE '" . $this->db->escape($data['filter_seller']) . "%'";
        }

        if (!empty($data['filter_zone'])) {
            $sql .= " AND gz.name LIKE '" . $this->db->escape($data['filter_zone']) . "%'";
        }

        if (isset($data['filter_weight_from']) && $data['filter_weight_from'] != '') {
            $sql .= " AND kss.weight_from = '" . $this->db->escape($data['filter_weight_from']) . "'";
        }
        
        if (isset($data['filter_weight_to']) && $data['filter_weight_to'] != '') {
            $sql .= " AND kss.weight_to = '" . $this->db->escape($data['filter_weight_to']) . "'";
        }

        if (isset($data['filter_rate']) && $data['filter_rate'] != '') {
            $sql .= " AND kss.rate = '" . $this->db->escape($data['filter_type']) . "'";
        }
        
        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND kss.status = '" . $this->db->escape($data['filter_status']) . "'";
        }
        
        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(kss.date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }
        
        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(kss.date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }

        $query = $this->db->query($sql);

        if (isset($query->row['total'])) {
            return $query->row['total'];
        } else {
            return 0;
        }
    }
    
    /*
     * Function to approve seller product
     */
    public function approveProduct($product_id) {
        if (isset($product_id) && !empty($product_id)) {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_product SET approved = '1' WHERE product_id = '" . (int) $product_id . "'";
            
            if ($this->db->query($sql)) {
                $sql = "UPDATE " . DB_PREFIX . "product SET status = '1' WHERE product_id = '" . (int) $product_id . "'";
                if ($this->db->query($sql)) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        }
    }
    
    /*
     * Function to disapprove seller product
     */
    public function disapproveProduct($product_id, $comment) {
        if (isset($product_id) && !empty($product_id) && isset($comment) && !empty($comment)) {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_product SET approved = '2', disapprove_comment = '" . $comment . "' WHERE product_id = '" . (int) $product_id . "'";
            
            if ($this->db->query($sql)) {
                return true;
            } else {
                return false;
            }
        }
    }
    
    /*
     * Function to approve seller
     */
    public function approveSeller($seller_id) {
        if (isset($seller_id) && !empty($seller_id)) {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller SET approved = '1' WHERE seller_id = '" . (int) $seller_id . "'";
            
            if ($this->db->query($sql)) {
                $sql = "SELECT customer_id FROM " . DB_PREFIX . "kb_mp_seller WHERE seller_id = '" . (int) $seller_id . "'";
                $query = $this->db->query($sql);
                
                if (isset($query->row)) {
                    $sql = "UPDATE " . DB_PREFIX . "customer SET status = '1' WHERE customer_id = '" . (int) $query->row['customer_id'] . "'";
                    if ($this->db->query($sql)) {
                        //Get All products from Tracking table
                        $enabledProducts = $this->getSellerTrackingProducts($seller_id);
                        if (isset($enabledProducts) && !empty($enabledProducts)) {
                            if ($this->enableSellerProducts($enabledProducts)) {
                                //Delete products from tracking
                                $this->deleteSellerTrackingProducts($seller_id);
                            }
                        }
                    }
                }
                return true;
            } else {
                return false;
            }
        }
    }
    
    /*
     * Function to disapprove seller
     */
    public function disapproveSeller($seller_id, $comment) {
        if (isset($seller_id) && !empty($seller_id) && isset($comment) && !empty($comment)) {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller SET approved = '2', disapprove_comment = '" . $comment . "', disapproval_count = disapproval_count + 1 WHERE seller_id = '" . (int) $seller_id . "'";
            
            if ($this->db->query($sql)) {
                return true;
            } else {
                return false;
            }
        }
    }
    
    /*
     * Function to get the sellers review information
     */
    public function getSellerReview($review_id) {
        if (isset($review_id) && !empty($review_id)) {
            $sql = "SELECT ksr.customer_id, ksr.seller_id, ksr.author, ksr.text, ksr.rating, ksr.approved, ksr.date_added, ksd.title FROM " . DB_PREFIX . "kb_mp_seller_review ksr INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ksr.seller_id = ksd.seller_id) WHERE ksr.seller_review_id = '" . (int) $review_id . "' LIMIT 0, 1";
            
            $query = $this->db->query($sql);

            return $query->row;
        }
        return false;
    }
    
    /*
     * Function definition to edit/update seller review
     */
    public function editSellerReview($review_id, $data = array()) {
        if (isset($review_id) && !empty($review_id)) {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_review SET author = '" . $data['author'] . "', text = '" . addslashes($data['text']) . "', rating = '" . (int) $data['rating'] . "', approved = '" . (int) $data['status'] . "' WHERE seller_review_id = '" . (int) $review_id . "'";
            
            if ($this->db->query($sql)) {
                return true;
            } else {
                return false;
            }
        }
    }
    
    /*
     * Function to approve category request
     */
    public function approveCategoryRequest($category_request_id) {
        if (isset($category_request_id) && !empty($category_request_id)) {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_category_request SET approved = '1' WHERE seller_category_request_id = '" . (int) $category_request_id . "'";
            
            if ($this->db->query($sql)) {
                $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller_category_request WHERE seller_category_request_id = '" . (int) $category_request_id . "'";
                $query = $this->db->query($sql);
                
                if (isset($query->row) && !empty($query->row)) {
                    $category = $query->row;
                    $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_category SET seller_category_id = '', seller_id = '" . (int) $category['seller_id'] . "', store_id = '" . (int) $category['store_id'] . "', category_id = '" . (int) $category['category_id'] . "', date_added = now()";
                    if ($this->db->query($sql)) {
                        return true;
                    }
                }
            } else {
                return false;
            }
        }
    }
    
    /*
     * Function to disapprove category request
     */
    public function disapproveCategoryRequest($category_request_id, $comment) {
        if (isset($category_request_id) && !empty($category_request_id) && isset($comment) && !empty($comment)) {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_category_request SET approved = '2', disapprove_comment = '" . $comment . "' WHERE seller_category_request_id = '" . (int) $category_request_id . "'";
            
            if ($this->db->query($sql)) {
                return true;
            } else {
                return false;
            }
        }
    }
    
    /*
     * Function to get Sellers List (Basically for Dropdown)
     */
    public function getSellersList($approved = true) {
        if (isset($approved) && $approved) {
            $sql = "SELECT ks.seller_id, ksd.title, c.email FROM " . DB_PREFIX . "kb_mp_seller ks INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ks.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (c.customer_id = ks.customer_id) AND ks.approved = '1'";
        } else {
            $sql = "SELECT ks.seller_id, ksd.title, c.email FROM " . DB_PREFIX . "kb_mp_seller ks INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ks.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (c.customer_id = ks.customer_id) AND ks.approved = '2'";
        }
        
        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to check if Transaction number is unique
     */
    public function isUniqueTransactionNumber($transaction_id) {
        if (isset($transaction_id) && !empty($transaction_id)) {
            $sql = "SELECT count(*) as total FROM " . DB_PREFIX . "kb_mp_seller_transaction WHERE transaction_number = '" . $transaction_id . "'";
            $query = $this->db->query($sql);

            if (isset($query->row['total']) && !empty($query->row['total'])) {
                return true;
            } else {
                return false;
            }
        }
        return false;
    }
    
    /*
     * Function to add new transaction details int the db table
     */
    public function addNewTransaction($data = array()) {
        if (isset($data) && !empty($data)) {
            if (isset($data['transaction_type']) && !empty($data['transaction_type'])) {
                $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_transaction SET seller_transaction_id = '', seller_id = '" . (int)$data['seller_id'] . "', store_id = '0', transaction_number = '" . $data['transaction_number'] . "', amount = '-" . $data['amount'] . "', transaction_type = '" . (int)$data['transaction_type'] . "', comment = '" . $data['comment'] . "', date_added = '" . date("Y-m-d H:i:s") . "'";
            } else {
                $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_transaction SET seller_transaction_id = '', seller_id = '" . (int)$data['seller_id'] . "', store_id = '0', transaction_number = '" . $data['transaction_number'] . "', amount = '" . $data['amount'] . "', transaction_type = '" . (int)$data['transaction_type'] . "', comment = '" . $data['comment'] . "', date_added = '" . date("Y-m-d H:i:s") . "'";
            }
            if ($this->db->query($sql)) {
                return true;
            } else {
                return false;
            }
        }
        return false;
    }
    
    /*
     * Function to get Email Template details
     */
    public function getEmailTemplate($template_id, $language_id = '') {
        if (isset($template_id) && !empty($template_id)) {
            if (isset($language_id) && !empty($language_id)) {
                $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_email_templates WHERE template_id = '" . (int)$template_id . "' AND language_id = '" . (int) $language_id . "'";
    
                $query = $this->db->query($sql);

                return $query->row;
            } else {
                $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_email_templates WHERE template_id = '" . (int)$template_id . "'";

                $query = $this->db->query($sql);

                return $query->rows;
            }
        }
    }
    
    /*
     * Function to update email content
     */
    public function updateEmailTemplate($data = array()) {
        if (isset($data) && !empty($data)) {
            //Check if row exists
            $sql = "SELECT count(*) as total FROM " . DB_PREFIX . "kb_mp_email_templates WHERE template_id = '" . (int)$data['template_id'] . "' and language_id = '" . (int)$data['language_id'] . "'";
            $query = $this->db->query($sql);

            if (isset($query->row['total']) && !empty($query->row['total'])) {
                //Update row
                $sql = "UPDATE " . DB_PREFIX . "kb_mp_email_templates SET email_subject = '" . $data['subject'] . "', email_content = '" . $data['content'] . "' WHERE template_id = '" . (int)$data['template_id'] . "' and language_id = '" . (int)$data['language_id'] . "'";
            } else {
                //Insert row
                if (isset($data['subject']) && !empty($data['subject'])) {
                    $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_email_templates SET id = '', template_id = '" . (int)$data['template_id'] . "', language_id = '" . $data['language_id'] . "', email_subject = '" . $data['subject'] . "', email_content = '" . $data['content'] . "', date_added = '" . date("Y-m-d H:i:s") . "'";
                }
            }
            
            if ($this->db->query($sql)) {
                return true;
            } else {
                return false;
            }
        }
    }
    
    /*
     * Function to check if customer is registered as seller
     */

    public function is_seller($customer_id) {
        $sql = "SELECT COUNT(*) as total FROM " . DB_PREFIX . "kb_mp_seller WHERE customer_id = '" . (int) $customer_id . "'";

        $query = $this->db->query($sql);

        if (isset($query->row['total'])) {
            return $query->row['total'];
        } else {
            return 0;
        }
    }
    
    /*
     * Function to get seller information by customer Id
     */

    public function getSellerByCustomerId($customer_id) {
        $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller WHERE customer_id = '" . (int) $customer_id . "'";

        $query = $this->db->query($sql);

        return $query->row;
    }
    
    /*
     * Function definition to get seller config
     */
    public function getSellerConfig($seller_id) {
        $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller_config WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $this->config->get('config_store_id') . "'";
        
        $query = $this->db->query($sql);
        
        return $query->rows;
    }
    
    /*
     * Function to update Seller Config
     */
    public function updateSellerConfig($data, $seller_id, $store_id) {
        //Update Seller Config entries in DB table
        //For default Commission
        if (isset($data['kbmp_default_commission_global'])) {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_config SET value = '" . $data['kbmp_default_commission'] . "', use_global = '" . $data['kbmp_default_commission_global'] . "' WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $store_id . "' AND `key` = 'kbmp_default_commission'";
        } else {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_config SET value = '" . $data['kbmp_default_commission'] . "', use_global = '0' WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $store_id . "' AND `key` = 'kbmp_default_commission'";
        }
        $this->db->query($sql);

        //For New Product Approval Required
        if (isset($data['kbmp_new_product_approval_required_global'])) {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_config SET value = '" . $data['kbmp_new_product_approval_required'] . "', use_global = '" . $data['kbmp_new_product_approval_required_global'] . "' WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $store_id . "' AND `key` = 'kbmp_new_product_approval_required'";
        } else {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_config SET value = '" . $data['kbmp_new_product_approval_required'] . "', use_global = '0' WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $store_id . "' AND `key` = 'kbmp_new_product_approval_required'";
        }
        $this->db->query($sql);

        //For Enable Seller Review
        if (isset($data['kbmp_enable_seller_review_global'])) {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_config SET value = '" . $data['kbmp_enable_seller_review'] . "', use_global = '" . $data['kbmp_enable_seller_review_global'] . "' WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $store_id . "' AND `key` = 'kbmp_enable_seller_review'";
        } else {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_config SET value = '" . $data['kbmp_enable_seller_review'] . "', use_global = '0' WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $store_id . "' AND `key` = 'kbmp_enable_seller_review'";
        }
        $this->db->query($sql);

        //For Seller Review Approval Required
        if (isset($data['kbmp_seller_review_approval_required_global'])) {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_config SET value = '" . $data['kbmp_seller_review_approval_required'] . "', use_global = '" . $data['kbmp_seller_review_approval_required_global'] . "' WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $store_id . "' AND `key` = 'kbmp_seller_review_approval_required'";
        } else {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_config SET value = '" . $data['kbmp_seller_review_approval_required'] . "', use_global = '0' WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $store_id . "' AND `key` = 'kbmp_seller_review_approval_required'";
        }
        $this->db->query($sql);

        //For Email on New Order
        if (isset($data['kbmp_email_on_new_order_global'])) {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_config SET value = '" . $data['kbmp_email_on_new_order'] . "', use_global = '" . $data['kbmp_email_on_new_order_global'] . "' WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $store_id . "' AND `key` = 'kbmp_email_on_new_order'";
        } else {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_config SET value = '" . $data['kbmp_email_on_new_order'] . "', use_global = '0' WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $store_id . "' AND `key` = 'kbmp_email_on_new_order'";
        }
        $this->db->query($sql);

        //For Categories
        $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_config SET value = '" . implode(", ", $data['product_category']) . "' WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $store_id . "' AND `key` = 'product_category'";
        $this->db->query($sql);
        
        if (isset($data['product_category']) && !empty($data['product_category'])) {
            $categories = $data['product_category'];
        } else {
            //Get All categories for Seller
            $categories = $this->getCategories();
        }
        
        //Delete all categories mapped to seller
        $this->db->query("DELETE FROM " . DB_PREFIX . "kb_mp_seller_category WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $store_id . "'");
        //Map categories to seller
        foreach ($categories as $category_id) {
            $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_category SET seller_category_id = '', seller_id = '" . (int) $seller_id . "', store_id = '" . (int) $store_id . "', category_id = '" . (int) $category_id . "', date_added = now()";
            $this->db->query($sql);
        }
        
    }
    
    /*
     * Function to get categories list (Mainly for dropdowns)
     */
    public function getCategories() {
        $sql = "SELECT cp.category_id AS category_id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') AS name, c1.parent_id, c1.sort_order FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "category c1 ON (cp.category_id = c1.category_id) LEFT JOIN " . DB_PREFIX . "category c2 ON (cp.path_id = c2.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (cp.category_id = cd2.category_id) WHERE cd1.language_id = '" . (int) $this->config->get('config_language_id') . "' AND cd2.language_id = '" . (int) $this->config->get('config_language_id') . "'";

        $sql .= " GROUP BY cp.category_id";

        $sql .= " ORDER BY sort_order";

        $sql .= " ASC";
        
        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to get Assigned categories list (Mainly for dropdowns)
     */
    public function getAssignedCategories($seller_id) {
        $sql = "SELECT category_id FROM " . DB_PREFIX . "kb_mp_seller_category WHERE store_id = '" . (int) $this->config->get('config_store_id') . "' AND seller_id = '" . (int) $seller_id . "' ORDER BY category_id ASC";
        
        $query = $this->db->query($sql);

        return $query->rows;
    }
    
    /*
     * Function to get category details
     */

    public function getCategory($category_id) {
        $query = $this->db->query("SELECT DISTINCT *, (SELECT GROUP_CONCAT(cd1.name ORDER BY level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id AND cp.category_id != cp.path_id) WHERE cp.category_id = c.category_id AND cd1.language_id = '" . (int) $this->config->get('config_language_id') . "' GROUP BY cp.category_id) AS path, (SELECT DISTINCT keyword FROM " . DB_PREFIX . "seo_url WHERE query = 'category_id=" . (int) $category_id . "') AS keyword FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (c.category_id = cd2.category_id) WHERE c.category_id = '" . (int) $category_id . "' AND cd2.language_id = '" . (int) $this->config->get('config_language_id') . "'");

        return $query->row;
    }
    
    /*
     * Function to get category Request details
     */
    public function getCategoryRequestDetails($category_request_id) {
        if (isset($category_request_id) && !empty($category_request_id)) {
            $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller_category_request WHERE seller_category_request_id = '" . (int) $category_request_id . "'";
            
            $query = $this->db->query($sql);
            
            return $query->row;
        }
    }
    
    /*
     * Function to get seller enabled products
     */
    public function getSellerEnabledProducts($seller_id) {
        if (isset($seller_id) && !empty($seller_id)) {
            $sql = "SELECT ksp.product_id FROM " . DB_PREFIX . "kb_mp_seller_product ksp INNER JOIN " . DB_PREFIX . "product p ON (ksp.product_id = p.product_id) WHERE ksp.seller_id = '" . (int) $seller_id . "' AND p.status = '1' AND ksp.deleted = '0'";
            $query = $this->db->query($sql);
            
            return $query->rows;
        }
    }
    
    /*
     * Function to add seller products into tracking
     */
    public function addSellerProductsForTracking($seller_id, $products) {
        if (isset($seller_id) && !empty($seller_id) && isset($products) && !empty($products)) {
            foreach ($products as $product) {
                $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_product_tracking SET tracking_id = '', seller_id = '" . (int) $seller_id . "', product_id = '" . (int)$product['product_id'] . "', date_added = now()";
                $this->db->query($sql);
            }
            return true;
        }
    }
    
    /*
     * Function to remove seller products from tracking
     */
    public function deleteSellerTrackingProducts($seller_id) {
        if (isset($seller_id) && !empty($seller_id)) {
            $sql = "DELETE FROM " . DB_PREFIX . "kb_mp_seller_product_tracking WHERE seller_id = '" . (int) $seller_id . "'";
            $this->db->query($sql);
        }
    }
    
    /*
     * Function to disable seller products on account disable
     */
    public function disableSellerProducts($seller_id) {
        if (isset($seller_id) && !empty($seller_id)) {
            $sql = "SELECT ksp.product_id FROM " . DB_PREFIX . "kb_mp_seller_product ksp INNER JOIN " . DB_PREFIX . "product p ON (ksp.product_id = p.product_id) WHERE ksp.seller_id = '" . (int) $seller_id . "' AND p.status = '1' AND ksp.deleted = '0'";
            $query = $this->db->query($sql);
            if (isset($query->rows)) {
                foreach ($query->rows as $product) {
                    $sql = "UPDATE " . DB_PREFIX . "product SET status = '0' WHERE product_id = '" . (int)$product['product_id'] . "'";
                    $this->db->query($sql);
                }
            }
        }
    }
    
    /*
     * Function to enable seller products on account enable
     */
    public function enableSellerProducts($products) {
        if (isset($products) && !empty($products)) {
            foreach ($products as $product) {
                $sql = "UPDATE " . DB_PREFIX . "product SET status = '1' WHERE product_id = '" . (int)$product['product_id'] . "'";
                $this->db->query($sql);
            }
            return true;
        }
    }
    
    /*
     * Function to get seller tracking products
     */
    public function getSellerTrackingProducts($seller_id) {
        if (isset($seller_id) && !empty($seller_id)) {
            $sql = "SELECT product_id FROM " . DB_PREFIX . "kb_mp_seller_product_tracking WHERE seller_id = '" . (int) $seller_id . "'";
            $query = $this->db->query($sql);
            
            return $query->rows;
        }
    }
    
    /*
     * Function to get seller account details
     */
    public function getSellerAccountDetails($seller_id) {
        if (isset($seller_id) && !empty($seller_id)) {
            $sql = "SELECT ks.*, ksd.*, c.email, c.firstname, c.lastname, c.telephone FROM " . DB_PREFIX . "kb_mp_seller ks INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ks.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (ks.customer_id = c.customer_id) WHERE ks.seller_id = '" . (int) $seller_id . "'";
            $query = $this->db->query($sql);
            
            return $query->row;
        }
    }
    
    /*
     * Function to get product request details
     */
    public function getProductRequestDetails($product_id) {
        if (isset($product_id) && !empty($product_id)) {
            $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller_product ksp INNER JOIN " . DB_PREFIX . "product p ON (ksp.product_id = p.product_id) INNER JOIN " . DB_PREFIX . "product_description pd ON (ksp.product_id = pd.product_id) WHERE ksp.product_id = '" . (int) $product_id . "' AND pd.language_id = '" . (int) $this->config->get('config_language_id') . "'";
            $query = $this->db->query($sql);

            return $query->row;
        }
    }
    
    /*
     * Function to delete a product
     */
    public function deleteProduct($seller_id, $product_id, $comment) {
        $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_product SET deleted = '1', delete_reason = '" . $this->db->escape($comment) . "' WHERE seller_id = '" . (int) $seller_id . "' AND product_id = '" . (int) $product_id . "'";
        
        if ($this->db->query($sql)) {
            $this->load->model('catalog/product');
            $this->model_catalog_product->deleteProduct($product_id);
            return true;
        }
        return false;
    }
    
    /*
     * Function to delete seller review
     */
    public function deleteReview($seller_id, $review_id) {
        $sql = "DELETE FROM " . DB_PREFIX . "kb_mp_seller_review WHERE seller_id = '" . (int) $seller_id . "' AND seller_review_id = '" . (int) $review_id . "'";
        if ($this->db->query($sql)) {
            return true;
        }
        return false;
    }
    
    /*
     * Function to check if product is seller product
     */
    public function isSellerProduct($product_id) {
        $sql = "SELECT seller_id, approved FROM " . DB_PREFIX . "kb_mp_seller_product WHERE product_id = '" . $product_id . "'";
        
        $query = $this->db->query($sql);
        
        if (isset($query->row['approved'])) {
            return $query->row;
        } else {
            return '';
        }
    }
    // Seller payout request
    public function getSellersPayoutRequest($data = array(), $store_id = 0) {
        $sql = "SELECT c.firstname, c.lastname, c.email,s.bankwire_account_info,s.bankwire_bank_details,s.bankwire_bank_address,s.bankwire_additional_info,s.paypal_id,s.paypal_additional_info,s.state,s.country_id,s.payout_type, sp.* FROM " . DB_PREFIX . "kb_mp_seller_payout as sp, " . DB_PREFIX . "kb_mp_seller as s, " . DB_PREFIX . "customer as c "
                . "WHERE sp.seller_id = s.seller_id AND s.customer_id = c.customer_id "
                . "AND sp.store_id = '" . (int) $this->config->get('config_store_id'). "' AND sp.status != '1'";

        if (!empty($data['filter_name'])) {
            $firstname = explode(' ', $data['filter_name'])[0];
            if(isset(explode(' ', $data['filter_name'])[1])){
                $lastname = explode(' ', $data['filter_name'])[1];
                $sql .= " AND c.lastname ='" . trim($lastname) . "'";
            }
            $sql .= " AND c.firstname ='" . trim($firstname) . "'";
        }

        if (!empty($data['filter_status'])) {
            $sql .= " AND sp.status = '" . $data['filter_status'] . "'";
        }
        if (!empty($data['filter_amount'])) {
            $sql .= " AND sp.amount = '" . trim((float)$data['filter_amount']) . "'";
        }
        if (!empty($data['filter_email'])) {
            $sql .= " AND c.email = '" . trim((float)$data['filter_email']) . "'";
        }
        if (!empty($data['filter_to_date']) && !empty($data['filter_from_date'])) {
            $sql .= " AND sp.date_added BETWEEN '" . trim($data['filter_from_date']) . "' AND '" . trim($data['filter_to_date']) . "'";
        }


        $sort_data = array(
            'sp.id',
            'c.firstname',
            'sp.amount',
            'sp.status',
            'sp.comment',
            'sp.date_added',
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY date_added";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = $this->config->get('config_limit_admin');
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }
        $query = $this->db->query($sql);
        
        return $query->rows;
    }
    public function payoutApproove($data = array()) {
//        var_dump($data);die;
        $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_payout SET status = '1', transaction_id='". $this->db->escape($data['transaction_id']) ."', approve_comment='". $this->db->escape($data['transaction_comment']) ."', transaction_type='". $this->db->escape($data['transaction_type']) ."' WHERE id='". (int)$data['id'] ."'";
        $this->db->query($sql);
        $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_transaction SET seller_id = '". (int)$data['seller_id'] ."', store_id = '". $this->config->get('config_store_id') ."', transaction_number='". $this->db->escape($data['transaction_id']) ."', amount='". (float)$data['amount_value'] ."', transaction_type='0', comment='". $this->db->escape($data['transaction_comment']) ."',date_added = '" . date("Y-m-d H:i:s") . "'";
        $this->db->query($sql);
    }
    public function payoutDisapproove($data = array()) {
        $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_payout SET status = '2', disapprove_comment='". $this->db->escape($data['transaction_comment']) ."' WHERE id='". (int)$data['id'] ."'";
        $this->db->query($sql);
    }
    //code by gopi
    //function to get tracking details for account order details
    public function getProductTracking($order_id,$product_id){
        
        $sql = "SELECT tracking_number FROM ".DB_PREFIX."kb_mp_seller_order_detail WHERE order_id =".(int)$order_id." AND product_id =".(int)$product_id;
        
        $result = $this->db->query($sql);

        if ($result->num_rows){
            return $result->row['tracking_number'];
        }else {
            return 0;
        }   
        
    }
    
    
}

?>