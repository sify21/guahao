<?php
class ImportController extends Phalcon\Mvc\Controller{
	public function excelAction($path){
		//phalcon向数据库导入的时候有点小问题，有default值的列需要赋值，不然这列的default值不会写入数据库
		include '../app/classes/PHPExcel.php';
		$this->view->disable();
        $obj=new PHPExcel();
        $name='/home/sify/'.$path;
        $type= PHPExcel_IOFactory::identify($name);
        $reader=PHPExcel_IOFactory::createReader($type);
        $obj=$reader->load($name);
        //导入hospital子表
        $sheet=$obj->getSheetByName('hospital');
        for($j=2;$j<=$sheet->getHighestRow();$j++){
        	$hospital=new Hospital();
        	$hospital->id=$sheet->getCell('A'.$j)->getValue();
        	$hospital->name=(string)$sheet->getCell('B'.$j)->getValue();
        	$hospital->intro=(string)$sheet->getCell('C'.$j)->getValue();
        	$hospital->cityid=$sheet->getCell('D'.$j)->getValue();
        	$hospital->street=(string)$sheet->getCell('E'.$j)->getValue();
        	$hospital->tele=(string)$sheet->getCell('F'.$j)->getValue();
        	$hospital->level=(string)$sheet->getCell('G'.$j)->getValue();
        	$hospital->notice=(string)$sheet->getCell('H'.$j)->getValue();
        	$hospital->img='/img/hospital/default.img';
        	$hospital->save();
        }
        //导入department子表
        $sheet=$obj->getSheetByName('department');
        for($j=2;$j<=$sheet->getHighestRow();$j++){
        	$department=new Department();
        	$department->id=$sheet->getCell('A'.$j)->getValue();
        	$department->h_id=$sheet->getCell('B'.$j)->getValue();
        	$department->type=(string)$sheet->getCell('C'.$j)->getValue();
        	$department->intro=(string)$sheet->getCell('D'.$j)->getValue();
        	$department->name=(string)$sheet->getCell('E'.$j)->getValue();
        	$department->dcount=0;
        	$department->save();
        }
        //导入doctor子表
        $sheet=$obj->getSheetByName('doctor');
        for($j=2;$j<=$sheet->getHighestRow();$j++){
            $doctor=new Doctor();
            $doctor->id=$sheet->getCell('A'.$j)->getValue();
            $doctor->name=(string)$sheet->getCell('B'.$j)->getValue();
            $doctor->de_id=$sheet->getCell('C'.$j)->getValue();
            $doctor->post=(string)$sheet->getCell('D'.$j)->getValue();
            $doctor->intro=(string)$sheet->getCell('E'.$j)->getValue();
            $doctor->specialty=(string)$sheet->getCell('F'.$j)->getValue();
            $doctor->fee=$sheet->getCell('G'.$j)->getValue();
            $doctor->img='/img/doctor/default.img';
            $doctor->save();
        }
        //导入available子表
        $sheet=$obj->getSheetByName('available');
        for($j=2;$j<=$sheet->getHighestRow();$j++){
        	$available=new Available();
        	$available->id=$sheet->getCell('A'.$j)->getValue();
        	$available->do_id=$sheet->getCell('B'.$j)->getValue();
        	$available->date= $sheet->getCell('C'.$j)->getFormattedValue();
        	$available->time=$sheet->getCell('D'.$j)->getValue();
        	$available->save();
        }
        echo '数据导入成功！';
	}
}