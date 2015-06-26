<?php
class Hospital extends Phalcon\Mvc\Model{
	public $id;
	public $name;
	public $intro;
	public $cityid;
	public $street;
	public $tele;
	public $level;
	public $notice;
	public $img;
	public function initialize(){
		$this->hasMany('id','Department','h_id');
		$this->hasOne('id','UserHX','h_id');
		$this->belongsTo('cityid','City','id');
	}
}