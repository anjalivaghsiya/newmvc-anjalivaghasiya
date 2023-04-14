<?php

/**
 * 
 */
class Block_VendorAddress_Grid extends Block_Core_Templete
{
	 function __construct()
	{
		parent::__construct();
		$this->setTemplete('vendor_address/grid.phtml');
	}

	public function getAddress()
	{
		$row = Ccc::getModel('VendorAddress');
		$request = $this->getRequest();
			
			if (!$request->isGet()) {
				throw new Exception("Invalid request", 1);
			}
			$id = $request->getParam('vendor_id');

		$address=$row->load($id,'vendor_id');
		return $address;
	}
}