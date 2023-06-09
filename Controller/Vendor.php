<?php

class Controller_Vendor extends Controller_Core_Action
{
	protected $vendor=null;
	protected $vendorid=null;
	protected $modelvendor=null;
	protected $modeladdress=null;

	
	public function setVendor($vendor)
	{
		$this->vendor=$vendor;
		return $this;
	}
	public function getVendor()
	{
		return $this->vendor;
	}
	public function setVendorid($vendorid)
	{
		$this->vendorid = $vendorid;
		return $this;
	}
	public function getVendorid()
	{
		return $this->vendorid;
	}
	public function setModelVendor($modelvendor)
	{
		$this->modelvendor = $modelvendor;
		return $this;
	}
	public function getModelVendor()
	{
		if ($this->modelvendor!=null)
		{
			return $this->modelvendor;
		}
		$modelvendor=new Model_Vendor();
		$this->setModelVendor($modelvendor);
		return $modelvendor;
	}
	public function setModelAddress($modeladdress)
	{
		$this->modeladdress = $modeladdress;
		return $this;
	}
	public function getModelAddress()
	{
		if ($this->modeladdress!=null)
		{
			return $this->modeladdress;
		}
		$modeladdress = new Model_Vendor_Address();
		print_r($modeladdress);
		$this->setModelAddress($modeladdress);
		return $this->modeladdress;
	}

	public function gridAction()
	{
		try {
			$layout = $this->getLayout();
			$grid = new Block_Vendor_Grid();
			$layout->getChild('content')->addChild('grid',$grid);
			$layout->render();
		} catch (Exception $e) {
			$message = new Model_Core_Message();
			$message->addMessages("Data Not Found",Model_Core_Message::FAILURE);
			$this->redirect( null,'grid', null, true);
		}
	}
	public function addAction()
	{
		try {
				$layout = $this->getLayout();
				$vendor = Ccc::getModel('Vendor');
				$address = Ccc::getModel('vendorAddress');
				$add = $layout->createBlock('Vendor_Edit')->setData(['vendor'=>$vendor,'address'=>$address]);

				 $layout->getChild('content')->addChild('add', $add);
				 $layout->render();

		} catch (Exception $e) {
			$message = new Model_Core_Message();
			$message->addMessages("Data Not Found",Model_Core_Message::FAILURE);
				$this->redirect( null,'grid', null, true);
		}

	}
	
		
	public function editAction()
	{
		try{
		$request = $this->getRequest();
		$row = Ccc::getModel('VendorAddress');
			$id=$request->getParam('vendor_id');
			if(!$id)
			{
				throw new Exception("invalid Request", 1);
			}
			$query = "SELECT * FROM `vendor_address` WHERE `vendor_id` = '$id'";
			$address = $row->fetchRow($query);
			$modelVendor = Ccc::getModel('Vendor');
			$query = "SELECT * FROM `vendor` WHERE `vendor_id`= '$id'";
			$vendor =$modelVendor->fetchRow($query);
			if(!$vendor)
			{
				throw new Exception('invalid id', 1);
			}
			$layout = $this->getLayout();
			$edit = $layout->createBlock('Vendor_Edit');
			$edit->setData(['vendor' => $vendor,'address'=>$address]);
			$layout->getChild('content')->addChild('edit',$edit);
			$layout->render();

		} catch (Exception $e) {
		$message = new Model_Core_Message();
		$message->addMessages("Data not found", Model_Core_Message::FAILURE);
			$this->redirect( null,'grid', null, true);
		}
	}

	public function saveAction()
	{
		try 
		{
			$request=$this->getRequest();
			$modelVendor = Ccc::getModel('Vendor');
			$modelVendorAddress = Ccc::getModel('VendorAddress');
			if (!$request->isPost())
			{
				throw new Exception("invalid Request.", 1);
			}
			$vendor = $request->getPost('vendor');
			$vendorAddress = $request->getPost('vendorAdd');


			$id = $request->getParam('vendor_id');
			
			if($id){
				$vendorRow = $modelVendor->load($id);

				if(!$vendorRow)
				{
					throw new Exception("invalid id.", 1);
				}
				$vendorAddress['vendor_id'] = $id;
				$vendor['vendor_id'] = $id;
			$vendor['update_at']  = date('Y-m-d h:i:sa');
				
			}
			$insertVendor = $modelVendor->setData($vendor)->save();
			if (!$id) {
			$vendorAddress['vendor_id'] = $insertVendor->vendor_id;
			}


			if ($id) {
				
			$query = "SELECT * FROM `vendor_address` WHERE `vendor_id` = '$id'";
				$vendorAddressRow = $modelVendorAddress->fetchRow($query);
			$vendorAddress['address_id'] = $vendorAddressRow->address_id;


			}

			$insertVendorAddress = $modelVendorAddress->setData($vendorAddress)->save();
			
	  	    $message = new Model_Core_Message();
	  	     $message->addMessages("Data saved Successfully..",Model_Core_Message::SUCCESS);
	 		// $this->redirect("index.php?a=grid&c=vendor");
		}
		catch (Exception $e)
		{
			$message = new Model_Core_Message();
	  	     $message->addMessages($e->getMessage(),Model_Core_Message::FAILURE);
	 		// $this->redirect("index.php?a=grid&c=vendor");
		}
	}
	
	public function deleteAction()
	{
		try {
			$vendorRow = Ccc::getModel('Vendor');
		$request = $this->getRequest();
		if (!$request) {
			throw new Exception("Invalid Request", 1);
		}
		$id = $request->getParam('vendor_id');
		if (!$id) {
			throw new Exception("Invalid Id", 1);
		}
		$vendorRow->load($id);
		$vendorRow->delete();
		$message = new Model_Core_Message();
		$message->addMessages("Row Delete Successfully..",Model_Core_Message::SUCCESS);
			$this->redirect( null,'grid', null, true);
		} catch (Exception $e) {
		$message = new Model_Core_Message();
		$message->addMessages("Data Not Deletes ..",Model_Core_Message::FAILURE);
			$this->redirect( null,'grid', null, true);
		}
	}
	
}
?>