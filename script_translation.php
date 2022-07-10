<?php
require($_SERVER['DOCUMENT_ROOT'].'/bitrix/modules/main/include/prolog_before.php');

\Bitrix\Main\Loader::includeModule('iblock');

$dbItems = \Bitrix\Iblock\ElementTable::getList(array(
    'order' => array('SORT' => 'asc'),
    'select' => array('ID', 'NAME', 'IBLOCK_ID'),
    'filter' => array('IBLOCK_ID' => 1),
    'limit' => 10
));

$arAttribute = [];

while ($arItem = $dbItems->fetch()){
// свойства элементов
    $dbProperty = \CIBlockElement::getProperty(
    $arItem['IBLOCK_ID'],
    $arItem['ID']
    ); 
    
    while($arProperty = $dbProperty->Fetch()){  
        $arItem['PROPERTIES'][] = $arProperty;
        
    }
    $arAttribute[] = $arItem;
}


file_put_contents('news.json', json_encode($arAttribute, JSON_FORCE_OBJECT));

header('Content-type: application/json');
echo json_encode($arAttribute);

