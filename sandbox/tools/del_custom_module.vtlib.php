<?php
include_once('vtlib/Vtiger/Module.php');

/*
* Delete a module
*/
$module = Vtiger_Module::getInstance('Partner');
if($module)
{
// Delete from system
$module->delete();
echo "Module deleted!";
} else {
echo "Module was not found and could not be deleted!\n";
}

$module = Vtiger_Module::getInstance('OSSMail');
if($module)
{
// Delete from system
$module->delete();
echo "Module deleted!";
} else {
echo "Module was not found and could not be deleted!\n";
}

$module = Vtiger_Module::getInstance('OSSMailScanner');
if($module)
{
// Delete from system
$module->delete();
echo "Module deleted!";
} else {
echo "Module was not found and could not be deleted!\n";
}

$module = Vtiger_Module::getInstance('OSSMailView');
if($module)
{
// Delete from system
$module->delete();
echo "Module deleted!";
} else {
echo "Module was not found and could not be deleted!\n";
}

?>