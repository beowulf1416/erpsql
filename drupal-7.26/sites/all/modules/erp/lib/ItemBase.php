<?php
namespace erp;

abstract class ItemBase {
	public function get_id();
	public function is_active();
	public function get_name();
}