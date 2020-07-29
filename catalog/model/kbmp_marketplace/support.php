<?php

class ModelKbmpmarketplaceSupport extends Model {

    public function getTickets($data) {
        $sql = ("SELECT DISTINCT * FROM " . DB_PREFIX . "kb_mp_seller_ticket t WHERE seller_id = '" . (int)$data['seller_id'] . "'");
        
        if (isset($data['filter_ticket_id']) && !is_null($data['filter_ticket_id'])) {
            $sql .= " AND t.ticket_id = '" . (int) trim($data['filter_ticket_id']) . "'";
        }
        if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
            $sql .= " AND t.status = '" . (int) trim($data['filter_status']) . "'";
        }
        if (isset($data['filter_priority']) && !is_null($data['filter_priority'])) {
            $sql .= " AND t.priority = '" . (int) trim($data['filter_priority']) . "'";
        }
        if (isset($data['filter_customer']) && !is_null($data['filter_customer'])) {
            $sql .= " AND t.name LIKE '" . $this->db->escape(trim($data['filter_customer'])) . "%'";
        }
        if (isset($data['filter_name']) && !is_null($data['filter_name'])) {
            $sql .= " AND t.name LIKE '" . $this->db->escape(trim($data['filter_name'])) . "%'";
        }
        if (isset($data['filter_email']) && !is_null($data['filter_email'])) {
            $sql .= " AND t.email LIKE '" . $this->db->escape(trim($data['filter_email'])) . "%'";
        }
        if (isset($data['filter_subject']) && !is_null($data['filter_subject'])) {
            $sql .= " AND t.subject LIKE '" . $this->db->escape(trim($data['filter_subject'])) . "%'";
        }
        if (isset($data['filter_date_added']) && !is_null($data['filter_date_added'])) {
            $sql .= " AND cast(t.date_added as date) = '" . trim($data['filter_date_added']) . "'";
        }
        if (isset($data['filter_date_modified']) && !is_null($data['filter_date_modified'])) {
            $sql .= " AND cast(t.date_updated as date) = '" . trim($data['filter_date_modified']) . "'";
        }
        
        $sort_data = array(
            'id',
            'email',
            'name',
            'subject',
            'status',
            'priority',
            'date_added',
            'date_updated',
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            if ($data['sort'] == 'ksd.title') {
                $sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
            } else {
                $sql .= " ORDER BY " . $data['sort'];
            }
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
//        var_dump($sql);die;
        $query = $this->db->query($sql);
        return $query->rows;
    }
    public function getTicket($id) {
        $sql = ("SELECT DISTINCT * FROM " . DB_PREFIX . "kb_mp_seller_ticket WHERE ticket_id = '" . (int)$id . "'");
        $query = $this->db->query($sql);

        return $query->row;
    }
    public function getTicketByEmail($id, $email) {
        $sql = ("SELECT DISTINCT * FROM " . DB_PREFIX . "kb_mp_seller_ticket WHERE ticket_id = '" . (int)$id . "' AND email='". $this->db->escape($email) ."'");
        $query = $this->db->query($sql);

        return $query->row;
    }
    public function getAllTicketByEmail($email) {
        $sql = ("SELECT DISTINCT * FROM " . DB_PREFIX . "kb_mp_seller_ticket WHERE email='". $this->db->escape($email) ."'");
        $query = $this->db->query($sql);

        return $query->rows;
    }
    public function getConversation($id) {
        $sql = ("SELECT * FROM " . DB_PREFIX . "kb_mp_seller_ticket_conversation WHERE ticket_id = '" . (int)$id . "' ORDER BY date_added DESC");
        $query = $this->db->query($sql);

        return $query->rows;
    }
    public function reply($data = array()) {
        $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_ticket_conversation SET "
                . "ticket_id = '". (int)$data['ticket_id'] ."', "
                . "text = '". $this->db->escape($data['reply']) ."', "
                . "type = '". (int)$data['type'] ."'"; // 1 for customer, 0 for seller
        $query = $this->db->query($sql);
        $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_ticket SET "
                . "status = '". (int)$data['status'] ."', "
                . "priority = '". (int)$data['priority'] ."', "
                . "date_updated = now() WHERE "
                . "ticket_id = '". (int)$data['ticket_id'] ."'";
        $query = $this->db->query($sql);
        
        $ticket_details = $this->getTicket($data['ticket_id']);
        $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(26);
        $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($ticket_details['seller_id']);
        $customer_details = $this->getTicket($data['ticket_id']);
        
        if (isset($email_template) && !empty($email_template)) {
            $message = str_replace("{{customer_name}}", $customer_details['name'], $email_template['email_content']); 
            $message = str_replace("{{seller_name}}", $seller_details['firstname'].' '.$seller_details['lastname'], $message); 
            $message = str_replace("{{store_name}}", $seller_details['title'], $message); 
            $message = str_replace("{{comment}}", $data['reply'], $message); 
            $message = str_replace("{{ticket_id}}", $ticket_details['ticket_id'], $message);

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

            $mail->setTo($ticket_details['email']);
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
            $mail->setSubject(html_entity_decode($email_template['email_subject'], ENT_QUOTES, 'UTF-8'));
            $mail->setHtml($email_content);
            $mail->send();
        }
    }
    
