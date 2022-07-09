<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>403 &mdash; {$config["appName"]}</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="{$malio_config['statics_url']}npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="{$malio_config['statics_url']}npm/@fortawesome/fontawesome-free@5.8.2/css/all.min.css">

  <!-- CSS Libraries -->

  <!-- Template CSS -->
  <link rel="stylesheet" href="{if {$malio_config['malio_js_url']} == ''}/theme/malio{else}{$malio_config['malio_js_url']}npm/malio{/if}/assets/css/style.css">
  <link rel="stylesheet" href="{if {$malio_config['malio_js_url']} == ''}/theme/malio{else}{$malio_config['malio_js_url']}npm/malio{/if}/assets/css/components.css">
</head>

<body>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="page-error">
          <div class="page-inner">
            <h1>403</h1>
            <div class="page-description">
              You do not have access to this page.
            </div>
            <div class="page-search">
              <div class="mt-3">
                <a href="/">返回主页</a>
              </div>
            </div>
          </div>
        </div>
        <div class="simple-footer">
          Copyright &copy; 2022 {$config["appName"]}
          <div class="mt-2" id="copyright"></div>
        </div>
      </div>
    </section>
  </div>

  <!-- General JS Scripts -->
  <script src="{$malio_config['statics_url']}npm/jquery@3.2.1/dist/jquery.min.js"></script>
  <script src="{$malio_config['statics_url']}npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
  <script src="{$malio_config['statics_url']}npm/tooltip.js@1.3.2/dist/umd/tooltip.min.js"></script>
  <script src="{$malio_config['statics_url']}npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
  <script src="{$malio_config['statics_url']}npm/jquery.nicescroll@3.7.6/jquery.nicescroll.min.js"></script>
  <script src="{$malio_config['statics_url']}npm/moment@2.18.1/min/moment.min.js"></script>
  <script src="{if {$malio_config['malio_js_url']} == ''}/theme/malio{else}{$malio_config['malio_js_url']}npm/malio{/if}/assets/js/stisla.js"></script>

  <!-- JS Libraies -->

  <!-- Template JS File -->
  <script src="{if {$malio_config['malio_js_url']} == ''}/theme/malio{else}{$malio_config['malio_js_url']}npm/malio{/if}/assets/js/scripts.js"></script>

  <script>
    var code = "UG93ZXJlZCBieSA8YSBocmVmPSIvc3RhZmYiPlNTUEFORUw8L2E+IDxkaXYgY2xhc3M9ImJ1bGxldCI+PC9kaXY+VGhlbWUgYnkgPGEgaHJlZj0iaHR0cHM6Ly90Lm1lL2VkaXRYWSIgdGFyZ2V0PSJibGFuayI+ZWRpdFhZPC9hPg==";
    $('#copyright').html(atob(code));
  </script>

  <!-- Page Specific JS File -->
</body>

</html>
