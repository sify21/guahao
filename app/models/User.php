<?php
class User extends Phalcon\Mvc\Model{
	public $id;
	public $name;
	public $pwd;
	public $idcard;
	public $truename;
	public $phone;
	public $email;
	public $level;
	public $verify_status;
	public $img;
	public function initialize(){
		$this->hasMany('id','Reservation','u_id');
	}
}