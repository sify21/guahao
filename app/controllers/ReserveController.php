<?php
class ReserveController extends ControllerBase{
    public function initialize(){
        $this->view->setTemplateAfter('index');
        parent::initialize();
    }
    //浏览医院，获得url中的地区id及pagenumber，从session中获得省；每次访问该action均刷新页面
    public function hosreserveAction(){
        //默认在路由中传参数要写成 ？名=值&名=值...然后用request接；另一种就是写成 /值/值/...的形式，这种就不能写名字，而且最好实在路由里面自定义一下，是依次赋给action括号里的参数
        $cityid=$this->request->get('cityid','int');
        $pagenumber=$this->request->get('pagenumber','int');
        if($cityid==null) $cityid=0;
        if($pagenumber==null) $pagenumber=1;
        //若session中没有province，默认是北京
        if(!$this->session->has('province')){
            $this->session->set('province','北京');
            $this->cookies->set('province','北京',time()+15*86400);
        }
        $province=$this->session->get('province');
        $this->tag->appendTitle($province);
        $qcities=City::find(array(
                'conditions' => 'province=?1',
                'bind' =>array(1=>$province)));
        $allhospitals=array();
        $k=0;
        if($cityid==0){
            $city='全部地区';
            foreach ($qcities as $item1) {
                foreach ($item1->Hospital as $item2) {
                    $k++;
                    $allhospitals[$k]=$item2;
                }
            }
        }else{
            $qcity=City::findFirst(array(
                'conditions' => 'id=?1',
                'bind' => array(1=>$cityid)));
            $city=$qcity->name;
            foreach ($qcity->Hospital as $item) {
                $k++;
                $allhospitals[$k]=$item;
            }
        }
        $hospitals=array();
        for($i=10*($pagenumber-1)+1;$i<=$pagenumber*10&&$i<=$k;$i++){
            $hospitals[$i]=$allhospitals[$i];
        }
        $this->view->setVars(array(
            'province' => $province,
            'city' => $city,
            'cityid'=>$cityid,
            'provinces' => $this->session->get('allprovinces'),
            'cities' => $qcities,
            'hospitals' => $hospitals,
            'pagenumber' => $pagenumber,
            'pagecount' => (int)($k/10)));
    }
    //医院主页，获得url中hospital id；返回全部科室及医院信息
    public function hospitalAction(){
        $hospitalid=$this->request->get('hospitalid','int');
        $pagenumber=$this->request->get('pagenumber','int');
        $hospital=Hospital::findFirst(array('id='.$hospitalid));
        $this->tag->appendTitle($hospital->name);
        $alldepartments=$hospital->Department;
        $departments=array();
        foreach ($alldepartments as $key => $item) {
            $departments[$item->type][$item->name]=$item->id;
        }
        $city=$hospital->City;
        $this->view->setVars(array(
            'city' => $city,
            'hospital' => $hospital,
            'departments' => $departments));
    }
    //科室主页，从url获得department id及pagenumber；返回并分页显示医生列表，及科室信息；每次访问该action均刷新页面
    public function departmentAction(){
        $departmentid=$this->request->get('departmentid');
        $department=Department::findFirst(array(
            'conditions' => 'id=?1',
            'bind' => array(1 => $departmentid)));
        $hospital=$department->Hospital;
        $this->tag->appendTitle($hospital->name.$department->name);
        $doctors=array();$k=0;
        foreach ($department->Doctor as $item) {
            $k++;
            $doctors[$k]=$item;
        }
        $city=$hospital->City;
        $this->view->setVars(array(
            'city' => $city,
            'hospital' => $hospital,
            'department' => $department,
            'doctors' => $doctors,));
    }
    //医生主页，获得doctor id；返回available并显示在预约表格中，及相关医生信息
    public function doctorAction(){
        $doctorid=$this->request->get('doctorid','int');
        $doctor=Doctor::findFirst(array(
            'conditions' => 'id=?1',
            'bind' =>array(1 => $doctorid)));
        $department=$doctor->Department;
        $hospital=$department->Hospital;
        $this->tag->appendTitle('医生主页');
        $available=$doctor->Available;
        $this->view->setVars(array(
            'doctor' => $doctor,
            'available' => $available));
        $available=$doctor->Available;
        $date=array();
        for($col=0;$col<7;$col++){
            for($row=0;$row<4;$row++){
                $colname=date('m/d',strtotime('+'.$col.' day'));
                $date[$colname][$row]=0;
            }
        }
        foreach ($available as $item) {
            $colname=date('m/d',strtotime($item->date));
            $row=$item->when;
            if($colname<=date('m/d',strtotime('+6 day'))&&$colname>=date('m/d',strtotime('now')))
                $date[$colname][$row]=$item->id;
        }
        $this->view->setVars(array(
            'city' => $hospital->City,
            'hospital' => $hospital,
            'department' => $department,
            'doctor' => $doctor,
            'date' => $date,));
    }
    public function successAction(){
        $availableid=$this->request->get('availableid','int');
        $this->view->disable();
        $this->response->setContentType('application/Json','UTF-8');
        $available=Available::findFirst(array(
            'conditions' => 'id=?1',
            'bind' => array(1=>$availableid),
        ));
        $user=User::findFirst(array(
            'conditions' => 'id=?1',
            'bind' => array(1 => $this->session->get('userid')),
        ));
        $this->response->setJsonContent($user->toArray());
        $reservations=$user->getReservation(array(
            'a_id=:a_id:',//用conditions不知为啥会报错，说parameters not defined
            'bind' => array('a_id' => $available->id))
        );
        $count=$reservations->count();
        $return=array();
        $return['string']='不能重复预约';
        if($count!=0){
            $this->response->setJsonContent($return);
        }else{
            $return['string']='预约成功';
            $return['availableid']=$available->id;
            $this->response->setJsonContent($return);
            $reservation=new Reservation();
            $reservation->a_id=$available->id;
            $reservation->u_id=$this->session->get('userid');
            $reservation->status='待就诊';
            $reservation->borntime=date('Y-m-d H:i:s');
            $reservation->save();
        }
        $this->response->send();
        return;
    }
    //预约成功提示页面
    public function showsuccessAction(){
        $availableid=$this->request->get('availableid','int');
        $this->tag->appendTitle('预约成功');
        $available=Available::findFirst(array(
            'id=:id:',
            'bind' => array('id'=>$availableid)));
        $doctor=$available->getDoctor();
        $department=$doctor->getDepartment();
        $hospital=$department->getHospital();
        $user=User::findFirst(array(
            'conditions' => 'id=?1',
            'bind' => array(1=>$this->session->get('userid'))));
        $reservation=Reservation::findFirst(array(
            'a_id=:a_id: AND u_id=:u_id:',
            'bind' => array('a_id' => $available->id,'u_id' => $user->id)));
        $this->view->setVars(array(
            'doctor' => $doctor,
            'hospital' => $hospital,
            'department' => $department,
            'reservationid' => $reservation->id,
            'user' => $user,
            'available' => $available));
    }
    //二级联动
    public function provinceAction(){
        $this->view->disable();
        $province=$this->request->getPost('province','string');
        $this->session->set('province',$province);
        $qcity=City::find(array(
            'conditions'=>'province=?1',
            'bind' => array(1 => $province)));
        $cities=array();
        foreach ($qcity as $item) {
            $cities[$item->id]=$item->name;
        }
        $this->response->setContentType('application/Json','UTF-8');
        $this->response->setJsonContent(array('cities' => $cities));
        $this->response->send();
    }
}