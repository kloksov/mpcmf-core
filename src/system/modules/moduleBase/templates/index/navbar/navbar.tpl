<!-- Navigation -->

<nav class="navbar navbar-expand-md navbar-dark static-top">

    <button class="btn btn-link btn-sm sidebar_toggle">
        <i class="fas fa-bars fa-2x"></i>
    </button>
    <a class="navbar-brand mr-1" href="/">SDS Admin{if isset($_title) && !empty($_title)}: {$_title}{/if}</a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        {include file="index/navbar/topPanel.tpl"}
    </div>
</nav>