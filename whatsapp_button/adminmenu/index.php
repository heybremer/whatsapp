<?php declare(strict_types=1);

use JTL\Helpers\Form;
use JTL\Helpers\Request;
use JTL\Plugin\Helper as PluginHelper;
use JTL\Shop;

require_once __DIR__ . '/../bootstrap.php';

$pluginId = 'whatsapp_button';
$oPlugin = PluginHelper::getPluginById($pluginId);
$pluginKey = method_exists($oPlugin, 'getID') ? $oPlugin->getID() : ($oPlugin->kPlugin ?? $pluginId);
$alertService = Shop::Container()->getAlertService();

$optionKeys = [
    'phone',
    'prefill_message',
    'label',
    'position',
    'visible_on_mobile',
    'visible_on_desktop',
    'zindex',
];

if (Request::postInt('save') === 1 && Form::validateToken()) {
    $values = [];
    foreach ($optionKeys as $key) {
        switch ($key) {
            case 'visible_on_mobile':
            case 'visible_on_desktop':
                $values[$key] = Request::postVar($key) === 'Y' ? 'Y' : 'N';
                break;
            case 'position':
                $values[$key] = Request::verifyGPDataString($key);
                if (!in_array($values[$key], ['left', 'right'], true)) {
                    $values[$key] = 'right';
                }
                break;
            case 'zindex':
                $values[$key] = (string) max(0, min(999999, Request::postInt($key)));
                break;
            default:
                $values[$key] = trim(Request::verifyGPDataString($key));
                break;
        }
        PluginHelper::updatePluginConfigValue($pluginKey, $key, $values[$key]);
    }
    $alertService->addSuccess(
        Shop::Lang()->get('admin_save_success', $pluginId),
        'saveSuccess'
    );
    $oPlugin = PluginHelper::getPluginById($pluginId);
    $pluginKey = method_exists($oPlugin, 'getID') ? $oPlugin->getID() : ($oPlugin->kPlugin ?? $pluginId);
}

$values = [];
foreach ($optionKeys as $key) {
    $values[$key] = $oPlugin->getOption($key);
}

Shop::Smarty()->assign('values', $values)
    ->assign('oPlugin', $oPlugin)
    ->assign('optionKeys', $optionKeys);

Shop::Smarty()->display(__DIR__ . '/template/config.tpl');
