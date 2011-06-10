{**
 * plugins.tpl
 *
 * Copyright (c) 2003-2011 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * List available import/export plugins.
 *}
{strip}
{assign var="pageTitle" value="manager.plugins.$path"}
{include file="common/header.tpl"}
{/strip}


{if $path == 'install'}
	<div id="install">
		{if !$uploaded}
			<p>{translate key="manager.plugins.installDescription"}</p>
		{/if}

		<form class="pkp_form" method="post" action="{url path="installPlugin"}" enctype="multipart/form-data">
			{if $error}
				<span class="pkp_controllers_form_error">{translate key="form.errorsOccurred"}:</span>
				<ul class="pkp_controllers_form_error_list">
					<li>
					{if is_array($message)}
						{translate key=$message[0]} {$message[1]}
					{else}
						{translate key=$message}
					{/if}
					</li>
				</ul>
			{/if}
			{if $uploaded}
				<ul class="plain">
					<li>&#187;&nbsp;
					{if is_array($message)}
						{translate key=$message[0]} {$message[1]}
					{else}
						{translate key=$message}
					{/if}
					</li>
				</ul>
			{/if}

			<br />
			<table class="data" width="100%">
			<tr>
				<td width="25%" class="label">
					{translate key="manager.plugins.uploadPluginDir"}
				</td>
				<td width="75%" class="value">
					<input type="file" class="pkp_form_uploadField" name="newPlugin" id="newPlugin" />
					<input name="uploadPlugin" type="submit" value="{translate key="common.continue"}" class="button defaultButton" />
				</td>
			</tr>
			</table>
			<p>
		</form>
	</div>
{elseif $path == 'upgrade'}
	<div id="upgrade">
		{if !$uploaded}
			<p>{translate key="manager.plugins.upgradeDescription"}</p>
		{/if}

		<form class="pkp_form" method="post" action="{url path="upgradePlugin"|to_array:$category:$plugin}" enctype="multipart/form-data">
			{if $error}
				<span class="pkp_controllers_form_error">{translate key="form.errorsOccurred"}:</span>
				<ul class="pkp_controllers_form_error_list">
					{if is_array($message)}
						{translate key=$message[0]} {$message[1]}
					{else}
						{translate key=$message}
					{/if}
				</ul>
			{/if}
			{if $uploaded}
				<ul class="plain">
					<li>&#187;&nbsp;
					{if is_array($message)}
						{translate key=$message[0]} {$message[1]}
					{else}
						{translate key=$message}
					{/if}
					</li>
				</ul>
			{/if}

			<br />
			<table class="data" width="100%">
			<tr>
				<td width="25%" class="label">
						{translate key="manager.plugins.uploadPluginDir"}
				</td>
				<td width="75%" class="value">
					<input type="file" class="pkp_form_uploadField" name="newPlugin" id="newPlugin" />
					<input name="uploadPlugin" type="submit" value="{translate key="common.continue"}" class="button defaultButton" />
				</td>
			</tr>
			</table>
			<p>
		</form>
	</div>
{elseif $path == 'delete'}
	<div id="delete">
		{if !$deleted}
			<p>{translate key="manager.plugins.deleteDescription"}</p>
		{/if}

		{if !$deleted}
			{if !$error}
				<ul class="pkp_controllers_form_error_list">
					<li>{translate key="manager.plugins.deleteConfirm"}</li>
				</ul>
			{/if}

			<br />
			<form class="pkp_form" method="post" action="{url path="deletePlugin"|to_array:$category:$plugin}" enctype="multipart/form-data">
				{if $error}
					<span class="pkp_controllers_form_error">{translate key="form.errorsOccurred"}:</span>
					<ul class="pkp_controllers_form_error_list">
						<li>
						{if is_array($message)}
							{translate key=$message[0]} {$message[1]}
						{else}
							{translate key=$message}
						{/if}
						</li>
					</ul>
				{/if}
				<input type="submit" name="save" class="button defaultButton" value="{translate key="common.delete"}"/> <input type="button" class="button" value="{translate key="common.cancel"}" onclick="history.go(-1)"/>
			</form>
		{else}
			<p>{translate key="manager.plugins.deleteSuccess"}</p>
		{/if}
	</div>
{/if}

{include file="common/footer.tpl"}

