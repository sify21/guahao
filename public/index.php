<?php
try {
	date_default_timezone_set('PRC');
	define('APP_PATH',realpath('..')."/");
	$config=new Phalcon\Config\Adapter\Ini(APP_PATH.'app/config/config.ini');
	$loader=new Phalcon\Loader();
	$loader->registerDirs(array(
			APP_PATH.$config->application->controllersDir,
			APP_PATH.$config->application->modelsDir,
			APP_PATH.$config->application->libraryDir,
	))->register();
	$di=new Phalcon\DI\FactoryDefault();
	$di->set('router',function(){
		require APP_PATH.'app/config/routes.php';
		return $router;
	});
	$di->set('url',function(){
		$url=new Phalcon\Mvc\Url();
		$url->setBaseUri('/');
		return $url;
	});
	$di->set('view',function() use($config){
		$view=new Phalcon\Mvc\View();
		$view->setViewsDir(APP_PATH.$config->application->viewsDir);
		$view->registerEngines(array(
			'.volt' => 'volt',
		));
		return $view;
	});
	$di->set('volt',function($view,$di){
		$volt=new Phalcon\Mvc\View\Engine\Volt($view,$di);
		$volt->setOptions(array(
			'compiledPath' => APP_PATH.'cache/volt/',
		));
		return $volt;
	},true);
	$di->setShared('session',function(){
		$session=new Phalcon\Session\Adapter\Files();
		$session->start();
		return $session; 
	});
	$di->set('tag',function(){
		return new Phalcon\Tag();
	});
	$di->set('db', function() use($config){
			return new Phalcon\Db\Adapter\Pdo\Mysql(array(
				'host' => $config->database->host,
				'username' => $config->database->username,
				'password' => $config->database->password,
				'dbname' => $config->database->dbname,
				'charset' => 'utf8' 
			));
	});
	$di->set('cookies',function(){
			return new Phalcon\Http\Response\Cookies();
	});
	//这里启用了crypt，cookies也要用它，要装mcrypt 及 php5-mcrypt
	$di->set('crypt',function() use($config){
			$crypt=new Phalcon\Crypt();
			$crypt->setKey('sify21');
			return $crypt;
	});
	$application = new \Phalcon\Mvc\Application($di);
	echo $application->handle()->getContent();
} catch (\Phalcon\Exception $e) {
	echo "Phalcon出异常啦：", $e->getMessage();
} catch(Exception $e){
	echo 'Php出异常啦：',$e->getMessage();
}