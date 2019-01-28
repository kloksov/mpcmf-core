{if !isset($item)}
    {assign var="item" value=null}
{/if}

{if isset($isMultiple) && $isMultiple}
    {assign var="isMultiple" value=true}
{else}
    {assign var="isMultiple" value=false}
{/if}

{assign var="options" value=[]}
{if $item === null}
    {assign var="fieldValue" value=[]}
{else}
    {assign var="fieldValue" value=$item->getFieldValue($fieldName)}
{/if}
{assign var="relatedModels" value=$_entity->getMapper()->getAllRelatedModels($fieldName, $item)}
{assign var="remainValues" value=($relatedModels->count())}

{foreach from=$relatedModels item='optionItem'}
    {assign var="itemValue" value=$optionItem->getFieldValue($_entity->getMapper()->getRelationField($fieldName))}
    {if $item === null}
        {assign var="selected" value=false}
    {else}
        {if $isMultiple}
            {assign var="itemFound" value=in_array($itemValue, $fieldValue, true)}
            {if $itemFound !== false}
                {assign var="selected" value=true}
                {assign var="remainValues" value=$remainValues-1}
            {else}
                {assign var="selected" value=false}
            {/if}
        {else}
            {assign var="selected" value=($fieldValue == $itemValue)}
        {/if}
    {/if}

    {append var="options" value=['title' => $optionItem->getTitleValue(), 'selected' => $selected, 'value' => $itemValue|htmlspecialchars]}
{foreachelse}
    {if isset($item) && !$isMultiple}
        {append var="options" value=['title' => $fieldValue, 'selected' => $selected, 'value' => $itemValue|htmlspecialchars]}
    {/if}
{/foreach}


<select
    {if $isMultiple}multiple="multiple"{/if}
    id="item-{$fieldName}"
    name="item[{$fieldName}]{if $isMultiple}[]{/if}"
    class="w-100"
    {if isset($field.options.required) && $field.options.required} required{/if}
    {if isset($field.role.key, $field.role['generate-key']) && $field.role.key && $field.role['generate-key']} disabled{/if}
    {if (isset($readonly) && $readonly)} readonly{/if}
>
    {if !$isMultiple}<option value="">Выбрать значение...</option>{/if}

    {foreach from=$options item="option"}
        <option value="{$option['value']}" {if $option['selected']} selected="selected"{/if}>
            {$option['title']}
        </option>
    {/foreach}
</select>

<script>
    $(function () {
        $('#item-{$fieldName}').multipleSelect({
            placeholder: 'Выберите значение...',
            single: {if !$isMultiple} true {else} false {/if},
            filter: true,
            selectAll: false,
        });
    });
</script>