<?php
class UserHX extends Phalcon\Mvc\Model{
	public $id;
	public $h_id
	public $name;
	public $pwd;
	public $phone;
	public $email;
	public function initialize(){
		$this->hasOne('h_id','Hospital','id');
	}
}