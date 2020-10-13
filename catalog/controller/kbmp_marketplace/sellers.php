<?php

class ControllerKbmpMarketplaceSellers extends Controller {

    public function index() {

        $this->load->language('kbmp_marketplace/sellers');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $this->load->model('setting/kbmp_marketplace');

        $this->load->model('tool/image');

        $this->document->addStyle('catalog/view/theme/default/stylesheet/kbmp_marketplace/custom.css');

        $store_id = (int) $this->config->get('config_store_id');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
        
        //Start - Changes added to Redirect customer on Home Page if module is disabled - added by Harsh on 15-Jan-2019
        if (isset($settings['kbmp_marketplace_setting']['kbmp_module_enable']) && $settings['kbmp_marketplace_setting']['kbmp_module_enable']) {
            //Do Nothing
        } else {
            //Redirect user on Home Page
            $this->response->redirect($this->url->link('common/home', '', true));
        }
        //Ends
        
        //Redirect user to home page if unauthorized access
        if (isset($settings['kbmp_marketplace_setting']['kbmp_show_seller_on_front']) && !$settings['kbmp_marketplace_setting']['kbmp_show_seller_on_front']) {
            $this->response->redirect($this->url->link('common/home', '', true));
        }
        
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'ksd.date_added';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->get['limit'])) {
            $limit = (int) $this->request->get['limit'];
        } else {
            $limit = $this->config->get('config_limit_admin');
        }
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_sellers'),
            'href' => $this->url->link('kbmp_marketplace/sellers', '', true)
        );

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_empty'] = $this->language->get('text_empty');
        $data['text_sort'] = $this->language->get('text_sort');
        $data['text_not_mentioned'] = $this->language->get('text_not_mentioned');
        
        $data['button_continue'] = $this->language->get('button_continue');

        $url = '';

        if (isset($this->request->get['limit'])) {
            $url .= '&limit=' . $this->request->get['limit'];
        }

        $data['sorts'] = array();

        $data['sorts'][] = array(
            'text' => $this->language->get('text_default'),
            'value' => 'ks.date_added-ASC',
            'href' => $this->url->link('kbmp_marketplace/sellers', '&sort=ks.date_added&order=ASC' . $url)
        );

        $data['sorts'][] = array(
            'text' => $this->language->get('text_name_asc'),
            'value' => 'ksd.title-ASC',
            'href' => $this->url->link('kbmp_marketplace/sellers', '&sort=ksd.title&order=ASC' . $url)
        );

        $data['sorts'][] = array(
            'text' => $this->language->get('text_name_desc'),
            'value' => 'ksd.title-DESC',
            'href' => $this->url->link('kbmp_marketplace/sellers', '&sort=ksd.title&order=DESC' . $url)
        );

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['limit'])) {
            $url .= '&limit=' . $this->request->get['limit'];
        }

        $data['sellers'] = array();

        $filter_data = array(
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $limit,
            'limit' => $limit
        );

        $sellers_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellers($filter_data);

        $results = $this->model_kbmp_marketplace_kbmp_marketplace->getSellers($filter_data);

        foreach ($results as $result) {
            if (!empty($result['logo'])) {
                $image = $this->model_tool_image->resize('sellers_logo/' . $result['logo'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
            } else {
                $image = $this->model_tool_image->resize('no_image.png', $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
            }

            //Get Seller Reviews details
            $seller_review_filter = array(
                'seller_id' => $result['seller_id'],
                'filter_status' => 1
            );
            $seller_rating = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerRating($seller_review_filter);
            
            $data['sellers'][] = array(
                'seller_id' => $result['seller_id'],
                'thumb' => $image,
                'title' => $result['title'],
                'rating' => $seller_rating,
                'href' => $this->url->link('kbmp_marketplace/sellers/view', '&seller_id=' . $result['seller_id'] . $url)
            );
        }

        $pagination = new Pagination();
        $pagination->total = $sellers_total;
        $pagination->page = $page;
        $pagination->limit = $limit;
        $pagination->url = $this->url->link('kbmp_marketplace/sellers', $url . '&page={page}');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($sellers_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($sellers_total - $limit)) ? $sellers_total : ((($page - 1) * $limit) + $limit), $sellers_total, ceil($sellers_total / $limit));

        $data['sort'] = $sort;
        $data['order'] = $order;
        $data['limit'] = $limit;

        $data['continue'] = $this->url->link('common/home');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('kbmp_marketplace/sellers', $data));
    }

    /*
     * Function to show sellers details and products listing
     */

    public function view() {

        $this->load->language('kbmp_marketplace/common');
        $this->load->language('kbmp_marketplace/sellers');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $this->load->model('setting/kbmp_marketplace');

        $this->load->model('tool/image');

        $this->document->addStyle('catalog/view/theme/default/stylesheet/kbmp_marketplace/custom.css');

        $store_id = (int) $this->config->get('config_store_id');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
        
        //Start - Changes added to Redirect customer on Home Page if module is disabled - added by Harsh on 15-Jan-2019
        if (isset($settings['kbmp_marketplace_setting']['kbmp_module_enable']) && $settings['kbmp_marketplace_setting']['kbmp_module_enable']) {
            //Do Nothing
        } else {
            //Redirect user on Home Page
            $this->response->redirect($this->url->link('common/home', '', true));
        }
        //Ends
        
        //Get Seller Configuration to overwrite default configuration if set exclusively for seller
        $seller_config = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerConfig($this->request->get['seller_id'], $store_id);
        if (isset($seller_config) && !empty($seller_config)) {
            foreach ($seller_config as $sellerconfig) {
                $settings['kbmp_marketplace_setting'][$sellerconfig['key']] = $sellerconfig['value'];
            }
        }
        $data['kbmp_marketplace_settings'] = $settings;

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'p.sort_order';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->get['limit'])) {
            $limit = (int) $this->request->get['limit'];
        } else {
            $limit = $this->config->get('config_limit_admin');
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_sellers'),
            'href' => $this->url->link('kbmp_marketplace/sellers/view', 'seller_id=' . $this->request->get['seller_id'], true)
        );

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_empty'] = $this->language->get('text_empty');
        $data['text_tax'] = $this->language->get('text_tax');
        $data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
        $data['text_sort'] = $this->language->get('text_sort');
        $data['text_limit'] = $this->language->get('text_limit');
        $data['text_view_reviews'] = $this->language->get('text_view_reviews');
        $data['text_write_review'] = $this->language->get('text_write_review');
        $data['text_total_seller_reviews'] = $this->language->get('text_total_seller_reviews');
        $data['text_not_mentioned'] = $this->language->get('text_not_mentioned');
        $data['text_empty_products'] = $this->language->get('text_empty_products');
        $data['text_empty_policy'] = $this->language->get('text_empty_policy');
        $data['text_contact_this_seller'] = $this->language->get('text_contact_this_seller');
        $data['text_empty_description'] = $this->language->get('text_empty_description');
        $data['text_description'] = $this->language->get('text_description');
        $data['text_return_policy'] = $this->language->get('text_return_policy');
        $data['text_shipping_policy'] = $this->language->get('text_shipping_policy');

        $data['button_cart'] = $this->language->get('button_cart');
        $data['button_wishlist'] = $this->language->get('button_wishlist');
        $data['button_compare'] = $this->language->get('button_compare');
        $data['button_continue'] = $this->language->get('button_continue');
        $data['button_list'] = $this->language->get('button_list');
        $data['button_grid'] = $this->language->get('button_grid');

        $data['compare'] = $this->url->link('product/compare');

        //Get Seller Reviews details
        $seller_review_filter = array(
            'seller_id' => $this->request->get['seller_id'],
            'filter_status' => 1
        );
        $data['seller_total_reviews'] = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerReviews($seller_review_filter);
        $data['seller_rating'] = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerRating($seller_review_filter) * 20;
        $data['seller_reviews_link'] = $this->url->link('kbmp_marketplace/sellers/reviews', '&seller_id=' . $this->request->get['seller_id']);

        //Get Seller Information
        $seller = $this->model_kbmp_marketplace_kbmp_marketplace->getSeller($this->request->get['seller_id']);

        if (isset($seller) && !empty($seller)) {
            if (!empty($seller['logo'])) {
                $image = $this->model_tool_image->resize('sellers_logo/' . $seller['logo'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
            } else {
                $image = $this->model_tool_image->resize('no_image.png', $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
            }

            if (!empty($seller['banner'])) {
                $banner = $this->model_tool_image->resize('sellers_banner/' . $seller['banner'], '1140', '380');
            } else {
                $banner = $this->model_tool_image->resize('no_image.png', '1140', '380');
            }

            $data['logo'] = $image;
            $data['banner'] = $banner;
            $data['title'] = $seller['title'];
            $data['return_policy'] = html_entity_decode($seller['return_policy']);
            $data['description'] = html_entity_decode($seller['description']);
            $data['shipping_policy'] = html_entity_decode($seller['shipping_policy']);
            $data['heading_title'] = $seller['title'];
            $data['fb_link'] = trim($seller['fb_link']);
            $data['gplus_link'] = trim($seller['gplus_link']);
            $data['twit_link'] = trim($seller['twit_link']);
//            var_dump($seller);die;
            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['products'] = array();

            $filter_data = array(
                'seller_id' => $this->request->get['seller_id'],
                'sort' => $sort,
                'order' => $order,
                'start' => ($page - 1) * $limit,
                'limit' => $limit
            );

            $product_total = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerProducts($filter_data);

            $results = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerProducts($filter_data);

            if (isset($results) && !empty($results)) {
                foreach ($results as $result) {
                    if (!empty($result['image'])) {
                        $image = $this->model_tool_image->resize($result['image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
                    } else {
                        $image = $this->model_tool_image->resize('no_image.png', $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
                    }

                    if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                        $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    } else {
                        $price = false;
                    }

                    if ((float) $result['special']) {
                        $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    } else {
                        $special = false;
                    }

                    if ($this->config->get('config_tax')) {
                        $tax = $this->currency->format((float) $result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
                    } else {
                        $tax = false;
                    }

                    if ($this->config->get('config_review_status')) {
                        $rating = (int) $result['rating'];
                    } else {
                        $rating = false;
                    }

                    $data['products'][] = array(
                        'product_id' => $result['product_id'],
                        'thumb' => $image,
                        'name' => $result['name'],
                        'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                        'price' => $price,
                        'special' => $special,
                        'tax' => $tax,
                        'minimum' => $result['minimum'] > 0 ? $result['minimum'] : 1,
                        'rating' => $result['rating'],
                        'href' => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $url)
                    );
                }
            }

            $url = '';

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['sorts'] = array();

            $data['sorts'][] = array(
                'text' => $this->language->get('text_default'),
                'value' => 'p.sort_order-ASC',
                'href' => $this->url->link('kbmp_marketplace/sellers/view', 'seller_id=' . $this->request->get['seller_id'] . '&sort=p.sort_order&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_name_asc'),
                'value' => 'pd.name-ASC',
                'href' => $this->url->link('kbmp_marketplace/sellers/view', 'seller_id=' . $this->request->get['seller_id'] . '&sort=pd.name&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_name_desc'),
                'value' => 'pd.name-DESC',
                'href' => $this->url->link('kbmp_marketplace/sellers/view', 'seller_id=' . $this->request->get['seller_id'] . '&sort=pd.name&order=DESC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_price_asc'),
                'value' => 'p.price-ASC',
                'href' => $this->url->link('kbmp_marketplace/sellers/view', 'seller_id=' . $this->request->get['seller_id'] . '&sort=p.price&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_price_desc'),
                'value' => 'p.price-DESC',
                'href' => $this->url->link('kbmp_marketplace/sellers/view', 'seller_id=' . $this->request->get['seller_id'] . '&sort=p.price&order=DESC' . $url)
            );

            if ($this->config->get('config_review_status')) {
                $data['sorts'][] = array(
                    'text' => $this->language->get('text_rating_desc'),
                    'value' => 'rating-DESC',
                    'href' => $this->url->link('kbmp_marketplace/sellers/view', 'seller_id=' . $this->request->get['seller_id'] . '&sort=rating&order=DESC' . $url)
                );

                $data['sorts'][] = array(
                    'text' => $this->language->get('text_rating_asc'),
                    'value' => 'rating-ASC',
                    'href' => $this->url->link('kbmp_marketplace/sellers/view', 'seller_id=' . $this->request->get['seller_id'] . '&sort=rating&order=ASC' . $url)
                );
            }

            $data['sorts'][] = array(
                'text' => $this->language->get('text_model_asc'),
                'value' => 'p.model-ASC',
                'href' => $this->url->link('kbmp_marketplace/sellers/view', 'seller_id=' . $this->request->get['seller_id'] . '&sort=p.model&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_model_desc'),
                'value' => 'p.model-DESC',
                'href' => $this->url->link('kbmp_marketplace/sellers/view', 'seller_id=' . $this->request->get['seller_id'] . '&sort=p.model&order=DESC' . $url)
            );

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            $data['limits'] = array();

            $limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

            sort($limits);

            foreach ($limits as $value) {
                $data['limits'][] = array(
                    'text' => $value,
                    'value' => $value,
                    'href' => $this->url->link('kbmp_marketplace/sellers/view', 'seller_id=' . $this->request->get['seller_id'] . $url . '&limit=' . $value)
                );
            }

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $pagination = new Pagination();
            $pagination->total = $product_total;
            $pagination->page = $page;
            $pagination->limit = $limit;
            $pagination->url = $this->url->link('kbmp_marketplace/sellers/view', 'seller_id=' . $this->request->get['seller_id'] . $url . '&page={page}');

            $data['pagination'] = $pagination->render();

            $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

            $data['sort'] = $sort;
            $data['order'] = $order;
            $data['limit'] = $limit;
        }

        $data['seller_id'] = $this->request->get['seller_id'];
        $data['continue'] = $this->url->link('common/home');

        $data['ticket_form_url'] = $this->url->link('kbmp_marketplace/ticket');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['sidebar'] = $this->load->controller('kbmp_marketplace/header');
        $data['kbmp_footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('common/header');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('kbmp_marketplace/seller_view', $data));
    }
    
    /*
     * Function to show sellers reviews
     */

    public function reviews() {

        $this->load->language('kbmp_marketplace/common');
        $this->load->language('kbmp_marketplace/seller_review');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $this->load->model('setting/kbmp_marketplace');

        $this->load->model('tool/image');

        $store_id = (int) $this->config->get('config_store_id');
        $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);
        
        //Start - Changes added to Redirect customer on Home Page if module is disabled - added by Harsh on 15-Jan-2019
        if (isset($settings['kbmp_marketplace_setting']['kbmp_module_enable']) && $settings['kbmp_marketplace_setting']['kbmp_module_enable']) {
            //Do Nothing
        } else {
            //Redirect user on Home Page
            $this->response->redirect($this->url->link('common/home', '', true));
        }
        //Ends
        
        //Get Seller Configuration to overwrite default configuration if set exclusively for seller
        $seller_config = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerConfig($this->request->get['seller_id'], $store_id);
        if (isset($seller_config) && !empty($seller_config)) {
            foreach ($seller_config as $sellerconfig) {
                $settings['kbmp_marketplace_setting'][$sellerconfig['key']] = $sellerconfig['value'];
            }
        }
        $data['kbmp_marketplace_settings'] = $settings;
        
        $this->document->addStyle('catalog/view/javascript/marketplace/marketplace.css');
        $this->document->addStyle('catalog/view/theme/default/stylesheet/kbmp_marketplace/custom.css');
        $this->document->addScript('catalog/view/javascript/marketplace/validation/marketplace-validation.js');
        $this->document->addScript('catalog/view/javascript/marketplace/validation/velovalidation.js');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_sellers'),
            'href' => $this->url->link('kbmp_marketplace/sellers/reviews', 'seller_id=' . $this->request->get['seller_id'], true)
        );
        
        //Handle the Post Request
        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            $this->model_kbmp_marketplace_kbmp_marketplace->addSellerReview($this->request->post, $this->request->get['seller_id'], $settings['kbmp_marketplace_setting']['kbmp_seller_review_approval_required']);
            
            //Send Review notification to admin
            $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($this->request->get['seller_id']);
            $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(13);

            if (isset($email_template) && !empty($email_template)) {
                $message = str_replace("{{rating}}", $this->request->post['rating'], $email_template['email_content']); //Rating
                $message = str_replace("{{review_comment}}", $this->request->post['text'], $message); //Review Comment
                $message = str_replace("{{shop_title}}", $seller_details['title'], $message); //Shop Title
                $message = str_replace("{{seller_name}}", $seller_details['firstname'] . ' ' . $seller_details['lastname'], $message); //Seller Name
                $message = str_replace("{{seller_email}}", $seller_details['email'], $message); //Seller Email
                $message = str_replace("{{seller_contact}}", $seller_details['telephone'], $message); //Seller Contact
                $message = str_replace("{{shop_url}}", HTTPS_SERVER , $message); //Store URL

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

                $mail->setTo($this->config->get('config_email'));
                $mail->setFrom($this->config->get('config_email'));
                $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
                $mail->setSubject(html_entity_decode($email_template['email_subject'], ENT_QUOTES, 'UTF-8'));
                $mail->setHtml($email_content);
                $mail->send();
            }
            
            //Send Review notification to seller
            $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($this->request->get['seller_id']);
            $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(14);

            if (isset($email_template) && !empty($email_template)) {
                $message = str_replace("{{rating}}", $this->request->post['rating'], $email_template['email_content']); //Rating
                $message = str_replace("{{review_comment}}", $this->request->post['text'], $message); //Review Comment
                $message = str_replace("{{shop_title}}", $seller_details['title'], $message); //Shop Title
                $message = str_replace("{{seller_name}}", $seller_details['firstname'] . ' ' . $seller_details['lastname'], $message); //Seller Name
                $message = str_replace("{{seller_email}}", $seller_details['email'], $message); //Seller Email
                $message = str_replace("{{seller_contact}}", $seller_details['telephone'], $message); //Seller Contact
                $message = str_replace("{{shop_url}}", HTTPS_SERVER , $message); //Store URL

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
            
            $this->session->data['success'] = $this->language->get('text_success');
            
            $this->response->redirect($this->url->link('kbmp_marketplace/sellers/reviews', '&seller_id='.$this->request->get['seller_id'], true));
        }
        
        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }
        
        if (isset($this->request->get['limit'])) {
            $limit = (int) $this->request->get['limit'];
        } else {
            $limit = $this->config->get('config_limit_admin');
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_empty_reviews'] = $this->language->get('text_empty_reviews');
        $data['text_view_reviews'] = $this->language->get('text_view_reviews');
        $data['text_write_review'] = $this->language->get('text_write_review');
        $data['text_total_seller_reviews'] = $this->language->get('text_total_seller_reviews');
        $data['text_your_name'] = $this->language->get('text_your_name');
        $data['text_your_review'] = $this->language->get('text_your_review');
        $data['text_note'] = $this->language->get('text_note');
        $data['text_note_description'] = $this->language->get('text_note_description');
        $data['text_rating'] = $this->language->get('text_rating');
        $data['text_bad'] = $this->language->get('text_bad');
        $data['text_good'] = $this->language->get('text_good');
        
        $data['button_save'] = $this->language->get('button_save');
        
        //Velovalidation Text
        $data['empty_fname'] = $this->language->get('empty_fname');
        $data['maxchar_fname'] = $this->language->get('maxchar_fname');
        $data['minchar_fname'] = $this->language->get('minchar_fname');
        $data['empty_mname'] = $this->language->get('empty_mname');
        $data['maxchar_mname'] = $this->language->get('maxchar_mname');
        $data['minchar_mname'] = $this->language->get('minchar_mname');
        $data['only_alphabet'] = $this->language->get('only_alphabet');
        $data['empty_lname'] = $this->language->get('empty_lname');
        $data['maxchar_lname'] = $this->language->get('maxchar_lname');
        $data['minchar_lname'] = $this->language->get('minchar_lname');
        $data['alphanumeric'] = $this->language->get('alphanumeric');
        $data['empty_pass'] = $this->language->get('empty_pass');
        $data['maxchar_pass'] = $this->language->get('maxchar_pass');
        $data['minchar_pass'] = $this->language->get('minchar_pass');
        $data['specialchar_pass'] = $this->language->get('specialchar_pass');
        $data['alphabets_pass'] = $this->language->get('alphabets_pass');
        $data['capital_alphabets_pass'] = $this->language->get('capital_alphabets_pass');
        $data['small_alphabets_pass'] = $this->language->get('small_alphabets_pass');
        $data['digit_pass'] = $this->language->get('digit_pass');
        $data['empty_field'] = $this->language->get('empty_field');
        $data['empty_field_lang'] = $this->language->get('empty_field_lang');
        $data['number_field'] = $this->language->get('number_field');
        $data['positive_number'] = $this->language->get('positive_number');
        $data['maxchar_field'] = $this->language->get('maxchar_field');
        $data['minchar_field'] = $this->language->get('minchar_field');
        $data['empty_email'] = $this->language->get('empty_email');
        $data['validate_email'] = $this->language->get('validate_email');
        $data['empty_country'] = $this->language->get('empty_country');
        $data['maxchar_country'] = $this->language->get('maxchar_country');
        $data['minchar_country'] = $this->language->get('minchar_country');
        $data['empty_city'] = $this->language->get('empty_city');
        $data['maxchar_city'] = $this->language->get('maxchar_city');
        $data['minchar_city'] = $this->language->get('minchar_city');
        $data['empty_state'] = $this->language->get('empty_state');
        $data['maxchar_state'] = $this->language->get('maxchar_state');
        $data['minchar_state'] = $this->language->get('minchar_state');
        $data['empty_proname'] = $this->language->get('empty_proname');
        $data['maxchar_proname'] = $this->language->get('maxchar_proname');
        $data['minchar_proname'] = $this->language->get('minchar_proname');
        $data['empty_catname'] = $this->language->get('empty_catname');
        $data['maxchar_catname'] = $this->language->get('maxchar_catname');
        $data['minchar_catname'] = $this->language->get('minchar_catname');
        $data['empty_zip'] = $this->language->get('empty_zip');
        $data['maxchar_zip'] = $this->language->get('maxchar_zip');
        $data['minchar_zip'] = $this->language->get('minchar_zip');
        $data['empty_username'] = $this->language->get('empty_username');
        $data['maxchar_username'] = $this->language->get('maxchar_username');
        $data['minchar_username'] = $this->language->get('minchar_username');
        $data['invalid_date'] = $this->language->get('invalid_date');
        $data['maxchar_sku'] = $this->language->get('maxchar_sku');
        $data['minchar_sku'] = $this->language->get('minchar_sku');
        $data['invalid_sku'] = $this->language->get('invalid_sku');
        $data['empty_sku'] = $this->language->get('empty_sku');
        $data['validate_range'] = $this->language->get('validate_range');
        $data['empty_address'] = $this->language->get('empty_address');
        $data['minchar_address'] = $this->language->get('minchar_address');
        $data['maxchar_address'] = $this->language->get('maxchar_address');
        $data['empty_company'] = $this->language->get('empty_company');
        $data['minchar_company'] = $this->language->get('minchar_company');
        $data['maxchar_company'] = $this->language->get('maxchar_company');
        $data['invalid_phone'] = $this->language->get('invalid_phone');
        $data['empty_phone'] = $this->language->get('empty_phone');
        $data['minchar_phone'] = $this->language->get('minchar_phone');
        $data['maxchar_phone'] = $this->language->get('maxchar_phone');
        $data['empty_brand'] = $this->language->get('empty_brand');
        $data['maxchar_brand'] = $this->language->get('maxchar_brand');
        $data['minchar_brand'] = $this->language->get('minchar_brand');
        $data['empty_shipment'] = $this->language->get('empty_shipment');
        $data['maxchar_shipment'] = $this->language->get('maxchar_shipment');
        $data['minchar_shipment'] = $this->language->get('minchar_shipment');
        $data['invalid_ip'] = $this->language->get('invalid_ip');
        $data['invalid_url'] = $this->language->get('invalid_url');
        $data['empty_url'] = $this->language->get('empty_url');
        $data['valid_amount'] = $this->language->get('valid_amount');
        $data['valid_decimal'] = $this->language->get('valid_decimal');
        $data['max_email'] = $this->language->get('max_email');
        $data['specialchar_zip'] = $this->language->get('specialchar_zip');
        $data['specialchar_sku'] = $this->language->get('specialchar_sku');
        $data['max_url'] = $this->language->get('max_url');
        $data['valid_percentage'] = $this->language->get('valid_percentage');
        $data['between_percentage'] = $this->language->get('between_percentage');
        $data['maxchar_size'] = $this->language->get('maxchar_size');
        $data['specialchar_size'] = $this->language->get('specialchar_size');
        $data['specialchar_upc'] = $this->language->get('specialchar_upc');
        $data['maxchar_upc'] = $this->language->get('maxchar_upc');
        $data['specialchar_ean'] = $this->language->get('specialchar_ean');
        $data['maxchar_ean'] = $this->language->get('maxchar_ean');
        $data['specialchar_bar'] = $this->language->get('specialchar_bar');
        $data['maxchar_bar'] = $this->language->get('maxchar_bar');
        $data['positive_amount'] = $this->language->get('positive_amount');
        $data['maxchar_color'] = $this->language->get('maxchar_color');
        $data['invalid_color'] = $this->language->get('invalid_color');
        $data['specialchar'] = $this->language->get('specialchar');
        $data['script'] = $this->language->get('script');
        $data['style'] = $this->language->get('style');
        $data['iframe'] = $this->language->get('iframe');
        $data['not_image'] = $this->language->get('not_image');
        $data['image_size'] = $this->language->get('image_size');
        $data['html_tags'] = $this->language->get('html_tags');
        $data['number_pos'] = $this->language->get('number_pos');
        $data['invalid_separator'] = $this->language->get('invalid_separator');

        //Get Seller Reviews details
        $seller_review_filter = array(
            'seller_id' => $this->request->get['seller_id'],
            'filter_status' => 1,
            'start' => ($page - 1) * $limit,
            'limit' => $limit
        );
        $seller_reviews = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerReviews($seller_review_filter);
        $seller_total_reviews = $this->model_kbmp_marketplace_kbmp_marketplace->getTotalSellerReviews($seller_review_filter);
        $data['seller_rating'] = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerRating($seller_review_filter) * 20;
        $data['seller_reviews_link'] = $this->url->link('kbmp_marketplace/sellers/reviews', '&seller_id=' . $this->request->get['seller_id']);

        $data['seller_total_reviews'] = sprintf($data['text_total_seller_reviews'], $seller_total_reviews);
        $data['seller_reviews'] = array();
        if (isset($seller_reviews) && !empty($seller_reviews)) {
            foreach ($seller_reviews as $seller_review) {
                $data['seller_reviews'][] = array(
                    'author' => $seller_review['author'],
                    'date' => date($this->language->get('date_format_short'), strtotime($seller_review['date_added'])),
                    'comment' => $seller_review['text'],
                    'rating' => $seller_review['rating']
                );
            }
        }
        //Get Seller Information
        $seller = $this->model_kbmp_marketplace_kbmp_marketplace->getSeller($this->request->get['seller_id']);

        if (isset($seller) && !empty($seller)) {
            if (!empty($seller['logo'])) {
                $image = $this->model_tool_image->resize('sellers_logo/' . $seller['logo'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
            } else {
                $image = $this->model_tool_image->resize('no_image.png', $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
            }

            if (!empty($seller['banner'])) {
                $banner = $this->model_tool_image->resize('sellers_banner/' . $seller['banner'], '1140', '380');
            } else {
                $banner = $this->model_tool_image->resize('no_image.png', '1140', '380');
            }

            $data['logo'] = $image;
            $data['banner'] = $banner;
            $data['title'] = $seller['title'];
            $data['heading_title'] = $seller['title'];

        }
        
        if ($this->customer->isLogged()) {
            $data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
        } else {
            $data['customer_name'] = '';
        }
        
        if (isset($this->error['warning'])) {
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
        
        $pagination = new Pagination();
        $pagination->total = $seller_total_reviews;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('kbmp_marketplace/sellers/reviews', '&seller_id=' . $this->request->get['seller_id'] . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($seller_total_reviews) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($seller_total_reviews - $this->config->get('config_limit_admin'))) ? $seller_total_reviews : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $seller_total_reviews, ceil($seller_total_reviews / $this->config->get('config_limit_admin')));

        $data['continue'] = $this->url->link('common/home');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['sidebar'] = $this->load->controller('kbmp_marketplace/header');
        $data['kbmp_footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('common/header');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('kbmp_marketplace/seller_review', $data));
    }
    
    /*
     * Function to re-send account approval request to admin
     */
    public function approval_request() {
     
        $this->load->language('kbmp_marketplace/sellers');
        
        $this->load->model('kbmp_marketplace/kbmp_marketplace');
        $this->load->model('setting/kbmp_marketplace');
        
        //Get Seller Information
        $seller = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerByCustomerId();
        
        if (isset($seller['seller_id']) && !empty($seller['seller_id'])) {
            $store_id = (int) $this->config->get('config_store_id');
            $settings = $this->model_setting_kbmp_marketplace->getSetting('kbmp_marketplace', $store_id);

            //Get Seller Configuration to overwrite default configuration if set exclusively for seller
            $seller_config = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerConfig($seller['seller_id'], $store_id);
            if (isset($seller_config) && !empty($seller_config)) {
                foreach ($seller_config as $sellerconfig) {
                    $settings['kbmp_marketplace_setting'][$sellerconfig['key']] = $sellerconfig['value'];
                }
            }

	    //Start Changes added to check Approval Request Limit to resolve the issue of not checking the same 24-Dec-2018 - Harsh Agarwal
            if ($seller['disapproval_count'] <= $seller['approval_request_limit']) {
	    //Ends
                if ($this->model_kbmp_marketplace_kbmp_marketplace->sendApprovalRequestAgain($seller['seller_id'])) {
                    
                    //Send email to notify admin about approval request
                    $seller_details = $this->model_kbmp_marketplace_kbmp_marketplace->getSellerAccountDetails($seller['seller_id']);
                    $email_template = $this->model_kbmp_marketplace_kbmp_marketplace->getEmailTemplate(5);

                    if (isset($email_template) && !empty($email_template)) {
                        $message = str_replace("{{seller_name}}", $seller_details['firstname'] . ' ' . $seller_details['lastname'], $email_template['email_content']); //seller Name
                        $message = str_replace("{{shop_title}}", $seller_details['title'], $message); //Shop Title
                        $message = str_replace("{{seller_email}}", $seller_details['email'], $message); //Seller Email
                        $message = str_replace("{{seller_contact}}", $seller_details['telephone'], $message); //Seller Contact

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

                        $mail->setTo($this->config->get('config_email'));
                        $mail->setFrom($this->config->get('config_email'));
                        $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
                        $mail->setSubject(html_entity_decode($email_template['email_subject'], ENT_QUOTES, 'UTF-8'));
                        $mail->setHtml($email_content);
                        $mail->send();
                    }
                    
                    $this->session->data['success'] = $this->language->get('text_seller_approval_request');
                } else {
                    $this->session->data['error'] = $this->language->get('error_seller_approval_request');
                }
            } else {
                $this->session->data['error'] = $this->language->get('error_seller_approval_request');
            }            
        }
        
        $this->response->redirect($this->url->link('kbmp_marketplace/seller_profile', '', true));
        
    }

}
