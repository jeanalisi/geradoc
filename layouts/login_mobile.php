<?php $CI = & get_instance(); ?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="GeraDox">
    <link rel="shortcut icon" href="{TPL_images}file-text-o_4e8079_128.ico" type="image/x-icon" />
    <link rel="icon" href="{TPL_images}file-text-o_4e8079_128.ico" />
    <title><?php echo $CI->config->item('title'); ?></title>
    <link href="<?php echo base_url(); ?>bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <script src="<?php echo base_url(); ?>js/jquery-1.11.1.min.js"></script>
    <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    html, body {
        height: 100%;
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
        font-size: 14px;
        line-height: 1.6;
        color: #1d2327;
        background: #f0f0f1;
    }
    .login-wrap {
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }
    .login-logo { margin-bottom: 20px; text-align: center; }
    .login-logo .logo-icon {
        width: 64px; height: 64px;
        background: #1d2327;
        border-radius: 50%;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        color: #fff;
        font-size: 28px;
        margin-bottom: 12px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.15);
    }
    .login-logo h1 { font-size: 20px; font-weight: 700; color: #1d2327; margin: 0; }
    .login-logo p { font-size: 12.5px; color: #8c8f94; margin-top: 3px; }
    .login-card {
        background: #fff;
        border: 1px solid #dcdcde;
        border-radius: 4px;
        box-shadow: 0 1px 3px rgba(0,0,0,0.06);
        padding: 26px 26px 20px;
        width: 100%;
        max-width: 360px;
    }
    .login-card h2 { font-size: 15px; font-weight: 600; color: #1d2327; margin-bottom: 18px; text-align: center; }
    .form-signin { background: transparent; padding: 0; box-shadow: none; border-radius: 0; max-width: 100%; }
    .form-signin-heading { display: none; }
    #emblema { display: none; }
    .form-signin .form-control {
        width: 100%; height: 36px; padding: 6px 10px;
        font-size: 13.5px; color: #1d2327; background: #fff;
        border: 1px solid #8c8f94; border-radius: 3px;
        outline: none; transition: border-color 0.15s, box-shadow 0.15s;
        box-shadow: none; display: block; margin-bottom: 12px;
    }
    .form-signin .form-control:focus { border-color: #2271b1; box-shadow: 0 0 0 1px #2271b1; }
    .form-signin .form-control::placeholder { color: #b4b9be; }
    .form-signin .btn {
        display: block; width: 100%; height: 36px;
        background: #2271b1; color: #fff; border: none;
        border-radius: 3px; font-size: 13.5px; font-weight: 600;
        cursor: pointer; transition: background 0.15s; margin-top: 4px;
    }
    .form-signin .btn:hover, .form-signin .btn:focus { background: #135e96; outline: none; color: #fff; }
    .form-signin .btn-primary {
        background: #f6f7f7; color: #2271b1;
        border: 1px solid #8c8f94; margin-top: 8px;
    }
    .form-signin .btn-primary:hover { background: #dcdcde; color: #135e96; }
    .form-signin .alert {
        border-radius: 3px; padding: 8px 12px;
        font-size: 12.5px; margin-bottom: 14px; border: 1px solid transparent;
    }
    .form-signin .alert-danger {
        background: #fcf0f1; border-color: #f86368;
        color: #8a2424; border-left: 4px solid #d63638;
    }
    .form-signin .alert-success {
        background: #edfaef; border-color: #68de7c;
        color: #007017; border-left: 4px solid #00a32a;
    }
    .help-block { font-size: 12px; color: #d63638; margin-top: -8px; margin-bottom: 8px; }
    .login-footer { margin-top: 20px; text-align: center; font-size: 11.5px; color: #8c8f94; }
    .login-footer a { color: #2271b1; text-decoration: none; }
    .login-footer a:hover { text-decoration: underline; }
    .login-version { margin-top: 4px; font-size: 11px; color: #b4b9be; }
    @media (max-width: 480px) { .login-card { padding: 20px 18px 16px; } }
    </style>
</head>
<body>
<div class="login-wrap">
    <div class="login-logo">
        <div class="logo-icon"><i class="fa fa-file-text"></i></div>
        <h1><?php echo $CI->config->item('title_short'); ?></h1>
        <p>Sistema de Gerenciamento de Documentos</p>
    </div>
    <div class="login-card">
        <h2>Acesse sua conta</h2>
        {TPL_content}
    </div>
    <div class="login-footer">
        <?php echo $CI->config->item('rodape_sistema'); ?>
        <div class="login-version">Versão 2.7</div>
    </div>
</div>
<script src="<?php echo base_url(); ?>bootstrap/js/bootstrap.min.js"></script>
{TPL_js}
</body>
</html>
