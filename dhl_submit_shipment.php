<?php

/* this is the starting point of using the API. 
   It will display a dump of the request and response

*/
// setup database connections if needed
$tdslink = mssql_connect($tdshostname, $tdsusername, $tdspw);
mssql_select_db($tdsdbname);

$conn=mysql_connect($host,$dbuser,$dbpassword) or die("cannot connect");
mysql_select_db($db,$conn) or die("cannot change db");


use DHL\Entity\AM\ShipmentValidateResponse;
use DHL\Entity\AM\ShipmentValidateRequest;
use DHL\Client\Web as WebserviceClient;
use DHL\Datatype\AM\MetaData;

//use DHL\Datatype\AM\ExportLineItems;
use DHL\Datatype\AM\ExportLineItem;
use DHL\Datatype\AM\Piece;
use DHL\Datatype\AM\SpecialService;

// You may use your own init script, as long as it takes care of autoloading
require(__DIR__ . '/init.php');




$invoice=$_GET['invoice'];
// DHL settings
$dhl = $config['dhl'];

// Test a ShipmentRequest using DHL XML API
//$sample = new ShipmentRequest();

$sample = new ShipmentValidateRequest();



// Display the XML that will be sent to DHL
$request= $sample->toXML();

// DHL webservice client using the staging environment
//the staging environment is limited and you may find that some DHL billing accounts may fail
//when they are valid.

$client = new WebserviceClient('production');

// Call the DHL service and display the XML result


$result=$client->call($sample);
echo '<html><head></head><body style="width: 400px;Margin: 30px;padding: 30px;"><div style="display: block;float:left"><div style="float:left; display block;margin: 20px">';
echo '$config= <br><pre>';
var_dump($config);
echo '</pre>';
echo '<br>';
echo '$applicationEnvironment= '.$applicationEnvironment;
echo '<br>';
echo '$configFilename= '.$configFilename;
echo '<br>';
echo '$scanOption= '.$scanOption;
echo '<br>';
echo '$autoloadDir= '.$autoloadDir;
echo '<p>';

echo '<pre>Request<p>';
echo htmlentities($request);
echo "<p>";
$out =preg_split('/\r\n|\r|\n/',htmlentities($request));
echo 'count out = '.count($out)."<p>";
foreach ($out as $key=>$val) {
	$line=$key+1;
	echo $line.". ".$val."<br>";
}
echo '</pre><p><pre>Result<p>';
echo htmlentities($result);
echo '</pre><p>Result<p>';
echo '<p>';
echo PHP_EOL . 'Executed in ' . (microtime(true) - $start) . ' seconds.' . PHP_EOL;
echo '</div></div></body></html>';
