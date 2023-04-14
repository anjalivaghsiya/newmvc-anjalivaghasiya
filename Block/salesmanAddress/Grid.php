<?php

/**
 * 
 */
class Block_SalesmanAddress_Grid extends Block_Core_Templete
{
	 function __construct()
	{
		parent::__construct();
		$this->setTemplete('salesman_address/grid.phtml');
	}

	public function getAddress()
	{
		$row = Ccc::getModel('SalesmanAddress');
		$request = $this->getRequest();
			
			if (!$request->isGet()) {
				throw new Exception("Invalid request", 1);
			}
			$id = $request->getParam('salesman_id');

		$address=$row->load($id,'salesman_id');
		// print_r($address);
		return $address;
	}
}