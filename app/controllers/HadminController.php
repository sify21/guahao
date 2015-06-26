<?php
class HadminController extends ControllerBase{
	public function initialize(){
		$this->tag->setTitle('医院系统管理员');
		parent::initialize();
		$this->view->setTemplateAfter('admin');
	}
	public function departmentinfoAction(){

	}
	public function departmenttableAction(){

	}
	public function doctorinfoAction(){

	}
	public function doctortableAction(){

	}
	public function hospitaladmininfoAction(){

	}
	public function hospitalinfoAction(){

	}
	public function hospitaldoctableAction(){

	}
	public function reservationinfoAction(){

	}
	public function reservationtableAction(){

	}
}