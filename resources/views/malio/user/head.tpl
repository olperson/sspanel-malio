<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">

<!-- General CSS Files -->
<link rel="stylesheet" href="{$malio_config['statics_url']}npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="{$malio_config['statics_url']}npm/@fortawesome/fontawesome-free@5.8.2/css/all.min.css">

<!-- Template CSS -->
<link rel="stylesheet"
      href="{if {$malio_config['malio_js_url']} == ''}/theme/malio{else}{$malio_config['malio_js_url']}npm/malio{/if}/css/style-{$malio_config['theme_color']}.css">
<link rel="stylesheet"
      href="{if {$malio_config['malio_js_url']} == ''}/theme/malio{else}{$malio_config['malio_js_url']}npm/malio{/if}/assets/css/components.css">
<style>
    @font-face {
        font-family: 'malio';
        src: url('{if {$malio_config['malio_js_url']} == ''}}/{else}{$malio_config['malio_js_url']}npm/malio/fonts/malio-icons.eot?k8g547{/if}');
        src: url('{if {$malio_config['malio_js_url']} == ''}}/{else}{$malio_config['malio_js_url']}npm/malio/fonts/malio-icons.eot?k8g547#iefix{/if}') format('embedded-opentype'),
        url('{if {$malio_config['malio_js_url']} == ''}}/{else}{$malio_config['malio_js_url']}npm/malio/fonts/malio-icons.ttf?k8g547{/if}') format('truetype'),
        url('{if {$malio_config['malio_js_url']} == ''}}/{else}{$malio_config['malio_js_url']}npm/malio/fonts/malio-icons.woff?k8g547{/if}') format('woff'),
        url('{if {$malio_config['malio_js_url']} == ''}}/{else}{$malio_config['malio_js_url']}npm/malio/fonts/malio-icons.svg?k8g547#malio-icons{/if}') format('svg');
        font-weight: normal;
        font-style: normal;
    }
</style>

<!-- Custom CSS -->
<link rel="stylesheet"
      href="{if {$malio_config['malio_js_url']} == ''}/theme/malio{else}{$malio_config['malio_js_url']}npm/malio{/if}/css/malio.css">

{if $malio_config['google_analytics_code'] != ''}
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id={$malio_config['google_analytics_code']}"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        {literal}function gtag() {
            dataLayer.push(arguments);
        }{/literal}
        gtag('js', new Date());
        gtag('config', '{$malio_config['google_analytics_code']}');
    </script>
{/if}

{if $config["sspanelAnalysis"] == 'true'}
    <!-- Google Analytics -->
    <script>
        window.ga = window.ga || function () {
            (ga.q = ga.q || []).push(arguments)
        };
        ga.l = +new Date;
        ga('create', 'UA-143778338-1', 'auto');
        var hostDomain = window.location.host || document.location.host || document.domain;
        ga('set', 'dimension1', hostDomain);
        ga('send', 'pageview');
        (function () {
            function perfops() {
                var js = document.createElement('script');
                js.src = '{$malio_config['statics_url']}npm/perfops-rom';
                document.body.appendChild(js);
            }

            if (document.readyState === 'complete') {
                perfops();
            } else {
                window.addEventListener('load', perfops);
            }
        })();
    </script>
    <script async src="https://www.google-analytics.com/analytics.js"></script>
    <script src="/js/fuck.js"></script>
    <!-- End Google Analytics -->
{/if}

{if $malio_config['enable_crisp'] == true}{include file='crisp.tpl'}{/if}
{if $malio_config['enable_chatra'] == true}{include file='chatra.tpl'}{/if}