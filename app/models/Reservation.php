<?php
class Reservation extends Phalcon\Mvc\Model{
	public $id;
	public $a_id;
	public $u_id;
	public $status;
	public $borntime;
	public function initialize(){
		$this->belongsTo('a_id','Available','id');
		$this->belongsTo('u_id','User','id');
	}
}