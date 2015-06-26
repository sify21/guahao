{#在volt里面手动引用资源时要在路径上css、js、img前面加上/或者/public/代表网站的根目录，output出来的不用它会自动给你加上；如果不加，以localhost/index/index形式访问无法加载资源（直接localhost或localhost/index是可以加载的）#}
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	{{ get_title() }}
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/reset.css">
    {{ assets.outputCss() }}
</head>
<body>
    <script type="text/javascript" src="/js/jquery-2.1.1.min.js"></script>
    {{ content() }}
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/topnav.js"></script>
    {{ assets.outputJs() }}
</body>