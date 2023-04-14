<?php
/**
*
*/
class Controller_Eav_Attribute extends Controller_Core_Action
{
	public function gridAction()
	{
		$layout = $this->getLayout();
		$grid = new Block_Eav_Attribute_Grid();
		$layout->getChild('content')->addChild('grid', $grid);
		$attributes = $grid->getAttribute();
		$layout->render();
	}
		public function addAction()
	{
		$message = Ccc::getModel('Core_Message');
		
	try{
		$attribute = Ccc::getModel('Eav_Attribute');
		if(!$attribute){
				throw new Exception("Invalid Id.", 1);
			}
			$layout = $this->getLayout();
			$edit = $layout->createBlock('Eav_Attribute_Edit');
			$edit->setData(['attribute'=>$attribute]);
			$layout->getChild('content')
				->addChild('edit',$edit);
			$layout->render();
		}
	catch (Exception $e) {
			$message->addMessages('Attribute not Saved',Model_Core_Message::FAILURE);
				$this->redirect("index.php?a=grid&c=eav_attribute");
		
	}
	}
	public function editAction()
	{
		try {
		$request = $this->getRequest();
			$id =(int) $request->getParam('attribute_id');
			if (!$id)
			{
				throw new Exception("invalid id.", 1);
				
			}
			$modelEavAttribute = Ccc::getModel('Eav_Attribute');
			$attribute = $modelEavAttribute->load($id);
			if(!$attribute)
			{
				throw new Exception("data not found.", 1);
			}
			$layout = $this->getLayout();
			$grid = $layout->createBlock('Eav_Attribute_Edit');
			$grid->setData(['attribute'=>$attribute]);
			$layout->getChild('content')->addChild('grid',$grid);
			$layout->render();
			
		} catch (Exception $e) {
			$message = new Model_Core_Message();
			$message->addMessages("Data not found",Model_Core_Message::SUCCESS);
			$this->redirect( null,'grid', null, true);
		}
	}
	public function saveAction()
		{
			try {
			echo "<pre>";	
			$request = $this->getRequest();
			if (!$request->isPost())
			{
				throw new Exception("invalid Request.", 1);
			}
			$postData = $request->getPost('attribute');
			// print_r($postData);
			if(!$postData)
			{
				throw new Exception("no data posted.", 1);
			}
			$modelEavAttribute = Ccc::getModel('Eav_Attribute');
			$modelEavAttributeOption = Ccc::getModel('Eav_Attribute_Option');
			$options = $request->getPost('option');
			// print_r($options);
			if($id = $request->getParam('attribute_id'))
			{
				$attribute = $modelEavAttribute->load($id);
				$postData['attribute_id'] = $attribute->attribute_id;
				$savetAtribute = $modelEavAttribute->setData($postData)->save();
			// print_r($savetAtribute);
				// echo "12121212";
				// if(!$savetAtribute)
				// {
				// 	throw new Exception("Attribute not saved", 1);
				// }
				echo "<br>";
				$query  = "SELECT * FROM `eav_attribute_option` WHERE `attribute_id` = '$id' ";
				$existOptions = $modelEavAttributeOption->fetchAll($query);
				$existOption = $existOptions->getData();
				if($existOption)
				{
					foreach ($existOption as $option)
					{

						$existOption[$option->option_id] =  $option->name;
						if(isset($options['old']))
						{
						// print_r($options);

							foreach ($options['old'] as $key => $value)
							{
								echo "<br>";
							// print_r($value);
								if($option->option_id == $key  && $option->name != $value)
								{
									$updateData['option_id'] = $key;
									$updateData['name'] = $value;
									$update = $modelEavAttributeOption->setData($updateData)->save();
									if(!$update)
									{
										throw new Exception("Attribute option not saved.", 1);
									}
								}
							}
						}
					}
					if($existOption && isset($options['old']))
					{
						$optiondelete = array_diff_key($existOption,$options['old']);
						foreach ($optiondelete as $optionid => $name)
								echo "<br>";

							{
							$delete = $modelEavAttributeOption->load($optionid)->delete();
							
							if (!$delete)
							{
								throw new Exception("option not deleted.", 1);
							}
						}
					}
					else
					{
						foreach ($existOption as $optionid => $name)
							{
							$delete = $modelEavAttributeOption->load($optionid)->delete();
							if (!$delete)
							{
								throw new Exception("Attribute option not deleted.", 1);
							}
						}
					}
				}
				$newOption['attribute_id'] = $id;
			}
			else
			{
				$savetAtribute = $modelEavAttribute->setData($postData)->save();
				$newOption['attribute_id'] = $savetAtribute->attribute_id;
			}
			if(isset($options['new']))
			{
				foreach ($options['new'] as $key => $value)
				{
					$modelEavAttributeOption = Ccc::getModel('Eav_Attribute_Option');
					$newOption['name'] = $value;
					print_r($newOption);
					$save = $modelEavAttributeOption->setData($newOption)->save();
					if(!$save)
					{
						throw new Exception("new option not saved.", 1);
					}
				}
			}
		} catch (Exception $e) {
				
			$message = new Model_Core_Message();
					$message->addMessages("Data saved successfully.",Model_Core_Message::SUCCESS);
			
							// return $this->redirect(null,'grid',null,true);
			}

		}
	
	




public function deleteAction()
	{
		try {
			$row = Ccc::getModel('Eav_Attribute');
				$request = $this->getRequest();
				if (!$request->isGet())
				{
					throw new Exception("Invalid request", 1);
				}
				$id = $request->getParam('attribute_id');
				if (!$id)
				{
					throw new Exception("id not found", 1);
				}
				$row->load($id);
				$row->delete();
				$message = new Model_Core_Message();
				$message->addMessages("Row deleted successfully..",Model_Core_Message::SUCCESS);
			$this->redirect( null,'grid', null, true);
			}catch (Exception $e)
			{
				$message = new Model_Core_Message();
				$message->addMessages("row not delete",Model_Core_Message::FAILURE);
			$this->redirect( null,'grid', null, true);
			}
	}
}
?>