<?php

class ControllerKbmpMarketplaceEditProduct extends Controller {

    public function index() {

        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('kbmp_marketplace/edit_product', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }
        $this->load->language('kbmp_marketplace/edit_product');
        $this->document->addStyle('catalog/view/javascript/marketplace/marketplace.css');
        $this->document->addStyle('catalog/view/javascript/validation/admin_validation.css');
        $this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
        $this->document->addStyle('catalog/view/javascript/summernote/summernote.css');
        $this->document->addScript('catalog/view/javascript/summernote/summernote.js');
        $this->document->addScript('catalog/view/javascript/summernote/opencart.js');
        $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
        $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
        $this->document->addScript('catalog/view/javascript/validation/marketPlace-validation.js');
        $this->document->addScript('catalog/view/javascript/validation/velovalidation.js');
        $this->document->addScript('catalog/view/javascript/marketplace/marketplace-custom.js');

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_my_account'] = $this->language->get('text_my_account');

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
            'text' => $this->language->get('text_current_title'),
            'href' => $this->url->link('common/home')
        );

        $data['sidebar'] = $this->load->controller('kbmp_marketplace/header');
        $data['kbmp_footer'] = $this->load->view('kbmp_marketplace/footer', $data);
        $data['header'] = $this->load->controller('common/header');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('kbmp_marketplace/edit_product', $data));
    }

}
