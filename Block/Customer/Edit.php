<?php

/**
 *
 */
class Block_Customer_Edit extends Block_Core_Templete
{
	
	function __construct()
	{
		parent::__construct();
		$this->setTemplete('customer/edit.phtml');
	}

}