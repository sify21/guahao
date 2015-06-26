<?php
class ControllerBase extends Phalcon\Mvc\Controller{
	protected function initialize(){
		$this->tag->prependTitle('医愿网-');
		if($this->session->has('username')){
			$this->view->setVars(array(
				'loginfo' => true,
				'username' => $this->session->get('username') ));
		}else{
			$this->view->setVars(array(
				'loginfo' => false,
				));
		}
	}
}