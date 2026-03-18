<?php
/*
 * Layout principal - Tema WordPress Admin (Off-White)
 * GeraDox - Sistema de Gerenciamento de Documentos
 */
$CI = & get_instance();
$CI->load->library(array('session', 'datas'));
$today          = $CI->datas->getMinDateExtenso();
$id_usuario     = $CI->session->userdata('id_usuario');
$nome_usuario   = $CI->session->userdata('nome');
$nivel_id       = $CI->session->userdata('nivelId');
$nivel_usuario  = '';
switch ($nivel_id) {
    case 1: $nivel_usuario = "Administrador"; break;
    case 2: $nivel_usuario = "Redator"; break;
    default: $nivel_usuario = "Usuário"; break;
}

/* Sessão e uploads */
$_SESSION['CI_ROOT']          = site_url();
$_SESSION['base_url_upload']  = str_replace('http://'.$_SERVER['SERVER_NAME'], '', base_url());
$_SESSION['orgao_documento']  = $CI->config->item('orgao');
$_SESSION['rodape_documento'] = $CI->config->item('rodape_documento');
$_SESSION['base_url']         = base_url();
$_SESSION['upload_path']      = "./uploads/".$id_usuario;

/* Menu ativo */
$area = $CI->uri->segment(1);
$menu_documento   = '';
$menu_repositorio = '';
$menu_ferramentas = '';
$menu_perfil      = '';
$menu_admin       = '';
if ($CI->uri->segment(2) == 'cadastro' || $CI->uri->segment(2) == 'altsenha') {
    $area = $CI->uri->segment(2);
}
switch ($area) {
    case 'documento':   $menu_documento   = 'current wp-has-current-submenu'; break;
    case 'repositorio': $menu_repositorio = 'current'; break;
    case 'coluna':
    case 'tipo':
    case 'orgao':
    case 'setor':
    case 'cargo':
    case 'contato':
    case 'usuario':     $menu_admin       = 'current wp-has-current-submenu'; break;
    case 'cadastro':
    case 'altsenha':    $menu_perfil      = 'current wp-has-current-submenu'; break;
    case 'auditoria':
    case 'estatistica': $menu_ferramentas = 'current wp-has-current-submenu'; break;
}

