<?php
if (!defined('B_PROLOG_INCLUDED') || B_PROLOG_INCLUDED !== true)
{
	die();
}

use \Bitrix\Main\Localization\Loc;
Loc::loadLanguageFile(__FILE__);


return array(
	'name' => Loc::getMessage('LANDING_DEMO_VALENTINE2_TITLE'),
	'description' => Loc::getMessage('LANDING_DEMO_VALENTINE2_DESCRIPTION'),
	'fields' => array(
		'ADDITIONAL_FIELDS' => array(
			'THEME_CODE' => 'travel',
			'THEMEFONTS_CODE' => 'Roboto',
			'THEMEFONTS_CODE_H' => 'Cormorant Infant',
			'THEMEFONTS_SIZE' => '1',
			'THEMEFONTS_USE' => 'Y',
			'UP_SHOW' => 'Y',
		)
	),
	'items' => array (
	),
	'available' => true,
);