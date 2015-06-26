<?php
class Available extends Phalcon\Mvc\Model{
	public $id;
	public $do_id;
	public $date;
	public $when;
	public $starttime;
	public $endtime;
	public $remain;
	public function initialize(){
		$this->belongsTo('do_id','Doctor','id');
		$this->hasMany('id','Reservation','a_id');
	}
}