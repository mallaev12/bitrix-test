<footer class="footer">
    <div class="container footer__container">
        <span class="footer__copyrights">Copyrignt (c) 2017 ООО «Ампир-Новосибирск»</span>
        <span class="footer__copyrights">Разработка сайта - <a href="http://airws.ru">AIR</a></span>
        
    </div>
    <div style = "background-color: #333333;">
    <div class = "container" >
        <?$APPLICATION->IncludeComponent(
        "bitrix:main.map",
        "",
        Array(
            "CACHE_TIME" => "3600",
            "CACHE_TYPE" => "A",
            "COL_NUM" => "1",
            "LEVEL" => "1",
            "SET_TITLE" => "Y",
            "SHOW_DESCRIPTION" => "N"
        )
        );?>
        </div>
    </div>
</footer>

<div class="remodal" data-remodal-id="call">
    <button data-remodal-action="close" class="remodal-close"></button>
    <div class="remodal__header">Заказ звонка</div>
    <div class="remodal__body">
        <form class="form js_form_popup">
            <div class="form__field form__required">
                <input type="text" class="form__control" placeholder="Имя" data-required="true"
                       data-rule="name"/>
            </div>
            <div class="form__field form__required">
                <input type="text" class="form__control phone-mask" placeholder="Телефон" data-required="true"
                       data-rule="phone"/>
            </div>

            <span class="error__text">Заполните все поля</span>

            <button class="button button__modal__form">Заказать звонок</button>
        </form>
    </div>
</div>


<script src="<?=SITE_TEMPLATE_PATH?>/dist/js/vendor/jquery-1.12.0.min.js"></script>
<script src="https://maps.api.2gis.ru/2.0/loader.js?pkg=full"></script>

<script src="<?=SITE_TEMPLATE_PATH?>/dist/js/plugins.js"></script>

<script src="<?=SITE_TEMPLATE_PATH?>/dist/js/jquery.inputmask.bundle.min.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/dist/js/jquery.inputmask-multi.min.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/dist/js/remodal.min.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/dist/js/jquery-confirm.min.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/dist/slick/slick.min.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/dist/fancybox/jquery.fancybox.pack.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/dist/fancybox/helpers/jquery.fancybox-thumbs.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/dist/js/helpers.js"></script>

<script src="<?=SITE_TEMPLATE_PATH?>/dist/js/helpers.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/dist/js/main.js"></script>


</body>