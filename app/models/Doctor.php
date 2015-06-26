<?php
class Doctor extends Phalcon\Mvc\Model{
	public $id;
	public $name;
	public $de_id;
	public $post;
	public $intro;
	public $specialty;
	public $fee;
	public $img;
	public function initialize(){
		$this->belongsTo('de_id','Department','id');
		$this->hasMany('id','Available','do_id');
	}
}