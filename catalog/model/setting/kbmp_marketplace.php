<?php

class ModelSettingKbmpMarketplace extends Model {
    /*
     * Function to get the module configuration details from setting table
     */
    public function getSetting($code, $store_id = 0) {
        
        $setting_data = array();
        //Fetch the details from database table
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int) $store_id . "' AND `code` = '" . $this->db->escape($code) . "'");
        
        //Iteration of the data to get the proper formatted results
        foreach ($query->rows as $result) {
            if (!$result['serialized']) {
                $setting_data[$result['key']] = $result['value'];
            } else {
                $setting_data[$result['key']] = json_decode($result['value'], true);
            }
        }
        return $setting_data;
        
    }
    //send email for cancelled order
    public function sendEmail($email,$order_id,$template){
       
        $this->load->language('kbmp_marketplace/common');
        $subject = $this->language->get('subject_order_cancel_email_template');
        $template = str_replace("{order_id}",$order_id,$template);
        if (VERSION < 3.0) {
            $mail = new Mail();
        } else {
            $mail = new Mail($this->config->get('config_mail_engine'));
        }
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');;
        
        $mail->setTo($email);
        $template = str_replace('{{order_id}}', $order_id, $template);        
        $mail->setFrom($this->config->get('config_email'));
        $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
        $mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
        $mail->setHtml(html_entity_decode($template, ENT_QUOTES, 'UTF-8'));
        
        $mail->send();
        
    }
    
    

}

?>