<?php

class Model_Customer extends Model_Core_Table
{
	protected $address = null;
	function __construct()
	{
		 $this->setResourceClass('Model_Customer_Resource');
	}

	public function getStatus()
	{
		if($this->status)
		{
			return $this->status; 
		}
		return Model_Customer_Resource::STATUS_DEFAULT;
	}

	public function getStatusText()
	{
		$statuses = $this->getResource()->getStatusOptions();
		if (array_key_exists($this->status, $statuses))
		{
			return $statuses[$this->status];
		}
			return $statuses[ Model_Customer_Resource::STATUS_DEFAULT];
	}

	public function getBillingAddress()
	{
		$request = Ccc::getModel('Core_Request');
		$modelAddress = Ccc::getModel('CustomerAddress');
		$id = $request->getParam('customer_id');
		if ($id) {
			
		$query = "SELECT * FROM `customer` WHERE `customer_id` = '$id'";
		$customer = $this->fetchRow($query);

		$query = "SELECT * FROM `customer_address` WHERE `address_id` ={$customer->billing_address_id}";
		$address = $modelAddress->fetchRow($query);

		}
		return $modelAddress;
	}

	public function getShippingAddress()
	{
		$request = Ccc::getModel('Core_Request');
		$modelAddress = Ccc::getModel('CustomerAddress');
		$id = $request->getParam('customer_id');
		if ($id) {
			
		$query = "SELECT * FROM `customer` WHERE `customer_id` = '$id'";
		$customer = $this->fetchRow($query);

		$query = "SELECT * FROM `customer_address` WHERE `address_id` ={$customer->shipping_address_id}";
		$address = $modelAddress->fetchRow($query);

	}
	return $modelAddress;
}
	
}
?>