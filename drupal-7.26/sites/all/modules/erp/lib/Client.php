<?php
namespace erp\clients;

use erp\ItemBase;
uses \erp;

class Client implements ItemBase {
	private $_id;
	private $_active;
	private $_name;
	
	public function __construct(){
		
	}
	
	public function get_id(){
		return $this->_id;
	}
	
	public function is_active(){
		return $this->_active;
	}
	
	public function get_name(){
		return $this->_name;
	}
}