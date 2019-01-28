
<div class="card">
    <div class="card-header">
        {include file="crud/_page_title.tpl" title="Создание объекта <strong>{$_entity->getEntityName()}</strong>"}
    </div>

    <form method="POST">
        <div class="card-body">

            {include file="index/catchResponse.tpl"}

            <table class="table table-responsive-sm mb-0">
                <thead>
                    <tr>
                        <th class="col-4 col-lg-3">Поле</th>
                        <th class="col-8 col-lg-9">Значение</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$_entity->getMapper()->getMap() key="fieldName" item="field"}
                        <tr>
                            <td class="align-middle">{$field.name}</td>
                            <td class="align-middle">
                                {if isset($data.item)}
                                    {include file="forms/generate/type_{$field.formType}.tpl" fieldName=$fieldName field=$field item=$data.item}
                                {else}
                                    {include file="forms/generate/type_{$field.formType}.tpl" fieldName=$fieldName field=$field item=null}
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>

        <div class="card-footer">
            {include file="forms/generate/type_submit.tpl"}
        </div>
    </form>
</div>