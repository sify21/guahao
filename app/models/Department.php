<?php
class Department extends Phalcon\Mvc\Model{
	public $id;
	public $h_id;
	public $type;
	public $intro;
	public $name;
	public $dcount;
	public function initialize(){
		$this->hasMany('id','Doctor','de_id');
		$this->belongsTo('h_id','Hospital','id');
	}
}