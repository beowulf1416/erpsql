<?php
function erp_settings_form($form, &$form_state){
	$form["save"] = array(
		"#type"=>"submit",
		"#value"=>t("Save"),
		"#name"=>"btn-save"
	);
	
	return $form;
}