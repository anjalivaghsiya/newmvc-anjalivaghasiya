<?php
class Controller_Customer extends Controller_Core_Action
{
	protected $customer = null;
	protected $customerid = null;
	protected $customerRow = null;
	protected $addressRow = null;

	public function testAction()
	{
		echo "<pre>";
		$modelCustomer = Ccc::getModel('Customer');
		$address = $modelCustomer->getShippingAddress();
		print_r($address);
	}
	
	public function setCustomer($customer)
	{
		$this->customer = $customer;
		return $this;
	}
	public function getCustomer()
	{
		return $this->customer;
	}
	public function setCustomerid($customerid)
	{
		$this->customerid = $customerid;
		return $this;
	}
	public function getCustomerid()
	{
		return $this->customerid;
	}
	public function setCustomerRow($customerRow)
	{
		$this->customerRow = $customerRow;
		return $this;
	}
	public function getCustomerRow()
	{
		if ($this->customerRow!=null)
		{
			return $this->customerRow;
		}
		$customerRow=new Model_Customer_Row();
		$this->setCustomerRow($customerRow);
		return $customerRow;
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
			$addressRow = new Model_Customer_Address_Row();
			$this->setAddressRow($addressRow);
			return $addressRow;
	}
	public function gridAction()
	{
		try {

			$layout = $this->getLayout();
			$grid = new Block_Customer_Grid();
			$Address = Ccc::getModel('Customer');
			$Address->getShippingAddress();

			$layout->getChild('content')->addChild('grid', $grid);
			$customers = $grid->getCollection();
			$layout->render();
			} catch (Exception $e) {
			$message = new Model_Core_Message();
			$message->addMessages("Data not Posted", Model_Core_Message::FAILURE);
			$this->redirect( null,'grid', null, true);
			}
	}
	public function addAction()
	{
		$layout = $this->getLayout();
				$customer = Ccc::getModel('Customer');
				$address = Ccc::getModel('CustomerAddress');
				$add = $layout->createBlock('Customer_Edit')->setData(['customer'=>$customer,'address'=>$address]);

				 $layout->getChild('content')->addChild('add', $add);

				$layout->render();

	}
	
	public function editAction()
	{
		try {
		$request = $this->getRequest();
		$row = Ccc::getModel('CustomerAddress');
			$id=$request->getParam('customer_id');
			if(!$id)
			{
				throw new Exception("invalid Request", 1);
			}
			$query = "SELECT * FROM `customer_address` WHERE `customer_id` = '$id'";
			$address = $row->fetchRow($query);
			$modelcustomer = Ccc::getModel('Customer');
			$query = "SELECT * FROM `customer` WHERE `customer_id`= '$id'";
			$customer =$modelcustomer->fetchRow($query);
			if(!$customer)
			{
				throw new Exception('invalid id', 1);
			}
			$layout = $this->getLayout();
			$edit = $layout->createBlock('Customer_Edit');
			$edit->setData(['customer' => $customer,'address'=>$address]);
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
			$modelCustomer = Ccc::getModel('Customer');
			$modelCustomerAddress = Ccc::getModel('CustomerAddress');
			if (!$request->isPost())
			{
				throw new Exception("invalid Request.", 1);
			}
			$customer = $request->getPost('customer');
			$customerAddress = $request->getPost('customerAdd');


			$id = $request->getParam('customer_id');
			
			if($id){
				$customerRow = $modelCustomer->load($id);

				if(!$customerRow)
				{
					throw new Exception("invalid id.", 1);
				}
				$customerAddress['customer_id'] = $id;
				$customer['customer_id'] = $id;
			$customer['update_at']  = date('Y-m-d h:i:sa');
				
			}
			$insertcustomer = $modelCustomer->setData($customer)->save();
			if (!$id) {
			$customerAddress['customer_id'] = $insertcustomer->customer_id;
			}


			if ($id) {
				
			$query = "SELECT * FROM `customer_address` WHERE `customer_id` = '$id'";
				$customerAddressRow = $modelCustomerAddress->fetchRow($query);
			$customerAddress['address_id'] = $customerAddressRow->address_id;


			}

			$insertcustomerAddress = $modelCustomerAddress->setData($customerAddress)->save();
			
	  	    $message = new Model_Core_Message();
	  	     $message->addMessages("Data saved Successfully..",Model_Core_Message::SUCCESS);
			$this->redirect( null,'grid', null, true);
		}
		catch (Exception $e)
		{
			$message = new Model_Core_Message();
	  	     $message->addMessages($e->getMessage(),Model_Core_Message::FAILURE);
			$this->redirect( null,'grid', null, true);
		}
	}
	public function deleteAction()
	{
	try {
	$customer = Ccc::getModel('Customer');
	$request = $this->getRequest();
	if (!$request->isGet()) {
	throw new Exception("Invalid Request", 1);
	}
	$id = $request->getParam('customer_id');
	if (!$id) {
	throw new Exception("Id Not Found", 1);
	}
	    $customer->load($id);
	    $customer->delete();
	    $message = new Model_Core_Message();
	    $message->addMessages("Row Delete Successfully..",Model_Core_Message::SUCCESS);
			$this->redirect( null,'grid', null, true);
	
	} catch (Exception $e) {
	$message = new Model_Core_Message();
	    $message->addMessages("Row Not Delete..",Model_Core_Message::FAILURE);
			$this->redirect( null,'grid', null, true);
	}
	
	}
	}
	?>