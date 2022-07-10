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
<section class="call__section section4">
    <div class="container clearfix">
        <div class="call__section__left">
            <div class="section__title section__middle">Закажите замер бесплатно</div>
            <div class="section__delimer"></div>
            <div class="section__text">
                Получите бесплатный расчет стоимости своего потолка прямо сейчас!
            </div>
		</div>
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
<div class="call__section__right">
            <div class="call__section__form">
<form action="<?=POST_FORM_ACTION_URI?>" method="POST" class="form js_form">
<?=bitrix_sessid_post()?>
<div class="form__fields__wrap">
	<div class="form__field form__required">
		<input type="text" name="user_name" class="form__control" placeholder="Имя" data-required="true"
                                   data-rule="name"/>
	</div>

	<div class="form__field form__required">
		<input type="text" name="user_email" class="form__control phone-mask" placeholder="Телефон"
                                   data-required="true"
                                   data-rule="phone"/>
	</div>
	<span class="error__text">Заполните все поля</span>
</div>
	
<div class="form__fields__wrap">
	<?if($arParams["USE_CAPTCHA"] == "Y"):?>
	<div class="mf-captcha">
		<div class="mf-text"><?=GetMessage("MFT_CAPTCHA")?></div>
		<input type="hidden" name="captcha_sid" value="<?=$arResult["capCode"]?>">
		<img src="/bitrix/tools/captcha.php?captcha_sid=<?=$arResult["capCode"]?>" width="180" height="40" alt="CAPTCHA">
		<div class="mf-text"><?=GetMessage("MFT_CAPTCHA_CODE")?><span class="mf-req">*</span></div>
		<input type="text" name="captcha_word" size="30" maxlength="50" value="">
	</div>
	<?endif;?>
	<input type="hidden" name="PARAMS_HASH" value="<?=$arResult["PARAMS_HASH"]?>">
	<div class="form__field call__text">Введите Ваши данные, и мы перезвоним Вам в ближайшее время
                        </div>
	
	<div class="form__field">
	<input type="submit"  class="button button__call__form" name="submit" value="Заказать замер">
	</div>
</div>
</form>
</div>
</div>
</div>
	</section>