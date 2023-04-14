<?php

class Controller_Vendor_Address extends Controller_Core_Action
{
	protected $address = null;
	protected $addressRow = null;

	public function setAddress($address)
	{
		 $this->address = $address;
		 return $this;
	}

	public function getAddress()
	{
		return $this->address;
	}

	public function setAddressRow($modeladdress)
	{
		$this->modeladdress = $modeladdress;
		return $this;
	}
	public function getAddressRow()
	{
		if ($this->addressRow!=null)
		{
			return $this->addressRow;
		}
			$addressRow = new Model_VendorAddress_Row();
			$this->setAddressRow($addressRow);
			return $addressRow;
	}


	public function gridAction()
	{
		try {
		$layout = $this->getLayout();
			$grid = new Block_VendorAddress_Grid();

			$layout->getChild('content')->addChild('grid', $grid);
			$layout->render();
		} catch (Exception $e) {
			$message = new Model_Core_Message();
			$message->addMessages("Address not found",Model_Core_Message::FAILURE);
			$this->redirect("index.php?a=grid&c=vendor_address");
		}
	}
	public function editAction()
	{
		try {
			
		$request=$this->getRequest();
		if (!$request) {
			throw new Exception("Invalid Request", 1);
		}
		$id = $request->getParam('vendor_id');
		$query="SELECT * FROM `vendor_address` WHERE `vendor_id`='$id'";
		 $address=$this->getModelAddress()->fetchRow(null,$query);
		 if (!$address) {	
		 	throw new Exception("Address not posted ", 1);
		 }
		 $this->setAddress($address);
		 $this->getTemplete('vendor_address/edit.phtml');
		} catch (Exception $e) {
		 	$message = new Model_Core_Message();
	 		$message->addMessages("Address not found",Model_Core_Message::FAILURE);
	 	 	$this->redirect("index.php?a=grid&c=vendor_address");
		}

	}

	public function updateAction()
	{
		try {
			
		 $request = $this->getRequest();
		 if (!$request) {
		 	throw new Exception("Invalid Request", 1);
		 }
		 $address = $request->getPost('vendorAdd');
		 $condition['vendor_id'] = $address['vendor_id'];
		 if (!$address) {
		 	throw new Exception("Address not found", 1);
		 }
		 $this->getModelAddress()->update($address,$condition);
		 $message = new Model_Core_Message();
	 	 $message->addMessages("Address Update Successfully..",Model_Core_Message::SUCCESS);
	 	 $this->redirect("index.php?a=grid&c=vendor_address");
		} catch (Exception $e) {
			$message = new Model_Core_Message();
	 		$message->addMessages("Address not Updates",Model_Core_Message::FAILURE);
	 	 	$this->redirect("index.php?a=grid&c=vendor_address");
		}
	}
	 
}
?>