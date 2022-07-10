<?php
require($_SERVER['DOCUMENT_ROOT'].'/bitrix/modules/main/include/prolog_before.php');
use Bitrix\Main\Loader;
use Bitrix\Iblock\ElementTable;
use Bitrix\Main\Web\Json;
use Bitrix\Main\Web\HttpClient;

\Bitrix\Main\Loader::includeModule('iblock');
$url = "http://bitrix/script_translation.php";
$httpClient = new HttpClient($options);
$httpClient->get($url);
$res = $httpClient->getResult();
$iBlockId = 1;
$jsonData = [];
$excludedIds = [];

try {
    $ar = Json::decode($httpClient->getResult());
} catch (\Exception $e){
    echo 'Ошибка: ',  $e->getMessage(), "\n";
}
$el = new CIBlockElement;
foreach ($ar as $item) {
    $PROP = array();
    $PROP['pr_name'] = $item['PROPERTIES'][0]['VALUE'];
    $PROP['pr_date'] = $item['PROPERTIES'][1]['VALUE']; 
    $PROP['pr_anons'] = $item['PROPERTIES'][2]['VALUE']; 
    $PROP['pr_otv'] = $item['PROPERTIES'][3]['VALUE']; 
    $PROP['pr_address'] = $item['PROPERTIES'][4]['VALUE'];  
    $PROP['pr_map'] = $item['PROPERTIES'][5]['VALUE'];  
    //echo '<pre>';print_r($PROP);
    $arLoadProductArray = Array(
        "MODIFIED_BY"    => $USER->GetID(), // элемент изменен текущим пользователем
        "IBLOCK_SECTION_ID" => false,          // элемент лежит в корне раздела
        "IBLOCK_ID"      => 6,
        "PROPERTY_VALUES"=> $PROP,
        "NAME"           => $item['NAME'],
        "ACTIVE"         => "Y"
        );
      
      if($PRODUCT_ID = $el->Add($arLoadProductArray))
        echo "New ID: ".$PRODUCT_ID;
      else
        echo "Error: ".$el->LAST_ERROR;
}

