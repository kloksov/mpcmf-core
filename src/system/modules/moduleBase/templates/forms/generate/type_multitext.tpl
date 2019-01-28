
{literal}
    <script id="multitextTemplate" type="text/x-handlebars-template">
        <div class="input-group my-2">
            <input
                type="text"
                class="form-control"
                id="item-{{ fieldName }}-{{ index }}"
                data-index="{{ index }}"
                name="item[{{ fieldName }}][]"
                value="{{ value }}"
                {{#if readonly}} readonly{{/if}}
                {{#if required}} required{{/if}}
                {{#if disabled}} disabled{{/if}}
            />
            <div class="input-group-append">
                <button class="btn btn-success add_field" type="button"><span class="fas fa-plus"></span></button>
                <button class="btn btn-warning remove_field" type="button"><span class="fas fa-minus"></span></button>
            </div>
        </div>
    </script>
{/literal}

<script>
    $(function () {
        var $box = $('#box-{$fieldName}'),
            multitextTemplate = Handlebars.compile($('#multitextTemplate').html()),
            is_readonly = {if isset($readonly) && $readonly} true {else} false {/if},
            is_required = {if isset($field.options.required) && $field.options.required} true {else} false {/if},
            is_disabled = {if isset($field.role.key, $field.role['generate-key']) && $field.role.key && $field.role['generate-key']} true {else} false {/if},
            list_fields = [];

        {if isset($item) && !empty($item->getFieldValue($fieldName))}
            {foreach from=$item->getFieldValue($fieldName) key="index" item="filterValue"}
                list_fields.push({
                    fieldName: '{$fieldName}',
                    index: '{$index}',
                    value: '{$filterValue|htmlspecialchars}',
                    readonly: is_readonly,
                    required: is_required,
                    disabled: is_disabled,
                });
            {/foreach}

        {else}
            list_fields.push({
                fieldName: '{$fieldName}',
                index: '0',
                value: '',
                readonly: is_readonly,
                required: is_required,
                disabled: is_disabled,
            });
        {/if}

        for (var i = 0; i < list_fields.length; i++) {
            $box.append(multitextTemplate(list_fields[i]));
        }

        // Add new field
        $box.on('click', '.add_field', function () {
            var new_index = parseInt($('.form-control', $box).last().data('index')) + 1,
                params = {
                    fieldName: '{$fieldName}',
                    index: new_index,
                    value: '',
                    readonly: is_readonly,
                    required: is_required,
                    disabled: is_disabled,
                };

            $box.append(multitextTemplate(params));
        });

        // Remove field
        $box.on('click', '.remove_field', function () {
            var $inputs = $('.form-control', $box),
                $field = $(this).closest('.input-group');

            if ($inputs.length >= 2) {
                $field.remove();
            } else {
                $('.form-control', $field).val('');
            }
        });
    });
</script>

<div id="box-{$fieldName}">

</div>