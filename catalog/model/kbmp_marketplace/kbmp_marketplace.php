<?php

class ModelKbmpMarketplaceKbmpMarketplace extends Model {
    /*
     * Function to get sellers for listing
     */

    public function getSellers($data) {
        $sql = "SELECT ks.seller_id, ks.logo, ksd.title FROM " . DB_PREFIX . "kb_mp_seller ks LEFT JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ks.seller_id = ksd.seller_id) WHERE ksd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND ks.approved = '1' AND ks.active = '1'";

        $sql .= " GROUP BY ks.seller_id";

        $sort_data = array(
            'ksd.title',
            'ks.date_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            if ($data['sort'] == 'ksd.title') {
                $sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
            } else {
                $sql .= " ORDER BY " . $data['sort'];
            }
        } else {
            $sql .= " ORDER BY ks.date_added";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC, LCASE(ksd.title) DESC";
        } else {
            $sql .= " ASC, LCASE(ksd.title) ASC";
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

    /*
     * Function to get Total Count fo Sellers in listing
     */

    public function getTotalSellers($data) {
        $sql = "SELECT COUNT(DISTINCT ks.seller_id) AS total FROM " . DB_PREFIX . "kb_mp_seller ks LEFT JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ks.seller_id = ksd.seller_id) WHERE ksd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND ks.approved = '1' AND ks.active = '1'";

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    /*
     * Function to add sellers and details in database
     */

    public function addSeller($customer_id, $request, $settings, $store_id) {
        
        if (isset($customer_id) && !empty($customer_id)) {
       
            $config_zone_id =$this->config->get('config_zone_id') ;
            $config_country_id = $this->config->get('config_country_id');
            $adress1 = isset($request['address_1'])?$request['address_1']:'';
            $adress2 = isset($request['address_2'])?$request['address_2']:'';
            $zone_id = isset($request['zone_id'])?$request['zone_id']:$config_zone_id;
            $country_id = isset($request['country_id'])?$request['country_id']:$config_country_id;

            $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller SET seller_id = '', customer_id = '" . (int) $customer_id . "', store_id = '" . (int) $store_id . "', active = '1', product_limit = '" . $settings['kbmp_marketplace_setting']['kbmp_product_limit'] . "', approval_request_limit = '" . $settings['kbmp_marketplace_setting']['kbmp_approval_request_limit'] . "', address = '" . $this->db->escape($adress1) . ' ' . $this->db->escape($adress2) . "', state = '" . (int)$zone_id . "', country_id = '" . (int) $country_id . "', date_added = '" . date("Y-m-d H:i:s") . "'";

            if ($this->db->query($sql)) {
                $seller_id = $this->db->getLastId();
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
                
               foreach($languages as $language){
                   $lang_id = $language['language_id'];
                   $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_details SET seller_detail_id = '', language_id = '" .(int)$lang_id. "', seller_id = '" . (int) $seller_id . "'";
               }
                
               
               
                
                if ($this->db->query($sql)) {
                    if (isset($settings['kbmp_marketplace_setting']['product_category']) && !empty($settings['kbmp_marketplace_setting']['product_category'])) {
                        $categories = $settings['kbmp_marketplace_setting']['product_category'];
                        //Map categories to seller
                        foreach ($categories as $category_id) {
                            $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_category SET seller_category_id = '', seller_id = '" . (int) $seller_id . "', store_id = '" . (int) $store_id . "', category_id = '" . (int) $category_id . "', date_added = now()";
                            $this->db->query($sql);
                        }
                    } else {
                        //Get All categories for Seller
                        $categories = $this->getCategories();
                        //Map categories to seller
                        foreach ($categories as $category) {
                            $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_category SET seller_category_id = '', seller_id = '" . (int) $seller_id . "', store_id = '" . (int) $store_id . "', category_id = '" . (int) $category['category_id'] . "', date_added = now()";
                            $this->db->query($sql);
                        }
                    }

                    //Create Seller Config entries in separate table
                    //For default Commission
                    $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_config SET seller_config_id = '', seller_id = '" . (int) $seller_id . "', store_id = '" . (int) $store_id . "', `key` = 'kbmp_default_commission', value = '" . $settings['kbmp_marketplace_setting']['kbmp_default_commission'] . "', date_added = now()";
                    $this->db->query($sql);

                    //For New Product Approval Required
                    $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_config SET seller_config_id = '', seller_id = '" . (int) $seller_id . "', store_id = '" . (int) $store_id . "', `key` = 'kbmp_new_product_approval_required', value = '" . $settings['kbmp_marketplace_setting']['kbmp_new_product_approval_required'] . "', date_added = now()";
                    $this->db->query($sql);

                    //For Enable Seller Review
                    $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_config SET seller_config_id = '', seller_id = '" . (int) $seller_id . "', store_id = '" . (int) $store_id . "', `key` = 'kbmp_enable_seller_review', value = '" . $settings['kbmp_marketplace_setting']['kbmp_enable_seller_review'] . "', date_added = now()";
                    $this->db->query($sql);

                    //For Seller Review Approval Required
                    $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_config SET seller_config_id = '', seller_id = '" . (int) $seller_id . "', store_id = '" . (int) $store_id . "', `key` = 'kbmp_seller_review_approval_required', value = '" . $settings['kbmp_marketplace_setting']['kbmp_seller_review_approval_required'] . "', date_added = now()";
                    $this->db->query($sql);

                    //For Email on New Order
                    $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_config SET seller_config_id = '', seller_id = '" . (int) $seller_id . "', store_id = '" . (int) $store_id . "', `key` = 'kbmp_email_on_new_order', value = '" . $settings['kbmp_marketplace_setting']['kbmp_email_on_new_order'] . "', date_added = now()";
                    $this->db->query($sql);

                    //For Categories
                    
                    
    
                    if (isset($settings['kbmp_marketplace_setting']['product_category'])) {
                      $kb_product_category = implode(", ", $settings['kbmp_marketplace_setting']['product_category']) ;  
                    }else {
                        $kb_product_category = '';
                    }
                    $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_config SET seller_config_id = '', seller_id = '" . (int) $seller_id . "', store_id = '" . (int) $store_id . "', `key` = 'product_category', value = '" .$kb_product_category. "', date_added = now()";
                    $this->db->query($sql);

                    return true;
                }
            }
        }
        return false;
    }

    /*
     * Function to get seller information for Seller View Page
     */

    public function getSeller($seller_id) {
        if (isset($seller_id) && !empty($seller_id)) {
            $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller ks, " . DB_PREFIX . "kb_mp_seller_details ksd WHERE ks.seller_id = ksd.seller_id AND ks.seller_id = '" . (int) $seller_id . "' AND ksd.language_id = '" . (int) $this->config->get('config_language_id') . "'";

            $query = $this->db->query($sql);

            return $query->row;
        }
    }

    /*
     * Function to get seller products list
     */

    public function getSellerProducts($data, $is_seller = 0) {
        $sql = "SELECT p.product_id, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int) $this->config->get('config_customer_group_id') . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int) $this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special, ksp.approved AS approved";

        $sql .= " FROM " . DB_PREFIX . "product p";

        $sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)";

        if (!empty($data['seller_id'])) {
            $sql .= " LEFT JOIN " . DB_PREFIX . "kb_mp_seller_product ksp ON (p.product_id = ksp.product_id)";
        }

        $sql .= " WHERE pd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "'";

        if (!empty($data['seller_id'])) {
            $sql .= " AND ksp.seller_id = '" . (int) $data['seller_id'] . "' AND ksp.deleted = '0' AND ksp.store_id = '" . (int) $this->config->get('config_store_id') . "'";
            if (!$is_seller) {
                $sql .= " AND p.status = '1' AND ksp.approved = '1'";
            }
        }

        if (!empty($data['filter_productname'])) {
            $sql .= " AND (";

            $implode = array();

            $words = explode(' ', trim(preg_replace('/\s+/', ' ', $data['filter_productname'])));

            foreach ($words as $word) {
                $implode[] = "pd.name LIKE '%" . $this->db->escape($word) . "%'";
            }

            if ($implode) {
                $sql .= " " . implode(" AND ", $implode) . "";
            }

            $sql .= ")";
        }

        if (!empty($data['filter_model'])) {
            $sql .= " AND p.model LIKE '%" . $this->db->escape($data['filter_model']) . "%'";
        }

        if (!empty($data['filter_price'])) {
            $sql .= " AND p.price = '" . $data['filter_price'] . "'";
        }

        if (!empty($data['filter_category'])) {
            
        }

        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND p.status = '" . (int) $data['filter_status'] . "'";
        }

        $sql .= " GROUP BY p.product_id";

        $sort_data = array(
            'pd.name',
            'p.model',
            'p.price',
            'rating',
            'p.sort_order',
            'p.date_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
                $sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
            } elseif ($data['sort'] == 'p.price') {
                $sql .= " ORDER BY (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
            } else {
                $sql .= " ORDER BY " . $data['sort'];
            }
        } else {
            $sql .= " ORDER BY p.sort_order";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC, LCASE(pd.name) DESC";
        } else {
            $sql .= " ASC, LCASE(pd.name) ASC";
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

        $product_data = array();
        $query = $this->db->query($sql);

        foreach ($query->rows as $result) {
            $product_data[$result['product_id']] = $this->getProduct($result['product_id']);

            $product_data[$result['product_id']]['approved'] = $result['approved'];
        }

        return $product_data;
    }

    /*
     * Function to get Total Count of seller products
     */

    public function getTotalSellerProducts($data, $is_seller = 0) {
        $sql = "SELECT COUNT(DISTINCT p.product_id) AS total";

        $sql .= " FROM " . DB_PREFIX . "product p";

        $sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)";

        if (!empty($data['seller_id'])) {
            $sql .= " LEFT JOIN " . DB_PREFIX . "kb_mp_seller_product ksp ON (p.product_id = ksp.product_id)";
        }

        $sql .= " WHERE pd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "'";

