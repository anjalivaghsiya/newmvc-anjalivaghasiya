<?php

/**
 *
 */
class Block_Payment_Grid extends Block_Core_Grid
{
	protected $columns = [];
	protected $actions = [];
	
	function __construct()
	{
		parent::__construct();
		$this->setTemplete('payment/grid.phtml');
		// $this->prepareColumns();
		// $this->prepareActions();
	}	

	public function setColumns(array $columns)
	{
		$this->columns = $columns;
		return $this;
	}

	public function getColumns()
	{
		return $this->columns;
	}

	public function addColumn($key, $value)
	{
		$this->columns[$key] = $value;
	}

	public function removeColumn($key)
	{
		unset($this->columns[$key]);
		return $this;
	}


	public function getColumn($key)
	{
		if (array_key_exists($key, $this->columns)) {
			return $this->columns[$key];
		}
	}

	public function prepareColumns()
	{
		$this->addcolumn('payment_id',[
			'title'=>'Payment_Id'
		]);

		$this->addcolumn('name',[
			'title'=>'Name'
		]);

		$this->addcolumn('status',[
			'title'=>'Status'
		]);

		$this->addcolumn('create_at',[
			'title'=>'Create_At'
		]);
	}


	public function setActions(array $actions)
	{
		$this->actions = $actions;
		return $this;
	}

	public function getActions()
	{
		return $this->actions;
	}

	public function addAction($key, $value)
	{
		$this->actions[$key] = $value;
	}

	public function removeColumn($key)
	{
		unset($this->actions[$key]);
		return $this;
	}


	public function getColumn($key)
	{
		if (array_key_exists($key, $this->actions)) {
			return $this->actions[$key];
		}
	}

	public function prepareActions()
	{
		$this->addcolumn('edit',[
			'title'=>'Edit'
		]);

		$this->addcolumn('delete',[
			'title'=>'Delete'
		]);

	}

	public function getCollection()
	{
		try {

		$query = "SELECT * FROM `payment`";
		$payments = Ccc::getModel("Payment")->fetchAll($query);

		return $payments;
		} catch (Exception $e) {
			$message = new Model_Core_Message();
			$message->addMessages("Data not found",Model_Core_Message::FAILURE);
			$this->redirect("index.php?a=grid&c=payment");
		}
	}
}