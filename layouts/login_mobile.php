<?php
$CI = & get_instance();
?>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="GeraDox">
    <meta name="description" content="GeraDox - Documentos padronizados com facilidade">
    <link rel="shortcut icon" href="{TPL_images}file-text-o_4e8079_128.ico" type="image/x-icon" />
    <link rel="icon" href="{TPL_images}file-text-o_4e8079_128.ico" />
    <title><?php echo $CI->config->item('title');?></title>
    <!-- Bootstrap -->
    <link href="<?php echo base_url();?>bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<?php echo base_url();?>font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="<?php echo base_url();?>js/jquery-1.11.1.min.js"></script>
    <!-- GeraDox Clean Login Theme -->
    <style>
      *, *::before, *::after { box-sizing: border-box; }
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      body {
        font-family: 'Segoe UI', 'Helvetica Neue', Arial, sans-serif;
        background: linear-gradient(135deg, #1a3a33 0%, #2e7d6b 50%, #27ae60 100%);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 20px;
      }
      body > .container {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        width: 100%;
        max-width: 100%;
        padding: 0;
      }
      .form-signin {
        background: #ffffff;
        border-radius: 14px;
        box-shadow: 0 20px 60px rgba(0,0,0,0.28);
        padding: 40px 38px 36px;
        max-width: 380px;
        width: 100%;
        margin: 0 auto;
      }
      .form-signin .sm-12 {
        text-align: center;
        margin-bottom: 8px;
      }
      #emblema {
        color: #2e7d6b;
        display: block;
        text-align: center;
        margin: 0 auto 8px;
        transition: transform 0.3s ease;
      }
      #emblema:hover { transform: scale(1.08); }
      .form-signin-heading {
        text-align: center;
        font-size: 22px;
        font-weight: 700;
        color: #2c3e50;
        margin: 8px 0 22px;
        line-height: 1.3;
      }
      .form-signin .form-control {
        border: 1.5px solid #d5dbdb;
        border-radius: 7px;
        padding: 11px 14px;
        font-size: 14px;
        color: #2c3e50;
        background: #fafafa;
        box-shadow: none;
        height: auto;
        margin-bottom: 12px;
        display: block;
        width: 100%;
        transition: border-color 0.2s ease, box-shadow 0.2s ease;
      }
      .form-signin .form-control:focus {
        border-color: #2e7d6b;
        box-shadow: 0 0 0 3px rgba(46,125,107,0.15);
        outline: none;
        background: #fff;
      }
      .form-signin .btn {
        border-radius: 7px;
        font-weight: 600;
        font-size: 14.5px;
        padding: 11px 20px;
        border: none;
        margin-top: 4px;
        width: 100%;
        display: block;
        transition: all 0.2s ease;
        cursor: pointer;
      }
      .form-signin .btn-success {
        background: linear-gradient(135deg, #2e7d6b 0%, #27ae60 100%);
        color: #fff;
        box-shadow: 0 4px 14px rgba(46,125,107,0.35);
      }
      .form-signin .btn-success:hover,
      .form-signin .btn-success:focus {
        background: linear-gradient(135deg, #246358 0%, #229954 100%);
        color: #fff;
        box-shadow: 0 6px 18px rgba(46,125,107,0.45);
        transform: translateY(-1px);
      }
      .form-signin .btn-primary {
        background: #ecf0f1;
        color: #2e7d6b;
        border: 1.5px solid #d4ede8;
        margin-top: 10px;
        box-shadow: none;
      }
      .form-signin .btn-primary:hover,
      .form-signin .btn-primary:focus {
        background: #d4ede8;
        color: #1a5246;
        border-color: #2e7d6b;
      }
      .form-signin .alert {
        border-radius: 6px;
        border: none;
        padding: 10px 14px;
        font-size: 13px;
        margin-bottom: 14px;
      }
      .form-signin .alert-danger {
        background: #fadbd8;
        color: #922b21;
        border-left: 4px solid #e74c3c;
      }
      footer.footer {
        background: transparent;
        padding: 16px 0 0;
        margin-top: 10px;
        width: 100%;
        text-align: center;
      }
      footer.footer .text-muted {
        color: rgba(255,255,255,0.65);
        font-size: 12px;
      }
      footer.footer a { color: rgba(255,255,255,0.85); }
      @media (max-width: 480px) {
        .form-signin { padding: 28px 22px 24px; border-radius: 10px; }
        .form-signin-heading { font-size: 17px; }
      }
    </style>
  </head>
  <body>
    {TPL_content}
    <footer class="footer">
      <div class="container text-center">
        <p class="text-muted"><?php echo $CI->config->item('rodape_sistema');?></p>
      </div>
    </footer>
    <script src="<?php echo base_url();?>bootstrap/js/bootstrap.min.js"></script>
    {TPL_js}
  </body>
</html>
