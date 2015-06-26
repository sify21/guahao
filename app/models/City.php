<?php
class City extends Phalcon\Mvc\Model{
	public $id;
	public $province;
	public $name;
	public function initialize(){
		$this->hasMany('id','Hospital','cityid');
	}
}