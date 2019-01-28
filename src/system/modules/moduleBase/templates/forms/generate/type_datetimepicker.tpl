<div>
    <input
        id="alt-item-{$fieldName}"
        name="item[{$fieldName}]"
        type="hidden"
        {if isset($item)} value="{$item->getFieldValue($fieldName)}"{/if}
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
            {if isset($item)} value="{$item->getFieldValue($fieldName)|date_format: "%Y%m%d %H:%M:%S"}"{/if}
            {if isset($field.options.required) && $field.options.required} required{/if}
                {if isset($field.role.key, $field.role['generate-key']) && $field.role.key && $field.role['generate-key'] || isset($readonly) && $readonly} disabled{/if}
        />
        <div class="input-group-append" data-target="#item-{$fieldName}" data-toggle="datetimepicker">
            <div class="input-group-text"><i class="fas fa-calendar-alt"></i></div>
        </div>
    </div>
</div>

<script>
    $(function () {
        var $dateTimePicker = $("#item-{$fieldName}"),
            $inputField = $("#input-item-{$fieldName}"),
            $altItemField = $("#alt-item-{$fieldName}");

        $dateTimePicker.datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            icons: {
                time: 'fas fa-clock',
                date: 'fas fa-calendar-alt'
            }
        });
        $dateTimePicker.on("change.datetimepicker", function () {
            $altItemField.val((Date.parse($inputField.val()) / 1000).toString());
        });
    });
</script>