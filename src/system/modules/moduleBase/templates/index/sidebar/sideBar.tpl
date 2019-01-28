{assign var="menu" value=$_application->getMenuStructure()}

<ul class="sidebar navbar-nav" id="collapse-0">

    <div class="form-group m-1">
        <input type="text" class="form-control form-control-sm" placeholder="Фильтрация меню" id="side-menu-filter">
    </div>

    {foreach from=$menu item='menuItem'}
        {include file="index/sidebar/sideBar.menuItem.tpl" item=$menuItem index=$menuItem@iteration indexParent=0}
    {/foreach}
</ul>

<script src="/js/custom/sideMenuFilter.js"></script>