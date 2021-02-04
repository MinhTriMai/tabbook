<?php

require_once(DIR_SYSTEM . 'library/PHPExcel/PHPExcel.php');
require_once(DIR_SYSTEM . 'library/PHPExcel/PHPExcel/Writer/Excel2007.php');


class ControllerKbmpMarketplaceProductImport extends Controller {

    public function index() {

        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('kbmp_marketplace/product_import', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }
        
        $this->load->language('kbmp_marketplace/common');
        $this->load->language('kbmp_marketplace/product_import');

        $data['title'] = $this->document->getTitle();
        
        $this->document->setTitle($this->language->get('heading_title'));
       
        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_my_account'] = $this->language->get('text_my_account');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_import'] = $this->language->get('text_import');
        $data['text_download_template'] = $this->language->get('text_download_template');
        $data['text_product_type'] = $this->language->get('text_product_type');
        $data['text_select_product_type'] = $this->language->get('text_select_product_type');
        $data['text_simple_product'] = $this->language->get('text_simple_product');
        $data['text_downloadable_product'] = $this->language->get('text_downloadable_product');
        $data['hint_download_temp_file'] = $this->language->get('hint_download_temp_file');
        $data['text_import_products'] = $this->language->get('text_import_products');
        $data['text_import_action'] = $this->language->get('text_import_action');
        $data['text_upload_file'] = $this->language->get('text_upload_file');
        $data['hint_upload_file'] = $this->language->get('hint_upload_file');
        $data['text_validate_file'] = $this->language->get('text_validate_file');
        $data['text_browse_file'] = $this->language->get('text_browse_file');
        $data['text_download_template_file'] = $this->language->get('text_download_template_file');
        $data['error_account_warning'] = $this->language->get('error_account_warning');
        $data['text_account_warning'] = $this->language->get('text_account_warning');
        $data['error_upload_file'] = $this->language->get('error_upload_file');
        
