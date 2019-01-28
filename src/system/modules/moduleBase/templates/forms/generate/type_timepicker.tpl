<div>
    <input
        id="alt-item-{$fieldName}"
        name="item[{$fieldName}]"
        type="hidden"
        value="{if isset($item)}{$item->getFieldValue($fieldName)}{else}0{/if}"
        {if isset($field.options.required) && $field.options.required} required{/if}
        {if isset($field.role.key, $field.role['generate-key']) && $field.role.key && $field.role['generate-key'] || isset($readonly) && $readonly} disabled{/if}
    />
    <div class="input-group date" id="item-{$fieldName}" data-target-input="nearest">
        <input
            name="useless[{$fieldName}]"
            type="text"
            id="input-item-{$fieldName}"
            class="form-control datetimepicker-input"
            data-toggle="datetimepicker"
            data-target="#item-{$fieldName}"
            {if isset($item)}
                {assign var="seconds" value=$item->getFieldValue($fieldName)}
                {assign var="hours" value=($seconds / 3600)|floor}
                {assign var="minutes" value=($seconds / 60)|floor}
                value="{$hours}:{$minutes}"
            {else}
                value="00:00"
            {/if}
            {if isset($field.options.required) && $field.options.required} required{/if}
            {if isset($field.role.key, $field.role['generate-key']) && $field.role.key && $field.role['generate-key'] || isset($readonly) && $readonly} disabled{/if}
        />
        <div class="input-group-append" data-target="#item-{$fieldName}" data-toggle="datetimepicker">
            <div class="input-group-text"><i class="fas fa-clock"></i></div>
        </div>
    </div>
</div>

<script>
    $(function () {
        var $timePicker = $("#item-{$fieldName}"),
            $inputField = $("#input-item-{$fieldName}"),
            $altItemField = $("#alt-item-{$fieldName}");

        $timePicker.datetimepicker({
            format: 'HH:mm'
        });
        $timePicker.on("change.datetimepicker", function () {
            var time = $inputField.val();
            var exploded = time.split(':');
            var seconds = (parseInt(exploded[0]) * 60 + parseInt(exploded[1])) * 60;
            $altItemField.val(seconds.toString());
        });
    });
</script>
