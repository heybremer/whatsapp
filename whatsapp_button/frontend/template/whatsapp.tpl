{assign var=waPhone value=$oPlugin->getOption('phone')}
{assign var=waMsg value=$oPlugin->getOption('prefill_message')}
{assign var=waPos value=$oPlugin->getOption('position')}
{assign var=waLabel value=$oPlugin->getOption('label')}
{assign var=waMobile value=$oPlugin->getOption('visible_on_mobile')}
{assign var=waDesktop value=$oPlugin->getOption('visible_on_desktop')}
{assign var=waZ value=$oPlugin->getOption('zindex')}

{if $waPhone|trim ne ''}
<link rel="stylesheet" href="{$oPlugin->cFrontendPfadURL}css/whatsapp.css" />
<script defer src="{$oPlugin->cFrontendPfadURL}js/whatsapp.js"></script>
<div id="wa-floating" class="wa-floating {if $waPos=='left'}left{else}right{/if}
            {if $waMobile!='Y'}hide-mobile{/if}
            {if $waDesktop!='Y'}hide-desktop{/if}" style="z-index: {$waZ|escape:'html'}"
     data-phone="{$waPhone|escape:'url'}" data-msg="{$waMsg|escape:'url'}">
  <button class="wa-btn" type="button" aria-label="WhatsApp">
    <svg class="wa-ic" viewBox="0 0 24 24" aria-hidden="true">
      <circle cx="12" cy="12" r="10"></circle>
      <path d="M16.5 13.5c-.2-.1-1.2-.6-1.4-.7-.2-.1-.3-.1-.5.1-.1.2-.4.6-.5.7-.1.1-.2.1-.4 0-1.1-.5-2-1.3-2.6-2.4-.1-.2 0-.3.1-.4s.2-.2.3-.3.1-.2.2-.3.1-.2 0-.4-.4-1-.6-1.5c-.2-.5-.3-.4-.5-.4h-.4c-.2 0-.4.1-.6.3-.3.3-.9.9-.9 2.1s1 2.4 1.1 2.6c.1.2 1.8 2.7 4.3 3.7.6.2 1 .4 1.4.5.6.2 1.1.1 1.5.1.5-.1 1.3-.6 1.5-1.1.2-.5.2-1 .1-1.1-.1-.1-.2-.2-.5-.3z"></path>
    </svg>
    <span class="wa-label">{$waLabel|escape}</span>
  </button>
</div>
{/if}
