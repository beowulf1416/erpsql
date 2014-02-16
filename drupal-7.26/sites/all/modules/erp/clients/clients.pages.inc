<?php
function clients_settings_form($form, &$form_state){
	$form["save"] = array(
		"#type"=>"submit",
		"#value"=>t("Save"),
		"#name"=>"btn-save"
	);
	
	return $form;
}

function clients_form($form, &$form_state){
	$form["save"] = array(
		"#type"=>"submit",
		"#value"=>t("Save"),
		"#name"=>"btn-save"
	);
	
	return $form;
}