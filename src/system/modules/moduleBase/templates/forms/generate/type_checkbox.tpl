{assign var="disabled" value=isset($field.role.key, $field.role['generate-key']) && $field.role.key && $field.role['generate-key'] || isset($readonly) && $readonly}
{if !$disabled}
    <input
        type="hidden"
        id="item-{$fieldName}-hidden"
        name="item[{$fieldName}]"
        value=""
    />
{/if}

<div class="custom-control custom-checkbox custom-control-inline">
    <input
        type="checkbox"
        id="item-{$fieldName}"
        class="custom-control-input"
        name="item[{$fieldName}]"
        {if isset($item)}{if $item->getFieldValue($fieldName)} checked{/if}{/if}
        {if isset($field.options.required) && $field.options.required} required{/if}
        {if $disabled} disabled{/if}
    />
    <label class="custom-control-label" for="item-{$fieldName}">Enabled</label>
</div>