        $data['sidebar'] = $this->load->controller('kbmp_marketplace/header');
        $data['kbmp_footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('common/header');
        $data['footer'] = $this->load->controller('common/footer');
        
        $data['action'] = $this->url->link('kbmp_marketplace/product_import');
        $data['downloadTemplate_link'] = $this->url->link('kbmp_marketplace/product_import/downloadTemplate');
        $file_name = 'template_downloadable_product_default.xlsx';
        $data['downloadTemplate_file'] = HTTPS_SERVER.'catalog/view/theme/default/image/kbmp_marketplace/'.$file_name;

        $data['home_link'] = $this->url->link('common/home');
        $data['account_link'] = $this->url->link('account/account', '', true);
        $data['logout_link'] = $this->url->link('account/logout', '', true);

        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $sellerId = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        $data['seller_details'] = $sellerId;
        
        if(isset($this->session->data['error_log']) && $this->session->data['error_log']){
            $data['error_log'] = $this->session->data['error_log'];
            unset($this->session->data['error_log']);
        }
        $data['errorLog_url'] = $this->url->link('kbmp_marketplace/product_import/downloadErrorLog');
        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            $json = array();
            if (!empty($this->request->files['file'])) {
                $filename = basename(html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8'));

                // Validate the filename length
                if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 128)) {
                    $json['error'] = $this->language->get('error_filename');
                }

                // Allowed file extension types
                $allowed = array('xls','xlsx');

                if (!in_array(strtolower(substr(strrchr($filename, '.'), 1)), $allowed)) {
                    $json['error'] = $this->language->get('error_filetype');
                }

                // Allowed file mime types
                $allowed = array();

                $mime_allowed = preg_replace('~\r?\n~', "\n", $this->config->get('config_file_mime_allowed'));

                $filetypes = explode("\n", $mime_allowed);

                foreach ($filetypes as $filetype) {
                    $allowed[] = trim($filetype);
                }
//                var_dump($this->request->files['file']['type'],$allowed);die;
                if (!in_array($this->request->files['file']['type'], $allowed)) {
//                    $json['error'] = $this->language->get('error_filetype');
                }

                // Check to see if any PHP files are trying to be uploaded
                $content = file_get_contents($this->request->files['file']['tmp_name']);

                if (preg_match('/\<\?php/i', $content)) {
                    $json['error'] = $this->language->get('error_filetype');
                }

                // Return any upload error
                if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
                    $json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
                }
//                var_dump($json);die;
            }else {
                $json['error'] = $this->language->get('error_upload');
            }
            if (!$json) {
                $file = $filename . '.' . token(32);
                move_uploaded_file($this->request->files['file']['tmp_name'], DIR_DOWNLOAD . $filename);
                
                $filepath = DIR_DOWNLOAD . $filename;
                $type = PHPExcel_IOFactory::identify($filepath);
                $objReader = PHPExcel_IOFactory::createReader($type);

                $objPHPExcel = $objReader->load($filepath);

                $rowIterator = $objPHPExcel->getActiveSheet()->getRowIterator();
                $exceldata = array();
                
                foreach($rowIterator as $row){
                    $cellIterator = $row->getCellIterator();
                    foreach ($cellIterator as $cell) {
                        $exceldata[$row->getRowIndex()][$cell->getColumn()] = $cell->getCalculatedValue();
                    }
                }
//                var_dump($rowIterator,$exceldata,$exceldata[1]['A']);die;
                if(isset($exceldata[1]['A'])){
                    unset($exceldata[1]);

                    $this->load->model('kbmp_marketplace/kbmp_marketplace');
                    $this->load->model('localisation/language');
                    $this->load->model('setting/store');

                    $stores = $this->model_setting_store->getStores();

                    $languages = $this->model_localisation_language->getLanguages();

                    $all_categories = $this->model_kbmp_marketplace_kbmp_marketplace->getAllCategoriesId();
                    $categories_ids = array();
                    foreach ($all_categories as $key => $value) {
                        $categories_ids[] = $value['category_id'];
                    }

                    $all_manufacturers = $this->model_kbmp_marketplace_kbmp_marketplace->getAllManufacturerId();
                    $manufacturer_ids = array();
                    foreach ($all_manufacturers as $key => $value) {
                        $manufacturer_ids[] = $value['manufacturer_id'];
                    }

                    $all_downloads = $this->model_kbmp_marketplace_kbmp_marketplace->getAllDownloadsId();
                    $download_ids = array();
                    foreach ($all_downloads as $key => $value) {
                        $download_ids[] = $value['download_id'];
                    }

                    $all_filters = $this->model_kbmp_marketplace_kbmp_marketplace->getAllFiltersId();
                    $filter_ids = array();
                    foreach ($all_filters as $key => $value) {
                        $filter_ids[] = $value['filter_id'];
                    }

                    $all_products = $this->model_kbmp_marketplace_kbmp_marketplace->getAllProductsId();
                    $product_ids = array();
                    foreach ($all_products as $key => $value) {
                        $product_ids[] = $value['product_id'];
                    }

                    $count = 0;
                    foreach ($exceldata as $key => $value) {
                        $product_data = array();
                        $empty_flag = 0; // To check if any row is empty
                        $product_data['product_store'][] = $this->config->get('config_store_id');
                        // Product Name
                        if(empty($value['A'])){
                            $error[$key][] = $this->language->get('error_name');
                            $empty_flag++;
                        }else{
                            foreach ($languages as $key1 => $value1) {
                                $product_data['product_description'][$value1['language_id']]['name'] = $value['A'];
                            }
                        }

                        // Product description for all language
                        if(empty($value['B'])){
                            foreach ($languages as $key1 => $value1) {
                                $product_data['product_description'][$value1['language_id']]['description'] = '';
                            }
                            $empty_flag++;
                        }else{
                            foreach ($languages as $key1 => $value1) {
                                $product_data['product_description'][$value1['language_id']]['description'] = $value['B'];
                            }
                        }

                        // Meta title for all languages
                        if(empty($value['C'])){
                            $error[$key][] = $this->language->get('error_meta_title');
                            $empty_flag++;
                        }else{
                            foreach ($languages as $key1 => $value1) {
                                $product_data['product_description'][$value1['language_id']]['meta_title'] = $value['C'];
                            }
                        }

                        // Meta Description for all languages
                        if(empty($value['D'])){
                            foreach ($languages as $key1 => $value1) {
                                $product_data['product_description'][$value1['language_id']]['meta_description'] = '';
                            }
                            $empty_flag++;
                        }else{
                            foreach ($languages as $key1 => $value1) {
                                $product_data['product_description'][$value1['language_id']]['meta_description'] = $value['D'];
                            }
                        }

                        // Meta keywords for all languages
                        if(empty($value['E'])){
                            foreach ($languages as $key1 => $value1) {
                                $product_data['product_description'][$value1['language_id']]['meta_keyword'] = '';
                            }
                            $empty_flag++;
                        }else{
                            foreach ($languages as $key1 => $value1) {
                                $product_data['product_description'][$value1['language_id']]['meta_keyword'] = $value['E'];
                            }
                        }

                        // Product tags for all languages
                        if(empty($value['F'])){
                            foreach ($languages as $key1 => $value1) {
                                $product_data['product_description'][$value1['language_id']]['tag'] = '';
                            }
                            $empty_flag++;
                        }else{
                            foreach ($languages as $key1 => $value1) {
                                $product_data['product_description'][$value1['language_id']]['tag'] = $value['F'];
                            }
                        }

                        if(empty($value['G'])){
                            $error[$key][] = $this->language->get('error_model');
                            $empty_flag++;
                        }else{
                            $product_data['model'] = $value['G'];
                        }
                        if(empty($value['H'])){
                            $product_data['sku'] = '';
                            $empty_flag++;
                        }else{
                            $product_data['sku'] = $value['H'];
                        }
                        if(empty($value['I'])){
                            $product_data['upc'] = '';
                            $empty_flag++;
                        }else{
                            $product_data['upc'] = $value['I'];
                        }
                        if(empty($value['J'])){
                            $product_data['ean'] = '';
                            $empty_flag++;
                        }else{
                            $product_data['ean'] = $value['J'];
                        }
                        if(empty($value['K'])){
                            $product_data['jan'] = '';
                            $empty_flag++;
                        }else{
                            $product_data['jan'] = $value['K'];
                        }
                        if(empty($value['L'])){
                            $product_data['isbn'] = '';
                            $empty_flag++;
                        }else{
                            $product_data['isbn'] = $value['L'];
                        }
                        if(empty($value['M'])){
                            $product_data['mpn'] = '';
                            $empty_flag++;
                        }else{
                            $product_data['mpn'] = $value['M'];
                        }
                        if(empty($value['N'])){
                            $product_data['location'] = '';
                            $empty_flag++;
                        }else{
                            $product_data['location'] = $value['N'];
                        }
                        if(empty($value['O'])){
                            $error[$key][] = $this->language->get('error_price_empty');
                            $empty_flag++;
                        }elseif (!preg_match("/^[0-9]+(\.[0-9]{2})?$/", $value['O'])) {
                            $error[$key][] = $this->language->get('error_price');
                        }else{
                            $product_data['price'] = $value['O'];
                        }

                        if(empty($value['P'])){
                            $product_data['tax_class_id'] = '0';
                            $empty_flag++;
                        }elseif (!preg_match("/^[0-9]+$/", $value['P']) && $value['P'] < 0) {
                            $error[$key][] = $this->language->get('error_taxt_class');
                        }else{
                            $product_data['tax_class_id'] = $value['P'];
                        }
                        if(empty($value['Q'])){
                            $error[$key][] = $this->language->get('error_quantity_empty');
                            $empty_flag++;
                        }elseif (!preg_match("/^[0-9]+$/", $value['Q'])) {
                            $error[$key][] = $this->language->get('error_quantity');
                        }else{
                            $product_data['quantity'] = $value['Q'];
                        }
                        if(empty($value['R'])){
                            $error[$key][] = $this->language->get('error_min_quantity_empty');
                            $empty_flag++;
                        }elseif (!preg_match("/^[0-9]+$/", $value['R'])) {
                            $error[$key][] = $this->language->get('error_min_quantity');
                        }else{
                            $product_data['minimum'] = $value['R'];
                        }
                        if(empty($value['S'])){
                            $product_data['subtract'] = '1';
                            $empty_flag++;
                        }elseif (!in_array($value['S'], array('0','1'))) {
                            $error[$key][] = $this->language->get('error_subtract_stock');
                        }else{
                            $product_data['subtract'] = $value['S'];
                        }
                        if(empty($value['T'])){
                            $product_data['stock_status_id'] = '1';
                            $empty_flag++;
                        }elseif (!preg_match("/^[0-9]+$/", $value['T'])) {
                            $error[$key][] = $this->language->get('error_out_of_stock');
                        }else{
                            $product_data['stock_status_id'] = $value['T'];
                        }
                        if(empty($value['U'])){
                            $product_data['shipping'] = '1';
                            $empty_flag++;
                        }elseif (!in_array($value['U'], array('0','1'))) {
                            $error[$key][] = $this->language->get('error_require_shipping');
                        }else{
                            $product_data['shipping'] = $value['U'];
                        }
                        if(empty($value['V'])){
                            $product_data['keyword'] = '';
                            $empty_flag++;
                        }else{
                            if (utf8_strlen($value['V']) > 0) {
                                $this->load->model('design/seo_url');

                                $url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);

                                if ($url_alias_info && isset($this->request->get['product_id']) && $url_alias_info['query'] != 'product_id=' . $this->request->get['product_id']) {
                                    $error[$key][] = sprintf($this->language->get('error_keyword'));
                                }

                                if ($url_alias_info && !isset($this->request->get['product_id'])) {
                                    $error[$key][] = sprintf($this->language->get('error_keyword'));
                                }
                            }
                            $product_data['keyword'] = $value['V'];
                        }
                        if(isset($value['W'])){
                            $date = explode(',', $value['W']);
                        }
                        if(empty($value['W'])){
                            $product_data['date_available'] = '1';
                            $empty_flag++;
                        }elseif (!(isset ($date[0]) && isset ($date[1]) && isset ($date[2])) || !checkdate($date[0],$date[1],$date[2])) {
                            $error[$key][] = $this->language->get('error_date_available');
                        }else{
                            $product_data['date_available'] = date('Y-m-d H:i:s', strtotime($date[2].'-'.$date[0].'-'.$date[1]));
                        }
                        if(isset($value['X'])){
                            $dimension = explode('x', $value['X']);
                        }
                        if(empty($value['X'])){ //////////////////////////////////////////////////////////////////////////////////////////
                            $product_data['length'] = 0;
                            $product_data['width'] = 0;
                            $product_data['height'] = 0;
                            $empty_flag++;
                        }elseif (!isset ($dimension[0]) || !isset ($dimension[1]) || !isset ($dimension[2])) {
                            $error[$key][] = $this->language->get('error_dimensions');
                        }else{
                            $product_data['length'] = trim($dimension[0]);
                            $product_data['width'] = trim($dimension[1]);
                            $product_data['height'] = trim($dimension[2]);
                        }
                        if(empty($value['Y'])){
                            $product_data['length_class_id'] = '1';
                            $empty_flag++;
                        }elseif (!preg_match("/^[0-9]+$/", $value['Y'])) {
                            $error[$key][] = $this->language->get('error_length_class');
                        }else{
                            $product_data['length_class_id'] = $value['Y'];
                        }
                        if(empty($value['Z'])){
                            $product_data['weight'] = '1';
                            $empty_flag++;
                        }elseif (!(gettype ($value['Z']) == 'integer' || gettype ($value['Z']) == 'double') || !preg_match("/^[0-9]+$/", $value['Z'])) {
                            $error[$key][] = $this->language->get('error_weight');
                        }else{
                            $product_data['weight'] = $value['Z'];
                        }
                        if(empty($value['AA'])){
                            $product_data['weight_class_id'] = '1';
                            $empty_flag++;
                        }elseif (!preg_match("/^[0-9]+$/", $value['AA'])) {
                            $error[$key][] = $this->language->get('error_weight_class');
                        }else{
                            $product_data['weight_class_id'] = $value['AA'];
                        }
                        if($value['AB'] === ''){
                            $error[$key][] = $this->language->get('error_status1');
                            $empty_flag++;
                        }elseif (!preg_match("/^[0-9]+$/", $value['AB'])) {
                            $error[$key][] = $this->language->get('error_status');
                        }else{
                            $product_data['status'] = $value['AB'];
                        }
                        if(empty($value['AC'])){
                            $product_data['sort_order'] = '';
                            $empty_flag++;
                        }elseif (!preg_match("/^[0-9]+$/", $value['AC'])) {
                            $error[$key][] = $this->language->get('error_sort_order');
                        }else{
                            $product_data['sort_order'] = $value['AC'];
                        }
                        if(empty(trim($value['AD']))){
                            $product_data['manufacturer_id'] = '';
                            $empty_flag++;
                        }else{
                            if(!in_array($value['AD'], $manufacturer_ids)) {
                                $error[$key][] = $this->language->get('error_manufacturer');
                            }else{
                                $product_data['manufacturer_id'] = (int)$value['AD'];
                            }
                        }
                        $categories = explode(',', $value['AE']);
                        if(empty(trim($value['AE']))){
                            $product_data['product_category'] = array();
                            $empty_flag++;
                        }else{
                            foreach ($categories as $key1 => $value1) {
                                if(!in_array($value1, $categories_ids)) {
                                    $error[$key][] = $this->language->get('error_category');
                                    break;
                                }
                                $product_data['product_category'][] = $value1;
                            }
                        }

                        $filters = explode(',', $value['AF']);
                        if(empty(trim($value['AF']))){
                            $product_data['product_filter'] = array();
                            $empty_flag++;
                        }else{
                            foreach ($filters as $key1 => $value1) {
                                if(!in_array($value1, $filter_ids)) {
                                    $error[$key][] = $this->language->get('error_filters');
                                    break;
                                }
                                $product_data['product_filter'][] = $value1;
                            }
                        }
                        $downloads = explode(',', $value['AG']);
                        if(empty(trim($value['AG']))){
                            $product_data['product_download'] = array();
                            $empty_flag++;
                        }else{
                            foreach ($downloads as $key1 => $value1) {
                                if(!in_array($value1, $download_ids)) {
                                    $error[$key][] = $this->language->get('error_downloads');
                                    break;
                                }
                                $product_data['product_download'][] = $value1;
                            }
                        }
                        $related_pro = explode(',', $value['AH']);
                        if(empty(trim($value['AH']))){
                            $product_data['product_related'] = array();
                            $empty_flag++;
                        }else{
                            foreach ($related_pro as $key1 => $value1) {
                                if(!in_array($value1, $product_ids)) {
                                    $error[$key][] = $this->language->get('error_related');
                                    break;
                                }
                                $product_data['product_related'][] = $value1;
                            }
                        }
                        $product_data['points'] = '0';
                        if(empty(trim($value['AI']))){
                            $product_data['image'] = '';
                            $empty_flag++;
                        }else{
                            $flag = 1;
                            // Allowed file extension types
                            $allowed = array('jpg','jpeg','png');

                            if (!in_array(strtolower(substr(strrchr($value['AI'], '.'), 1)), $allowed)) {
                                $flag = 0;
                                $error[$key][] = $this->language->get('error_filetype');
                            }
                            $content = file_get_contents($value['AI']);

                            // Check to see if any PHP files are trying to be uploaded
                            if (preg_match('/\<\?php/i', $content)) {
                                $flag = 0;
                                $error[$key][] = $this->language->get('error_filetype');
                            }
                            if($flag && $content != ''){
                                $product_data['image'] = $value['AI'];
                            }else{
                                $error[$key][] = $this->language->get('error_image');
                            }
                        }

                        if(!isset($error[$key])){
                            $this->addProduct($product_data);
                            $count++;
                        }
                        if($empty_flag == 35){
                            unset($error[$key]);
                        }
                    }
                    if(isset($error) && !empty($error)){
                        
                        $file_name = 'error_log.csv';
                        $error_log = DIR_APPLICATION.'/view/theme/default/image/kbmp_marketplace/'.$file_name;
                        $sd_file =  fopen($error_log,"w");

                        $rows = array_keys($error);
                        foreach ($error as $key => $value) {
                            fputcsv($sd_file, array_merge(array($key),$value));
                        }
                        $rows = implode(',', $rows);

                        $this->session->data['error_log'] = true;
                        $this->session->data['error_warning'] = sprintf($this->language->get('product_import_error'),$rows);
                    }
                    if($count){
                        $this->session->data['success'] = sprintf($this->language->get('product_import_success'),$count);
                    }
                }else{
                    $this->session->data['error_warning'] = $this->language->get('product_import_error_empty');
                }
            }else{
                $this->session->data['error_warning'] = $json['error'];
            }

            $this->response->redirect($this->url->link('kbmp_marketplace/product_import', '', true));
        }
        
        if(isset($this->session->data['error']) && $this->session->data['error'] != ''){
            $data['error_warning'] = $this->session->data['error'];
            unset($this->session->data['error']);
        }
        if(isset($this->session->data['success']) && $this->session->data['success'] != ''){
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        }
        $data['view_all_order'] = $this->url->link('kbmp_marketplace/orders');

	$this->load->model('setting/kbmp_marketplace');
        //Get the module configuration values
        $store_id = (int) $this->config->get('config_store_id');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
        $data['kbmp_marketplace_settings'] = $settings;

        $this->response->setOutput($this->load->view('kbmp_marketplace/product_import', $data));
    }

    public function downloadTemplate() {
        $this->load->language('kbmp_marketplace/product_import');
//        $file_name = 'template_simple_product_default.xlsx';
//        $file_url = DIR_APPLICATION.'/view/theme/default/image/kbmp_marketplace/'.$file_name;

        $objPHPExcel = new PHPExcel(); 
        $objPHPExcel->setActiveSheetIndex(0); 
        
        $styleArray = array(
            'font'  => array(
                'color' => array('rgb' => 'FF0000'),
                'name'  => 'Verdana'
            ),
            'fill' => array(
                'type' => PHPExcel_Style_Fill::FILL_SOLID,
                'color' => array('rgb' => 'FFFF00')
            ));
        $styleArray2 = array(
            'fill' => array(
                'type' => PHPExcel_Style_Fill::FILL_SOLID,
                'color' => array('rgb' => 'FFFF00')
            ));
        
        $objPHPExcel->getActiveSheet()->SetCellValue('A2', $this->language->get('text_hint1'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A3', $this->language->get('text_hint2'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A4', $this->language->get('text_hint3'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A5', $this->language->get('text_hint4'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A6', $this->language->get('text_hint5'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A7', $this->language->get('text_hint6'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A12', $this->language->get('text_field'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C12', $this->language->get('text_possible_value'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E12', $this->language->get('text_mandatory'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A13', $this->language->get('text_name'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C13', $this->language->get('text_any_text'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E13', $this->language->get('text_yes'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A14', $this->language->get('text_meta_title'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C14', $this->language->get('text_any_text'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E14', $this->language->get('text_yes'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A15', $this->language->get('text_model'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C15', $this->language->get('text_any_text'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E15', $this->language->get('text_yes'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A16', $this->language->get('text_price'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C16', $this->language->get('text_float_value'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E16', $this->language->get('text_yes'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A17', $this->language->get('text_quantity'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C17', $this->language->get('text_integer_value'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A18', $this->language->get('text_tax_class'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C18', $this->language->get('text_integer_value'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E18', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A19', $this->language->get('text_minimum_quantity'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C19', $this->language->get('text_integer_value'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E19', $this->language->get('text_yes'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A20', $this->language->get('text_subtract_stock'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C20', $this->language->get('text_0_or_1'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E20', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A21', $this->language->get('text_out_of_stock_status'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C21', $this->language->get('text_integer_value'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E21', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A22', $this->language->get('text_required_shipping'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C22', $this->language->get('text_integer_value'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E22', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A23', $this->language->get('text_seo_url'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C23', $this->language->get('text_integer_value'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E23', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A24', $this->language->get('text_date_available'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C24', $this->language->get('text_date'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E24', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A25', $this->language->get('text_dimensions'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C25', $this->language->get('text_dimension_format'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E25', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A26', $this->language->get('text_length_class'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C26', $this->language->get('text_integer_value'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E26', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A27', $this->language->get('text_weight'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C27', $this->language->get('text_float_value'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E27', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A28', $this->language->get('text_status'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C28', $this->language->get('text_0_or_1'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E28', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A29', $this->language->get('text_sort_order'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C29', $this->language->get('text_integer_value'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E29', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A30', $this->language->get('text_manufacturer'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C30', $this->language->get('text_manufacturer_hint'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E30', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A31', $this->language->get('text_categories'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C31', $this->language->get('text_common_hint'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E31', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A32', $this->language->get('text_filters'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C32', $this->language->get('text_common_hint'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E32', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A33', $this->language->get('text_downloads'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C33', $this->language->get('text_common_hint'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E33', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A34', $this->language->get('text_related_products'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C34', $this->language->get('text_common_hint'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E34', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->SetCellValue('A35', $this->language->get('text_image'));
        $objPHPExcel->getActiveSheet()->SetCellValue('C35', $this->language->get('text_common_hint'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E35', $this->language->get('text_no'));
        $objPHPExcel->getActiveSheet()->getStyle('A12:E12')->applyFromArray($styleArray2);
        
        $objPHPExcel->getActiveSheet()->setTitle($this->language->get('text_meta_info'));
        
        // Create a new worksheet, after the default sheet
        $objPHPExcel->createSheet();
        $objPHPExcel->setActiveSheetIndex(1);
        
        
        $rowCount = 1; 
        $objPHPExcel->getActiveSheet()->SetCellValue('A'.$rowCount, $this->language->get('text_name'));
        $objPHPExcel->getActiveSheet()->getStyle('A1')->applyFromArray($styleArray);
        $objPHPExcel->getActiveSheet()->SetCellValue('B'.$rowCount, $this->language->get('text_description'));
        $objPHPExcel->getActiveSheet()->getStyle('B'.$rowCount)->applyFromArray($styleArray2);
        $objPHPExcel->getActiveSheet()->SetCellValue('C'.$rowCount, $this->language->get('text_meta_title'));
        $objPHPExcel->getActiveSheet()->getStyle('C'.$rowCount)->applyFromArray($styleArray);
        $objPHPExcel->getActiveSheet()->SetCellValue('D'.$rowCount, $this->language->get('text_meta_description'));
        $objPHPExcel->getActiveSheet()->SetCellValue('E'.$rowCount, $this->language->get('text_meta_keywords'));
        $objPHPExcel->getActiveSheet()->SetCellValue('F'.$rowCount, $this->language->get('text_product_tags'));
        $objPHPExcel->getActiveSheet()->SetCellValue('G'.$rowCount, $this->language->get('text_model'));
        $objPHPExcel->getActiveSheet()->getStyle('G'.$rowCount)->applyFromArray($styleArray);
        $objPHPExcel->getActiveSheet()->SetCellValue('H'.$rowCount, $this->language->get('text_sku'));
        $objPHPExcel->getActiveSheet()->SetCellValue('I'.$rowCount, $this->language->get('text_upc'));
        $objPHPExcel->getActiveSheet()->SetCellValue('J'.$rowCount, $this->language->get('text_ean'));
        $objPHPExcel->getActiveSheet()->SetCellValue('K'.$rowCount, $this->language->get('text_jan'));
        $objPHPExcel->getActiveSheet()->SetCellValue('L'.$rowCount, $this->language->get('text_isbn'));
        $objPHPExcel->getActiveSheet()->SetCellValue('M'.$rowCount, $this->language->get('text_mpn'));
        $objPHPExcel->getActiveSheet()->SetCellValue('N'.$rowCount, $this->language->get('text_location'));
        $objPHPExcel->getActiveSheet()->SetCellValue('O'.$rowCount, $this->language->get('text_price'));
        $objPHPExcel->getActiveSheet()->getStyle('O'.$rowCount)->applyFromArray($styleArray);
        $objPHPExcel->getActiveSheet()->SetCellValue('P'.$rowCount, $this->language->get('text_tax_class'));
        $objPHPExcel->getActiveSheet()->getStyle('P'.$rowCount)->applyFromArray($styleArray2);
        $objPHPExcel->getActiveSheet()->SetCellValue('Q'.$rowCount, $this->language->get('text_quantity'));
        $objPHPExcel->getActiveSheet()->getStyle('Q'.$rowCount)->applyFromArray($styleArray);
        $objPHPExcel->getActiveSheet()->SetCellValue('R'.$rowCount, $this->language->get('text_minimum_quantity'));
        $objPHPExcel->getActiveSheet()->getStyle('R'.$rowCount)->applyFromArray($styleArray);
        $objPHPExcel->getActiveSheet()->SetCellValue('S'.$rowCount, $this->language->get('text_subtract_stock'));
        $objPHPExcel->getActiveSheet()->SetCellValue('T'.$rowCount, $this->language->get('text_out_of_stock_status'));
        $objPHPExcel->getActiveSheet()->SetCellValue('U'.$rowCount, $this->language->get('text_required_shipping'));
        $objPHPExcel->getActiveSheet()->SetCellValue('V'.$rowCount, $this->language->get('text_seo_url'));
        $objPHPExcel->getActiveSheet()->SetCellValue('W'.$rowCount, $this->language->get('text_date_available'));
        $objPHPExcel->getActiveSheet()->SetCellValue('X'.$rowCount, $this->language->get('text_dimensions'));
        $objPHPExcel->getActiveSheet()->SetCellValue('Y'.$rowCount, $this->language->get('text_length_class'));
        $objPHPExcel->getActiveSheet()->SetCellValue('Z'.$rowCount, $this->language->get('text_weight'));
        $objPHPExcel->getActiveSheet()->SetCellValue('AA'.$rowCount, $this->language->get('text_weight_class'));
        $objPHPExcel->getActiveSheet()->SetCellValue('AB'.$rowCount, $this->language->get('text_status'));
        $objPHPExcel->getActiveSheet()->getStyle('AB'.$rowCount)->applyFromArray($styleArray);
        $objPHPExcel->getActiveSheet()->SetCellValue('AC'.$rowCount, $this->language->get('text_sort_order'));
        $objPHPExcel->getActiveSheet()->SetCellValue('AD'.$rowCount, $this->language->get('text_manufacturer'));
        $objPHPExcel->getActiveSheet()->SetCellValue('AE'.$rowCount, $this->language->get('text_categories'));
        $objPHPExcel->getActiveSheet()->SetCellValue('AF'.$rowCount, $this->language->get('text_filters'));
        $objPHPExcel->getActiveSheet()->SetCellValue('AG'.$rowCount, $this->language->get('text_downloads'));
        $objPHPExcel->getActiveSheet()->SetCellValue('AH'.$rowCount, $this->language->get('text_related_products'));
        $objPHPExcel->getActiveSheet()->SetCellValue('AI'.$rowCount, $this->language->get('text_image'));
        $objPHPExcel->getActiveSheet()->getStyle('D1:F1')->applyFromArray($styleArray2);
        $objPHPExcel->getActiveSheet()->getStyle('H1:N1')->applyFromArray($styleArray2);
        $objPHPExcel->getActiveSheet()->getStyle('S1:AA1')->applyFromArray($styleArray2);
        $objPHPExcel->getActiveSheet()->getStyle('AC1:AI1')->applyFromArray($styleArray2);
        $objPHPExcel->getActiveSheet()->setTitle($this->language->get('text_general'));
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        // Sending headers to force the user to download the file
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="template_product.xls"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
//        
//        header("Content-Description: File Transfer");
//        header("Content-Type: application/octet-stream");
//        header('Content-Disposition: attachment; filename="'.basename($file_url).'"');
//        header("Content-Transfer-Encoding: binary");
//        header('Expires: 0');
//        header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
//        header('Pragma: public');
//        header("Content-Type: application/force-download");
//        header("Content-Type: application/download");
//        header("Content-Length: ".filesize($file_url));
//        flush();
//        readfile($file_url);
//        die();
    }
    public function downloadErrorLog() {
        
        $file_name = 'error_log.csv';
        $file_url = DIR_APPLICATION.'/view/theme/default/image/kbmp_marketplace/'.$file_name;

        header('Content-Type: application/octet-stream');
        header("Content-Transfer-Encoding: Binary"); 
        header("Content-disposition: attachment; filename=\"".$file_name."\""); 
        
        readfile($file_url);
        die();
    }
    
    public function addProduct($product_data) {
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $this->load->model('setting/kbmp_marketplace');
        
        $this->load->adminmodel('catalog/product');
        
        $seller = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        $store_id = (int) $this->config->get('config_store_id');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
        
        //Get Seller Configuration to overwrite default configuration if set exclusively for seller
        $seller_config = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerConfig($seller['seller_id'], $store_id);
        if (isset($seller_config) && !empty($seller_config)) {
            foreach ($seller_config as $sellerconfig) {
                $settings['kbmp_marketplace_setting'][$sellerconfig['key']] = $sellerconfig['value'];
            }
        }
        
        $seller_data = array('seller_id' => $seller['seller_id']);
        $seller_products_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerNewProducts($seller_data, 1);
        
        if (isset($seller['approved']) && $seller['approved'] != '1') {
            //Check product limit if seller is not approved
            if ($seller_products_total < $seller['product_limit']) {
                //Add Product and its details
                $product_id = $this->model_kbmp_marketplace_kbmp_marketplace->addProduct($product_data);

                //Add product entry in seller table of products to map products with seller
                if (isset($product_id) && !empty($product_id)) {
                    $this->model_kbmp_marketplace_kbmp_marketplace->addSellerProduct($seller['seller_id'], $product_id, $settings['kbmp_marketplace_setting']['kbmp_new_product_approval_required']);

                    //Check if approval required then send email
                    if (isset($settings['kbmp_marketplace_setting']['kbmp_new_product_approval_required']) && !empty($settings['kbmp_marketplace_setting']['kbmp_new_product_approval_required'])) {
                        //Send New Product Approval Request mail to admin
                        $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($seller['seller_id']);
                        $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(6);

                    } else {
                        //Add enabled product in tracking table if approval is not required and seller is not approved
                        if (isset($this->request->post['status']) && !empty($this->request->post['status'])) {
                            $this->model_kbmp_marketplace_kbmp_marketplace->addSellerProductsForTracking($seller['seller_id'], array('0' => array('product_id' => $product_id)));

                            //Set product status as disabled/inactive
                            $this->model_kbmp_marketplace_kbmp_marketplace->updateProductStatus($product_id, 0);
                        }
                    }
                }
            } else {
                $this->session->data['error_warning'] = $this->language->get('error_product_limit');
                $this->response->redirect($this->url->link('kbmp_marketplace/product_import', '', true));
            }
        } else {
            //Add Product and its details
            $product_id = $this->model_kbmp_marketplace_kbmp_marketplace->addProduct($product_data);

            //Add product entry in seller table of products to map products with seller
            if (isset($product_id) && !empty($product_id)) {
                $this->model_kbmp_marketplace_kbmp_marketplace->addSellerProduct($seller['seller_id'], $product_id, $settings['kbmp_marketplace_setting']['kbmp_new_product_approval_required']);

                //Check if approval required then send email
                if (isset($settings['kbmp_marketplace_setting']['kbmp_new_product_approval_required']) && !empty($settings['kbmp_marketplace_setting']['kbmp_new_product_approval_required'])) {
                    //Send New Product Approval Request mail to admin
                    $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($seller['seller_id']);
                    $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(6);
                }
            }
        }
    }
}
