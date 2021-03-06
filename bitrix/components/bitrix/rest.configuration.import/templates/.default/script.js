;(function () {
	BX.namespace('BX.Rest.Configuration.Import');
	if (!BX.Rest.Configuration.Import)
	{
		return;
	}
	/**
	 * Import.
	 *
	 */
	function Import()
	{
	}

	Import.prototype =
		{
			init: function (params)
			{
				this.id = params.id;
				this.signedParameters = params.signedParameters;
				this.fileMaxSize = params.fileMaxSize;
				var file = BX(this.id + '-file-upload');
				BX.bind(
					file,
					'change',
					BX.delegate(
						function (event) {
							if(file.files.length > 0 && file.files[0]['size'] < this.fileMaxSize)
							{
								this.submitForm(event);
							}
							else
							{
								BX.UI.Notification.Center.notify({
									content: BX.message('REST_CONFIGURATION_IMPORT_ERRORS_MAX_FILE_SIZE')
								});
							}
						},
						this
					)
				);
			},

			submitForm: function (event)
			{
				event.preventDefault();
				BX.addClass(
					BX.findChildByClassName(
						BX(this.id),
						'rest-configuration-start-icon-main'
					),
					'rest-configuration-start-icon-main-loading'
				);
				BX.style(
					BX.findChildByClassName(
						BX(this.id),
						'rest-configuration-upload-file'
					),
					'display',
					'none'
				);
				BX.html(
					BX.findChildByClassName(
						BX(this.id),
						'rest-configuration-info'
					),
					BX.message('REST_CONFIGURATION_IMPORT_SAVE_FILE_PROCESS')
				);
				BX(this.id + '-file-form').submit();
			}
		};

	BX.Rest.Configuration.Import =  new Import();
})(window);