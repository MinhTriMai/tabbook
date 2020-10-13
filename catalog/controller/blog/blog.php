<?php
class ControllerBlogBlog extends Controller 
{
	public function index() {
		$this->load->model('blog/article');
        $this->load->language('blog/blog');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('theme_' . $this->config->get('config_theme') . '_directory') . '/stylesheet/opentheme/ocblog.css')) {
			$this->document->addStyle('catalog/view/theme/'.$this->config->get('theme_' . $this->config->get('config_theme') . '_directory').'/stylesheet/opentheme/ocblog.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/opentheme/ocblog.css');
		}

		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}

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
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('module_ocblog_article_limit');
		}

		$this->document->setTitle($this->config->get('module_ocblog_meta_title'));
		$this->document->setDescription($this->config->get('module_ocblog_meta_description'));
		$this->document->setKeywords($this->config->get('module_ocblog_meta_keyword'));
		$this->document->addLink($this->url->link('blog/blog'),'');

		$data['heading_title'] = $this->config->get('module_ocblog_meta_title');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_blog'),
			'href' => $this->url->link('blog/blog')
		);

		$url = '';

		if (isset($this->request->get['filter'])) {
			$url .= '&filter=' . $this->request->get['filter'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		$data['articles'] = array();

		$filter_data = array(
			'filter_filter'      => $filter,
			'sort'               => $sort,
			'order'              => $order,
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit
		);

		$article_total = $this->model_blog_article->getTotalArticles($filter_data);

		$results = $this->model_blog_article->getArticles($filter_data);

		$this->load->model('tool/image');

		$image_size_width = (int)$this->config->get('module_ocblog_blog_width');
		$image_size_height = (int)$this->config->get('module_ocblog_blog_height');
		foreach ($results as $result) {
			if($image_size_width && $image_size_height) {
				$image = $this->model_tool_image->resize($result['image'], $image_size_width, $image_size_height);
			} else {
				$image = $this->model_tool_image->resize($result['image'], 100, 100);
			}
            $intro_text =html_entity_decode($result['intro_text'], ENT_QUOTES, 'UTF-8');
            $intro_text_new = strlen($intro_text) > 200 ? substr($intro_text,0,200)."..." : $intro_text;
			$data['articles'][] = array(
				'article_id'  => $result['article_id'],
				'name'        => $result['name'],
				'author'	  => $result['author'],
				'image'		  => $image,
				'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'date_added_m'  => date("d", strtotime($result['date_added'])),
				'date_added_d'  => date("F", strtotime($result['date_added'])),
				'date_added_y'  => date("y", strtotime($result['date_added'])),
				'intro_text' => $intro_text_new,
				'href'        => $this->url->link('blog/article', 'article_id=' . $result['article_id'] . $url),
                'event_link'       => $result['event_link'],
                'event_start_time' => date('Y-m-d',strtotime($result['event_start_time'])),
                'event_end_time' => date('Y-m-d',strtotime($result['event_end_time'])),
                'event_status' => $this->getEventStatus($result),
                'button_buy_ticket' => $this->language->get('button_buy_ticket'),
                'text_up_coming' => $this->language->get('text_up_coming'),
                'text_on_going' => $this->language->get('text_on_going'),
                'text_finish' => $this->language->get('text_finish'),
			);
		}

		$url = '';

		if (isset($this->request->get['filter'])) {
			$url .= '&filter=' . $this->request->get['filter'];
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

        if (isset($this->request->get['event_status'])) {
            $newData = array();
            foreach($data['articles'] as $article){
                if ($article['event_status'] == $this->request->get['event_status']){
                    $newData[] = $article;
                }
            }
            $data['articles'] = $newData;
            $article_total = count($data['articles']);
        }

        if(isset($this->request->get['week'])){
            $newData = array();
            $current_date = strtotime(date('Y/m/d'));
            $range = $this->getNumOfDayForWeek($this->request->get['week']);
            $rangeDate = [date('Y-m-d', strtotime("$range[0]", $current_date)), date('Y-m-d', strtotime("$range[1]", $current_date))];
            foreach($data['articles'] as $article){
                $date_added = DateTime::createFromFormat('d/m/Y', $article['date_added'])->format('Y-m-d');
                if ($date_added >= $rangeDate[1] && $date_added <= $rangeDate[0]){
                    $newData[] = $article;
                }
            }
            $data['articles'] = $newData;
            $article_total = count($data['articles']);
        }

		$data['sorts'] = array();

		$data['sorts'][] = array(
			'text'  => $this->language->get('text_default'),
			'value' => 'p.sort_order-ASC',
			'href'  => $this->url->link('blog/blog', '&sort=p.sort_order&order=ASC' . $url)
		);

		$url = '';

		if (isset($this->request->get['filter'])) {
			$url .= '&filter=' . $this->request->get['filter'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$data['limits'] = array();

		$limits = array_unique(array($this->config->get('module_ocblog_article_limit'), 50, 75, 100));

		sort($limits);

		foreach($limits as $value) {
			$data['limits'][] = array(
				'text'  => $value,
				'value' => $value,
				'href'  => $this->url->link('blog/blog', $url . '&limit=' . $value)
			);
		}

		$url = '';

		if (isset($this->request->get['filter'])) {
			$url .= '&filter=' . $this->request->get['filter'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

        if (isset($this->request->get['week'])) {
            $url .= '&week=' . $this->request->get['week'];
        }
        if (isset($this->request->get['limit'])) {
            $url .= '&event_status=' . $this->request->get['event_status'];
        }

		$pagination = new Pagination();
		$pagination->total = $article_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('blog/blog', $url . '&page={page}');

        $data['blog_url'] = $this->url->link('blog/blog');
		$data['pagination'] = $pagination->render();
		$data['text_empty'] = $this->language->get('text_empty');
		$data['results'] = sprintf($this->language->get('text_pagination'), ($article_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($article_total - $limit)) ? $article_total : ((($page - 1) * $limit) + $limit), $article_total, ceil($article_total / $limit));

		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['limit'] = $limit;

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('blog/blog', $data));
    }

    public function getEventStatus($data){
        $currentDate = date('Y-m-d');
        if ($currentDate < $data['event_start_time']){
            return "UC";
        }else if($data['event_start_time'] <= $currentDate && $currentDate <= $data['event_end_time']){
            return "OG";
        }else if($currentDate > $data['event_end_time']){
            return "F";
        }
        return '';
    }

    public function getNumOfDayForWeek($week){
	    switch ((int)$week){
            case 1:
                return ['+7 days', '-7 days'];
                break;
            case 2:
                return ['+14 days', '-14 days'];
                break;
            case 3:
                return ['+21 days', '-21 days'];
                break;
            case 4:
                return ['+28 days', '-28 days'];
                break;
        }
        return [];
    }
}