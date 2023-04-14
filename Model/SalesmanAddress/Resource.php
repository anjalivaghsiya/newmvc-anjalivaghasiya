<?php

class Model_SalesmanAddress_Resource extends Model_Core_Table_Resource	
{
	
	function __construct()
	{
		$this->setTableName('salesman_address');
		$this->setPrimaryKey('address_id');
	}
}