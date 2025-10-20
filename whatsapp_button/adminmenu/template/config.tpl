{extends file="tpl_inc/seite.tpl"}

{block name='content'}
  <div class="card">
    <div class="card-header">
      <h2 class="card-title">{$oPlugin->getName()|escape}</h2>
    </div>
    <div class="card-body">
      <form method="post">
        {include file='tpl_inc/hiddenToken.tpl'}
        <input type="hidden" name="save" value="1">

        <div class="form-group">
          <label for="phone">{__('phone')}</label>
          <input type="text" name="phone" id="phone" value="{$values.phone|escape}" class="form-control" maxlength="32" required>
          <small class="form-text text-muted">{__('phone_desc')}</small>
        </div>

        <div class="form-group">
          <label for="prefill_message">{__('prefill_message')}</label>
          <textarea name="prefill_message" id="prefill_message" rows="3" class="form-control" maxlength="500">{$values.prefill_message|escape}</textarea>
          <small class="form-text text-muted">{__('prefill_message_desc')}</small>
        </div>

        <div class="form-group">
          <label for="label">{__('label')}</label>
          <input type="text" name="label" id="label" value="{$values.label|escape}" class="form-control" maxlength="60">
          <small class="form-text text-muted">{__('label_desc')}</small>
        </div>

        <div class="form-group">
          <label for="position">{__('position')}</label>
          <select name="position" id="position" class="custom-select">
            <option value="right" {if $values.position == 'right'}selected{/if}>{__('position_right')}</option>
            <option value="left" {if $values.position == 'left'}selected{/if}>{__('position_left')}</option>
          </select>
          <small class="form-text text-muted">{__('position_desc')}</small>
        </div>

        <div class="form-group form-check">
          <input type="checkbox" name="visible_on_mobile" id="visible_on_mobile" value="Y" class="form-check-input" {if $values.visible_on_mobile == 'Y'}checked{/if}>
          <label class="form-check-label" for="visible_on_mobile">{__('visible_on_mobile')}</label>
          <small class="form-text text-muted d-block">{__('visible_on_mobile_desc')}</small>
        </div>

        <div class="form-group form-check">
          <input type="checkbox" name="visible_on_desktop" id="visible_on_desktop" value="Y" class="form-check-input" {if $values.visible_on_desktop == 'Y'}checked{/if}>
          <label class="form-check-label" for="visible_on_desktop">{__('visible_on_desktop')}</label>
          <small class="form-text text-muted d-block">{__('visible_on_desktop_desc')}</small>
        </div>

        <div class="form-group">
          <label for="zindex">{__('zindex')}</label>
          <input type="number" name="zindex" id="zindex" value="{$values.zindex|escape}" class="form-control" min="0" max="999999">
          <small class="form-text text-muted">{__('zindex_desc')}</small>
        </div>

        <div class="mt-4">
          <button type="submit" class="btn btn-primary">{__('admin_save_button')}</button>
        </div>
      </form>
    </div>
  </div>
{/block}
