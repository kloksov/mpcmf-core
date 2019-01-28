
{* Item has sub items *}
{assign var="hasSubItems" value=isset($item['subitems']) && count($item['subitems'])}

{* Item is active *}
{assign var="isActive" value=isset($item['active']) && $item['active']}

<li class="nav-item{if $isActive} active{/if}">
    <a href="{$item['path']}" class="nav-link{if !$isActive} collapsed{/if}" {if $hasSubItems}data-target="#collapse-{$index}" role="button" data-toggle="collapse" aria-controls="collapse-{$index}" aria-expanded="{if $isActive}true{else}false{/if}"{/if}>
        <i class="fas {if $hasSubItems}fa-folder{else}fa-cube fa-fw{/if}"></i>
        <span>{$item['name']}</span>
    </a>
    {if $hasSubItems}
        <ul id="collapse-{$index}" class="collapse navbar-nav{if $isActive} show{/if}" data-parent="#collapse-{$indexParent}">
            {foreach from=$item['subitems'] item='subItem'}
                {assign var="subIndex" value="`$index`-`$subItem@iteration`"}
                {include file="index/sidebar/sideBar.menuItem.tpl" item=$subItem index=$subIndex indexParent=$index}
            {/foreach}
        </ul>
    {/if}
</li>
