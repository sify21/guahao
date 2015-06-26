<?php
/**
 * Created by PhpStorm.
 * User: Koatt
 * Date: 2014/12/16
 * Time: 16:32
 */

class EvaluationController extends ControllerBase {
    public function initialize(){
        $this->tag->setTitle('评价系统');
        parent::initialize();
        $this->view->setTemplateAfter('index');
    }
    public function hosevaAction(){
    }
    public function departevaAction(){
    }
    public function doctorevaAction(){
    }
}