<?
if(!defined("B_PROLOG_INCLUDED")||B_PROLOG_INCLUDED!==true)die();
/**
 * Bitrix vars
 *
 * @var array $arParams
 * @var array $arResult
 * @var CBitrixComponentTemplate $this
 * @global CMain $APPLICATION
 * @global CUser $USER
 */
?>
<section class="first__section">
<?if(!empty($arResult["ERROR_MESSAGE"]))
{
	foreach($arResult["ERROR_MESSAGE"] as $v)
		ShowError($v);
}
if($arResult["OK_MESSAGE"] <> '')
{
	?><div class="mf-ok-text"><?=$arResult["OK_MESSAGE"]?></div><?
}
?>



        <h1 class="hidden">Установка натяжных потолков и осветительных приборов</h1>
        <div class="first__slider__wrap">
            <div class="first__slider__inner js_slider">
                <div class="first__slide">
                    <div class="first__slide__image" style="background-image: url('<?=SITE_TEMPLATE_PATH?>/content/slide.jpg')"></div>

                    <div class="first__slide__content">
                        <div class="container">
                            <div class="first__title"><span class="orange">Установка</span> натяжных потолков<br/>и
                                осветительных приборов
                            </div>
                            <div class="first__slide__delimer"></div>
                            <div class="first__slide__text">Стабильно и качественно<br/>выполняем свою работу на
                                протяжении 8 лет
                            </div>
                        </div>
                    </div>

                </div>
                <div class="first__slide">
                    <div class="first__slide__image" style="background-image: url('<?=SITE_TEMPLATE_PATH?>/content/slide.jpg')"></div>
                    <div class="first__slide__content">
                        <div class="container">
                            <div class="first__title"><span class="orange">Установка</span> натяжных потолков<br/>и
                                осветительных приборов
                            </div>
                            <div class="first__slide__delimer"></div>
                            <div class="first__slide__text">Стабильно и качественно<br/>выполняем свою работу на
                                протяжении 8 лет
                            </div>
                        </div>
                    </div>
                </div>
                <div class="first__slide">
                    <div class="first__slide__image" style="background-image: url('<?=SITE_TEMPLATE_PATH?>/content/slide.jpg')"></div>
                    <div class="first__slide__content">
                        <div class="container">
                            <div class="first__title"><span class="orange">Установка</span> натяжных потолков<br/>и
                                осветительных приборов
                            </div>
                            <div class="first__slide__delimer"></div>
                            <div class="first__slide__text">Стабильно и качественно<br/>выполняем свою работу на
                                протяжении 8 лет
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<div class="first__section__form">
    <div class="first__form__title">Узнайте стоимость установки натяжного потолка</div>
    <div class="first__form__body">
<form action="<?=POST_FORM_ACTION_URI?>" method="POST" class="form js_form">
<?=bitrix_sessid_post()?>
	<div class="form__field form__required">
		
		<input type="text"  name="user_name" class="form__control" placeholder="Имя" data-required="true"
                               data-rule="name" >
	</div>
	<div class="form__field form__required">
		
		<input type="text"  name="user_email" class="form__control phone-mask" placeholder="Телефон" data-required="true"
                               data-rule="phone">
	</div>

	<?if($arParams["USE_CAPTCHA"] == "Y"):?>
	<div class="mf-captcha">
		<div class="mf-text"><?=GetMessage("MFT_CAPTCHA")?></div>
		<input type="hidden" name="captcha_sid" value="<?=$arResult["capCode"]?>">
		<img src="/bitrix/tools/captcha.php?captcha_sid=<?=$arResult["capCode"]?>" width="180" height="40" alt="CAPTCHA">
		<div class="mf-text"><?=GetMessage("MFT_CAPTCHA_CODE")?><span class="mf-req">*</span></div>
		<input type="text" name="captcha_word" size="30" maxlength="50" value="">
	</div>
	<?endif;?>
	<span class="error__text">Заполните все поля</span>
	<input type="hidden" name="PARAMS_HASH" value="<?=$arResult["PARAMS_HASH"]?>">
	<input type="submit" name="submit"  class = 'button button__first__form' value="Рассчитать стоимость">
</form>
</div>
</div>
</section>