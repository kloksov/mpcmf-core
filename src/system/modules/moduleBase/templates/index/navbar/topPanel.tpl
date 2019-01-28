
{assign var="_user" value=$_acl->getCurrentUser()}

{if !$_user->isGuest()}
    <ul class="navbar-nav">
        <li class="nav-item dropdown mx-1">
            <a href="#" class="nav-link dropdown-toggle" id="dropdownStatistics" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Статистики
            </a>

            <div class="dropdown-menu border-0 shadow animated--fade-in" aria-labelledby="dropdownStatistics">
                <a class="dropdown-item" href="{$_application->getUrl('/webMonitor/monitor/webMonitor.monitor')}">
                    Monitor
                </a>
                <a class="dropdown-item" href="{$_application->getUrl('/sds/page/page.stats.ilook_statistics')}">
                    Статистика по источникам
                </a>
                <a class="dropdown-item" href="{$_application->getUrl('/webMonitor/monitor/webMonitor.monitor.byMedia')}">
                    Статистика по медиа-типам
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="{$_application->getUrl('/sds/page/stats.grabberDashboard')}">
                    Grabber dashboard
                </a>
                <a class="dropdown-item" href="{$_application->getUrl('/sds/page/stats.templatesErrors')}">
                    Ошибки шаблонов
                </a>
                <a class="dropdown-item" href="{$_application->getUrl('/sds/page/stats.grabberHarvest')}">
                    Сбор граббера
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="{$_application->getUrl('/sds/page/page.stats.bots')}">
                    Статистика по ботам
                </a>
                <a class="dropdown-item" href="{$_application->getUrl('/sds/page/page.stats.lang')}">
                    Статистика по языкам
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="{$_application->getUrl('/sds/page/page.stats.xauthorFields')}">
                    Статистика по полям авторов
                </a>
                <a class="dropdown-item" href="{$_application->getUrl('/sds/page/page.stats.xauthorFieldsCount')}">
                    Статистика по заполенности полей авторов
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="{$_application->getUrl('/api/saccount/saccount.accountsCount')}">
                    sAccount: количество аккаунтов
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="{$_application->getUrl('/sds/page/stats.collectionLag')}">
                    Отставание сбора
                </a>
                <a class="dropdown-item" href="{$_application->getUrl('/sds/page/page.stats.keywordStats')}">
                    Загруженность конфигов
                </a>
            </div>
        </li>
    </ul>
{/if}

{if $_user->isAdmin()}
    <ul class="navbar-nav">
        <li class="nav-item dropdown mx-1">
            <a href="#" class="nav-link dropdown-toggle" id="dropdownCoref" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Кореференция
            </a>
            <div class="dropdown-menu border-0 shadow animated--fade-in" aria-labelledby="dropdownCoref">
                <a class="dropdown-item" href="{$_application->getUrl('/plApi/synsets/synsetsList.page')}">
                    Список синсетов
                </a>
                <a class="dropdown-item" href="{$_application->getUrl('/plApi/synsets/synsetCreate.page')}">
                    Добавить синсет
                </a>
            </div>
        </li>
    </ul>
{/if}


<ul class="navbar-nav ml-auto">

    <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="dropdownMessages" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-envelope fa-fw"></i>
            <span class="badge badge-danger">42+</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right border-0 shadow animated--fade-in" aria-labelledby="dropdownMessages">
            <a class="dropdown-item" href="#">
                <div>
                    <strong>John Smith</strong>
                    <span class="pull-right text-muted">
                        <em>Yesterday</em>
                    </span>
                </div>
                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item text-center" href="#">
                <strong>Read All Messages</strong>
                <i class="fa fa-angle-right"></i>
            </a>
        </div>
    </li>

    <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="dropdownUpdates" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-bell fa-fw"></i>
            <span class="badge badge-danger">9+</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right border-0 shadow animated--fade-in" aria-labelledby="dropdownUpdates">
            <a class="dropdown-item" href="#">
                <div>
                    <i class="fas fa-comment fa-fw"></i> Facebook +50%
                    <span class="mx-1 text-muted small">недавно</span>
                </div>
            </a>
            <a class="dropdown-item" href="#">
                <div>
                    <i class="fas fa-comment fa-fw"></i> Facebook +50%
                    <span class="mx-1 text-muted small">недавно</span>
                </div>
            </a>
        </div>
    </li>

    <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="dropdownUser" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <img class="img-profile rounded-circle" src="{$_user->getAvatarLink(42)}" />
            <span class="mx-1">{$_user->getLastName()}</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right border-0 shadow animated--fade-in" aria-labelledby="dropdownUser">
            {if !$_user->isGuest()}
                <a class="dropdown-item" href="{$_application->getUrl('/authex/user/profile')}">{$i18n->get('Профиль')}</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="{$_application->getUrl('/authex/user/logout', ['redirectUrl' => {$_application->getUrl($_route->getName())|base64_encode}])}">
                    {$i18n->get('Выйти')}
                </a>
            {else}
                <a class="dropdown-item" href="{$_application->getUrl('/authex/user/login')}"><i class="fas fa-sign-in fa-fw"></i> Login</a>
            {/if}
        </div>
    </li>
</ul>
