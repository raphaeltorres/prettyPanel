<?php
##==================================================
## API Log Model
## @Author: Pinky Liwanagan
## @Date: 24-OCT-2013 
##==================================================

class Apilog_model extends CI_Model {

	public function __construct() {
		parent::__construct();
		
		//load database based on locale
		$locale		= ( strlen($this->uri->segment(3)) > 2 ) ? $this->uri->segment(4) : $this->uri->segment(3);
		$dbPrefix	= $this->config->item('db_prefix');
		$this->db	= $this->load->database($dbPrefix,TRUE);
		
		$utctimestamp = $this->db->query("SELECT UTC_TIMESTAMP() as utctimestamp");
		$this->utctimestamp = $utctimestamp->row()->utctimestamp;
	}
	
	public function apiLog($data)
	{
		//sanitized data
		$data = $this->security->xss_clean($data);
		//insert data
		$data['log_access_time'] = $this->utctimestamp;
		$query = $this->db->insert('api_logs', $data);
	}
	
}
?>