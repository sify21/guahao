<?php
//cookie是键值对，从前台往后台自动发送，发送的是整个cookie，前台只能控制禁用完全不发，不能控制发送哪部分，所有部分都发，我后台就用就行了
class IndexController extends ControllerBase{
	public function initialize(){
		$this->tag->setTitle('全国统一预约挂号平台');
		parent::initialize();
        $this->assets->addCss('css/slider.css');
        $this->assets->addJs('js/power-slider.js');
	}
	public function indexAction(){
		//若session中没有省列表则调用函数
		if(!$this->session->has('allprovinces')) $this->getAllProvinces();
		//若cookie中存有数据则执行下面的代码段
		if($this->cookies->has('province')){
			$province=$this->cookies->get('province')->getValue();
			//返回的城市列表
			$qcity=City::find(array(
					'conditions' => 'province=?1',
					'bind' => array(1=>$province),
					//'columns' => 'id,name' 如果要利用orm model间关系，必须取出完整对象，不能映射到某几列
					));
			$cities=array();
			foreach ($qcity as $item){
				$cities[$item->id]=$item->name;
			}
			//返回的医院列表
			if($this->cookies->has('cityid')){
				$cityid=$this->cookies->get('cityid')->getValue();
				$qcity=City::findFirst(array(
					'conditions' => 'id=?1',
					'bind' => array(1=>$cityid),
					//'columns' => 'id,name'
					));
			}
			$hospitals=array();
			foreach ($qcity as $item1) {
				foreach ($item1->Hospital as $item2) {
					$hospitals[$item2->id]=$item2->name;
				}
			}
			$this->zhSort($cities);$this->zhSort($hospitals);
		}
		$this->view->setVars(array(
			'provinces' => $this->session->get('allprovinces'),
			'cities' => $cities,
			'hospitals' => $hospitals,
			));
	}
	//获得全部省名称的数组，存到session里
	private function getAllProvinces(){		
		$qprovince=City::find(array(
					'columns' => 'province',
					)
		);
		$provinces=array();
		foreach ($qprovince as $key => $item) {
			$provinces[$key]=$item->province;
		}
		$provinces=array_unique($provinces);
		$this->zhSort($provinces);
		$this->session->set('allprovinces',$provinces);
	}
	//用户选择省。传递省名称；返回地区列表及医院列表
	public function provinceAction(){
		$this->view->disable();
		$province=$this->request->get('province','string');
		$this->response->setContentType('application/Json','UTF-8');
		$qcity=City::find(array(
			'conditions' => 'province=?1',
			'bind' => array(1 => $province),
			//'columns' => 'id,name',要用model之间的关系必须得到全的model，不能映射到几列
			'order' => 'name'));
		$cities=array();
		foreach ($qcity as $item) {
			$cities[$item->id]=$item->name;
		}
		$hospitals=array();
		foreach ($qcity as $item1) {
			foreach ($item1->Hospital as $item2) {
				$hospitals[$item2->id]=$item2->name;
			}
		}
		$this->zhSort($cities);$this->zhSort($hospitals);
		$this->response->setJsonContent(array('city' => $cities, 'hospital' => $hospitals));
		$this->session->set('province',$province);
		$this->response->send();
	}
	//用户选择地区。传递地区id（不限为0）；返回医院列表
	public function cityAction(){
		$this->view->disable();
		$cityid=(int)$this->request->get('cityid','string');
		$this->response->setContentType('application/Json','UTF-8');
		$hospitals=array();
		if($cityid==0){
			$qcity=City::find(array(
				'conditions' => "province=?1",
				'bind' => array(1 => $this->session->get('province'))));
			foreach ($qcity as $item1) {
				foreach ($item1->Hospital as $item2) {
					$hospitals[$item2->id]=$item2->name;
				}
		}
		}else{
			$qcity=City::findFirst(array(
			'conditions' => 'id=?1',
			'bind' => array(1 => $cityid)));
			foreach ($qcity->Hospital as $item) {
				$hospitals[$item->id]=$item->name;
			}
		}
		$this->zhSort($hospitals);
		$this->response->setJsonContent(array('hospital' => $hospitals));
		$this->response->send();
	}
	//用户选择医院。传递医院id；返回科室列表
	public function hospitalAction(){
		$this->view->disable();
		$hospitalid=$this->request->get('hospitalid','int');
		$this->response->setContentType('application/Json','UTF-8');
		$hospital=Hospital::findFirst(array(
			'conditions' => 'id=?1',
			'bind' => array(1=>$hospitalid)));
		$departments=array();
		foreach ($hospital->Department as $item) {
			$departments[$item->id]=$item->name;
		}
		$this->zhSort($departments);
		$this->response->setJsonContent(array('department' => $departments));
		$this->response->send();
	}
	//用户选择预约按钮。传递地区id（不限为0），医院id，科室id（没选为-1）；跳转到不同预约页面
	//cookie：存储用户地区选择，只选省只存储province，删除cityid；选了市存储province和cityid
	public function reserveAction(){
		$cityid=$this->request->get('cityid','string');
		$hospitalid=$this->request->get('hospitalid','string');
		$departmentid=$this->request->get('departmentid','string');
		$this->cookies->set('province',$this->session->get('province'),time()+15*86400);//保存15天
		if($cityid=='-1'){
			if($this->cookies->has('cityid'))	$this->cookies->delete('cityid');
		}else{
			$this->cookies->set('cityid',$cityid,time()+15*86400);
		}
		if($hospitalid=='-1'){
			$this->response->redirect('reserve/hosreserve?cityid='.$cityid);
			return;
		}else{
			if($departmentid=='-1'){
				$this->response->redirect('reserve/hospital?hospitalid='.$hospitalid);
				return;
			}else{
				$this->response->redirect('reserve/department?departmentid='.$departmentid);
				return;
			}
		}
	}
	private function zhSort(&$array) {
  		if(!isset($array) || !is_array($array)) {
   			return false;
  		}
  		foreach($array as $k=>$v) {
   			$array[$k] = iconv('UTF-8', 'GBK//IGNORE',$v);
  		}
  		asort($array);
  		foreach($array as $k=>$v) {
   			$array[$k] = iconv('GBK', 'UTF-8//IGNORE', $v);
  		}
  		return true;
	}
}