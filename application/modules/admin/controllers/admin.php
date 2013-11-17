<?php

class Admin extends CI_Controller {
	
	
	public function __construct() {
		parent::__construct();
		
		$this->load->model('admin_model');
		
		//template path
		$this->globalTpl = $this->config->item('global_tpl');
		$this->globalhdr = $this->config->item('global_hdr');
		
		//get flash data for error/info message
		$this->msgClass = ( $this->session->flashdata('msgClass') ) ? $this->session->flashdata('msgClass') : '';
		$this->msgInfo  = ( $this->session->flashdata('msgInfo') ) ? $this->session->flashdata('msgInfo') : '';
	}
	
	
	//loads the login form
	function index()
	{
		$this->load->library('form_validation');  
		
		$this->form_validation->set_rules('username', 'Username or Email', 'xss_clean|trim|required|valid_email');
		$this->form_validation->set_rules('password', 'password', 'xss_clean|trim|required');
		
		if($this->form_validation->run() == FALSE)
		{
			//set forms open, close and inputs
			$form_open	= form_open_multipart('',array('class' => 'form-horizontal', 'method' => 'post'));
			$form_close	= form_close();
			$username	= form_input(array('name' => 'username', 'class' => 'input-large span10' , 'id' => 'focusedInput', 'placeholder' => 'Enter Email'));
			$password	= form_password(array('name' => 'password', 'class' => 'input-large span10' , 'id' => 'focusedInput', 'placeholder' => 'Enter Password'));
			
			$res = $this->admin_model->countryList();
			
			if ( validation_errors() ){
				$this->msgClass = 'alert alert-error';
				$this->msgInfo  = validation_errors();
			}
			
			$data['title']			= 'Login';
			$data['countryList'] 	= $res->data->countrylist;
			$data['baseUrl'] 		= base_url();
			$data['msgClass'] 		= $this->msgClass;
			$data['msgInfo'] 		= $this->msgInfo;
			$data['username'] 		= $username;
			$data['password'] 		= $password;
			$data['formOpen'] 		= $form_open;
			$data['formClose'] 		= $form_close;

			$this->parser->parse('login_form.tpl', $data);
		}
		else{
			$login_data = array(
				'username' => $this->input->post('username'),
				'password' => $this->input->post('password'),
				'locale'   => strtolower($this->input->post('locale'))
			);	
			
			$login = $this->admin_model->validate($login_data);
				
			// echo "<pre />";
			// print_r($login);
			// exit;
			if ( $login->rc == 0 ){
				$data = array(
					'userid' 		=> $login->data->user->userid,
					'email'	 		=> $login->data->user->email,
					'fname'	 		=> $login->data->user->fname,
					'lname'			=> $login->data->user->lname,
					'logid' 		=> $login->data->user->log_id,
					'locale' 		=> $login->data->user->locale,
					'user_level_id' => $login->data->user->user_level_id,
					'is_logged_in'  => true
				);
				
				$this->session->set_userdata($data);
				redirect('dashboard/members_area');
			}
			else{
				$msgClass = 'alert alert-error';
				$msgInfo  = ( $login->message[0] ) ? $login->message[0] : 'Invalid Username and/or Password.';	
				
				//set flash data for error/info message
				$msginfo_arr = array(
					'msgClass' => $msgClass,
					'msgInfo'  => $msgInfo,
				);
				$this->session->set_flashdata($msginfo_arr);
				
				// echo "<pre />";
				// print_r($msginfo_arr);
				redirect('admin');
			}	
		}

	}
	
	//login into the system
	function validate_credentials()
	{	
		$login_data = array(
			'username' => $this->input->post('username'),
			'password' => $this->input->post('password'),
			'locale'   => strtolower($this->input->post('locale'))
		);	
		
		$login = $this->admin_model->validate($login_data);
			
		// echo "<pre />";
		// print_r($login);
		// exit;
		if ( $login->rc == 0 ){
			$data = array(
				'userid' 		=> $login->data->user->userid,
				'email'	 		=> $login->data->user->email,
				'fname'	 		=> $login->data->user->fname,
				'lname'			=> $login->data->user->lname,
				'logid' 		=> $login->data->user->log_id,
				'locale' 		=> $login->data->user->locale,
				'user_level_id' => $login->data->user->user_level_id,
				'is_logged_in'  => true
			);
			
			$this->session->set_userdata($data);
			redirect('dashboard/members_area');
		}
		else{
			$msgClass = 'alert alert-error';
			$msgInfo  = ( $login->message[0] ) ? $login->message[0] : 'Invalid Username and/or Password.';	
			
			//set flash data for error/info message
			$msginfo_arr = array(
				'msgClass' => $msgClass,
				'msgInfo'  => $msgInfo,
			);
			$this->session->set_flashdata($msginfo_arr);
			
			// echo "<pre />";
			// print_r($msginfo_arr);
			redirect('admin');
		}		
	}	
	
	
	// display dashboard upon validating credentials
	function dashboard()
	{
	
		$this->hero_session->is_active_session();
		$data['mainContent'] = 'dashboard.tpl';
		
		$data['data'] = array(
			'baseUrl'	=> base_url(),
			'title'   	=> 'Dashboard',
			'msgClass'  => $this->msgClass,
			'msgInfo'   => $this->msgInfo,
		);
		
		$this->load->view($this->globalTpl, $data);		
	}
	
	// logout user from the system, record exit time in the API
	function logout()
	{
		$this->load->model('admin_model');
		$logout = $this->admin_model->logout();
		$this->session->unset_userdata('username');
		$this->session->unset_userdata('is_logged_in');
		$this->session->sess_destroy();
		redirect('admin');
	}	

	function postProduct()
	{
		$url = 'http://localhost/MoneyMaxPH/api/products/98740/';
		
		$insert_data = array(
				'product_name'			 => 'Iphone',
				'product_description'	 => 'Iphone5',
				'product_type_id'		 => 1,
				'featured'	 			 => 0,
				'country_id' 			 => 1,
				'company_id' 			 => 1,
				'area_id' 				 => 1,
				'product_icon' 			 => 'ico',
				'product_link' 			 => 'asdadad',
			);
			
		$result = $this->curl->simple_post($url , $data , array(CURLOPT_SSL_VERIFYPEER => false, CURLOPT_SSL_VERIFYHOST=> false));

		echo "<pre />";
		print_r($result);
	}
}