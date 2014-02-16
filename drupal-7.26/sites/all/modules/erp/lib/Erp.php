<?php
namespace erp;

class ERP {
	private static $_instance;
	
	private function __construct(){
		
	}
	
	public static function get_instance(){
		if(self::$_instance){
			self::$_instance = new ERP();
		}
		return self::$_instance;
	}
	
	public function set_connection($cn){
		if(null == $cn){
			throw new \Exception();
		}
	}
	
	public static function get_clients(){
		
	}
}