    public function getTotalTicket($seller_id) {
        $sql = ("SELECT count(*) as total FROM " . DB_PREFIX . "kb_mp_seller_ticket WHERE seller_id = '" . (int)$seller_id . "'");
        $query = $this->db->query($sql);

        return $query->row['total'];
    }
    
    public function getTotalOpenTicket($seller_id) {
        $sql = ("SELECT count(*) as total FROM " . DB_PREFIX . "kb_mp_seller_ticket WHERE seller_id = '" . (int)$seller_id . "' AND status = '1'");
        $query = $this->db->query($sql);

        return $query->row['total'];
    }
    
    public function getTotalClosedTicket($seller_id) {
        $sql = ("SELECT count(*) as total FROM " . DB_PREFIX . "kb_mp_seller_ticket WHERE seller_id = '" . (int)$seller_id . "' AND status = '6'");
        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function editCoupon($coupon_id, $data) {
        $this->db->query("UPDATE " . DB_PREFIX . "coupon SET name = '" . $this->db->escape($data['name']) . "', code = '" . $this->db->escape($data['code']) . "', discount = '" . (float) $data['discount'] . "', type = '" . $this->db->escape($data['type']) . "', total = '" . (float) $data['total'] . "', logged = '" . (int) $data['logged'] . "', shipping = '" . (int) $data['shipping'] . "', date_start = '" . $this->db->escape($data['date_start']) . "', date_end = '" . $this->db->escape($data['date_end']) . "', uses_total = '" . (int) $data['uses_total'] . "', uses_customer = '" . (int) $data['uses_customer'] . "', status = '" . (int) $data['status'] . "' WHERE coupon_id = '" . (int) $coupon_id . "'");

        $this->db->query("DELETE FROM " . DB_PREFIX . "coupon_product WHERE coupon_id = '" . (int) $coupon_id . "'");

        if (isset($data['coupon_product'])) {
            foreach ($data['coupon_product'] as $product_id) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "coupon_product SET coupon_id = '" . (int) $coupon_id . "', product_id = '" . (int) $product_id . "'");
            }
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "coupon_category WHERE coupon_id = '" . (int) $coupon_id . "'");

