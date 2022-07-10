<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();?>
<?
IncludeTemplateLangFile(__FILE__);
?>
<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Place favicon.ico in the root directory -->
	<?$APPLICATION->ShowHead();?>
    <link rel="stylesheet" href="<?=SITE_TEMPLATE_PATH?>/dist/css/normalize.css">
    <link rel="stylesheet" href="<?=SITE_TEMPLATE_PATH?>/dist/css/font-awesome.min.css">

    <link rel="stylesheet" href="<?=SITE_TEMPLATE_PATH?>/dist/css/fonts.css">

    <link rel="stylesheet" href="<?=SITE_TEMPLATE_PATH?>/dist/css/remodal.css">
    <link rel="stylesheet" href="<?=SITE_TEMPLATE_PATH?>/dist/css/jquery-confirm.css">
    <link rel="stylesheet" href="<?=SITE_TEMPLATE_PATH?>/dist/slick/slick.css">
    <link rel="stylesheet" href="<?=SITE_TEMPLATE_PATH?>/dist/fancybox/jquery.fancybox.css">
    <link rel="stylesheet" href="<?=SITE_TEMPLATE_PATH?>/dist/fancybox/helpers/jquery.fancybox-thumbs.css">

    <link rel="stylesheet" href="<?=SITE_TEMPLATE_PATH?>/dist/css/main.css">

    <script src="<?=SITE_TEMPLATE_PATH?>/dist/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body class="wrap">
	<div id="panel"><?$APPLICATION->ShowPanel();?></div>
<header class="header">
    <div class="header__main__wrap">
        <div class="container header__container">
            <div class="header__logo">
                <div class="header__logo__link">
                    <div class="header__logo__image">
                        <a href="<?=SITE_DIR?>" title="<?=GetMessage("HDR_GOTO_MAIN")?>"><?$APPLICATION->IncludeFile(
									SITE_DIR."include/company_name.php",
									Array(),
									Array("MODE"=>"html")
								);?></a>
                    </div>
                </div>
                <div class="header__logo__text">
                    <?$APPLICATION->IncludeFile(
									SITE_DIR."include/company_slogan.php",
									Array(),
									Array("MODE"=>"html")
								);?>
                </div>
            </div>

            <div class="header__contacts__wrap clearfix">
                <a href="callto:8(383)000-00-00" class="header__contacts__phone">8 (383) 000-00-00</a>
                <a href="#" data-remodal-target="call" class="button button__small">
                    <span class="button__text">Заказать звонок</span>
                </a>

            </div>
        </div>
    </div>
</header>
<div class="page__menu__fixed">
    <nav class="page__menu">
        <div class="container">

<?$APPLICATION->IncludeComponent(
	"bitrix:menu", 
	".default", 
	array(
		"ROOT_MENU_TYPE" => "top",
		"MAX_LEVEL" => "1",
		"CHILD_MENU_TYPE" => "left",
		"USE_EXT" => "Y",
		"COMPONENT_TEMPLATE" => ".default",
		"MENU_CACHE_TYPE" => "N",
		"MENU_CACHE_TIME" => "3600",
		"MENU_CACHE_USE_GROUPS" => "Y",
		"MENU_CACHE_GET_VARS" => array(
		),
		"DELAY" => "N",
		"ALLOW_MULTI_SELECT" => "N"
	),
	false
);?>
</div>
    </nav>
</div>