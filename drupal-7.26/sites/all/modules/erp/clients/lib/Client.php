<?php
namespace erp;

class Client {
	private $_name;
	private $_desc;
	
	public function __construct($name, $desc){
		$this->_name = $name;
		$this->_desc = $desc;
	}
	
	public function get_name(){
		return $this->_name;
	}
	
	public function get_description(){
		return $this->_desc;
	}
}