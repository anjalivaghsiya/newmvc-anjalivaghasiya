<?php
error_reporting(E_ALL);
ini_set('display_errors', 'On');
define("DS",DIRECTORY_SEPARATOR);
session_start();
spl_autoload_register(function ($className){
	$classpath = str_replace('_', '/', $className);
	require_once ($classpath .".php");
});
class Ccc
{
	
	public static function init()
	{
		$init=new Controller_Core_Front();
		$init=$init->init();
	}
	public static function getModel($className)
	{
		$className = "Model_".$className;
		return (new $className());
		}
	public static function getSingleton($className)
	{
		$className = "Model_".$className;
		if (array_key_exists($className, $GLOBALS)) {
			return $GLOBALS[$className];
	}
	$GLOBALS[$className] =(new $className());
	return $GLOBALS[$className];
	}
	public static function Register($key,$value)
	{
		$GLOBALS[$key] = $value;
	}
	public static function getregistry($key)
	{
		if (array_key_exists($key, $GLOBALS)) {
			return $GLOBALS[$key];
		}
		return null;
	}
}
Ccc::init();
?>