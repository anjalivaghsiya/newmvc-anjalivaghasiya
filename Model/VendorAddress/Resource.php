<?php

class Model_VendorAddress_Resource extends Model_Core_Table_Resource	
{
	
	function __construct()
	{
		$this->setTableName('vendor_address');
		$this->setPrimaryKey('address_id');
	}
}