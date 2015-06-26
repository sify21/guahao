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
{{ assets.outputJs() }}
</body>