        if (!empty($data['seller_id'])) {
            $sql .= " AND ksp.seller_id = '" . (int) $data['seller_id'] . "' AND ksp.deleted = '0' AND ksp.store_id = '" . (int) $this->config->get('config_store_id') . "'";
            if (!$is_seller) {
                $sql .= " AND p.status = '1' AND ksp.approved = '1'";
            }
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    /*
     * Function to get product details
     */

    public function getProduct($product_id) {
        $query = $this->db->query("SELECT DISTINCT *, pd.name AS name, p.image, m.name AS manufacturer, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int) $this->config->get('config_customer_group_id') . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int) $this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special, (SELECT points FROM " . DB_PREFIX . "product_reward pr WHERE pr.product_id = p.product_id AND pr.customer_group_id = '" . (int) $this->config->get('config_customer_group_id') . "') AS reward, (SELECT ss.name FROM " . DB_PREFIX . "stock_status ss WHERE ss.stock_status_id = p.stock_status_id AND ss.language_id = '" . (int) $this->config->get('config_language_id') . "') AS stock_status, (SELECT wcd.unit FROM " . DB_PREFIX . "weight_class_description wcd WHERE p.weight_class_id = wcd.weight_class_id AND wcd.language_id = '" . (int) $this->config->get('config_language_id') . "') AS weight_class, (SELECT lcd.unit FROM " . DB_PREFIX . "length_class_description lcd WHERE p.length_class_id = lcd.length_class_id AND lcd.language_id = '" . (int) $this->config->get('config_language_id') . "') AS length_class, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r2 WHERE r2.product_id = p.product_id AND r2.status = '1' GROUP BY r2.product_id) AS reviews, (SELECT SUM(qty) AS qty_sold FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod WHERE ksod.product_id = p.product_id AND ksod.is_consider = '1' AND ksod.is_canceled = '0' GROUP BY ksod.product_id) AS qty_sold, (SELECT SUM(seller_earning) AS seller_earning FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod WHERE ksod.product_id = p.product_id AND ksod.is_consider = '1' AND ksod.is_canceled = '0' GROUP BY ksod.product_id) AS seller_earning, p.sort_order FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) WHERE p.product_id = '" . (int) $product_id . "' AND pd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "'");

        if ($query->num_rows) {
            return array(
                'product_id' => $query->row['product_id'],
                'name' => $query->row['name'],
                'description' => $query->row['description'],
                'meta_title' => $query->row['meta_title'],
                'meta_description' => $query->row['meta_description'],
                'meta_keyword' => $query->row['meta_keyword'],
                'tag' => $query->row['tag'],
                'model' => $query->row['model'],
                'sku' => $query->row['sku'],
                'upc' => $query->row['upc'],
                'ean' => $query->row['ean'],
                'jan' => $query->row['jan'],
                'isbn' => $query->row['isbn'],
                'mpn' => $query->row['mpn'],
                'location' => $query->row['location'],
                'quantity' => $query->row['quantity'],
                'stock_status' => $query->row['stock_status'],
                'image' => $query->row['image'],
                'manufacturer_id' => $query->row['manufacturer_id'],
                'manufacturer' => $query->row['manufacturer'],
                'price' => ($query->row['discount'] ? $query->row['discount'] : $query->row['price']),
                'special' => $query->row['special'],
                'reward' => $query->row['reward'],
                'points' => $query->row['points'],
                'tax_class_id' => $query->row['tax_class_id'],
                'date_available' => $query->row['date_available'],
                'weight' => $query->row['weight'],
                'weight_class_id' => $query->row['weight_class_id'],
                'length' => $query->row['length'],
                'width' => $query->row['width'],
                'height' => $query->row['height'],
                'length_class_id' => $query->row['length_class_id'],
                'subtract' => $query->row['subtract'],
                'rating' => round($query->row['rating']),
                'reviews' => $query->row['reviews'] ? $query->row['reviews'] : 0,
                'minimum' => $query->row['minimum'],
                'sort_order' => $query->row['sort_order'],
                'status' => $query->row['status'],
                'date_added' => $query->row['date_added'],
                'date_modified' => $query->row['date_modified'],
                'viewed' => $query->row['viewed'],
                'qty_sold' => $query->row['qty_sold'],
                'seller_earning' => $query->row['seller_earning']
            );
        } else {
            return false;
        }
    }

    /*
     * Function to check if customer is registered as seller
     */

    public function is_seller() {
        $sql = "SELECT COUNT(*) as total FROM " . DB_PREFIX . "kb_mp_seller WHERE customer_id = '" . (int) $this->customer->getId() . "'";

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    /*
     * Function to get the total number of orders for dashboard stats
     */

    public function getTotalSellerOrders($type, $data = array()) {
        if (isset($type) && !empty($type)) {
            switch ($type) {
                case 'all':
                    $sql = "SELECT COUNT(DISTINCT ksod.order_id) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "'  AND ksod.is_consider = '1'";
                    break;
                case 'today':
                    $sql = "SELECT COUNT(DISTINCT ksod.order_id) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND DAY(ksod.date_added) = '" . date("d") . "'  AND ksod.is_consider = '1'";
                    break;
                case 'lastday':
                    $sql = "SELECT COUNT(DISTINCT ksod.order_id) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND DAY(ksod.date_added) = '" . date("d", strtotime(' -1 day')) . "'  AND ksod.is_consider = '1'";
                    break;
                case 'week':
                    $sql = "SELECT COUNT(DISTINCT ksod.order_id) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.date_added >= '" . date("Y-m-d 00:00:00", strtotime('monday this week')) . "' AND ksod.date_added <= '" . date("Y-m-d 23:59:59", strtotime(' +6 day ')) . "' AND ksod.is_consider = '1'";
                    break;
                case 'lastweek':
                    $sql = "SELECT COUNT(DISTINCT ksod.order_id) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.date_added >= '" . date("Y-m-d 00:00:00", strtotime('monday last week')) . "' AND ksod.date_added <= '" . date("Y-m-d 00:00:00", strtotime('monday this week')) . "' AND ksod.is_consider = '1'";
                    break;
                case 'month':
                    $sql = "SELECT COUNT(DISTINCT ksod.order_id) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND MONTH(ksod.date_added) = '" . date("m") . "' AND ksod.is_consider = '1'";
                    break;
                case 'lastmonth':
                    $sql = "SELECT COUNT(DISTINCT ksod.order_id) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND MONTH(ksod.date_added) = '" . date("m", strtotime(' -1 month')) . "' AND ksod.is_consider = '1'";
                    break;
                case 'year':
                    $sql = "SELECT COUNT(DISTINCT ksod.order_id) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND YEAR(ksod.date_added) = '" . date("Y") . "' AND ksod.is_consider = '1'";
                    break;
                case 'lastyear':
                    $sql = "SELECT COUNT(DISTINCT ksod.order_id) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND YEAR(ksod.date_added) = '" . date("Y", strtotime(' -1 year')) . "' AND ksod.is_consider = '1'";
                    break;
            }

            $query = $this->db->query($sql);

            if (isset($query->row['total'])) {
                return $query->row['total'];
            } else {
                return 0;
            }
        } else {
            if (isset($data) && !empty($data)) {
                $sql = "SELECT COUNT(DISTINCT ksod.order_id) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod INNER JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ks.seller_id = ksod.seller_id) INNER JOIN " . DB_PREFIX . "order o ON (ksod.order_id = o.order_id) INNER JOIN " . DB_PREFIX . "order_status os ON (o.order_status_id = os.order_status_id and os.language_id = '" . (int) $this->config->get('config_language_id') . "') WHERE ks.customer_id = '" . (int) $this->customer->getId() . "'";

                if (!empty($data['filter_order_id'])) {
                    $sql .= " AND o.order_id = '" . (int) $data['filter_order_id'] . "'";
                }

                if (!empty($data['filter_from_date'])) {
                    $sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
                }

                if (!empty($data['filter_to_date'])) {
                    $sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
                }

                if (!empty($data['filter_customer'])) {
                    $sql .= " AND (o.firstname LIKE '%" . (int) $data['filter_customer'] . "%' OR o.lastname LIKE '%" . (int) $data['filter_customer'] . "%')";
                }

                if (!empty($data['filter_status'])) {
                    $sql .= " AND o.order_status_id = '" . (int) $data['filter_status'] . "'";
                }

                //$sql .= " GROUP BY ksod.order_id";

                $query = $this->db->query($sql);

                if (isset($query->row['total'])) {
                    return $query->row['total'];
                } else {
                    return 0;
                }
            }
        }
        return 0;
    }

    /*
     * Function to get the total sale for dashboard stats
     */

    public function getTotalSellerSale($type) {
        if (isset($type) && !empty($type)) {
            switch ($type) {
                case 'all':
                    $sql = "SELECT SUM(ksod.total_earning) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1' GROUP BY ksod.seller_id";
                    break;
            }

            $query = $this->db->query($sql);

            if (isset($query->row['total'])) {
                return $query->row['total'];
            } else {
                return 0;
            }
        }
        return 0;
    }

    /*
     * Function to get the total earning for dashboard stats
     */

    public function getTotalSellerEarning($type) {
        if (isset($type) && !empty($type)) {
            switch ($type) {
                case 'all':
                    $sql = "SELECT SUM(ksod.seller_earning) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1' GROUP BY ksod.seller_id";
                    break;
                case 'today':
                    $sql = "SELECT SUM(ksod.seller_earning) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1' AND DAY(ksod.date_added) = '" . date("d") . "' GROUP BY ksod.seller_id";
                    break;
                case 'lastday':
                    $sql = "SELECT SUM(ksod.seller_earning) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1' AND DAY(ksod.date_added) = '" . date("d", strtotime(' -1 day')) . "' GROUP BY ksod.seller_id";
                    break;
                case 'week':
                    $sql = "SELECT SUM(ksod.seller_earning) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1' AND ksod.date_added >= '" . date("Y-m-d 00:00:00", strtotime('monday this week')) . "' AND ksod.date_added <= '" . date("Y-m-d 23:59:59", strtotime(' +6 day ')) . "' GROUP BY ksod.seller_id";
                    break;
                case 'lastweek':
                    $sql = "SELECT SUM(ksod.seller_earning) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1'AND ksod.date_added >= '" . date("Y-m-d 00:00:00", strtotime('monday last week')) . "' AND ksod.date_added <= '" . date("Y-m-d 00:00:00", strtotime('monday this week')) . "' GROUP BY ksod.seller_id";
                    break;
                case 'month':
                    $sql = "SELECT SUM(ksod.seller_earning) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1'AND MONTH(ksod.date_added) = '" . date("m") . "' GROUP BY ksod.seller_id";
                    break;
                case 'lastmonth':
                    $sql = "SELECT SUM(ksod.seller_earning) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1'AND MONTH(ksod.date_added) = '" . date("m", strtotime(' -1 month')) . "' GROUP BY ksod.seller_id";
                    break;
                case 'year':
                    $sql = "SELECT SUM(ksod.seller_earning) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1'AND YEAR(ksod.date_added) = '" . date("Y") . "' GROUP BY ksod.seller_id";
                    break;
                case 'lastyear':
                    $sql = "SELECT SUM(ksod.seller_earning) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1'AND YEAR(ksod.date_added) = '" . date("Y", strtotime(' -1 year')) . "' GROUP BY ksod.seller_id";
                    break;
            }

            $query = $this->db->query($sql);

            if (isset($query->row['total'])) {
                return $query->row['total'];
            } else {
                return 0;
            }
        }
        return 0;
    }

    /*
     * Function to get the total number of ordered products for dashboard stats
     */

    public function getTotalSellerOrderedProducts($type) {
        if (isset($type) && !empty($type)) {
            switch ($type) {
                case 'all':
                    $sql = "SELECT SUM(ksod.qty) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1' GROUP BY ksod.seller_id";
                    break;
                case 'today':
                    $sql = "SELECT SUM(ksod.qty) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1' AND DAY(ksod.date_added) = '" . date("d") . "' GROUP BY ksod.seller_id";
                    break;
                case 'lastday':
                    $sql = "SELECT SUM(ksod.qty) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1' AND DAY(ksod.date_added) = '" . date("d", strtotime(' -1 day')) . "' GROUP BY ksod.seller_id";
                    break;
                case 'week':
                    $sql = "SELECT SUM(ksod.qty) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1' AND ksod.date_added >= '" . date("Y-m-d 00:00:00", strtotime('monday this week')) . "' AND ksod.date_added <= '" . date("Y-m-d 23:59:59", strtotime(' +6 day ')) . "' GROUP BY ksod.seller_id";
                    break;
                case 'lastweek':
                    $sql = "SELECT SUM(ksod.qty) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1' AND ksod.date_added >= '" . date("Y-m-d 00:00:00", strtotime('monday last week')) . "' AND ksod.date_added <= '" . date("Y-m-d 00:00:00", strtotime('monday this week')) . "' GROUP BY ksod.seller_id";
                    break;
                case 'month':
                    $sql = "SELECT SUM(ksod.qty) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1' AND MONTH(ksod.date_added) = '" . date("m") . "' GROUP BY ksod.seller_id";
                    break;
                case 'lastmonth':
                    $sql = "SELECT SUM(ksod.qty) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1' AND MONTH(ksod.date_added) = '" . date("m", strtotime(' -1 month')) . "' GROUP BY ksod.seller_id";
                    break;
                case 'year':
                    $sql = "SELECT SUM(ksod.qty) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1' AND YEAR(ksod.date_added) = '" . date("Y") . "' GROUP BY ksod.seller_id";
                    break;
                case 'lastyear':
                    $sql = "SELECT SUM(ksod.qty) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1' AND YEAR(ksod.date_added) = '" . date("Y", strtotime(' -1 year')) . "' GROUP BY ksod.seller_id";
                    break;
            }

            $query = $this->db->query($sql);

            if (isset($query->row['total'])) {
                return $query->row['total'];
            } else {
                return 0;
            }
        }
        return 0;
    }

    /*
     * Function to get seller orders to list on front end inside seller account
     */

    public function getSellerOrders($data) {
        $sql = "SELECT o.order_id, o.firstname, o.lastname, o.email, o.order_status_id, o.total, o.currency_id, o.currency_code, o.currency_value, o.date_added, o.date_modified, SUM(ksod.qty) as qty, os.name, SUM(ksod.total_earning) as order_total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod INNER JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ks.seller_id = ksod.seller_id) INNER JOIN " . DB_PREFIX . "order o ON (ksod.order_id = o.order_id) INNER JOIN " . DB_PREFIX . "order_status os ON (o.order_status_id = os.order_status_id and os.language_id = '" . (int) $this->config->get('config_language_id') . "') WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.is_consider = '1'";

        if (!empty($data['filter_order_id'])) {
            $sql .= " AND o.order_id = '" . (int) $data['filter_order_id'] . "'";
        }

        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }

        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }

        if (!empty($data['filter_customer'])) {
            $sql .= " AND (o.firstname LIKE '%" . $this->db->escape($data['filter_customer']) . "%' OR o.lastname LIKE '%" . $this->db->escape($data['filter_customer']) . "%')";
        }

        if (!empty($data['filter_status'])) {
            $sql .= " AND o.order_status_id = '" . (int) $data['filter_status'] . "'";
        }

        $sql .= " GROUP BY ksod.order_id, ksod.seller_id";

        $sql .= " ORDER BY o.date_modified DESC";

        if (isset($data['limit']) && !empty($data['limit'])) {
            $sql .= " LIMIT 0, " . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    /*
     * Function to get seller information by customer Id
     */

    public function getSellerByProductId($product_id) {
        $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller_product WHERE product_id = '" . (int) $product_id . "'";

        $query = $this->db->query($sql);

        if($query->num_rows) {
            return $query->row['seller_id'];
        }
        else {
            return 0;
        }
    }

     /*
     * Function to get seller information by customer Id
     */

    public function getSellerById($seller_id) {
        $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller WHERE seller_id = '" . (int) $seller_id . "'";

        $query = $this->db->query($sql);

        return $query->row;
    }
    
    /*
     * Function to get seller information by customer Id
     */

    /*
     * Function to get seller information by customer Id
     */

    public function getSellerByCustomerId() {
        $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller WHERE customer_id = '" . (int) $this->customer->getId() . "'";

        $query = $this->db->query($sql);

        return $query->row;
    }

    /*
     * Function to update Seller Profile Details
     */
    public function getSellerbylang($id_seller,$lang){
        $sql = "SELECT * FROM ".DB_PREFIX."kb_mp_seller_details WHERE seller_id=".(int)$id_seller." AND language_id=".(int)$lang;
        $details = $this->db->query($sql);
        return $details->row;
    }

    public function updateSellerProfile($data = array()) {
        if (isset($data) && !empty($data)) {
            $seller = $this->getSellerByCustomerId();

            //Add condition for Logo and Banner
            $logo_sql = '';
            if (isset($data['logo'])) {
                $logo_sql = "logo = '" . $this->db->escape($data['logo']) . "', ";
            }
            $banner_sql = '';
            if (isset($data['banner'])) {
                $banner_sql = "banner = '" . $this->db->escape($data['banner']) . "', ";
            }

            //Update Seller details in primary table
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller SET " . $logo_sql . " " . $banner_sql . " phone_number = '" . $this->db->escape($data['seller_phone_number']) . "', business_email = '" . $this->db->escape($data['business_email']) . "', notification_type = '" . (int) $data['seller_notification_type'] . "', address = '" . $this->db->escape($data['seller_address']) . "', state = '" . $this->db->escape($data['seller_state']) . "', country_id = '" . (int) $data['seller_country'] . "', payout_type = '" . $this->db->escape($data['seller_payment_option']) . "', bankwire_account_info = '" . $this->db->escape($data['payment_owner_info']) . "', bankwire_bank_details = '" . $this->db->escape($data['payment_owner_details']) . "', bankwire_bank_address = '" . $this->db->escape($data['bank_address']) . "', bankwire_additional_info = '" . $this->db->escape($data['bank_additional_info']) . "', paypal_id = '" . $this->db->escape($data['paypal_id']) . "', paypal_additional_info = '" . $this->db->escape($data['paypal_additional_info']) . "',  fb_link = '" . $this->db->escape($data['seller_fb_link']) . "', gplus_link = '" . $this->db->escape($data['seller_gplus_link']) . "', twit_link = '" . $this->db->escape($data['seller_twit_link']) . "' WHERE seller_id = '" . (int) $seller['seller_id'] . "'";

            if ($this->db->query($sql)) {
                //Check if seller already exists for particular language id

                $this->load->model('localisation/language');
                $languages= $this->model_localisation_language->getLanguages();
                foreach($languages as $language){
                    $id =$language['language_id'];
                    $sql = "SELECT count(*) as count FROM " . DB_PREFIX . "kb_mp_seller_details WHERE seller_id = '" . (int) $seller['seller_id'] . "' AND language_id = '" . (int) $id . "'";
                    $exists = $this->db->query($sql);   
                    if (isset($exists->row['count']) && $exists->row['count'] > 0) {
                        //Update details
                        $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_details SET title = '" . $this->db->escape($data['seller_title'][$id]) . "', description = '" . $this->db->escape($data['seller_description'][$id]) . "', meta_keyword = '" . $this->db->escape($data['seller_meta_keywords'][$id]) . "', meta_description = '" . $this->db->escape($data['seller_meta_description'][$id]) . "', return_policy = '" . $this->db->escape($data['return_policy'][$id]) . "', shipping_policy = '" . $this->db->escape($data['shipping_policy'][$id]) . "' WHERE seller_id = '" . (int) $seller['seller_id'] . "' AND language_id = '" . (int)$id  . "'";
                    } else {
                        //Insert details
                        $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_details SET seller_detail_id = '', seller_id = '" . (int) $seller['seller_id'] . "', language_id = '" . (int)$id . "', title = '" . $this->db->escape($data['seller_title'][$id]) . "', description = '" . $this->db->escape($data['seller_description'][$id]) . "', meta_keyword = '" . $this->db->escape($data['seller_meta_keywords'][$id]) . "', meta_description = '" . $this->db->escape($data['seller_meta_description'][$id]) . "', return_policy = '" . $this->db->escape($data['return_policy'][$id]) . "', shipping_policy = '" . $this->db->escape($data['shipping_policy'][$id]) . "'";
                    }
                    $this->db->query($sql);
                }

                return true;


            }
        }
        return false;
    }

    /*
     * Function to delete products from database
     */

    public function deleteProducts($seller_id, $products) {

        if (isset($seller_id) && !empty($seller_id) && isset($products) && !empty($products)) {
            $products = implode(", ", $products);
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_product SET deleted = '1' WHERE seller_id = '" . (int) $seller_id . "' AND product_id IN (" . $products . ")";
            if ($this->db->query($sql)) {
                //Disable product on store
                $sql = "UPDATE " . DB_PREFIX . "product SET status = '0' WHERE product_id IN (" . $products . ")";
                if ($this->db->query($sql)) {
                    return true;
                }
            }
        }
        return false;
    }

    /*
     * Function to get list of order statuses
     */

    public function getOrderStatuses($data = array()) {
        if ($data) {
            $sql = "SELECT * FROM " . DB_PREFIX . "order_status WHERE language_id = '" . (int) $this->config->get('config_language_id') . "'";

            $sql .= " ORDER BY name";

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
        } else {
            $order_status_data = $this->cache->get('order_status.' . (int) $this->config->get('config_language_id'));

            if (!$order_status_data) {
                $query = $this->db->query("SELECT order_status_id, name FROM " . DB_PREFIX . "order_status WHERE language_id = '" . (int) $this->config->get('config_language_id') . "' ORDER BY name");

                $order_status_data = $query->rows;

                $this->cache->set('order_status.' . (int) $this->config->get('config_language_id'), $order_status_data);
            }

            return $order_status_data;
        }
    }

    /*
     * Function to get Order Status Value
     */

    public function getOrderStatus($order_status_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int) $order_status_id . "' AND language_id = '" . (int) $this->config->get('config_language_id') . "'");

        return $query->row;
    }

    /*
     * Function to get order details
     */

    public function getOrder($order_id, $seller_id) {
        $order_query = $this->db->query("SELECT *, (SELECT CONCAT(c.firstname, ' ', c.lastname) FROM " . DB_PREFIX . "customer c WHERE c.customer_id = o.customer_id) AS customer, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int) $this->config->get('config_language_id') . "') AS order_status FROM `" . DB_PREFIX . "order` o INNER JOIN " . DB_PREFIX . "kb_mp_seller_order_detail ksod ON (ksod.order_id = o.order_id) WHERE o.order_id = '" . (int) $order_id . "' AND ksod.seller_id = '" . (int) $seller_id . "' GROUP BY o.order_id");

        if ($order_query->num_rows) {
            $country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int) $order_query->row['payment_country_id'] . "'");

            if ($country_query->num_rows) {
                $payment_iso_code_2 = $country_query->row['iso_code_2'];
                $payment_iso_code_3 = $country_query->row['iso_code_3'];
            } else {
                $payment_iso_code_2 = '';
                $payment_iso_code_3 = '';
            }

            $zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int) $order_query->row['payment_zone_id'] . "'");

