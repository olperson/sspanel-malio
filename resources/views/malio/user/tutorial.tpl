<!DOCTYPE html>
<html lang="en">

<head>
    {include file='user/head.tpl'}

    <title>{$i18n->get('apps-and-tutorial')} &mdash; {$config["appName"]}</title>

    <style>
        .os-card {
            border: none;
            border-radius: 3px !important;
            cursor: pointer;
        }

        .windows-card {
            background-image: linear-gradient(to bottom, #0178d7, #2FA1E6) !important;
            box-shadow: 0 2px 6px #2FA1E6ad;
        }

        .windows-card i {
            color: #2FA1E6;
        }

        .android-card {
            background-image: linear-gradient(to bottom, #6AB344, #98DC47) !important;
            box-shadow: 0 2px 6px #98DC47ad;
        }

        .android-card i {
            color: #98DC47;
        }

        .ios-card {
            background-image: linear-gradient(to bottom, black, #363636) !important;
            box-shadow: 0 2px 6px #36363683;
        }

        .ios-card i {
            color: #363636;
        }

        .mac-card {
            background-image: linear-gradient(to top, #b2b6bc, #848484) !important;
            box-shadow: 0 2px 6px #b2b6bc83;
        }

        .mac-card i {
            color: #b2b6bc;
        }

        .linux-card {
            background-image: linear-gradient(to bottom, #ffa425, #fdbe67) !important;
            box-shadow: 0 2px 6px #ffb349ad;
        }

        .linux-card i {
            color: #fdbe67;
        }
    </style>

</head>

<body>
<div id="app">
    <div class="main-wrapper">
        {include file='user/navbar.tpl'}

        <!-- Main Content -->
        <div class="main-content">
            <section class="section">
                <div class="section-header">
                    <h1>{$i18n->get('apps-and-tutorial')}</h1>
                </div>
                <div class="alert alert-success">
                    下方為簡易版教程，<a href="{$malio_config['docs_url']}" target="_blank">跳轉進階教程</a>
                </div>
                <div class="section-body">
                    <div class="row mt-sm-4">
                        <div class="col-lg-6">
                            {if $malio_config['windows_client'] == 'cfw'}
                            <div class="card card-hero" onclick="location='/user/tutorial?os=windows&client=v2rayn'">
                                {/if}
                                {if $malio_config['windows_client'] == 'ssr'}
                                <div class="card card-hero" onclick="location='/user/tutorial?os=windows&client=ssr'">
                                    {/if}
                                    <div class="card-header os-card windows-card">
                                        <div class="card-icon">
                                            <i class="fab fa-windows"></i>
                                        </div>
                                        <h4>Windows</h4>
                                        <div class="card-description">{$i18n->get('windows-minimal-version')}</div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                {if $malio_config['android_client'] == 'surfboard'}
                                <div class="card card-hero"
                                     onclick="location='/user/tutorial?os=android&client=surfboard'">
                                    {/if}
                                    {if $malio_config['android_client'] == 'ssr'}
                                    <div class="card card-hero"
                                         onclick="location='/user/tutorial?os=android&client=ssr'">
                                        {/if}
                                        {if $malio_config['android_client'] == 'v2rayng'}
                                        <div class="card card-hero"
                                             onclick="location='/user/tutorial?os=android&client=v2rayng'">
                                            {/if}
                                            {if $malio_config['android_client'] == 'kitsunebi'}
                                            <div class="card card-hero"
                                                 onclick="location='/user/tutorial?os=android&client=kitsunebi'">
                                                {/if}
                                                {if $malio_config['android_client'] == 'clash'}
                                                <div class="card card-hero"
                                                     onclick="location='/user/tutorial?os=android&client=clash'">
                                                    {/if}
                                                    <div class="card-header os-card android-card">
                                                        <div class="card-icon">
                                                            <i class="fab fa-android"></i>
                                                        </div>
                                                        <h4>Android</h4>
                                                        <div class="card-description">{$i18n->get('android-minimal-version')}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                {if $malio_config['ios_client'] == 'quantumult'}
                                                <div class="card card-hero"
                                                     onclick="location='/user/tutorial?os=ios&client=quantumult'">
                                                    {/if}
                                                    {if $malio_config['ios_client'] == 'shadowrocket'}
                                                    <div class="card card-hero"
                                                         onclick="location='/user/tutorial?os=ios&client=shadowrocket'">
                                                        {/if}
                                                        {if $malio_config['ios_client'] == 'kitsunebi'}
                                                        <div class="card card-hero"
                                                             onclick="location='/user/tutorial?os=ios&client=kitsunebi'">
                                                            {/if}
                                                            <div class="card-header os-card ios-card">
                                                                <div class="card-icon">
                                                                    <i class="fab fa-apple"></i>
                                                                </div>
                                                                <h4>Apple</h4>
                                                                <div class="card-description">{$i18n->get('ios-minimal-version')}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        {if $malio_config['mac_client'] == 'clashx'}
                                                        <div class="card card-hero"
                                                             onclick="location='/user/tutorial?os=mac&client=clashx'">
                                                            {/if}
                                                            {if $malio_config['mac_client'] == 'shadowsocksx-ng-r'}
                                                            <div class="card card-hero"
                                                                 onclick="location='/user/tutorial?os=mac&client=ssxgr'">
                                                                {/if}
                                                                <div class="card-header os-card mac-card">
                                                                    <div class="card-icon">
                                                                      <i class="fas fa-laptop"></i>
                                                                    </div>
                                                                    <h4>Mac</h4>
                                                                    <div class="card-description">{$i18n->get('mac-minimal-version')}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            {if $malio_config['linux_client'] == 'clash'}
                                                            <div class="card card-hero"
                                                                 onclick="location='/user/tutorial?os=linux&client=clash'">
                                                                {/if}
                                                                {if $malio_config['linux_client'] == 'electron-ssr'}
                                                                <div class="card card-hero"
                                                                     onclick="location='/user/tutorial?os=linux&client=clash'">
                                                                    {/if}
                                                                    <div class="card-header os-card linux-card">
                                                                        <div class="card-icon">
                                                                          <i class="fab fa-linux"></i>
                                                                        </div>
                                                                        <h4>Linux</h4>
                                                                        <div class="card-description">{$i18n->get('linux-minimal-version')}</div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                                <div class="col-lg-6">
                                                                  <a href="{$malio_config['docs_url']}" target="_blank">
                                                                    <div class="card card-hero">
                                                                        <div class="card-header os-card os-faq"
                                                                             style="box-shadow: 0 2px 6px #acb5f6;">
                                                                            <div class="card-icon">
                                                                              <i class="fal fa-map"></i>
                                                                            </div>
                                                                            <h4>{$i18n->get('soft-routing')}</h4>
                                                                            <div class="card-description">{$i18n->get('soft-routing-version')}</div>
                                                                        </div>
                                                                    </div>
                                                                  </a>
                                                                </div>

                                                        </div>

                                                    </div>
            </section>
        </div>
        {include file='user/footer.tpl'}
    </div>
</div>

{include file='user/scripts.tpl'}

</body>

</html>
