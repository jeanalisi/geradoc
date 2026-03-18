<?php 
	$CI =& get_instance();
	$CI->load->library('datas');
	$today = $CI->datas->getMinDateExtenso(); 	
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<meta name="author" content="GeraDox">
	<meta name="reply-to" content="contato.geradox@gmail.com">
	<meta name="revised" content="GeraDox, 14/09/2016" />
	<meta name="abstract" content="GeraDox - Documentos padronizados com facilidade">

	<link rel="shortcut icon" href="{TPL_images}file-text-o_4e8079_128.ico" type="image/x-icon" />
	<link rel="icon" href="{TPL_images}file-text-o_4e8079_128.ico" />

	<title><?php echo $CI->config->item('title');?></title>
	{TPL_css}
	<link href="<?php echo base_url();?>bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="<?php echo base_url();?>font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="<?php echo base_url();?>bootstrap/css/animate.css" rel="stylesheet">
	<link href="<?php echo base_url();?>bootstrap/css/login_clean.css" rel="stylesheet">
    {TPL_js}
    <script src="<?php echo base_url();?>js/jquery-1.11.1.min.js"></script>
    <script src="<?php echo base_url();?>bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	{TPL_content}
	<footer class="footer">
	  <div class="container text-center">
	    <p class="text-muted"><?php echo $CI->config->item('rodape_sistema');?></p>
	  </div>
	</footer>
</body>
</html>