        if (isset($data['coupon_category'])) {
            foreach ($data['coupon_category'] as $category_id) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "coupon_category SET coupon_id = '" . (int) $coupon_id . "', category_id = '" . (int) $category_id . "'");
            }
        }
    }

    public function deleteCoupon($coupon_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "coupon WHERE coupon_id = '" . (int) $coupon_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "coupon_product WHERE coupon_id = '" . (int) $coupon_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "coupon_category WHERE coupon_id = '" . (int) $coupon_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "coupon_history WHERE coupon_id = '" . (int) $coupon_id . "'");
    }

    public function getCoupon($coupon_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "coupon WHERE coupon_id = '" . (int) $coupon_id . "'");

        return $query->row;
    }

    public function getCouponByCode($code) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "coupon WHERE code = '" . $this->db->escape($code) . "'");

        return $query->row;
    }

    public function getCoupons($data = array()) {
        $sql = "SELECT c.coupon_id, name, code, discount, date_start, date_end, status FROM " . DB_PREFIX . "coupon as c"
                . " LEFT JOIN ".DB_PREFIX."kb_mp_seller_coupon as sc ON c.coupon_id= sc.coupon_id "
                . "WHERE sc.seller_id IS NOT null";

        $sort_data = array(
            'name',
            'code',
            'discount',
            'date_start',
            'date_end',
            'status'
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

    public function getCouponProducts($coupon_id) {
        $coupon_product_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "coupon_product WHERE coupon_id = '" . (int) $coupon_id . "'");

        foreach ($query->rows as $result) {
            $coupon_product_data[] = $result['product_id'];
        }

        return $coupon_product_data;
    }

    public function getCouponCategories($coupon_id) {
        $coupon_category_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "coupon_category WHERE coupon_id = '" . (int) $coupon_id . "'");

        foreach ($query->rows as $result) {
            $coupon_category_data[] = $result['category_id'];
        }

        return $coupon_category_data;
    }

    public function getTotalCoupons() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "coupon");

        return $query->row['total'];
    }

    public function getCouponHistories($coupon_id, $start = 0, $limit = 10) {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 10;
        }

        $query = $this->db->query("SELECT ch.order_id, CONCAT(c.firstname, ' ', c.lastname) AS customer, ch.amount, ch.date_added FROM " . DB_PREFIX . "coupon_history ch LEFT JOIN " . DB_PREFIX . "customer c ON (ch.customer_id = c.customer_id) WHERE ch.coupon_id = '" . (int) $coupon_id . "' ORDER BY ch.date_added ASC LIMIT " . (int) $start . "," . (int) $limit);

        return $query->rows;
    }

    public function getTotalCouponHistories($coupon_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "coupon_history WHERE coupon_id = '" . (int) $coupon_id . "'");

        return $query->row['total'];
    }
    public function addTicket($data = array(), $seller_id) {
        $ticket_id = $this->generateTicketId();
        $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_ticket SET "
                . "seller_id = '". (int)$data['seller_id'] ."', "
                . "ticket_id = '". (int)$ticket_id ."', "
                . "email = '". $this->db->escape($data['email']) ."', "
                . "name = '". $this->db->escape($data['firstname'].' '.$data['lastname']) ."', "
                . "subject = '". $this->db->escape($data['subject']) ."', "
                . "issue = '". $this->db->escape($data['issue']) ."', "
                . "status = '". (int)$data['status'] ."', "
                . "phone = '". $this->db->escape($data['phone']) ."', "
                . "priority = '". (int)$data['priority'] ."'";
        $query = $this->db->query($sql);
        $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_ticket_conversation SET "
                . "ticket_id = '". (int)$ticket_id ."', "
                . "text = '". $this->db->escape($data['issue']) ."', "
                . "type = '1'"; // 1 for customer
        $query = $this->db->query($sql);
        
        $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(25);
        $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($seller_id);
        
        if (isset($email_template) && !empty($email_template)) {
            $message = str_replace("{{name}}", $data['firstname'].' '.$data['lastname'], $email_template['email_content']); 
            $message = str_replace("{{seller_name}}", $seller_details['firstname'].' '.$seller_details['lastname'], $message); 
            $message = str_replace("{{email}}", $data['email'], $message); 
            $message = str_replace("{{store_name}}", $seller_details['title'], $message); 
            $message = str_replace("{{email}}", $data['email'], $message); 
            $message = str_replace("{{phone}}", $data['phone'], $message); 
            $message = str_replace("{{subject}}", $data['subject'], $message);
            $message = str_replace("{{issue}}", $data['issue'], $message);
            $message = str_replace("{{ticket_id}}", $ticket_id, $message);

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
        return $ticket_id;
    }
    public function editTicket($data = array()) {
        $ticket_id = $this->generateTicketId();
        $sql = "INSERT INTO " . DB_PREFIX . "kb_mp_seller_ticket_conversation SET "
                . "ticket_id = '". (int)$ticket_id ."', "
                . "text = '". $this->db->escape($data['issue']) ."', "
                . "type = '". (int)$data['type'] ."'"; // 1 for customer, 0 for seller
        $query = $this->db->query($sql);
        $sql = "UPDATE " . DB_PREFIX . "kb_mp_seller_ticket SET "
                . "date_updated = now() WHERE "
                . "seller_id = '". (int)$data['seller_id'] ."' AND "
                . "ticket_id = '". (int)$ticket_id ."'";
        $query = $this->db->query($sql);
    }
    public function checkTicketId($ticket) {
        $sql = "SELECT ticket_id FROM " . DB_PREFIX . "kb_mp_seller_ticket";
        $query = $this->db->query($sql);
        $flag = 0;
        if($query->num_rows){
            foreach ($query->rows as $key => $value) {
                if($value['ticket_id'] == $ticket){
                    $flag++;
                    break;
                }
            }
        }
        return $flag;
    }
    public function generateTicketId() {
        $code = mt_rand(1000000,9999999);
        $result = $this->checkTicketId($code);
        
        if($result == 1){
            $this->generateTicketId();
        }else{
            return $code;
        }
    }
}
