<?php
/**
 * Created by PhpStorm.
 * User: Koatt
 * Date: 2014/12/16
 * Time: 16:34
 */

class HomeController extends ControllerBase {
    public function initialize(){
        $this->tag->setTitle('个人中心');
        parent::initialize();
        $this->view->setTemplateAfter('index');
    }
    public function myhomeAction(){
    	if(!$this->session->has('userid')){
    		$this->response->redirect('index/index');
    	}else{
    		$userid=$this->session->get('userid');
    		$user=User::findFirst(array(
                //这里写find下边getReservation出错，关系不能用于resultset
    			'id=:id:',
    			'bind' => array('id'=>$userid)));
    		$reservations=array();
    		$availables=array();
    		$doctors=array();
            $departments=array();
    		$hospitals=array();
            $a=Hospital::find();
            $res=$user->getReservation(array('order' => 'borntime'));
            $all=array();
            if($res->count()!=0){
                $k=0;
                foreach ($res as $item) {
                    $k++;
                    $reservations[$k]=$item;
                    $availables[$k]=$item->getAvailable();
                    $doctors[$k]=$availables[$k]->getDoctor();
                    $departments[$k]=$doctors[$k]->getDepartment();
                    $hospitals[$k]=$departments[$k]->getHospital();
                    //用get才是只返回一个对象，直接model名返回resultset
                }
            }
            for($i=1;$i<=$k;$i++){
                $all[$i]['reservationdate']=$availables[$i]->date;
                $all[$i]['doctorid']=$doctors[$i]->id;
                $all[$i]['doctorname']=$doctors[$i]->name;
                $all[$i]['departmentname']=$departments[$i]->name;
                $all[$i]['hospitalsname']=$hospitals[$i]->name;
                $all[$i]['doctorfee']=$doctors[$i]->fee;
                $all[$i]['reservationstatus']=$reservations[$i]->status;
                $all[$i]['reservationid']=$reservations[$i]->id;
                $all[$i]['availableid']=$availables[$i]->id;
            }
    		$this->view->setVars(array(
    			'user' => $user,
    			'all' => $all));
    	}
    }
    //取消预约单
    public function deleteAction(){
    	$this->view->disable();
    	$this->response->setContentType('text/plain','UTF-8');
    	$Reservationid=$this->request->get('reservationid','string');
    	$reservation=Reservation::findFirst(array(
    		'coditions' => 'id=?1',
    		'bind' => array(1=>$reservationid) ));
    	if($reservation!=null){
    		$available=$reservation->Available;
    		if($available->date==date('Y-m-d',strtotime('now'))){
    			$this->response->setContent('对不起，该预约单已经超过可取消日期');
    			$this->response->send();return;
    		}else if($reservation->delete()==false){
    			$this->response->setContent('对不起，现在无法取消预约单');
    			$this->response->send();return;
    		}else{
    			$this->response->setContent('预约单取消成功');
    			$this->response->send();return;
    		}
    	}
    }
    public function changepasswordAction(){
        $this->view->disable();
        $this->response->setContentType('text/plain','UTF-8');
        $id=$this->request->get('id','string');
        $old=$this->request->get('old','string');
        $new=$this->request->get('new','string');
        $user=User::findFirst(array(
            'conditions' => 'id=?1',
            'bind' => array(1=>$id)));
        if($old!=$user->id){
            $this->response->setContent('原密码不相符');
            $this->response->send();
            return;
        }else{
            $user->id=$new;
            $user->save();
            $this->response->setContent('修改成功');
            $this->response->send();
            return;
        }
    }
}