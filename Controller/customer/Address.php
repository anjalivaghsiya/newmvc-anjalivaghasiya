<?php

class Controller_Customer_Address extends Controller_Core_Action
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
	public function setAddressRow($addressRow)
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
			$addressRow = new Model_CustomerAddress_Row();
			$this->setAddressRow($addressRow);
			return $addressRow;
	}
	
	
	public function gridAction()
	{
			$layout = $this->getLayout();
			$grid = new Block_Customer_Address_Grid();

			$layout->getChild('content')->addChild('grid', $grid);
			$layout->render();
			
	}
	// public function editAction()
	// {
	// 	try {
			
	// 	}
	// 	$this->setAddress($address);
	// 	$this->getTemplete('Customer_address/edit.phtml');
	// 	} catch (Exception $e) {
	// 		$message = new Model_Core_Message();
	// 		$message->addMessages("Address not found",Model_Core_Message::FAILURE);
	// 		$this->redirect("index.php?a=grid&c=customer_address");
	// 	}
	// }
	public function updateAction()
	{
		try {
			$address = Ccc::getModel('CustomerAddress_Row');
			
		$request = $this->getRequest();
		if (!$request) {
			throw new Exception("Invalid Request...", 1);
		}
		$address= $request->getPost('customerAdd');
		if (!$address) {
			throw new Exception("Data Not post..", 1);
		}
		$condition['customer_id'] = $address['customer_id'];
		$address->update($address,$condition);
		$message = new Model_Core_Message();
		$message->addMessages("Address Updated Successfully...",Model_Core_Message::SUCCESS);
		$this->redirect("index.php?a=grid&c=customer_address");
		} catch (Exception $e) {
			$message = new Model_Core_Message();
			$message->addMessages("Address not Updated",Model_Core_Message::FAILURE);
			$this->redirect("index.php?a=grid&c=customer_address");
		}
	}

	public function deleteAction()
	{
		echo "<pre>";
		try {
			
		$request = $this->getRequest();
		if (!$request->isGet()) {
			throw new Exception("Invalid request", 1);
		}
		// $id = $request->getPost('');
		$customerid = $request->getParam('customer_id');
		$customerAddress = Ccc::getModel('CustomerAddress');
		$customerAddress->load($customerid);
		print_r($customerAddress);
		$customerAddress->delete();
		$this->getMessage()->addMessages("Address delete successfully..", Model_Core_Message::SUCCESS);
		// $this->redirect(null, 'grid',['customer_id'=>$customerid]);

		} catch (Exception $e) {
		$this->getMessage->addMessages("Address not delete .", Model_Core_Message::FAILURE);
			
		}
	}
	
}
?>