<?php

/**
 * 
 */
class Model_Vendor_Resource extends Model_Core_Table_Resource
{
	public function __construct()
	{
		$this->setTableName('vendor');
		$this->setPrimaryKey('vendor_id');
	}
	const STATUS_ACTIVE = 1;
	const STATUS_ACTIVE_LBL ='Active';
	const STATUS_INACTIVE = 2;
	const STATUS_INACTIVE_LBL ='Inactive';
	const STATUS_DEFAULT =2;
	
	
public function getStatusOptions()
	{
		return[
				self::STATUS_ACTIVE=>self::STATUS_ACTIVE_LBL,
				self::STATUS_INACTIVE=>self::STATUS_INACTIVE_LBL,
		];
	}
	
}