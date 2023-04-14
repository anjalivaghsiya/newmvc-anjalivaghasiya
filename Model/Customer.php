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


	public function getShippingAddress()
	{

		$address = Ccc::getModel('CustomerAddress');
		

	}

	public function getBillingAddress()
	{
		
	}

	
}
?>