/* Tempo de sessão restante */
$SessTimeLeft = 0;
$SessExpTime  = $CI->config->config["sess_expiration"];
$CurrTime     = time();
$SQL = "SELECT last_activity FROM ci_sessions WHERE session_id = '".$CI->session->userdata('session_id')."'";
$query = $CI->db->query($SQL);
$arrLastActivity = $query->result_array();
if (!empty($arrLastActivity)) {
    $SessTimeLeft = ($SessExpTime - ($CurrTime - $arrLastActivity[0]["last_activity"]));
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="refresh" content="<?php echo $CI->config->item('sess_expiration');?>" />
    <meta name="author" content="GeraDox">
    <meta name="keywords" content="geradoc, geradox, documento, oficio, comunicacao interna">
    <link rel="shortcut icon" href="{TPL_images}file-text-o_4e8079_128.ico" type="image/x-icon" />
    <link rel="icon" href="{TPL_images}file-text-o_4e8079_128.ico" />
    <title><?php echo $CI->config->item('title');?></title>

    {TPL_css}

    <!-- Bootstrap & Ícones -->
    <link href="<?php echo base_url();?>bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url();?>bootstrap/css/bootstrap_custom.css" rel="stylesheet">
    <link href="<?php echo base_url();?>bootstrap/css/cus-icons.css" rel="stylesheet">
    <link href="<?php echo base_url();?>bootstrap/css/datatables.bootstrap.css" rel="stylesheet">
    <link href="<?php echo base_url();?>font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/jquery.countdown.css">

    <!-- =====================================================
         TEMA WORDPRESS-LIKE — OFF-WHITE / CLEAN ADMIN
    ====================================================== -->
    <style>
    /* ---- Reset & Base ---- */
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    html, body { height: 100%; }
    body {
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
        background: #f0f0f1;
        color: #1d2327;
        font-size: 13px;
        line-height: 1.6;
    }
    a { color: #2271b1; text-decoration: none; transition: color 0.15s; }
    a:hover, a:focus { color: #135e96; text-decoration: none; }

    /* ---- Wrapper geral ---- */
    #wpwrap { display: flex; min-height: 100vh; }

    /* =============================================
       SIDEBAR
    ============================================= */
    #adminmenu-wrap {
        width: 160px;
        min-width: 160px;
        background: #1d2327;
        display: flex;
        flex-direction: column;
        position: fixed;
        top: 0; left: 0;
        height: 100vh;
        z-index: 9999;
        overflow-y: auto;
        overflow-x: hidden;
        transition: width 0.25s ease;
    }
    #adminmenu-wrap::-webkit-scrollbar { width: 4px; }
    #adminmenu-wrap::-webkit-scrollbar-thumb { background: #3c434a; border-radius: 2px; }

    #wp-admin-bar-logo {
        display: flex; align-items: center;
        padding: 14px 16px 12px;
        background: #1d2327;
        border-bottom: 1px solid #2c3338;
        text-decoration: none;
        min-height: 56px;
    }
    #wp-admin-bar-logo .logo-icon {
        width: 32px; height: 32px;
        background: #2271b1;
        border-radius: 6px;
        display: flex; align-items: center; justify-content: center;
        color: #fff; font-size: 16px; flex-shrink: 0;
    }
    #wp-admin-bar-logo .logo-text {
        margin-left: 10px; color: #fff;
        font-size: 13px; font-weight: 700;
        line-height: 1.2; letter-spacing: 0.3px;
        white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
    }
    #wp-admin-bar-logo .logo-text small {
        display: block; font-size: 10px; font-weight: 400; color: #8c8f94; margin-top: 1px;
    }

    #adminmenu { list-style: none; padding: 8px 0; flex: 1; }
    #adminmenu li { position: relative; }
    #adminmenu > li > a {
        display: flex; align-items: center;
        padding: 8px 16px;
        color: #b4b9be; font-size: 12.5px; font-weight: 400;
        white-space: nowrap;
        transition: background 0.15s, color 0.15s;
        cursor: pointer;
        border-left: 3px solid transparent;
    }
    #adminmenu > li > a .menu-icon {
        width: 20px; text-align: center; font-size: 14px;
        margin-right: 10px; flex-shrink: 0;
        color: #8c8f94; transition: color 0.15s;
    }
    #adminmenu > li > a:hover, #adminmenu > li > a:focus {
        background: #2c3338; color: #fff; border-left-color: #2271b1;
    }
    #adminmenu > li > a:hover .menu-icon,
    #adminmenu > li > a:focus .menu-icon { color: #72aee6; }
    #adminmenu > li.current > a,
    #adminmenu > li.wp-has-current-submenu > a {
        background: #2c3338; color: #fff; border-left-color: #2271b1; font-weight: 600;
    }
    #adminmenu > li.current > a .menu-icon,
    #adminmenu > li.wp-has-current-submenu > a .menu-icon { color: #72aee6; }

    #adminmenu .wp-menu-separator { height: 1px; background: #2c3338; margin: 6px 0; pointer-events: none; }
    #adminmenu .wp-menu-separator a { display: none; }

    #adminmenu .wp-submenu { list-style: none; background: #101517; display: none; padding: 4px 0; }
    #adminmenu li.open > .wp-submenu { display: block; }
    #adminmenu .wp-submenu li a {
        display: block; padding: 6px 16px 6px 46px;
        color: #8c8f94; font-size: 12px;
        transition: color 0.15s, background 0.15s; white-space: nowrap;
    }
    #adminmenu .wp-submenu li a:hover { color: #fff; background: #1d2327; }

    #adminmenu > li > a .menu-caret {
        margin-left: auto; font-size: 10px; color: #50575e; transition: transform 0.2s;
    }
    #adminmenu > li.open > a .menu-caret { transform: rotate(90deg); color: #8c8f94; }

    #adminmenu-footer { padding: 12px 16px; border-top: 1px solid #2c3338; }
    #adminmenu-footer a {
        display: flex; align-items: center;
        color: #8c8f94; font-size: 12px; padding: 6px 0; transition: color 0.15s;
    }
    #adminmenu-footer a:hover { color: #fff; }
    #adminmenu-footer a .menu-icon { width: 20px; text-align: center; margin-right: 10px; font-size: 13px; }

    /* =============================================
       AREA PRINCIPAL
    ============================================= */
    #wpcontent {
        flex: 1; margin-left: 160px;
        display: flex; flex-direction: column; min-height: 100vh;
        transition: margin-left 0.25s ease;
    }

    /* Topbar */
    #wpadminbar {
        position: sticky; top: 0; z-index: 9998;
        background: #fff; border-bottom: 1px solid #dcdcde;
        height: 46px; display: flex; align-items: center;
        padding: 0 20px; box-shadow: 0 1px 4px rgba(0,0,0,0.06);
    }
    #wpadminbar .adminbar-left { display: flex; align-items: center; flex: 1; gap: 16px; }
    #wpadminbar .adminbar-right { display: flex; align-items: center; gap: 12px; }
    #menu-toggle {
        background: none; border: none; cursor: pointer;
        padding: 4px 6px; color: #50575e; font-size: 18px; display: none; line-height: 1;
    }
    #menu-toggle:hover { color: #1d2327; }
    .adminbar-date { font-size: 11.5px; color: #8c8f94; }
    .adminbar-countdown { font-size: 11.5px; color: #8c8f94; display: flex; align-items: center; gap: 4px; }
    .adminbar-sep { width: 1px; height: 20px; background: #dcdcde; }
    .adminbar-user { display: flex; align-items: center; gap: 8px; color: #50575e; font-size: 12.5px; }
    .adminbar-user .user-avatar {
        width: 28px; height: 28px; background: #2271b1; border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        color: #fff; font-size: 12px; font-weight: 700; flex-shrink: 0;
    }
    .adminbar-user .user-name { font-weight: 600; color: #1d2327; font-size: 12.5px; }
    .adminbar-user .user-role { font-size: 11px; color: #8c8f94; }

    /* Conteudo */
    #wpbody { flex: 1; padding: 20px 24px; background: #f0f0f1; }
    #wpbody-content { max-width: 1400px; }

    /* Rodape */
    #wpfooter {
        background: #fff; border-top: 1px solid #dcdcde;
        padding: 10px 24px; font-size: 11.5px; color: #8c8f94; text-align: center;
    }
    #wpfooter a { color: #2271b1; }

    /* =============================================
       COMPONENTES
    ============================================= */
    .panel {
        background: #fff; border: 1px solid #dcdcde !important;
        border-radius: 4px !important; box-shadow: 0 1px 3px rgba(0,0,0,0.04) !important;
        margin-bottom: 20px;
    }
    .panel-primary > .panel-heading,
    .panel-default > .panel-heading {
        background: #f6f7f7 !important; color: #1d2327 !important;
        border-bottom: 1px solid #dcdcde !important; border-color: #dcdcde !important;
        padding: 11px 16px !important; font-weight: 600 !important; font-size: 13px !important;
        border-radius: 3px 3px 0 0 !important;
    }
    .panel-body { padding: 16px !important; background: #fff !important; }

    .btn {
        border-radius: 3px !important; font-size: 12.5px !important;
        font-weight: 400 !important; padding: 5px 12px !important;
        line-height: 1.5 !important; border: 1px solid transparent !important;
        box-shadow: none !important; transition: all 0.15s ease !important;
    }
    .btn-primary, .btn-success {
        background: #2271b1 !important; border-color: #2271b1 !important; color: #fff !important;
    }
    .btn-primary:hover, .btn-primary:focus,
    .btn-success:hover, .btn-success:focus {
        background: #135e96 !important; border-color: #135e96 !important; color: #fff !important;
    }
    .btn-danger { background: #d63638 !important; border-color: #d63638 !important; color: #fff !important; }
    .btn-danger:hover { background: #b32d2e !important; color: #fff !important; }
    .btn-warning { background: #dba617 !important; border-color: #dba617 !important; color: #fff !important; }
    .btn-warning:hover { background: #c08c00 !important; color: #fff !important; }
    .btn-info { background: #50575e !important; border-color: #50575e !important; color: #fff !important; }
    .btn-info:hover { background: #3c434a !important; color: #fff !important; }
    .btn-default { background: #f6f7f7 !important; border-color: #8c8f94 !important; color: #1d2327 !important; }
    .btn-default:hover { background: #dcdcde !important; color: #1d2327 !important; }

    .form-control {
        border: 1px solid #8c8f94 !important; border-radius: 3px !important;
        padding: 5px 10px !important; font-size: 13px !important;
        color: #1d2327 !important; background: #fff !important;
        box-shadow: none !important; height: 30px !important;
    }
    .form-control:focus { border-color: #2271b1 !important; box-shadow: 0 0 0 1px #2271b1 !important; }
    textarea.form-control { height: auto !important; }
    .input-group-addon { background: #f6f7f7 !important; border-color: #8c8f94 !important; color: #50575e !important; }

    .table > thead > tr > th {
        background: #f6f7f7 !important; color: #1d2327 !important;
        font-weight: 700 !important; font-size: 11.5px !important;
        text-transform: uppercase !important; letter-spacing: 0.4px !important;
        border-bottom: 2px solid #dcdcde !important; border-top: none !important;
        padding: 9px 12px !important;
    }
    .table > tbody > tr > td { padding: 9px 12px !important; border-top: 1px solid #f0f0f1 !important; }
    .table > tbody > tr:hover > td { background-color: #f6f7f7 !important; }
    .table-striped > tbody > tr:nth-of-type(odd) > td { background-color: #fafafa !important; }

    .alert { border-radius: 3px !important; padding: 10px 14px !important; font-size: 13px !important; }
    .alert-success { background: #edfaef !important; border-color: #68de7c !important; color: #007017 !important; border-left: 4px solid #00a32a !important; }
    .alert-danger { background: #fcf0f1 !important; border-color: #f86368 !important; color: #8a2424 !important; border-left: 4px solid #d63638 !important; }
    .alert-warning { background: #fcf9e8 !important; border-color: #f0c33c !important; color: #674200 !important; border-left: 4px solid #dba617 !important; }
    .alert-info { background: #f0f6fc !important; border-color: #72aee6 !important; color: #0a4b78 !important; border-left: 4px solid #2271b1 !important; }

    .bg-success {
        background: #f6f7f7 !important; color: #1d2327 !important;
        padding: 8px 14px !important; border-radius: 3px !important;
        border-left: 4px solid #2271b1 !important; border-bottom: 1px solid #dcdcde !important;
        margin-bottom: 16px !important; font-weight: 600 !important; font-size: 15px !important;
    }

    .pagination > li > a, .pagination > li > span {
        color: #2271b1 !important; border: 1px solid #dcdcde !important;
        margin: 0 1px !important; border-radius: 3px !important;
        padding: 5px 10px !important; font-size: 12.5px !important; background: #fff !important;
    }
    .pagination > li > a:hover { background: #f6f7f7 !important; }
    .pagination > .active > a, .pagination > .active > a:hover {
        background: #2271b1 !important; border-color: #2271b1 !important; color: #fff !important;
    }

    .modal-content { border: 1px solid #dcdcde !important; border-radius: 4px !important; box-shadow: 0 5px 20px rgba(0,0,0,0.15) !important; }
    .modal-header { background: #f6f7f7 !important; border-bottom: 1px solid #dcdcde !important; border-radius: 3px 3px 0 0 !important; padding: 14px 18px !important; }
    .modal-header .modal-title { font-size: 14px !important; font-weight: 600 !important; color: #1d2327 !important; }
    .modal-body { padding: 18px !important; font-size: 13px !important; }
    .modal-footer { background: #f6f7f7 !important; border-top: 1px solid #dcdcde !important; border-radius: 0 0 3px 3px !important; padding: 12px 18px !important; }

    .badge { background: #2271b1 !important; border-radius: 10px !important; font-size: 10.5px !important; }
    .well { background: #f6f7f7 !important; border: 1px solid #dcdcde !important; border-radius: 4px !important; box-shadow: none !important; }
    .breadcrumb { background: transparent !important; padding: 6px 0 !important; margin-bottom: 12px !important; }
    .text-muted { color: #8c8f94 !important; }
    .areaimage { text-align: center; padding: 20px 0 10px; }
    .areaimage img { opacity: 0.2; filter: grayscale(100%); }

    /* Responsivo */
    @media (max-width: 782px) {
        #adminmenu-wrap { width: 0; transform: translateX(-100%); transition: transform 0.25s ease, width 0.25s ease; }
        #adminmenu-wrap.open { width: 200px; transform: translateX(0); }
        #wpcontent { margin-left: 0 !important; }
        #menu-toggle { display: block !important; }
        #wpbody { padding: 14px 16px; }
    }
    @media (min-width: 783px) and (max-width: 960px) {
        #adminmenu-wrap { width: 36px; }
        #adminmenu-wrap .logo-text, #adminmenu-wrap .menu-label,
        #adminmenu-wrap .menu-caret, #adminmenu-wrap .wp-submenu,
        #adminmenu-wrap #adminmenu-footer span { display: none; }
        #adminmenu-wrap #wp-admin-bar-logo { padding: 14px 8px; justify-content: center; }
        #adminmenu-wrap #wp-admin-bar-logo .logo-icon { margin: 0; }
        #adminmenu > li > a { padding: 10px 8px; justify-content: center; }
        #adminmenu > li > a .menu-icon { margin: 0; font-size: 16px; }
        #wpcontent { margin-left: 36px; }
    }

    #sidebar-overlay { display: none; position: fixed; inset: 0; background: rgba(0,0,0,0.5); z-index: 9998; }
    #sidebar-overlay.active { display: block; }

    ::-webkit-scrollbar { width: 8px; height: 8px; }
    ::-webkit-scrollbar-track { background: #f0f0f1; }
    ::-webkit-scrollbar-thumb { background: #c3c4c7; border-radius: 4px; }
    ::-webkit-scrollbar-thumb:hover { background: #8c8f94; }
    </style>

    <script type="text/javascript">var CI_ROOT = '<?php echo site_url(); ?>';</script>
    {TPL_js}
    {TPL_js_custom}
    <script src="<?php echo base_url();?>bootstrap/js/ie10-viewport-bug-workaround.js"></script>
</head>
<body class="wp-admin">

<div id="sidebar-overlay"></div>

<div id="wpwrap">

    <!-- SIDEBAR -->
    <div id="adminmenu-wrap">
        <a href="<?php echo site_url('/documento/index'); ?>" id="wp-admin-bar-logo" title="Inicio">
            <div class="logo-icon"><i class="fa fa-file-text"></i></div>
            <div class="logo-text">
                <?php echo $CI->config->item('title_short'); ?>
                <small>Painel</small>
            </div>
        </a>
        <ul id="adminmenu">
            <li class="<?php echo $menu_documento; ?> wp-has-submenu">
                <a href="#" class="menu-toggle-item">
                    <span class="menu-icon"><i class="fa fa-file-o"></i></span>
                    <span class="menu-label">Documentos</span>
                    <span class="menu-caret"><i class="fa fa-chevron-right"></i></span>
                </a>
                <ul class="wp-submenu">
                    <li><a href="<?php echo site_url('/documento/index'); ?>"><i class="fa fa-list fa-fw"></i> Lista</a></li>
                    <li><a href="<?php echo site_url('/documento/add'); ?>"><i class="fa fa-plus fa-fw"></i> Novo</a></li>
                    <li><a href="<?php echo site_url('/workflow'); ?>"><i class="fa fa-inbox fa-fw"></i> Entrada</a></li>
                </ul>
            </li>
            <li class="<?php echo $menu_repositorio; ?>">
                <a href="<?php echo site_url('/repositorio/index'); ?>">
                    <span class="menu-icon"><i class="fa fa-archive"></i></span>
                    <span class="menu-label">Repositorio</span>
                </a>
            </li>
            <?php if ($nivel_id == 1): ?>
            <li class="wp-menu-separator"><a></a></li>
            <li class="wp-has-submenu <?php echo $menu_admin; ?>">
                <a href="#" class="menu-toggle-item">
                    <span class="menu-icon"><i class="fa fa-cog"></i></span>
                    <span class="menu-label">Administracao</span>
                    <span class="menu-caret"><i class="fa fa-chevron-right"></i></span>
                </a>
                <ul class="wp-submenu">
                    <li><a href="<?php echo site_url('/coluna/index'); ?>"><i class="fa fa-database fa-fw"></i> Campos</a></li>
                    <li><a href="<?php echo site_url('/tipo/index'); ?>"><i class="fa fa-files-o fa-fw"></i> Tipos de Doc.</a></li>
                    <li><a href="<?php echo site_url('/orgao/index'); ?>"><i class="fa fa-building-o fa-fw"></i> Orgaos</a></li>
                    <li><a href="<?php echo site_url('/setor/index'); ?>"><i class="fa fa-sitemap fa-fw"></i> Setores</a></li>
                    <li><a href="<?php echo site_url('/cargo/index'); ?>"><i class="fa fa-suitcase fa-fw"></i> Cargos</a></li>
                    <li><a href="<?php echo site_url('/contato/index'); ?>"><i class="fa fa-pencil fa-fw"></i> Remetentes</a></li>
                    <li><a href="<?php echo site_url('/usuario/index'); ?>"><i class="fa fa-users fa-fw"></i> Usuarios</a></li>
                </ul>
            </li>
            <li class="wp-has-submenu <?php echo $menu_ferramentas; ?>">
                <a href="#" class="menu-toggle-item">
                    <span class="menu-icon"><i class="fa fa-wrench"></i></span>
                    <span class="menu-label">Ferramentas</span>
                    <span class="menu-caret"><i class="fa fa-chevron-right"></i></span>
                </a>
                <ul class="wp-submenu">
                    <li><a href="<?php echo site_url('/auditoria/index'); ?>"><i class="fa fa-binoculars fa-fw"></i> Auditoria</a></li>
                    <li><a href="<?php echo site_url('/estatistica/index'); ?>"><i class="fa fa-bar-chart fa-fw"></i> Estatisticas</a></li>
                </ul>
            </li>
            <?php endif; ?>
            <li class="wp-menu-separator"><a></a></li>
            <?php if ($CI->session->userdata('email') != 'demo@geradox.com.br' && $CI->session->userdata('email') != 'convidado@geradox.com.br'): ?>
            <li class="wp-has-submenu <?php echo $menu_perfil; ?>">
                <a href="#" class="menu-toggle-item">
                    <span class="menu-icon"><i class="fa fa-user-circle-o"></i></span>
                    <span class="menu-label">Meu Perfil</span>
                    <span class="menu-caret"><i class="fa fa-chevron-right"></i></span>
                </a>
                <ul class="wp-submenu">
                    <li><a href="<?php echo site_url('usuario/cadastro'); ?>"><i class="fa fa-smile-o fa-fw"></i> Meu cadastro</a></li>
                    <li><a href="<?php echo site_url('usuario/altsenha'); ?>"><i class="fa fa-key fa-fw"></i> Minha senha</a></li>
                </ul>
            </li>
            <?php endif; ?>
        </ul>
        <div id="adminmenu-footer">
            <a href="#modalSobre" data-toggle="modal">
                <span class="menu-icon"><i class="fa fa-info-circle"></i></span>
                <span>Sobre</span>
            </a>
            <a href="#modalFaleconosco" id="fale" data-toggle="modal">
                <span class="menu-icon"><i class="fa fa-envelope-o"></i></span>
                <span>Fale conosco</span>
            </a>
            <a href="<?php echo site_url('login_mail/logoff'); ?>" title="Sair">
                <span class="menu-icon"><i class="fa fa-sign-out"></i></span>
                <span>Sair</span>
            </a>
        </div>
    </div>
    <!-- Fim Sidebar -->

    <!-- AREA PRINCIPAL -->
    <div id="wpcontent">
        <!-- Topbar -->
        <div id="wpadminbar">
            <div class="adminbar-left">
                <button id="menu-toggle" title="Menu"><i class="fa fa-bars"></i></button>
                <span class="adminbar-date"><i class="fa fa-calendar-o"></i> <?php echo $today; ?></span>
                <span class="adminbar-sep"></span>
                <span class="adminbar-countdown">
                    <i class="fa fa-clock-o"></i>
                    <span class="countdown"></span> restantes
                </span>
            </div>
            <div class="adminbar-right">
                <div class="adminbar-user">
                    <div class="user-avatar"><?php echo strtoupper(substr($nome_usuario, 0, 1)); ?></div>
                    <div>
                        <div class="user-name"><?php echo $nome_usuario; ?></div>
                        <div class="user-role"><?php echo $nivel_usuario; ?></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Conteudo -->
        <div id="wpbody">
            <div id="wpbody-content">
                {TPL_content}
            </div>
        </div>

        <!-- Rodape -->
        <div id="wpfooter">
            <?php echo $CI->config->item('rodape_sistema'); ?>
        </div>
    </div>
    <!-- Fim Area Principal -->

</div>

<!-- MODAIS -->
<div class="modal fade" id="modalSobre" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog"><div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><?php $pos = strpos($CI->config->item('title_short'), "<"); echo ($pos !== false) ? substr($CI->config->item('title_short'), 0, $pos) : $CI->config->item('title_short'); ?></h4>
    </div>
    <div class="modal-body">{TPL_modal}</div>
    <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button></div>
  </div></div>
</div>

<?php $action_fale_conosco = site_url() . "/faleconosco/mensagem/" . uri_string(); ?>
<div class="modal fade" id="modalFaleconosco" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog"><div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Fale conosco</h4>
    </div>
    <form id="contactForm" role="form" action="<?php echo $action_fale_conosco; ?>" method="post">
    <div class="modal-body">
        <p class="text-muted">Utilize o formulario abaixo para enviar suas criticas, duvidas ou sugestoes.</p>
        <div class="form-group"><label>Seu nome:</label><input type="text" class="form-control" name="nome" required></div>
        <div class="form-group"><label>Seu e-mail:</label><input type="email" class="form-control" name="email" required></div>
        <div class="form-group"><label>Assunto:</label><input type="text" class="form-control" name="subject" required></div>
        <div class="form-group"><label>Mensagem:</label><textarea class="form-control" name="message" rows="4" required></textarea></div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
        <button type="submit" class="btn btn-primary">Enviar</button>
    </div>
    </form>
  </div></div>
</div>

<div class="modal fade" id="modalAguarde" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog"><div class="modal-content">
    <div class="modal-header"><h4 class="modal-title">Aguarde</h4></div>
    <div class="modal-body">
        <p>Enviando...</p>
        <div class="progress"><div class="progress-bar progress-bar-striped active" id="bar" role="progressbar" style="width: 0%;"></div></div>
    </div>
  </div></div>
</div>

<div id="modalDialog" style="display:none; min-height: 300px;">
    <div class="title"><?php $pos = strpos($CI->config->item('title_short'), "<"); echo ($pos !== false) ? substr($CI->config->item('title_short'), 0, $pos) : $CI->config->item('title_short'); ?></div>
    <div class="close"><a href="#" id="bt_cancelar"> X </a></div>
    <div class="text">{TPL_modal}</div>
    <div class="foot"></div>
</div>

<!-- Scripts -->
<script src="<?php echo base_url();?>bootstrap/js/bootstrap.min.js"></script>
<script src="<?php echo base_url();?>bootstrap/js/datatables.bootstrap.js"></script>
<script src="<?php echo base_url();?>bootstrap/js/bootstrap-select.min.js"></script>
<script src="<?php echo base_url(); ?>js/countdown/jquery.countdown.js"></script>
<script src="<?php echo base_url(); ?>js/countdown/jquery.countdown-pt-BR.js"></script>

<script type="text/javascript">
$('span.countdown').countdown({
    until: <?php echo $SessTimeLeft; ?>,
    compact: true,
    layout: '{hnn}h{sep}{mnn}m{sep}{snn}s',
    expiryUrl: "<?php echo base_url(); ?>"
});

$('.menu-toggle-item').on('click', function(e) {
    e.preventDefault();
    var $li = $(this).closest('li');
    var isOpen = $li.hasClass('open');
    $('#adminmenu li.open').removeClass('open');
    if (!isOpen) $li.addClass('open');
});

$('#adminmenu li.current, #adminmenu li.wp-has-current-submenu').each(function() {
    if ($(this).find('.wp-submenu').length) $(this).addClass('open');
});

$('#menu-toggle').on('click', function() {
    $('#adminmenu-wrap').toggleClass('open');
    $('#sidebar-overlay').toggleClass('active');
});
$('#sidebar-overlay').on('click', function() {
    $('#adminmenu-wrap').removeClass('open');
    $(this).removeClass('active');
});

$('[data-toggle="popover"]').popover();
$("a.btn").popover();
$("a.input-group-addon").popover();

$('#contactForm').submit(function() {
    $("#modalFaleconosco").modal('hide');
    $("#modalAguarde").modal('show');
    var bar = $('.progress-bar');
    var val = 0;
    (function myLoop(i) {
        setTimeout(function() {
            val += 10; bar.attr('aria-valuenow', val); bar.css('width', val + '%');
            if (--i) myLoop(i);
        }, 500);
    })(10);
    return true;
});
</script>
</body>
</html>
