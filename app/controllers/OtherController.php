<?php
/**
 * Created by PhpStorm.
 * User: st
 * Date: 14-12-17
 * Time: 上午11:06
 */

class OtherController extends ControllerBase {
    public function initialize(){
        $this->tag->setTitle('打印预约单');
        parent::initialize();
        $this->view->setTemplateAfter('index');
    }
    public function doprintAction(){
    	$rid=$this->request->get('reservationid','int');
        $r=Reservation::findFirst(array(
            'id=:rid:',
            'bind' => array('rid' => $rid)));
        $user=$r->getUser();
        $available=$r->getAvailable();
        $doctor=$available->getDoctor();
        $department=$doctor->getDepartment();
        $hospital=$department->getHospital();
        $this->view->setVars(array(
            'user'=>$user,
            'available' => $available,
            'doctor' => $doctor,
            'department' => $department,
            'hospital' => $hospital,
            'reservation' => $r));
    }
    public function fasthelpAction(){

    }
    public function footanounceAction(){

    }
}