            if ($zone_query->num_rows) {
                $payment_zone_code = $zone_query->row['code'];
            } else {
                $payment_zone_code = '';
            }

            $country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int) $order_query->row['shipping_country_id'] . "'");

            if ($country_query->num_rows) {
                $shipping_iso_code_2 = $country_query->row['iso_code_2'];
                $shipping_iso_code_3 = $country_query->row['iso_code_3'];
            } else {
                $shipping_iso_code_2 = '';
                $shipping_iso_code_3 = '';
            }

            $zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int) $order_query->row['shipping_zone_id'] . "'");

            if ($zone_query->num_rows) {
                $shipping_zone_code = $zone_query->row['code'];
            } else {
                $shipping_zone_code = '';
            }

            $reward = 0;

            $order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int) $order_id . "'");

            foreach ($order_product_query->rows as $product) {
                $reward += $product['reward'];
            }

            $this->load->model('localisation/language');

            $language_info = $this->model_localisation_language->getLanguage($order_query->row['language_id']);

            if ($language_info) {
                $language_code = $language_info['code'];
            } else {
                $language_code = $this->config->get('config_language');
            }

            return array(
                'order_id' => $order_query->row['order_id'],
                'invoice_no' => $order_query->row['invoice_no'],
                'invoice_prefix' => $order_query->row['invoice_prefix'],
                'store_id' => $order_query->row['store_id'],
                'store_name' => $order_query->row['store_name'],
                'store_url' => $order_query->row['store_url'],
                'customer_id' => $order_query->row['customer_id'],
                'customer' => $order_query->row['customer'],
                'customer_group_id' => $order_query->row['customer_group_id'],
                'firstname' => $order_query->row['firstname'],
                'lastname' => $order_query->row['lastname'],
                'email' => $order_query->row['email'],
                'telephone' => $order_query->row['telephone'],
                'fax' => $order_query->row['fax'],
                'custom_field' => json_decode($order_query->row['custom_field'], true),
                'payment_firstname' => $order_query->row['payment_firstname'],
                'payment_lastname' => $order_query->row['payment_lastname'],
                'payment_company' => $order_query->row['payment_company'],
                'payment_address_1' => $order_query->row['payment_address_1'],
                'payment_address_2' => $order_query->row['payment_address_2'],
                'payment_postcode' => $order_query->row['payment_postcode'],
                'payment_city' => $order_query->row['payment_city'],
                'payment_zone_id' => $order_query->row['payment_zone_id'],
                'payment_zone' => $order_query->row['payment_zone'],
                'payment_zone_code' => $payment_zone_code,
                'payment_country_id' => $order_query->row['payment_country_id'],
                'payment_country' => $order_query->row['payment_country'],
                'payment_iso_code_2' => $payment_iso_code_2,
                'payment_iso_code_3' => $payment_iso_code_3,
                'payment_address_format' => $order_query->row['payment_address_format'],
                'payment_custom_field' => json_decode($order_query->row['payment_custom_field'], true),
                'payment_method' => $order_query->row['payment_method'],
                'payment_code' => $order_query->row['payment_code'],
                'shipping_firstname' => $order_query->row['shipping_firstname'],
                'shipping_lastname' => $order_query->row['shipping_lastname'],
                'shipping_company' => $order_query->row['shipping_company'],
                'shipping_address_1' => $order_query->row['shipping_address_1'],
                'shipping_address_2' => $order_query->row['shipping_address_2'],
                'shipping_postcode' => $order_query->row['shipping_postcode'],
                'shipping_city' => $order_query->row['shipping_city'],
                'shipping_zone_id' => $order_query->row['shipping_zone_id'],
                'shipping_zone' => $order_query->row['shipping_zone'],
                'shipping_zone_code' => $shipping_zone_code,
                'shipping_country_id' => $order_query->row['shipping_country_id'],
                'shipping_country' => $order_query->row['shipping_country'],
                'shipping_iso_code_2' => $shipping_iso_code_2,
                'shipping_iso_code_3' => $shipping_iso_code_3,
                'shipping_address_format' => $order_query->row['shipping_address_format'],
                'shipping_custom_field' => json_decode($order_query->row['shipping_custom_field'], true),
                'shipping_method' => $order_query->row['shipping_method'],
                'shipping_code' => $order_query->row['shipping_code'],
                'comment' => $order_query->row['comment'],
                'total' => $order_query->row['total'],
                'reward' => $reward,
                'order_status_id' => $order_query->row['order_status_id'],
                'order_status' => $order_query->row['order_status'],
                'commission' => $order_query->row['commission'],
                'language_id' => $order_query->row['language_id'],
                'language_code' => $language_code,
                'currency_id' => $order_query->row['currency_id'],
                'currency_code' => $order_query->row['currency_code'],
                'currency_value' => $order_query->row['currency_value'],
                'ip' => $order_query->row['ip'],
                'forwarded_ip' => $order_query->row['forwarded_ip'],
                'user_agent' => $order_query->row['user_agent'],
                'accept_language' => $order_query->row['accept_language'],
                'date_added' => $order_query->row['date_added'],
                'date_modified' => $order_query->row['date_modified']
            );
        } else {
            return;
        }
    }

    /*
     * Function to get order products
     */

    public function getOrderProducts($order_id, $seller_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product op INNER JOIN " . DB_PREFIX . "kb_mp_seller_order_detail ksod ON (op.product_id = ksod.product_id AND op.order_id = ksod.order_id) WHERE op.order_id = '" . (int) $order_id . "' AND ksod.seller_id = '" . (int) $seller_id . "'");

        return $query->rows;
    }

    /*
     * Function to get order products options
     */

    public function getOrderOptions($order_id, $order_product_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int) $order_id . "' AND order_product_id = '" . (int) $order_product_id . "'");

        return $query->rows;
    }

    /*
     * Function to get upload details by code
     */

    public function getUploadByCode($code) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "upload WHERE code = '" . $this->db->escape($code) . "'");

        return $query->row;
    }

    /*
     * Function to get order vouchers
     */

    public function getOrderVouchers($order_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_voucher WHERE order_id = '" . (int) $order_id . "'");

        return $query->rows;
    }

    /*
     * Function to get order totals
     */

    public function getOrderTotals($order_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int) $order_id . "' ORDER BY sort_order");

        return $query->rows;
    }

    /*
     * Function to get order hitory
     */

    public function getOrderHistories($order_id) {
        $query = $this->db->query("SELECT oh.date_added, os.name AS status, oh.comment, oh.notify FROM " . DB_PREFIX . "order_history oh LEFT JOIN " . DB_PREFIX . "order_status os ON oh.order_status_id = os.order_status_id WHERE oh.order_id = '" . (int) $order_id . "' AND os.language_id = '" . (int) $this->config->get('config_language_id') . "' ORDER BY oh.date_added ASC");

        return $query->rows;
    }

    /*
     * Function to cancel ordered product
     */

    public function cancelOrderProduct($order_id, $product_id, $seller_id) {
        $this->db->query("UPDATE " . DB_PREFIX . "kb_mp_seller_order_detail SET is_canceled = '1', date_canceled = now() WHERE order_id = '" . (int) $order_id . "' AND product_id = '" . (int) $product_id . "' AND seller_id = '" . (int) $seller_id . "'");
    }

    /*
     * Function to get total of non-canceled items of an order
     */

    public function getTotalNonCanceledProducts($order_id) {

        $sql = "SELECT Count(*) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail WHERE order_id = '" . (int) $order_id . "' AND is_canceled = '0'";
        $query = $this->db->query($sql);

        if (isset($query->row['total'])) {
            return $query->row['total'];
        } else {
            return 0;
        }
    }

    /*
     * Function to update Tracking Number
     */

    public function updateTrackingNumber($order_id, $product_id, $trackingNumber, $seller_id) {
        $this->db->query("UPDATE " . DB_PREFIX . "kb_mp_seller_order_detail SET tracking_number = '" . $this->db->escape($trackingNumber) . "' WHERE order_id = '" . (int) $order_id . "' AND product_id = '" . (int) $product_id . "' AND seller_id = '" . (int) $seller_id . "'");
    }

    /*
     * Function definition to get the list of sellers products reviews
     */

    public function getSellersProductReviews($data = array()) {
        $sql = "SELECT pd.name, r.review_id, r.author, r.text, r.rating, r.status, ksd.title, kspr.product_id, kspr.seller_id, kspr.date_added FROM " . DB_PREFIX . "kb_mp_seller_product_review kspr INNER JOIN " . DB_PREFIX . "review r ON (kspr.product_review_id = r.review_id) INNER JOIN " . DB_PREFIX . "product_description pd ON (r.product_id = pd.product_id and pd.language_id = '" . (int) $this->config->get('config_language_id') . "') INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (kspr.seller_id = ksd.seller_id) WHERE ksd.seller_id = '" . (int) $data['seller_id'] . "'";

        if (isset($data['filter_rating']) && $data['filter_rating'] != '') {
            $sql .= " AND r.rating = '" . (int) $data['filter_rating'] . "'";
        }

        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND r.status = '" . (int) $data['filter_status'] . "'";
        }

        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(kspr.date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }

        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(kspr.date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }

        $sql .= " GROUP BY r.review_id";

        $sql .= " ORDER BY kspr.date_added";

        $sql .= " DESC";

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

    /*
     * Function to get total sellers products reviews count
     */

    public function getTotalSellersProductReviews($data = array()) {
        $sql = "SELECT COUNT(DISTINCT r.review_id) AS total FROM " . DB_PREFIX . "kb_mp_seller_product_review kspr INNER JOIN " . DB_PREFIX . "review r ON (kspr.product_review_id = r.review_id) INNER JOIN " . DB_PREFIX . "product_description pd ON (r.product_id = pd.product_id and pd.language_id = '" . (int) $this->config->get('config_language_id') . "') INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (kspr.seller_id = ksd.seller_id) WHERE ksd.seller_id = '" . (int) $data['seller_id'] . "'";

        if (isset($data['filter_rating']) && $data['filter_rating'] != '') {
            $sql .= " AND r.rating = '" . (int) $data['filter_rating'] . "'";
        }

        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND r.status = '" . (int) $data['filter_status'] . "'";
        }

        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(kspr.date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }

        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(kspr.date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    /*
     * Function to delete Product Reviews of Seller from database
     */

    public function deleteProductReview($review_id, $seller_id) {
        //Delete sellers product review
        if ($this->db->query("DELETE FROM " . DB_PREFIX . "kb_mp_seller_product_review WHERE seller_id = '" . (int) $seller_id . "' AND product_review_id = '" . (int) $review_id . "'")) {
            $this->db->query("DELETE FROM " . DB_PREFIX . "review WHERE review_id = '" . (int) $review_id . "'");
        }
    }

    /*
     * Function definition to get the list of seller reviews
     */

    public function getSellerReviews($data = array()) {
        $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller_review WHERE seller_id = '" . (int) $data['seller_id'] . "'";

        if (isset($data['filter_rating']) && $data['filter_rating'] != '') {
            $sql .= " AND rating = '" . (int) $data['filter_rating'] . "'";
        }

        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND approved = '" . (int) $data['filter_status'] . "'";
        }

        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }

        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }

        $sql .= " ORDER BY date_added";

        $sql .= " DESC";

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

    /*
     * Function to get total seller reviews count
     */

    public function getTotalSellerReviews($data = array()) {
        $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "kb_mp_seller_review WHERE seller_id = '" . (int) $data['seller_id'] . "'";

        if (isset($data['filter_rating']) && $data['filter_rating'] != '') {
            $sql .= " AND rating = '" . (int) $data['filter_rating'] . "'";
        }

        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND approved = '" . (int) $data['filter_status'] . "'";
        }

        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }

        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }

        $query = $this->db->query($sql);

        if (isset($query->row['total'])) {
            return $query->row['total'];
        } else {
            return 0;
        }
    }

    /*
     * Function to get average rating of seller
     */

    public function getSellerRating($data = array()) {
        $sql = "SELECT AVG(rating) AS rating FROM " . DB_PREFIX . "kb_mp_seller_review WHERE seller_id = '" . (int) $data['seller_id'] . "'";

        if (isset($data['filter_status']) && $data['filter_status'] != '') {
            $sql .= " AND approved = '" . (int) $data['filter_status'] . "'";
        }

        $query = $this->db->query($sql);

        if (isset($query->row['rating'])) {
            return $query->row['rating'];
        } else {
            return 0;
        }
    }

    /*
     * Function to delete Seller Reviews from database
     */

    public function deleteSellerReview($review_id, $seller_id) {
        //Delete seller review
        $this->db->query("DELETE FROM " . DB_PREFIX . "kb_mp_seller_review WHERE seller_id = '" . (int) $seller_id . "' AND seller_review_id = '" . (int) $review_id . "'");
    }

    /*
     * Function definition to get the Seller Transaction History
     */

    public function getSellerTransactionHistory($data = array()) {

        $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller_transaction WHERE seller_id = '" . (int) $data['seller_id'] . "'";

        if (isset($data['filter_transaction_type']) && $data['filter_transaction_type'] != '') {
            $sql .= " AND transaction_type = '" . (int) $data['filter_transaction_type'] . "'";
        }

        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }

        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }

        $sql .= " ORDER BY date_added";

        $sql .= " DESC";

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

    /*
     * Function to get total count of Seller Transaction History
     */

    public function getTotalSellerTransactionHistory($data = array()) {

        $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "kb_mp_seller_transaction WHERE seller_id = '" . (int) $data['seller_id'] . "'";

        if (isset($data['filter_transaction_type']) && $data['filter_transaction_type'] != '') {
            $sql .= " AND transaction_type = '" . (int) $data['filter_transaction_type'] . "'";
        }

        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }

        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }

        $query = $this->db->query($sql);

        if (isset($query->row['total'])) {
            return $query->row['total'];
        } else {
            return 0;
        }
    }

    /*
     * Function definition to get the Seller Earning History
     */

    public function getSellerEarningHistory($data = array()) {

        if (!empty($data['filter_report_format'])) {
            switch ($data['filter_report_format']) {
                case 1:
                    $field = " DATE(ksod.date_added) as date";
                    $group_by = " GROUP BY DATE(ksod.date_added)";
                    $order_by = " ORDER BY DATE(ksod.date_added)";
                    break;
                case 2:
                    $field = " WEEK(ksod.date_added) as week, YEAR(ksod.date_added) as year";
                    $group_by = " GROUP BY WEEK(ksod.date_added), YEAR(ksod.date_added)";
                    $order_by = " ORDER BY WEEK(ksod.date_added), YEAR(ksod.date_added)";
                    break;
                case 3:
                    $field = " MONTH(ksod.date_added) as month, YEAR(ksod.date_added) as year";
                    $group_by = " GROUP BY MONTH(ksod.date_added), YEAR(ksod.date_added)";
                    $order_by = " ORDER BY MONTH(ksod.date_added), YEAR(ksod.date_added)";
                    break;
                case 4:
                    $field = " YEAR(ksod.date_added) as year";
                    $group_by = " GROUP BY YEAR(ksod.date_added)";
                    $order_by = " ORDER BY YEAR(ksod.date_added)";
                    break;
            }
        } else {
            $field = " DATE(ksod.date_added) as date";
            $group_by = " GROUP BY DATE(ksod.date_added)";
            $order_by = " ORDER BY DATE(ksod.date_added)";
        }

      //  $sql = "SELECT " . $field . ", COUNT(DISTINCT order_id) AS total_order, SUM(qty) AS products_sold, SUM(total_earning) as order_total, SUM(seller_earning) as seller_earning FROM " . DB_PREFIX . "kb_mp_seller_order_detail WHERE seller_id = '" . (int) $data['seller_id'] . "' and is_canceled = '0' AND is_consider = '1'";
      
        $sql = "SELECT " . $field . ",os.name, COUNT(DISTINCT ksod.order_id) AS total_order, SUM(ksod.qty) AS products_sold, SUM(ksod.total_earning + ksod.shipping) as order_total, SUM(ksod.seller_earning + ksod.shipping) as seller_earning FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod INNER JOIN " . DB_PREFIX . "order o ON (ksod.order_id = o.order_id) INNER JOIN " . DB_PREFIX . "order_status os ON (o.order_status_id = os.order_status_id and os.language_id = '" . (int) $this->config->get('config_language_id') . "')  WHERE ksod.seller_id = '" . (int) $data['seller_id'] . "' and ksod.is_canceled = '0' AND ksod.is_consider = '1'";

            //condition for not taking cancelled order
            $this->load->model('setting/kbmp_marketplace');
            //store condition
            $store_id = $this->config->get('config_store_id');
            if (isset($store_id)){
                $store_id = $store_id;
            }else{
                $store_id = 0;
            }
            $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id); 
            $cancelled = $settings['kbmp_marketplace_setting']['cancel_order_status_value'];
            if (!empty($cancelled)){
               //condition to ignore cancelled order 
               $sql .= "AND os.name NOT IN ('".implode("','", $cancelled)."')";
            }  
            
        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }

        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }

        $sql .= $group_by . ' ' . $order_by . " DESC";

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
       
        return $query;
    }

    /*
     * Function to get total count of Seller Earning History
     */

    public function getTotalSellerEarningHistory($data = array()) {

        if (!empty($data['filter_report_format'])) {
            switch ($data['filter_report_format']) {
                case 1:
                    $group_by = " GROUP BY DATE(date_added)";
                    break;
                case 2:
                    $group_by = " GROUP BY WEEK(date_added), YEAR(date_added)";
                    break;
                case 3:
                    $group_by = " GROUP BY MONTH(date_added), YEAR(date_added)";
                    break;
                case 4:
                    $group_by = " GROUP BY YEAR(date_added)";
                    break;
            }
        } else {
            $group_by = " GROUP BY DATE(date_added)";
        }

        $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller_order_detail WHERE seller_id = '" . (int) $data['seller_id'] . "' and is_canceled = '0' AND is_consider = '1'";
        
        

        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }

        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }

        $sql .= $group_by;

        $sql = "SELECT COUNT(*) AS total FROM ($sql) groups";

        $query = $this->db->query($sql);

        if (isset($query->row['total'])) {
            return $query->row['total'];
        } else {
            return 0;
        }
    }

    /*
     * Function definition to get the Seller Earning Order-wise
     */

    public function getSellerEarningOrderWise($data = array()) {

        $sql = "SELECT ksod.order_id, SUM(ksod.qty) AS quantity, SUM(total_earning+shipping) AS order_total, SUM(seller_earning+shipping) AS seller_earning, ksod.date_added, os.name as order_status FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod INNER JOIN " . DB_PREFIX . "order o ON (o.order_id = ksod.order_id) INNER JOIN " . DB_PREFIX . "order_status os ON (os.order_status_id = o.order_status_id) WHERE ksod.seller_id = '" . (int) $data['seller_id'] . "' AND os.language_id = '" . (int) $this->config->get('config_language_id') . "'";

        if (!empty($data['filter_status'])) {
            $sql .= " AND o.order_status_id = '" . (int) $data['filter_status'] . "'";
        }

        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(ksod.date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }

        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(ksod.date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }

        $sql .= " GROUP BY ksod.order_id";

        $sql .= " ORDER BY ksod.date_added";

        $sql .= " DESC";

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

    /*
     * Function to get total count of Seller Earning Order Wise
     */

    public function getTotalSellerEarningOrderWise($data = array()) {

        $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod INNER JOIN " . DB_PREFIX . "order o ON (o.order_id = ksod.order_id) INNER JOIN " . DB_PREFIX . "order_status os ON (os.order_status_id = o.order_status_id) WHERE ksod.seller_id = '" . (int) $data['seller_id'] . "' AND os.language_id = '" . (int) $this->config->get('config_language_id') . "'";

        if (!empty($data['filter_status'])) {
            $sql .= " AND o.order_status_id = '" . (int) $data['filter_status'] . "'";
        }

        if (!empty($data['filter_from_date'])) {
            $sql .= " AND DATE(ksod.date_added) >= '" . $this->db->escape($data['filter_from_date']) . "'";
        }

        if (!empty($data['filter_to_date'])) {
            $sql .= " AND DATE(ksod.date_added) <= '" . $this->db->escape($data['filter_to_date']) . "'";
        }

        $query = $this->db->query($sql);

        if (isset($query->row['total'])) {
            return $query->row['total'];
        } else {
            return 0;
        }
    }

    /*
     * Function to get category details
     */

    public function getCategory($category_id) {
        $query = $this->db->query("SELECT DISTINCT *, (SELECT GROUP_CONCAT(cd1.name ORDER BY level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id AND cp.category_id != cp.path_id) WHERE cp.category_id = c.category_id AND cd1.language_id = '" . (int) $this->config->get('config_language_id') . "' GROUP BY cp.category_id) AS path, (SELECT DISTINCT keyword FROM " . DB_PREFIX . "seo_url WHERE query = 'category_id=" . (int) $category_id . "'AND language_id = '" . (int) $this->config->get('config_language_id') . "') AS keyword FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (c.category_id = cd2.category_id) WHERE c.category_id = '" . (int) $category_id . "' AND cd2.language_id = '" . (int) $this->config->get('config_language_id') . "'");

        return $query->row;
    }

    /*
     * Function to add seller product in seller table
     */

    public function addSellerProduct($seller_id, $product_id, $approvalRequired) {
        if (isset($approvalRequired) && $approvalRequired) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "kb_mp_seller_product SET seller_product_id = '', seller_id = '" . (int) $seller_id . "', store_id = '" . (int) $this->config->get('config_store_id') . "', product_id = '" . (int) $product_id . "', date_added = now()");
        } else {
            $this->db->query("INSERT INTO " . DB_PREFIX . "kb_mp_seller_product SET seller_product_id = '', seller_id = '" . (int) $seller_id . "', store_id = '" . (int) $this->config->get('config_store_id') . "', product_id = '" . (int) $product_id . "', approved = '1', date_added = now()");
        }
    }

    /*
     * Function definition to get the list of sellers category requests
     */

    public function getSellerCategoryRequest($data = array()) {
        $sql = "SELECT kscr.seller_category_request_id, kscr.seller_id, kscr.category_id, kscr.approved, kscr.date_added, kscr.comment, kscr.disapprove_comment, cd.name FROM " . DB_PREFIX . "kb_mp_seller_category_request kscr INNER JOIN " . DB_PREFIX . "category_description cd ON (kscr.category_id = cd.category_id AND cd.language_id = '" . (int) $this->config->get('config_language_id') . "') WHERE kscr.seller_id = '" . (int) $data['seller_id'] . "'";

        if (!empty($data['filter_category'])) {
            $sql .= " AND kscr.category_id = '" . (int) $data['filter_category'] . "'";
        }

        if (!empty($data['filter_status'])) {
            $sql .= " AND kscr.approved = '" . (int) $data['filter_status'] . "'";
        }

        $sql .= " ORDER BY kscr.date_added DESC";

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

    /*
     * Function to get total seller category requests count
     */

    public function getTotalSellerCategoryRequest($data = array()) {

        $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "kb_mp_seller_category_request kscr INNER JOIN " . DB_PREFIX . "category_description cd ON (kscr.category_id = cd.category_id AND cd.language_id = '" . (int) $this->config->get('config_language_id') . "') WHERE kscr.seller_id = '" . (int) $data['seller_id'] . "'";

        if (!empty($data['filter_category'])) {
            $sql .= " AND kscr.category_id = '" . (int) $data['filter_category'] . "'";
        }

        if (!empty($data['filter_status'])) {
            $sql .= " AND kscr.approved = '" . (int) $data['filter_status'] . "'";
        }

        $query = $this->db->query($sql);

        if (isset($query->row['total'])) {
            return $query->row['total'];
        } else {
            return 0;
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
        $sql = "SELECT category_id FROM " . DB_PREFIX . "kb_mp_seller_category WHERE store_id = '" . (int) $this->config->get('config_store_id') . "' AND seller_id = '" . (int) $seller_id . "'";

        $query = $this->db->query($sql);

        return $query->rows;
    }

    /*
     * Function to get Requested categories list
     */

    public function getRequestedCategories($seller_id) {
        $sql = "SELECT category_id FROM " . DB_PREFIX . "kb_mp_seller_category_request WHERE store_id = '" . (int) $this->config->get('config_store_id') . "' AND seller_id = '" . (int) $seller_id . "' AND approved = '0'";

        $query = $this->db->query($sql);

        return $query->rows;
    }

    /*
     * Function to save category request raised by seller
     */

    public function createCategoryRequest($data, $seller_id) {
        $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_category_request SET seller_category_request_id = '', seller_id = '" . (int) $seller_id . "', store_id = '" . (int) $this->config->get('config_store_id') . "', category_id = '" . (int) $data['available_categories'] . "', comment = '" . $this->db->escape($data['request_reason']) . "', date_added = now()";

        $this->db->query($sql);
    }

    public function getAssignedCategoriesList($data = array()) {

        $seller = $this->getSellerByCustomerId();

        $sql = "SELECT cp.category_id AS category_id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') AS name, c1.parent_id, c1.sort_order FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "category c1 ON (cp.category_id = c1.category_id) LEFT JOIN " . DB_PREFIX . "category c2 ON (cp.path_id = c2.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (cp.category_id = cd2.category_id) LEFT JOIN " . DB_PREFIX . "kb_mp_seller_category ksc ON (ksc.category_id = cp.category_id) WHERE ksc.seller_id = '" . (int) $seller['seller_id'] . "' AND cd1.language_id = '" . (int) $this->config->get('config_language_id') . "' AND cd2.language_id = '" . (int) $this->config->get('config_language_id') . "'";

        if (!empty($data['filter_name'])) {
            $sql .= " AND cd2.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }

        $sql .= " GROUP BY cp.category_id";

        $sort_data = array(
            'name',
            'sort_order'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY sort_order";
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
     * Function to get Product seller details
     */

    public function getProductSeller($product_id) {
        $sql = "SELECT ksd.seller_id, ksd.title FROM " . DB_PREFIX . "kb_mp_seller_details ksd INNER JOIN " . DB_PREFIX . "kb_mp_seller_product ksp ON (ksd.seller_id = ksp.seller_id) AND ksp.product_id = '" . (int) $product_id . "' AND ksd.language_id = '" . (int) $this->config->get('config_language_id') . "'";
		 
        $query = $this->db->query($sql);

        return $query->row;
    }

    /*
     * Function to add seller review into database table
     */

    public function addSellerReview($data, $seller_id, $approvalRequired) {
        if (isset($approvalRequired) && $approvalRequired) {
            $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_review SET seller_review_id = '', seller_id = '" . (int) $seller_id . "', customer_id = '" . (int) $this->customer->getId() . "', store_id = '" . (int) $this->config->get('config_store_id') . "', author = '" . $this->db->escape($data['name']) . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int) $data['rating'] . "', date_added = now()";
        } else {
            $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_review SET seller_review_id = '', seller_id = '" . (int) $seller_id . "', customer_id = '" . (int) $this->customer->getId() . "', store_id = '" . (int) $this->config->get('config_store_id') . "', author = '" . $this->db->escape($data['name']) . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int) $data['rating'] . "', approved = '1', date_added = now()";
        }

        $this->db->query($sql);
    }

    /*
     * Function to add seller product review into database table
     */

    public function addSellerProductReview($product_id, $seller_id) {
        //$review_id = $this->db->getLastId();
        $last_review = $this->db->query("SELECT review_id FROM " . DB_PREFIX . "review ORDER BY review_id DESC LIMIT 0, 1");
        $review_id = $last_review->row['review_id'];

        $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_product_review SET seller_product_review_id = '', seller_id = '" . (int) $seller_id . "', customer_id = '" . (int) $this->customer->getId() . "', store_id = '" . (int) $this->config->get('config_store_id') . "', product_id = '" . (int) $product_id . "', product_review_id = '" . (int) $review_id . "', date_added = now()";

        $this->db->query($sql);
    }

    /*
     * Function definition to get seller config
     */

    public function getSellerConfig($seller_id) {
        $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller_config WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $this->config->get('config_store_id') . "' AND use_global = '0'";

        $query = $this->db->query($sql);

        return $query->rows;
    }

    /*
     * Function to get Seller Shipping
     */

    public function getSellerShipping($seller_id) {
        $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller_shipping WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $this->config->get('config_store_id') . "'";

        $query = $this->db->query($sql);

        return $query->rows;
    }

    /*
     * Function to delete seller shipping details
     */

    public function deleteShipping($seller_id) {
        $sql = "DELETE FROM " . DB_PREFIX . "kb_mp_seller_shipping WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $this->config->get('config_store_id') . "'";

        if ($this->db->query($sql)) {
            return true;
        }
    }

    /*
     * Function to add shipping details
     */

    public function addShipping($data) {
        $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_shipping SET shipping_id = '', seller_id = '" . (int) $data['seller_id'] . "', store_id = '" . (int) $this->config->get('config_store_id') . "', geo_zone_id = '" . (int) $data['geo_zone_id'] . "', weight_from = '" . $data['weight_from'] . "', weight_to = '" . $data['weight_to'] . "', rate = '" . $data['rate'] . "', date_added = now()";

        $this->db->query($sql);
    }

    /*
     * Function to get shipping method quote
     */

    public function getQuote($address) {
        $this->load->language('kbmp_marketplace/checkout');

        $quote_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "geo_zone ORDER BY name");

        foreach ($query->rows as $result) {
            $shipping = 0;
            $total_weight = 0;
            $weight = array();

            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int) $result['geo_zone_id'] . "' AND country_id = '" . (int) $address['country_id'] . "' AND (zone_id = '" . (int) $address['zone_id'] . "' OR zone_id = '0')");

            if ($query->num_rows) {
                $status = true;
            } else {
                $status = false;
            }

            if ($status) {
                $cost = '';
                $cart_products = $this->cart->getProducts();
                //var_dump($cart_products); die;
                if (isset($cart_products) && !empty($cart_products)) {
                    foreach ($cart_products as $cart_product) {
                        //Get Product Seller
                        $seller = $this->getProductSeller($cart_product['product_id']);
                        if (isset($seller) && !empty($seller)) {
                            if (isset($weight[$seller['seller_id']])) {
                                $weight[$seller['seller_id']] = $weight[$seller['seller_id']] + $this->weight->convert($cart_product['weight'], $cart_product['weight_class_id'], $this->config->get('config_weight_class_id'));
                            } else {
                                $weight[$seller['seller_id']] = $this->weight->convert($cart_product['weight'], $cart_product['weight_class_id'], $this->config->get('config_weight_class_id'));
                            }
                            $total_weight = $total_weight + $this->weight->convert($cart_product['weight'], $cart_product['weight_class_id'], $this->config->get('config_weight_class_id'));
                        }
                    }
                }

                //Get Shipping price by weight of each seller
                if (isset($weight) && !empty($weight)) {
                    foreach ($weight as $key => $value) {
                        $rate = $this->getSellerShippingByWeightAndZone($key, $result['geo_zone_id'], $value);
                        if (isset($rate) && !empty($rate)) {
                            $shipping = $shipping + $rate;
                        }
                    }
                }

                if (isset($shipping) && !empty($shipping)) {
                    $quote_data['marketplace_custom_shipping_' . $result['geo_zone_id']] = array(
                        'geo_zone_id' => $result['geo_zone_id'],
                        'code' => 'marketplace_custom_shipping.marketplace_custom_shipping_' . $result['geo_zone_id'],
                        'title' => $this->language->get('text_marketplace') . ' ' . $result['name'] . '  (' . $this->language->get('text_weight') . ' ' . $this->weight->format($total_weight, $this->config->get('config_weight_class_id')) . ')',
                        'cost' => $shipping,
                        'tax_class_id' => $this->config->get('weight_tax_class_id'),
                        'text' => $this->currency->format($this->tax->calculate($shipping, $this->config->get('weight_tax_class_id'), $this->config->get('config_tax')), $this->session->data['currency'])
                    );
                }
            }
        }

        $method_data = array();

        if ($quote_data) {
            $method_data = array(
                'code' => 'marketplace_custom_shipping',
                'title' => $this->language->get('text_title'),
                'quote' => $quote_data,
                'sort_order' => 0,
                'error' => false
            );
        }

        return $method_data;
    }

    /*
     * Function to get Seller Shipping by weight and zone
     */

    public function getSellerShippingByWeightAndZone($seller_id, $geo_zone, $weight) {
        $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller_shipping WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $this->config->get('config_store_id') . "' AND geo_zone_id = '" . (int) $geo_zone . "' AND weight_from <= '" . $weight . "' AND weight_to >= '" . $weight . "' AND status = 'active'";

        $query = $this->db->query($sql);

        if (isset($query->row['rate'])) {
            return $query->row['rate'];
        } else {
            $sql = "SELECT max(rate) as rate FROM " . DB_PREFIX . "kb_mp_seller_shipping WHERE seller_id = '" . (int) $seller_id . "' AND store_id = '" . (int) $this->config->get('config_store_id') . "' AND geo_zone_id = '" . (int) $geo_zone . "' AND status = 'active'";

            $query = $this->db->query($sql);

            if (isset($query->row['rate'])) {
                return $query->row['rate'];
            } else {
                return '';
            }
        }
    }

    /*
     * Function to update is_consider bit of order
     */

    public function considerOrder($order_id) {
        if (isset($order_id) && !empty($order_id)) {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_order_detail SET is_consider = '1' WHERE order_id = '" . (int) $order_id . "'";
            $this->db->query($sql);
        }
    }

    /*
     * Function to add order details in Marketplace DB Table
     */

    public function addOrder($data) {
        

        if (isset($data) && !empty($data)) {
            //Get Seller ID of product
            $seller = $this->getProductSeller($data['product_id']);
 
            
            if (isset($seller) && !empty($seller)) {

                //Get Ordered Product Category
                $category_id = 0;
                $this->load->model('catalog/product');
                $product_categories = $this->model_catalog_product->getCategories($data['product_id']);
                if (isset($product_categories) && !empty($product_categories)) {
                    foreach ($product_categories as $product_category) {
                        if (isset($product_category['category_id']) && !empty($product_category['category_id'])) {
                            $category_id = $product_category['category_id'];
                            break;
                        }
                    }
                }

     
                $this->load->model('setting/kbmp_marketplace');
                $store_id = (int) $this->config->get('config_store_id');
                $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);

                //Get Seller Configuration to overwrite default configuration if set exclusively for seller
                $seller_config = $this->getSellerConfig($seller['seller_id'], $store_id);
                if (isset($seller_config) && !empty($seller_config)) {
                    foreach ($seller_config as $sellerconfig) {
                        $settings['kbmp_marketplace_setting'][$sellerconfig['key']] = $sellerconfig['value'];
                    }
                }

                //Calculate commision and seller/admin earning values
                $commission_percent = $settings['kbmp_marketplace_setting']['kbmp_default_commission'];
                
                    //get customer id from seller id

                $sql_seller_cus_id = "SELECT customer_id FROM ".DB_PREFIX."kb_mp_seller WHERE seller_id =".(int)$seller['seller_id']; 
                $result = $this->db->query($sql_seller_cus_id);
                $seller_cust_id = $result->row['customer_id'];
                //check category condition added by gopi
                $sql_check_category_commision = "SELECT commission FROM ".DB_PREFIX."kb_mp_category_commission WHERE seller_cust_id =".(int)$seller_cust_id." && category_id =".(int)$category_id;

                $result = $this->db->query($sql_check_category_commision);
                if ($result->num_rows > 0){
                    $commission_percent = $result->row['commission'];
                }
                $total_tax = $data['tax'] * $data['quantity'];
                $total_earning = ($data['unit_price'] * $data['quantity'])+$total_tax ;
                
                //code for coupon applied by gopi 
                $this->load->model('extension/total/coupon');
                if (isset($this->session->data['coupon'])) {

                $coupon_info = $this->model_extension_total_coupon->getCoupon($this->session->data['coupon']);
                
                if(isset($coupon_info['product'])){
                   
                    if (!empty($coupon_info['product']) || count($coupon_info['product']) > 0){
                        if ($coupon_info['type']== 'P'){
                            $total_earning = $data['unit_price'] * $data['quantity']-$coupon_info['discount']*$data['unit_price'] * $data['quantity']/100;
                        }else if($coupon_info['type']=='F') {
                            $total_earning = ($data['unit_price'] * $data['quantity'])-$coupon_info['discount'];
                        }
                    }                    
                }
                } 
                //seller earning means admin earning and vice versa here
                $seller_earning = round(($total_earning * $commission_percent) / 100, 2);
                $admin_earning = round(($total_earning - $seller_earning), 2);
                //code for tax include in commission
                
                if(!($settings['kbmp_marketplace_setting']['kbmp_enable_include_product_tax'])){
                    $total_earning_temp = $total_earning;
                    $seller_earning = round((($total_earning_temp-$total_tax) * $commission_percent) / 100, 2);
                    $admin_earning = round(($total_earning - $seller_earning), 2);
                }

                $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_order_detail SET seller_order_detail_id = '', seller_id = '" . (int) $seller['seller_id'] . "', order_id = '" . (int) $data['order_id'] . "', store_id = '" . (int) $store_id . "', category_id = '" . (int) $category_id . "', product_id = '" . (int) $data['product_id'] . "', order_detail_id = '" . (int) $data['order_detail_id'] . "', commission_percent = '" . (float) $commission_percent . "', total_earning = '" . (float) $total_earning . "', seller_earning = '" . (float) $admin_earning . "', admin_earning = '" . (float) $seller_earning . "', unit_price = '" . (float) $data['unit_price'] . "', qty = '" . (int) $data['quantity'] . "',status='0', is_consider = '" . (int) $data['is_consider'] . "', date_added = now()";
                $this->db->query($sql);
            }
        }
    }
    
    public function updateCommission($id,$order_id){
            //Get Seller ID of product
            $store_id = (int) $this->config->get('config_store_id');
            $sql = "SELECT shipping,total_earning,commission_percent FROM " . DB_PREFIX . "kb_mp_seller_order_detail WHERE order_id = '" . (int) $order_id . "' AND product_id =".(int)$id." AND store_id =".(int)$store_id;
            $result = $this->db->query($sql);
            
            if (isset($result->row['shipping']) && $result->num_rows > 0 && $result->row['shipping'] != '' ) {
                $commission_percent = $result->row['commission_percent'];
                $total_earning = $result->row['total_earning'] + $result->row['shipping'] ;
                $seller_earning = round(($total_earning * $commission_percent) / 100, 2);
                $admin_earning = round(($total_earning - $seller_earning), 2);

                $sqlUpdate = "UPDATE " . DB_PREFIX . "kb_mp_seller_order_detail SET commission_percent = '" . (float) $commission_percent . "', total_earning = '" . (float) $total_earning . "', seller_earning = '" . (float) $admin_earning . "', admin_earning = '" . (float) $seller_earning . "' WHERE store_id =".(int)$store_id." AND order_id =".(int)$order_id." AND product_id =".(int)$id;
                $this->db->query($sqlUpdate);
            }
    }

    /*
     * Function to update shipping of Order
     */

    public function updateOrderShipping($order_id, $shipping_zone) {
        if (isset($order_id) && !empty($order_id) && isset($shipping_zone) && !empty($shipping_zone)) {
            $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller_order_detail WHERE order_id = '" . (int) $order_id . "'";
            $sellers = $this->db->query($sql);

            if (isset($sellers) && !empty($sellers)) {
                $weight = array();
                foreach ($sellers->rows as $seller) {
                    //Get Total Ordered Products Weight
                    //Get Product Details
                    $product = $this->getProduct($seller['product_id']);

                    if (isset($weight[$seller['seller_id']])) {
                        $weight[$seller['seller_id']] = $weight[$seller['seller_id']] + $this->weight->convert($product['weight'], $product['weight_class_id'], $this->config->get('config_weight_class_id'));
                    } else {
                        $weight[$seller['seller_id']] = $this->weight->convert($product['weight'], $product['weight_class_id'], $this->config->get('config_weight_class_id'));
                    }
                }

                //Get Shipping price by weight of each seller
                if (isset($weight) && !empty($weight)) {
                    foreach ($weight as $key => $value) {
                        $rate = $this->getSellerShippingByWeightAndZone($key, $shipping_zone, $value);
                        //shipping price fixed for muti seller product
                        $sql = "SELECT COUNT(product_id) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail WHERE order_id = '" . (int) $order_id . "' AND seller_id =".(int)$key;
                        $result = $this->db->query($sql);
                        $rate = $rate/$result->row['total'];
                        
                        if (isset($rate) && !empty($rate)) {
                            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_order_detail SET shipping = '" . $rate . "' WHERE seller_id = '" . (int) $key . "' AND order_id = '" . (int) $order_id . "'";
                            $this->db->query($sql);
                        }
                    }
                }
            }
        }
    }

    /*
     * Function to get order shipping
     */

    public function getOrderShipping($order_id, $seller_id) {
        if (isset($order_id) && !empty($order_id) && isset($seller_id) && !empty($seller_id)) {
            $sql = "SELECT SUM(shipping) as shipping FROM " . DB_PREFIX . "kb_mp_seller_order_detail WHERE order_id = '" . (int) $order_id . "' AND seller_id = '" . (int) $seller_id . "' GROUP BY order_id";
            $query = $this->db->query($sql);

            return $query->row;
        }
    }

    /*
     * Function to update order product status
     */

    public function updateOrderProductStatus($order_id, $product_id, $status) {
        $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_order_detail SET status = '" . $this->db->escape($status) . "' WHERE order_id = '" . (int) $order_id . "' AND product_id = '" . (int) $product_id . "'";
        $this->db->query($sql);
    }

    /*
     * Function to add order history
     */

    public function addOrderHistory($order_id, $comment) {
        if (isset($order_id) && !empty($order_id)) {
            $sql = "SELECT order_status_id FROM " . DB_PREFIX . "order WHERE order_id = '" . (int) $order_id . "'";
            $order_details = $this->db->query($sql);

            $sql = "INSERT INTO " . DB_PREFIX . "order_history SET order_history_id = '', order_id = '" . (int) $order_id . "', order_status_id = '" . $order_details->row['order_status_id'] . "', notify = 0, comment = '" . $this->db->escape($comment) . "', date_added = now()";
            $this->db->query($sql);
        }
    }

    /*
     * Function to check ordered products status complete or not
     */

    public function checkOrderedProductStatus($order_id) {
        if (isset($order_id) && !empty($order_id)) {
            $sql = "SELECT COUNT(*) as total FROM " . DB_PREFIX . "kb_mp_seller_order_detail WHERE order_id = '" . (int) $order_id . "' AND status != 'Complete' AND is_canceled = '0'";
            
            $output = $this->db->query($sql);
            
            if (isset($output->row['total']) && empty($output->row['total'])) {
                return true;
            } else {
                return false;
            }
        }
        return false;
    }

    /*
     * Function to get the total number of orders for dashboard graph
     */

    public function getTotalSellerOrdersList($type) {
        if (isset($type) && !empty($type)) {
            switch ($type) {
                case 'lastweek':
                    $sql = "SELECT COUNT(DISTINCT ksod.order_id) as total, DATE(ksod.date_added) FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.date_added >= '" . date("Y-m-d 00:00:00", strtotime('monday this week')) . "' AND ksod.date_added <= '" . date("Y-m-d 00:00:00", strtotime('+6 Days')) . "' AND ksod.is_consider = '1' GROUP BY DATE(ksod.date_added)";
                    break;
            }

            $query = $this->db->query($sql);

            return $query->rows;
        }
        return false;
    }

    /*
     * Function to get the total number of ordered products for dashboard graph
     */

    public function getTotalSellerOrderedProductsList($type) {
        if (isset($type) && !empty($type)) {
            switch ($type) {
                case 'lastweek':
                    $sql = "SELECT SUM(ksod.qty) as total, DATE(ksod.date_added) FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.date_added >= '" . date("Y-m-d 00:00:00", strtotime('monday this week')) . "' AND ksod.date_added <= '" . date("Y-m-d 00:00:00", strtotime('+6 Days')) . "' AND ksod.is_consider = '1' GROUP BY DATE(ksod.date_added)";
                    break;
            }

            $query = $this->db->query($sql);

            return $query->rows;
        }
        return false;
    }

    /*
     * Function to get the total earning for dashboard graph
     */

    public function getTotalSellerEarningList($type) {
        if (isset($type) && !empty($type)) {
            switch ($type) {
                case 'lastweek':
                    $sql = "SELECT SUM(ksod.seller_earning) as total, DATE(ksod.date_added) FROM " . DB_PREFIX . "kb_mp_seller_order_detail ksod LEFT JOIN " . DB_PREFIX . "kb_mp_seller ks ON (ksod.seller_id = ks.seller_id) WHERE ks.customer_id = '" . (int) $this->customer->getId() . "' AND ksod.date_added >= '" . date("Y-m-d 00:00:00", strtotime('monday this week')) . "' AND ksod.date_added <= '" . date("Y-m-d 00:00:00", strtotime('+6 Days')) . "' AND ksod.is_consider = '1' GROUP BY DATE(ksod.date_added)";
                    break;
            }

            $query = $this->db->query($sql);

            return $query->rows;
        }
        return false;
    }

    /*
     * Function to get email template
     */

    public function getEmailTemplate($template_id) {
        if (isset($template_id) && !empty($template_id)) {
            $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_email_templates WHERE template_id = '" . (int) $template_id . "' AND language_id = '" . (int) $this->config->get('config_language_id') . "'";
            $query = $this->db->query($sql);

            return $query->row;
        }
    }

    /*
     * Function to get seller account details
     */

    public function getSellerAccountDetails($seller_id) {
        if (isset($seller_id) && !empty($seller_id)) {
            $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller ks INNER JOIN " . DB_PREFIX . "kb_mp_seller_details ksd ON (ks.seller_id = ksd.seller_id) INNER JOIN " . DB_PREFIX . "customer c ON (ks.customer_id = c.customer_id) WHERE ks.seller_id = '" . (int) $seller_id . "'";
            $query = $this->db->query($sql);

            return $query->row;
        }
    }

    /*
     * Function to create seller accoutn approval request
     */

    public function sendApprovalRequestAgain($seller_id) {
        if (isset($seller_id) && !empty($seller_id)) {
            $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller SET approved = '0' WHERE seller_id = '" . (int) $seller_id . "'";
            if ($this->db->query($sql)) {
                return true;
            }
        }
        return false;
    }

    /*
     * Function to get order email template
     */

    public function getOrderEmailTemplate() {
        $sql = "SELECT * FROM  " . DB_PREFIX . "setting WHERE `code` = 'kbmp_marketplace' AND `key` = 'kbmp_marketplace_order_email_template'";
        $query = $this->db->query($sql);

        if (isset($query->row['value']) && !empty($query->row['value'])) {
            return json_decode($query->row['value'], true);
        }
        return false;
    }

    /*
     * Function to add seller products into tracking
     */

    public function addSellerProductsForTracking($seller_id, $products) {
        if (isset($seller_id) && !empty($seller_id) && isset($products) && !empty($products)) {
            foreach ($products as $product) {
                $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_product_tracking SET tracking_id = '', seller_id = '" . (int) $seller_id . "', product_id = '" . (int) $product['product_id'] . "', date_added = now()";
                $this->db->query($sql);
            }
            return true;
        }
    }

    /*
     * Function to update product status
     */

    public function updateProductStatus($product_id, $status) {
        $sql = "UPDATE " . DB_PREFIX . "product SET status = '" . $status . "' WHERE product_id = '" . (int) $product_id . "'";

        if ($this->db->query($sql)) {
            return true;
        }
        return false;
    }

    /*
     * Function to update product status
     */

    public function updateProductApprovalStatus($product_id, $status) {
        $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_product SET approved = '" . $status . "' WHERE product_id = '" . (int) $product_id . "'";

        if ($this->db->query($sql)) {
            return true;
        }
        return false;
    }

    //Start Function to get Total Count of seller products at the time of New Product add to check New Product Limit set for seller 24-Dec-2018 - Harsh Agarwal
    public function getTotalSellerNewProducts($data, $is_seller = 0) {
        $sql = "SELECT COUNT(DISTINCT p.product_id) AS total";

        $sql .= " FROM " . DB_PREFIX . "product p";

        $sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)";

        if (!empty($data['seller_id'])) {
            $sql .= " LEFT JOIN " . DB_PREFIX . "kb_mp_seller_product ksp ON (p.product_id = ksp.product_id)";
        }

        $sql .= " WHERE pd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "'";

        if (!empty($data['seller_id'])) {
            $sql .= " AND ksp.seller_id = '" . (int) $data['seller_id'] . "' AND ksp.deleted = '0' AND ksp.store_id = '" . (int) $this->config->get('config_store_id') . "'";
            if (!$is_seller) {
                $sql .= " AND ksp.approved = '1'";
            }
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    //End
    // Return manager BOC
    public function addReturn($data) {
        $this->db->query("INSERT INTO `" . DB_PREFIX . "return` SET order_id = '" . (int) $data['order_id'] . "', product_id = '" . (int) $data['product_id'] . "', customer_id = '" . (int) $data['customer_id'] . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', product = '" . $this->db->escape($data['product']) . "', model = '" . $this->db->escape($data['model']) . "', quantity = '" . (int) $data['quantity'] . "', opened = '" . (int) $data['opened'] . "', return_reason_id = '" . (int) $data['return_reason_id'] . "', return_action_id = '" . (int) $data['return_action_id'] . "', return_status_id = '" . (int) $data['return_status_id'] . "', comment = '" . $this->db->escape($data['comment']) . "', date_ordered = '" . $this->db->escape($data['date_ordered']) . "', date_added = NOW(), date_modified = NOW()");

        return $this->db->getLastId();
    }

    public function editReturn($return_id, $data) {
        $this->db->query("UPDATE `" . DB_PREFIX . "return` SET order_id = '" . (int) $data['order_id'] . "', product_id = '" . (int) $data['product_id'] . "', customer_id = '" . (int) $data['customer_id'] . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', product = '" . $this->db->escape($data['product']) . "', model = '" . $this->db->escape($data['model']) . "', quantity = '" . (int) $data['quantity'] . "', opened = '" . (int) $data['opened'] . "', return_reason_id = '" . (int) $data['return_reason_id'] . "', return_action_id = '" . (int) $data['return_action_id'] . "', comment = '" . $this->db->escape($data['comment']) . "', date_ordered = '" . $this->db->escape($data['date_ordered']) . "', date_modified = NOW() WHERE return_id = '" . (int) $return_id . "'");
    }

    public function deleteReturn($return_id) {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "return` WHERE return_id = '" . (int) $return_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "return_history WHERE return_id = '" . (int) $return_id . "'");
    }

    public function getReturn($return_id) {
        $query = $this->db->query("SELECT DISTINCT *, (SELECT CONCAT(c.firstname, ' ', c.lastname) FROM " . DB_PREFIX . "customer c WHERE c.customer_id = r.customer_id) AS customer FROM `" . DB_PREFIX . "return` r WHERE r.return_id = '" . (int) $return_id . "'");

        return $query->row;
    }

    public function getReturns($data = array()) {
        $sql = "SELECT *, CONCAT(r.firstname, ' ', r.lastname) AS customer, (SELECT rs.name FROM " . DB_PREFIX . "return_status rs WHERE rs.return_status_id = r.return_status_id AND rs.language_id = '" . (int) $this->config->get('config_language_id') . "') AS status FROM `" . DB_PREFIX . "return` r";

        $implode = array();

        if (!empty($data['filter_return_id'])) {
            $implode[] = "r.return_id = '" . (int) $data['filter_return_id'] . "'";
        }

        if (!empty($data['filter_order_id'])) {
            $implode[] = "r.order_id = '" . (int) $data['filter_order_id'] . "'";
        }

        if (!empty($data['filter_customer'])) {
            $implode[] = "CONCAT(r.firstname, ' ', r.lastname) LIKE '" . $this->db->escape($data['filter_customer']) . "%'";
        }

        if (!empty($data['filter_product'])) {
            $implode[] = "r.product = '" . $this->db->escape($data['filter_product']) . "'";
        }

        if (!empty($data['filter_model'])) {
            $implode[] = "r.model = '" . $this->db->escape($data['filter_model']) . "'";
        }

        if (!empty($data['filter_return_status_id'])) {
            $implode[] = "r.return_status_id = '" . (int) $data['filter_return_status_id'] . "'";
        }

        if (!empty($data['filter_date_added'])) {
            $implode[] = "DATE(r.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
        }

        if (!empty($data['filter_date_modified'])) {
            $implode[] = "DATE(r.date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
        }

        if ($implode) {
            $sql .= " WHERE " . implode(" AND ", $implode);
        }

        $sort_data = array(
            'r.return_id',
            'r.order_id',
            'customer',
            'r.product',
            'r.model',
            'status',
            'r.date_added',
            'r.date_modified'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY r.return_id";
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

    public function getTotalReturns($data = array()) {
        $sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "return`r";

        $implode = array();

        if (!empty($data['filter_return_id'])) {
            $implode[] = "r.return_id = '" . (int) $data['filter_return_id'] . "'";
        }

        if (!empty($data['filter_customer'])) {
            $implode[] = "CONCAT(r.firstname, ' ', r.lastname) LIKE '" . $this->db->escape($data['filter_customer']) . "%'";
        }

        if (!empty($data['filter_order_id'])) {
            $implode[] = "r.order_id = '" . $this->db->escape($data['filter_order_id']) . "'";
        }

        if (!empty($data['filter_product'])) {
            $implode[] = "r.product = '" . $this->db->escape($data['filter_product']) . "'";
        }

        if (!empty($data['filter_model'])) {
            $implode[] = "r.model = '" . $this->db->escape($data['filter_model']) . "'";
        }

        if (!empty($data['filter_return_status_id'])) {
            $implode[] = "r.return_status_id = '" . (int) $data['filter_return_status_id'] . "'";
        }

        if (!empty($data['filter_date_added'])) {
            $implode[] = "DATE(r.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
        }

        if (!empty($data['filter_date_modified'])) {
            $implode[] = "DATE(r.date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
        }

        if ($implode) {
            $sql .= " WHERE " . implode(" AND ", $implode);
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getTotalReturnsByReturnStatusId($return_status_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "return` WHERE return_status_id = '" . (int) $return_status_id . "'");

        return $query->row['total'];
    }

    public function getTotalReturnsByReturnReasonId($return_reason_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "return` WHERE return_reason_id = '" . (int) $return_reason_id . "'");

        return $query->row['total'];
    }

    public function getTotalReturnsByReturnActionId($return_action_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "return` WHERE return_action_id = '" . (int) $return_action_id . "'");

        return $query->row['total'];
    }

    public function addReturnHistory($return_id, $data) {
        $this->db->query("UPDATE `" . DB_PREFIX . "return` SET return_status_id = '" . (int) $data['return_status_id'] . "', date_modified = NOW() WHERE return_id = '" . (int) $return_id . "'");

        $this->db->query("INSERT INTO " . DB_PREFIX . "return_history SET return_id = '" . (int) $return_id . "', return_status_id = '" . (int) $data['return_status_id'] . "', notify = '" . (isset($data['notify']) ? (int) $data['notify'] : 0) . "', comment = '" . $this->db->escape(strip_tags($data['comment'])) . "', date_added = NOW()");

        if ($data['notify']) {
            $return_query = $this->db->query("SELECT *, rs.name AS status FROM `" . DB_PREFIX . "return` r LEFT JOIN " . DB_PREFIX . "return_status rs ON (r.return_status_id = rs.return_status_id) WHERE r.return_id = '" . (int) $return_id . "' AND rs.language_id = '" . (int) $this->config->get('config_language_id') . "'");

            if ($return_query->num_rows) {
                $this->load->language('mail/return');

                $subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'), $return_id);

                $message = $this->language->get('text_return_id') . ' ' . $return_id . "\n";
                $message .= $this->language->get('text_date_added') . ' ' . date($this->language->get('date_format_short'), strtotime($return_query->row['date_added'])) . "\n\n";
                $message .= $this->language->get('text_return_status') . "\n";
                $message .= $return_query->row['status'] . "\n\n";

                if ($data['comment']) {
                    $message .= $this->language->get('text_comment') . "\n\n";
                    $message .= strip_tags(html_entity_decode($data['comment'], ENT_QUOTES, 'UTF-8')) . "\n\n";
                }

                $message .= $this->language->get('text_footer');

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

                $mail->setTo($return_query->row['email']);
                $mail->setFrom($this->config->get('config_email'));
                $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
                $mail->setSubject($subject);
                $mail->setText($message);
                $mail->send();
            }
        }
    }

    public function getReturnHistories($return_id, $start = 0, $limit = 10) {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 10;
        }

        $query = $this->db->query("SELECT rh.date_added, rs.name AS status, rh.comment, rh.notify FROM " . DB_PREFIX . "return_history rh LEFT JOIN " . DB_PREFIX . "return_status rs ON rh.return_status_id = rs.return_status_id WHERE rh.return_id = '" . (int) $return_id . "' AND rs.language_id = '" . (int) $this->config->get('config_language_id') . "' ORDER BY rh.date_added ASC LIMIT " . (int) $start . "," . (int) $limit);

        return $query->rows;
    }

    public function getTotalReturnHistories($return_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "return_history WHERE return_id = '" . (int) $return_id . "'");

        return $query->row['total'];
    }

    public function getTotalReturnHistoriesByReturnStatusId($return_status_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "return_history WHERE return_status_id = '" . (int) $return_status_id . "'");

        return $query->row['total'];
    }
    
    public function getReturnStatuses($data = array()) {
        if ($data) {
            $sql = "SELECT * FROM " . DB_PREFIX . "return_status WHERE language_id = '" . (int) $this->config->get('config_language_id') . "'";

            $sql .= " ORDER BY name";

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
        } else {
            $return_status_data = $this->cache->get('return_status.' . (int) $this->config->get('config_language_id'));

            if (!$return_status_data) {
                $query = $this->db->query("SELECT return_status_id, name FROM " . DB_PREFIX . "return_status WHERE language_id = '" . (int) $this->config->get('config_language_id') . "' ORDER BY name");

                $return_status_data = $query->rows;

                $this->cache->set('return_status.' . (int) $this->config->get('config_language_id'), $return_status_data);
            }

            return $return_status_data;
        }
    }

    // Return manager EOC
    public function getCustomers($data = array()) {
        $sql = "SELECT *, CONCAT(c.firstname, ' ', c.lastname) AS name, cgd.name AS customer_group FROM " . DB_PREFIX . "customer c LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (c.customer_group_id = cgd.customer_group_id) WHERE cgd.language_id = '" . (int) $this->config->get('config_language_id') . "'";

        $implode = array();

        if (!empty($data['filter_name'])) {
            $implode[] = "CONCAT(c.firstname, ' ', c.lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }

        if (!empty($data['filter_email'])) {
            $implode[] = "c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
        }

        if (isset($data['filter_newsletter']) && !is_null($data['filter_newsletter'])) {
            $implode[] = "c.newsletter = '" . (int) $data['filter_newsletter'] . "'";
        }

        if (!empty($data['filter_customer_group_id'])) {
            $implode[] = "c.customer_group_id = '" . (int) $data['filter_customer_group_id'] . "'";
        }

        if (!empty($data['filter_ip'])) {
            $implode[] = "c.customer_id IN (SELECT customer_id FROM " . DB_PREFIX . "customer_ip WHERE ip = '" . $this->db->escape($data['filter_ip']) . "')";
        }

        if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
            $implode[] = "c.status = '" . (int) $data['filter_status'] . "'";
        }

        if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
            $implode[] = "c.approved = '" . (int) $data['filter_approved'] . "'";
        }

        if (!empty($data['filter_date_added'])) {
            $implode[] = "DATE(c.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
        }

        if ($implode) {
            $sql .= " AND " . implode(" AND ", $implode);
        }

        $sort_data = array(
            'name',
            'c.email',
            'customer_group',
            'c.status',
            'c.approved',
            'c.ip',
            'c.date_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY name";
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
    
    public function getAddresses($customer_id) {
        $address_data = array();

        $query = $this->db->query("SELECT address_id FROM " . DB_PREFIX . "address WHERE customer_id = '" . (int) $customer_id . "'");

        foreach ($query->rows as $result) {
            $address_info = $this->getAddress($result['address_id']);

            if ($address_info) {
                $address_data[$result['address_id']] = $address_info;
            }
        }

        return $address_data;
    }
    public function getAddress($address_id) {
        $address_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "address WHERE address_id = '" . (int) $address_id . "'");

        if ($address_query->num_rows) {
            $country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int) $address_query->row['country_id'] . "'");

            if ($country_query->num_rows) {
                $country = $country_query->row['name'];
                $iso_code_2 = $country_query->row['iso_code_2'];
                $iso_code_3 = $country_query->row['iso_code_3'];
                $address_format = $country_query->row['address_format'];
            } else {
                $country = '';
                $iso_code_2 = '';
                $iso_code_3 = '';
                $address_format = '';
            }

            $zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int) $address_query->row['zone_id'] . "'");

            if ($zone_query->num_rows) {
                $zone = $zone_query->row['name'];
                $zone_code = $zone_query->row['code'];
            } else {
                $zone = '';
                $zone_code = '';
            }

            return array(
                'address_id' => $address_query->row['address_id'],
                'customer_id' => $address_query->row['customer_id'],
                'firstname' => $address_query->row['firstname'],
                'lastname' => $address_query->row['lastname'],
                'company' => $address_query->row['company'],
                'address_1' => $address_query->row['address_1'],
                'address_2' => $address_query->row['address_2'],
                'postcode' => $address_query->row['postcode'],
                'city' => $address_query->row['city'],
                'zone_id' => $address_query->row['zone_id'],
                'zone' => $zone,
                'zone_code' => $zone_code,
                'country_id' => $address_query->row['country_id'],
                'country' => $country,
                'iso_code_2' => $iso_code_2,
                'iso_code_3' => $iso_code_3,
                'address_format' => $address_format,
                'custom_field' => json_decode($address_query->row['custom_field'], true)
            );
        }
    }
    public function getProducts($data = array()) {
        $sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)"
                . " LEFT JOIN ".DB_PREFIX."kb_mp_seller_product sp ON (sp.product_id = p.product_id)"
                . " WHERE pd.language_id = '" . (int) $this->config->get('config_language_id') . "'"
                . " AND sp.seller_id = '". (int)$data['seller_id'] ."'"
                . " AND sp.product_id IS NOT null";
        if (!empty($data['filter_name'])) {
            $sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
        }

        if (!empty($data['filter_model'])) {
            $sql .= " AND p.model LIKE '" . $this->db->escape($data['filter_model']) . "%'";
        }

        if (isset($data['filter_price']) && !is_null($data['filter_price'])) {
            $sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
        }

        if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
            $sql .= " AND p.quantity = '" . (int) $data['filter_quantity'] . "'";
        }

        if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
            $sql .= " AND p.status = '" . (int) $data['filter_status'] . "'";
        }

        if (isset($data['filter_image']) && !is_null($data['filter_image'])) {
            if ($data['filter_image'] == 1) {
                $sql .= " AND (p.image IS NOT NULL AND p.image <> '' AND p.image <> 'no_image.png')";
            } else {
                $sql .= " AND (p.image IS NULL OR p.image = '' OR p.image = 'no_image.png')";
            }
        }

        $sql .= " GROUP BY p.product_id";

        $sort_data = array(
            'pd.name',
            'p.model',
            'p.price',
            'p.quantity',
            'p.status',
            'p.sort_order'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY pd.name";
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
    public function getProductOptions($product_id) {
        $product_option_data = array();

        $product_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int) $product_id . "' AND od.language_id = '" . (int) $this->config->get('config_language_id') . "'");

        foreach ($product_option_query->rows as $product_option) {
            $product_option_value_data = array();

            $product_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int) $product_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");

            foreach ($product_option_value_query->rows as $product_option_value) {
                $product_option_value_data[] = array(
                    'product_option_value_id' => $product_option_value['product_option_value_id'],
                    'option_value_id' => $product_option_value['option_value_id'],
                    'quantity' => $product_option_value['quantity'],
                    'subtract' => $product_option_value['subtract'],
                    'price' => $product_option_value['price'],
                    'price_prefix' => $product_option_value['price_prefix'],
                    'points' => $product_option_value['points'],
                    'points_prefix' => $product_option_value['points_prefix'],
                    'weight' => $product_option_value['weight'],
                    'weight_prefix' => $product_option_value['weight_prefix']
                );
            }

            $product_option_data[] = array(
                'product_option_id' => $product_option['product_option_id'],
                'product_option_value' => $product_option_value_data,
                'option_id' => $product_option['option_id'],
                'name' => $product_option['name'],
                'type' => $product_option['type'],
                'value' => $product_option['value'],
                'required' => $product_option['required']
            );
        }

        return $product_option_data;
    }
    public function getOrders($seller_id) {
        
        $data = array();
        $sql = "SELECT order_id FROM " . DB_PREFIX . "kb_mp_seller_order_detail WHERE seller_id = '" . (int)$seller_id . "'";
        $query = $this->db->query($sql);
        if($query->num_rows){
            foreach ($query->rows as $key => $value) {
                $data[] = $value['order_id'];
            }
        }
        return $data;
    }
    public function getAllCategories($data = array()) {
        $sql = "SELECT cp.category_id AS category_id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') AS name, c1.parent_id, c1.sort_order FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "category c1 ON (cp.category_id = c1.category_id) LEFT JOIN " . DB_PREFIX . "category c2 ON (cp.path_id = c2.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id) LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (cp.category_id = cd2.category_id) WHERE cd1.language_id = '" . (int) $this->config->get('config_language_id') . "' AND cd2.language_id = '" . (int) $this->config->get('config_language_id') . "'";

        if (!empty($data['filter_name'])) {
            $sql .= " AND cd2.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }

        $sql .= " GROUP BY cp.category_id";

        $sort_data = array(
            'name',
            'sort_order'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY sort_order";
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
    public function getSellerProductsIds($seller_id) {
        $data = array();
        $query = $this->db->query("SELECT product_id FROM " . DB_PREFIX . "kb_mp_seller_product WHERE seller_id = '". (int)$seller_id ."'");
        if($query->num_rows){
            foreach ($query->rows as $key => $value) {
                $data[] = $value['product_id'];
            }
        }
        return $data;
    }
    public function getCouponProduct($product_id) {
            $query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "seo_url WHERE query = 'product_id=" . (int)$product_id . "'AND language_id = '" . (int) $this->config->get('config_language_id') . "') AS keyword FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

            return $query->row;
    }
    public function getSellerDownloads($seller_id = 0) {
        $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller_downloads WHERE seller_id = '" . (int) $seller_id . "'";
        $query = $this->db->query($sql);
        $data = array();
        if($query->num_rows){
            foreach ($query->rows as $key => $value) {
                $data[] = $value['download_id'];
            }
        }
        return $data;
    }

    // Payout Request
    public function getPayoutRequest($data = array()) {
        $sql = "SELECT * FROM " . DB_PREFIX . "kb_mp_seller_payout WHERE seller_id = '" . (int) $data['seller_id']. "'";
        
        if (!empty($data['filter_amount'])) {
            $sql .= " AND amount ='" . trim((float)$data['filter_amount']) . "'";
        }

        if (!empty($data['filter_status'])) {
            $sql .= " AND status = '" . $data['filter_status'] . "'";
        }


        $sort_data = array(
            'id',
            'amount',
            'status',
            'date_added',
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
    public function addPayoutRequest($data = array()) {
        $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_payout SET"
                . " seller_id = '" . (int) $data['seller_id']. "', "
                . " amount = '" . (int) $data['amount']. "', "
                . " comment = '" . $this->db->escape($data['reason']). "', "
                . " status = '0'";
        $query = $this->db->query($sql);
    }
    public function getAllCategoriesId() {
        $query = $this->db->query("SELECT DISTINCT category_id FROM " . DB_PREFIX . "category  WHERE status = '1'");

        return $query->rows;
    }
    public function getAllManufacturerId() {
        $query = $this->db->query("SELECT DISTINCT manufacturer_id FROM " . DB_PREFIX . "manufacturer");

        return $query->rows;
    }
    public function getAllDownloadsId() {
        $query = $this->db->query("SELECT DISTINCT download_id FROM " . DB_PREFIX . "download");

        return $query->rows;
    }
    public function getAllFiltersId() {
        $query = $this->db->query("SELECT DISTINCT filter_id FROM " . DB_PREFIX . "filter");

        return $query->rows;
    }
    public function getAllProductsId() {
        $query = $this->db->query("SELECT DISTINCT product_id FROM " . DB_PREFIX . "product");

        return $query->rows;
    }
    public function addProduct($data) {

            $this->db->query("INSERT INTO " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW()");

            $product_id = $this->db->getLastId();

            if (isset($data['image']) and !empty($data['image']) ) {
                    $file = file_get_contents($data['image']);
                    if(!empty($file)){
                        $filename = basename(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8'));
                        file_put_contents(DIR_IMAGE.'catalog/'.$product_id.'_'.$filename, $file);
                        $this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape('catalog/'.$product_id.'_'.$filename) . "' WHERE product_id = '" . (int)$product_id . "'");
                    }
            }

            foreach ($data['product_description'] as $language_id => $value) {
                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$product_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
            }

            if (isset($data['product_store'])) {
                    foreach ($data['product_store'] as $store_id) {
                            $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$product_id . "', store_id = '" . (int)$store_id . "'");
                    }
            }

            if (isset($data['product_attribute'])) {
                    foreach ($data['product_attribute'] as $product_attribute) {
                            if ($product_attribute['attribute_id']) {
                                    // Removes duplicates
                                    $this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "' AND attribute_id = '" . (int)$product_attribute['attribute_id'] . "'");

                                    foreach ($product_attribute['product_attribute_description'] as $language_id => $product_attribute_description) {
                                            $this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "' AND attribute_id = '" . (int)$product_attribute['attribute_id'] . "' AND language_id = '" . (int)$language_id . "'");

                                            $this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$product_id . "', attribute_id = '" . (int)$product_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($product_attribute_description['text']) . "'");
                                    }
                            }
                    }
            }

            if (isset($data['product_option'])) {
                    foreach ($data['product_option'] as $product_option) {
                            if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
                                    if (isset($product_option['product_option_value'])) {
                                            $this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$product_id . "', option_id = '" . (int)$product_option['option_id'] . "', required = '" . (int)$product_option['required'] . "'");

                                            $product_option_id = $this->db->getLastId();

                                            foreach ($product_option['product_option_value'] as $product_option_value) {
                                                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_id = '" . (int)$product_option_id . "', product_id = '" . (int)$product_id . "', option_id = '" . (int)$product_option['option_id'] . "', option_value_id = '" . (int)$product_option_value['option_value_id'] . "', quantity = '" . (int)$product_option_value['quantity'] . "', subtract = '" . (int)$product_option_value['subtract'] . "', price = '" . (float)$product_option_value['price'] . "', price_prefix = '" . $this->db->escape($product_option_value['price_prefix']) . "', points = '" . (int)$product_option_value['points'] . "', points_prefix = '" . $this->db->escape($product_option_value['points_prefix']) . "', weight = '" . (float)$product_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($product_option_value['weight_prefix']) . "'");
                                            }
                                    }
                            } else {
                                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$product_id . "', option_id = '" . (int)$product_option['option_id'] . "', value = '" . $this->db->escape($product_option['value']) . "', required = '" . (int)$product_option['required'] . "'");
                            }
                    }
            }

            if (isset($data['product_discount'])) {
                    foreach ($data['product_discount'] as $product_discount) {
                            $this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int)$product_id . "', customer_group_id = '" . (int)$product_discount['customer_group_id'] . "', quantity = '" . (int)$product_discount['quantity'] . "', priority = '" . (int)$product_discount['priority'] . "', price = '" . (float)$product_discount['price'] . "', date_start = '" . $this->db->escape($product_discount['date_start']) . "', date_end = '" . $this->db->escape($product_discount['date_end']) . "'");
                    }
            }

            if (isset($data['product_special'])) {
                    foreach ($data['product_special'] as $product_special) {
                            $this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$product_id . "', customer_group_id = '" . (int)$product_special['customer_group_id'] . "', priority = '" . (int)$product_special['priority'] . "', price = '" . (float)$product_special['price'] . "', date_start = '" . $this->db->escape($product_special['date_start']) . "', date_end = '" . $this->db->escape($product_special['date_end']) . "'");
                    }
            }

            if (isset($data['product_image'])) {
                    foreach ($data['product_image'] as $product_image) {
                            $this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$product_id . "', image = '" . $this->db->escape($product_image['image']) . "', sort_order = '" . (int)$product_image['sort_order'] . "'");
                    }
            }

            if (isset($data['product_download'])) {
                    foreach ($data['product_download'] as $download_id) {
                            $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int)$product_id . "', download_id = '" . (int)$download_id . "'");
                    }
            }

            if (isset($data['product_category'])) {
                    foreach ($data['product_category'] as $category_id) {
                            $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '" . (int)$category_id . "'");
                    }
            }

            if (isset($data['product_filter'])) {
                    foreach ($data['product_filter'] as $filter_id) {
                            $this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$product_id . "', filter_id = '" . (int)$filter_id . "'");
                    }
            }

            if (isset($data['product_related'])) {
                    foreach ($data['product_related'] as $related_id) {
                            $this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$product_id . "' AND related_id = '" . (int)$related_id . "'");
                            $this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$product_id . "', related_id = '" . (int)$related_id . "'");
                            $this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$related_id . "' AND related_id = '" . (int)$product_id . "'");
                            $this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$related_id . "', related_id = '" . (int)$product_id . "'");
                    }
            }

            if (isset($data['product_reward'])) {
                    foreach ($data['product_reward'] as $customer_group_id => $product_reward) {
                            if ((int)$product_reward['points'] > 0) {
                                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int)$product_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$product_reward['points'] . "'");
                            }
                    }
            }

            if (isset($data['product_layout'])) {
                    foreach ($data['product_layout'] as $store_id => $layout_id) {
                            $this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$product_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
                    }
            }

            if ($data['keyword']) {
                    $this->db->query("INSERT INTO " . DB_PREFIX . "seo_url SET query = 'product_id=" . (int)$product_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
            }

            if (isset($data['product_recurring'])) {
                    foreach ($data['product_recurring'] as $recurring) {
                            $this->db->query("INSERT INTO `" . DB_PREFIX . "product_recurring` SET `product_id` = " . (int)$product_id . ", customer_group_id = " . (int)$recurring['customer_group_id'] . ", `recurring_id` = " . (int)$recurring['recurring_id']);
                    }
            }

            $this->cache->delete('product');

            return $product_id;
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
    //function to request again
    public function requestApproval($seller_id){
        $sql = "UPDATE ".DB_PREFIX."kb_mp_seller SET approved='0' WHERE seller_id=".(int)$seller_id;
        $this->db->query($sql);
    }
    
}
