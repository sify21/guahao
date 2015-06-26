<?php
$router=new Phalcon\Mvc\Router();
$router->handle();
$router->notFound(array(
	'controller' => 'index',
	'action' => 'index'));