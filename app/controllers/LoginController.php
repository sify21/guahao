<?php
class LoginController extends ControllerBase{
	public function initialize(){
        $this->view->setTemplateAfter('index');
		$this->tag->appendTitle('用户注册');
		parent::initialize();
	}
	//传递name，password，code；
	//session:存储userid,username
	public function loginAction(){
		$name=$this->request->get('name','string');
		$password=$this->request->get('password','string');
		$this->view->disable();
		$this->response->setContentType('text/plain','UTF-8');
		$code=$this->request->get('code','string');
		if($name==null||$password==null||$code==null){
			$this->response->setContent('数据不完整');
			$this->response->send();
			return;
		}
		$user=User::findFirst(array(
			'conditions' => "name=?1",
			'bind' =>array(1=>$name)));
			//用find方法没的到数据时并不是null，而是一个集合；findfirst没找到数据是返回null
		if($user==null){
			$this->response->setContent('用户不存在');
			$this->response->send();return;
		}else{
			if($user->verify_status==0){
				$this->response->setContent('对不起，您的注册尚未审核完成');
				$this->response->send();return;
			}else if($user->verify_status==-1){
				$this->response->setContent('对不起，您的注册申请未通过审核');
				$this->response->send();return;
			}else if($user->verify_status==1){
				if($password!=$user->pwd){
					$this->response->setContent('密码错误');
					$this->response->send();
					return;
				}else{
					if($code!=$this->session->get('code')){
						$this->response->setContent('验证码错误');
						$this->response->send();return;
					}else{
						$this->session->set('userid',$user->id);
						$this->session->set('username',$user->name);
						/*$this->response->redirect('index/index');return;
						redirct不能在最前面（controller前）带/，那样是绝对路径，应当写作相对路径;用异步请求无法在后台进行页面跳转，因为异步不是浏览器的请求，是把结果返回到那个函数了*/
						$this->response->setContent('成功');
						$this->response->send();return;
					}
				}
			}
		}
	}
	public function registermainAction(){
	}
	public function registerAction(){
		$this->view->disable();
		$name=$this->request->get('name','string');
		$pwd=$this->request->get('password','string');
		$idcard=$this->request->get('idcard','string');
		$truename=$this->request->get('truename','string');
		$phone=$this->request->get('phone','string');
		$email=$this->request->get('email','email');
		$code=$this->request->get('code','string');
		$this->response->setContentType('text/plain','UTF-8');
		if($name==null||$pwd==null||$idcard==null||$truename==null||$phone==null||$email==null){
			$this->response->setContent('数据不完整或格式错误');
			$this->response->send();return;
		}else{
			$find=User::findFirst(array(
				'name=:name:',
				'bind' => array('name'=>$name)));
			if($find!=null){
				$this->response->setContent('用户名已存在');
				$this->response->send();
				return;
			}else{
				$find=User::findFirst(array("idcard='".$idcard."'"));
				if($find!=null){
					$this->response->setContent('该用户身份已注册');
					$this->response->send();return;
				}else if($code!=$this->session->get('code')){
					$this->response->setContent('验证码错误');
					$this->response->send();return;
				}else{
					$user=new User();
					$user->name=$name;
					$user->pwd=$pwd;
					$user->idcard=$idcard;
					$user->truename=$truename;
					$user->phone=$phone;
					$user->email=$email;
					$user->level=10;
					$user->verify_status=0;
					$user->img='/img/user/default.png';
					$user->save();
					$this->response->setContent('成功');
					$this->response->send();
					return;
				}
			}
		}
	}
	//用户点击登陆后，后台提供验证码；用户填好用户名、密码、验证码后后台核实信息，刷新页面，将userid存入cookie（userx及userhx只允许一次性登陆，cookie中不存入任何数据）
	//用gd库生成验证码，优化时考虑用另一台专门的服务器传送图片数据
	public function codeAction(){
		$this->view->disable();
		$vcode=new ValidateCode();
		$vcode->doimg();
		$this->session->set('code',$vcode->getCode());
	}
	public function rsuccessAction(){

	}
	public function exitAction(){
		if($this->session->has('username'))$this->session->remove('username');
		if($this->session->has('userid'))$this->session->remove('userid');
		$this->response->redirect('index/index');
		return;
	}
}