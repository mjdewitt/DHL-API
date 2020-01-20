<?php

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
//$Address = new AddressStandardizationSolution;

// DHL settings
$dhl = $config['dhl'];

// Test a ShipmentRequest using DHL XML API
//$sample = new ShipmentRequest();

$sample = new ShipmentValidateRequest();

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++BASE values
// Assuming there is a config array variable with id and pass to DHL XML Service
$sample->SiteID = $dhl['id'];
$sample->Password = $dhl['pass'];
if ($_GET['debug']) {
	echo '<p>Siteid= '.$sample->SiteID;
	echo '<p>password= '.$sample->Password;
	
	
}
 
// Set values of the request
//$sample->MessageTime = '2001-12-17T09:30:47-05:00';
$sample->MessageTime = gmdate("Y-m-d\TH:i:s\Z");
$sample->MessageReference = substr('csw'.gmdate("Y-m-d\TH:i:s\Z").$_GET['invoice'].'-010101010101010101010101010101010101',0,30);
$sample->MetaData->SoftwareName = 'CSW_FS';
$sample->MetaData->SoftwareVersion = '1.0';

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++END BASE values

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++Request values
$sample->RegionCode = 'AM';
$sample->RequestedPickupTime = 'N';
$sample->NewShipper = 'Y';
$sample->LanguageCode = 'en';
$sample->PiecesEnabled = 'Y';
/*
+++++++++++++++++++++$rs_subs
invoice1
invoice2    
firm                           
contact                        
address                        
address2                       
city                           
st_cde 
zip        
country                        
po               
service         
uol  
dte
custcontact
phone
pext
e_mail_add
odte
*/

$sql  = ' SELECT dhl_country.*,dpa.is_paperless,dpa.paperless_limit,fmt.format,no_zip.ctry_cde no_zip FROM dhl_country ';
$sql .= ' left outer join dhl_paperless as dpa on dpa.ctry_cde=dhl_country.ctry_cde  ';
$sql .= ' left outer join dhl_postcode_format as fmt on fmt.ctry_cde=dhl_country.ctry_cde  ';
$sql .= ' left outer join dhl_no_postalcode as no_zip on no_zip.ctry_cde=dhl_country.ctry_cde  ';
$sql .= ' where substr(dhl_country.ctry_name,1,10)="'.substr($rs_subs['country'],0,10).'"';
if ($_GET['debug']==1) {
echo '<p>'.$sql;
echo '<p>';
}
$ctry_no_zip=0;
$rs_ctry_query=mysql_query($sql,$conn) or die('country query');
if (mysql_num_rows($rs_ctry_query)) {
	$rs_ctry=mysql_fetch_array($rs_ctry_query);
	$ctry_cde=$rs_ctry['ctry_cde'];
	$ctry_postal_code_format=ltrim(rtrim($rs_ctry['format']));
	if (!empty($rs_ctry['no_zip'])) $ctry_no_zip=1;
if ($rs_ctry['is_paperless']=='Y' and $rs_ctry['paperless_limit']>=0) {
	$paperless_allowed=1;
	$paperless_limit=$rs_ctry['paperless_limit'];
} else {
	$paperless_allowed=0;
}

	
}
if ($_GET['debug']==1) {
	echo '<p>country postcode format '.$ctry_postal_code_format;
}	
$matches=array(
'A'=>'[A-Z]+[\s]*',
'9'=>'[0-9]+[\s]*',
' '=>'[\s]*',
'-'=>'[\-]*[\s]*'
);
$ctry_match='';
$format_array = str_split($ctry_postal_code_format);
foreach ($format_array as $key=>$value) {
	
if (isset($matches[$value]))	$ctry_match .=$matches[$value];
	
if ($_GET['debug']==1) {
	echo '<p>country match is '.$ctry_match;
}	
	
	
}

//$rs_subs['address'] = str_replace('BLVD','Boulevard',$rs_subs['address']);

//$rs_subs['address'] = '17 Boulevard Toussaint Louverture';
//$rs_subs['address2'] = 'Angle Rue Jn Gilles';
//$rs_subs['address3'] = 'Route de l\'Aeroport';
//$rs_subs['city'] ='Port Au Prince';
$sample->Billing->ShipperAccountNumber = $dhl['shipperAccountNumber'];
//shipment is on your shipper account
if ($dhl['shipperAccountNumber'] == $dhl['shipperAccountNumber'] { 
$sample->Billing->ShipperAccountNumber = $dhl['shipperAccountNumber'];	
	$sample->Billing->ShippingPaymentType = 'S';
$sample->Billing->BillingAccountNumber = $dhl['shipperAccountNumber']; //set shipment charges billing to your shipper account
$sample->Billing->DutyPaymentType = 'S';
$sample->Billing->DutyAccountNumber = $dhl['shipperAccountNumber'];  //set duties charges billing to your shipper account
} else {
//set shipment billing to receiver	
$sample->Billing->ShippingPaymentType = 'R';
$sample->Billing->BillingAccountNumber = $yourData['receivorAccount']; //set shipment charges billing to receivor's account
$sample->Billing->DutyPaymentType = 'R';
$sample->Billing->DutyAccountNumber = $yourData['receivorAccount']; //set duties charges billing to your receivor's account
}
if ($_GET['debug']==1) {
	echo '<p>ShippingPaymentType '.$sample->Billing->ShippingPaymentType;
		echo '<p>BillingAccountNumber '.$sample->Billing->BillingAccountNumber;
echo '<p>DutyPaymentType '.$sample->Billing->DutyPaymentType;	
echo '<p>DutyAccountNumber '.$sample->Billing->DutyAccountNumber;			
}
           

$sample->Consignee->CompanyName = $yourData['receivorFirm'];

$sample->Consignee->addAddressLine($yourData['receivorAddress']));
if (!empty($yourData['receivorAddress2'])) {
	$sample->Consignee->addAddressLine($yourData['receivorAddress2']);
}
if (!empty($yourData['receivorAddress3'])) {
	$sample->Consignee->addAddressLine($yourData['receivorAddress3']);
}
if ($_GET['debug']==1) {
	echo '<p>city is '.rtrim($yourData['receivorCity']);
}
if (!empty($yourData['receivorCity'])) {
$sample->Consignee->City = $yourData['receivorCity'];
}
if (!empty($yourData['receivorState'])) {
$sample->Consignee->DivisionCode = $yourData['receivorState'];
}
if ($_GET['debug']==1) {
	echo '<p>postalcode on file is '.$yourData['receivorPostalCode'];
}
if (!empty($yourData['receivorPostalCode']) ) {
//	echo '<p>zip is not empty ';
	
if (!$ctry_no_zip) $sample->Consignee->PostalCode = $yourData['receivorPostalCode'];
} else {
if (!$ctry_no_zip) {	

$city=$yourData['receivorCity'];
$postalCode=$yourData['receivorPostalCode'];

$ctry_match='/.*(?P<postalcode>'.$ctry_match.').*/i';
preg_match($ctry_match,$city, $matches);
$parts_split=preg_split("/".$matches['postalcode']."/",$city);
$ncity=trim($parts_split[0],' ');
$npostalcode=trim($matches['postalcode'],' ');
if (!empty($ncity)) $sample->Consignee->City=$ncity;
if (!empty($nzip)) $sample->Consignee->PostalCode=$nzip;
	if ($_GET['debug']==1 and (!empty($ncity) or !empty($nzip))) {
			echo '<p>new city is '.$sample->Consignee->City;
			echo '<p>new postalcode is '.$sample->Consignee->PostalCode;
		}

} //ctry_no_zip
}
if (!empty($yourData['receivorCountryCode'])) {
$sample->Consignee->CountryCode = $yourData['receivorCountryCode'];
$sample->Consignee->CountryName = rtrim($yourData['receivorCountryName']);
}

if (!empty($yourData['receivorContactName'])) {
$sample->Consignee->Contact->PersonName = $yourData['receivorContactName'];
}
if (!empty($yourData['receivorContactPhone'])) {
$sample->Consignee->Contact->PhoneNumber = $yourData['receivorContactPhone'];
}
if (!empty($yourData['receivorContactPhoneExt'])) {
$sample->Consignee->Contact->PhoneExtension = rtrim($yourData['receivorContactPhoneExt']);
}
//assign if you want/need this data
$sample->Consignee->Contact->FaxNumber = '';
$sample->Consignee->Contact->Telex = '';
if (!empty($yourData['receivorContactEmail'])) {
$sample->Consignee->Contact->Email = rtrim($yourData['receivorContactEmail']);
}
$sample->Commodity->CommodityCode = $yourData['shipmentCommodityCode'];
$sample->Commodity->CommodityName = $yourData['shipmentCommodityName'];

$sample->Dutiable->DeclaredValue = number_format(round($yourData['shipmentTotalValue'],2), 2, '.', '');
$sample->Dutiable->DeclaredCurrency = $yourData['shipmentTotalValue']; //e.g., 'USD'
$sample->Dutiable->TermsOfTrade =  $yourData['shipmentTermsOfTrade']; //e.g., 'FCA'
if ($yourData['shipmentFilingType'] =='FTR') {
$sample->Dutiable->Filing->FilingType=$yourData['shipmentFilingType'];
$sample->Dutiable->Filing->FTSR==$yourData['shipmentFTSR'];
} else {
$sample->Dutiable->Filing->FilingType=$yourData['shipmentFilingType'];
$sample->Dutiable->Filing->ITN=$yourData['shipmentITN'];	
}
// I didn't need these
$sample->Dutiable->ExportLicense = '';
$sample->Dutiable->ShipperEIN = '';
$sample->Dutiable->ShipperIDType = '';
$sample->Dutiable->ImportLicense = '';
$sample->Dutiable->ConsigneeEIN = '';

$sample->UseDHLInvoice = 'Y';
$sample->DHLInvoiceLanguageCode = 'en';
$sample->DHLInvoiceType = 'CMI';

$sample->ExportDeclaration->ExportReasonCode ='P';
$sample->ExportDeclaration->InvoiceNumber = $yourData['shipmentInvoiceNumber'];
$sample->ExportDeclaration->InvoiceDate = $yourData['shipmentInvoiceNumber']; // date is YYYY-mm-dd format
$sample->ExportDeclaration->BillToCompanyName =$yourData['shipmentBilltoCompany']; //set to either shipper or receiver
$sample->ExportDeclaration->BillToContanctName =$yourData['shipmentBilltoContact']; //misspelling is in the DHL API

$sample->ExportDeclaration->addBillToAddressLine($yourData['shipmentBilltoAddress']);
if (!empty($yourData['shipmentBilltoAddress2'])) {
$sample->ExportDeclaration->addBillToAddressLine($yourData['shipmentBilltoAddress2']);	
}
if (!empty($yourData['shipmentBilltoAddress3'])) {
$sample->ExportDeclaration->addBillToAddressLine(rtrim($yourData['shipmentBilltoAddress3']);	
}
if (!empty($yourData['shipmentBilltoCity'])) {
$sample->ExportDeclaration->BillToCity = rtrim($yourData['shipmentBilltoCity']);
}
if (!empty($yourData['shipmentBilltoPostalCode'])) {
$sample->ExportDeclaration->BillToPostcode =$yourData['shipmentBilltoPostalCode'];
}
$sample->ExportDeclaration->BillToSuburb = ''; //I never needed this
if (!empty($yourData['shipmentBilltoState'])) {
$sample->ExportDeclaration->BillToState = $yourData['shipmentBilltoState'];
}
if (!empty($yourData['shipmentBilltoCountryName'])) {
$sample->ExportDeclaration->BillToCountryName = $yourData['shipmentBilltoCountryName'];
}
if (!empty($yourData['shipmentBilltoPhone'])) {
$sample->ExportDeclaration->BillToPhoneNumber = $yourData['shipmentBilltoPhone'];
}
if (!empty($yourData['shipmentBilltoPhoneExt'])) {
$sample->ExportDeclaration->BillToPhoneNumberExtn = $yourData['shipmentBilltoPhoneExt'];
}
$sig_path = './sample_signature.png'; //set appropriate path to live (real) signature image
$sig_type = pathinfo($sig_path, PATHINFO_EXTENSION);
$sig_data = file_get_contents($sig_path);
//$sig_base64 = 'data:image/' . $sig_type . ';base64,' . base64_encode($sig_data);
$sig_base64 = base64_encode($sig_data);
$sample->ExportDeclaration->SignatureImage=$sig_base64;  //1048576
$sample->ExportDeclaration->SignatureName = $yourData['shipmentSignatureName'];
$sample->ExportDeclaration->SignatureTitle = $yourData['shipmentSignaturetitle'];
/*
(LineNumber,
Quantity,
QuantityUnit,
Description,
Value,
IsDomestic?,
CommodityCode?,
ScheduleB?,
ECCN?,
Weight,
GrossWeight,
License?,
LicenseSymbol?,
ManufactureCountryCode?,
ManufactureCountryName?)
*/
$sql=' SELECT * FROM dhl_country ';
$rs_ctry_cde_query=mysql_query($sql,$conn) or die('country query');
$rs_ctry_cde=array();
if (mysql_num_rows($rs_ctry_cde_query)) {
	while ($rs_ctry_cde_row=mysql_fetch_array($rs_ctry_cde_query)) {
	$rs_ctry_cde[$rs_ctry_cde_row['ctry_cde']]=rtrim($rs_ctry_cde_row['ctry_name']);
}
}

reset($rs_order);
$lineno=1;
$paperless_value=0;
$tariff_total_weight_k=0;
foreach ($rs_order as $key=>$value) {

$eli = new ExportLineItem();
$eli->LineNumber = $lineno;
$eli->Quantity = $value['tariff']['tariff_qty'];
$eli->QuantityUnit = 'PCS';
$eli->Description = rtrim($value['tariff']['tariff_desc']);
$eli->Value =number_format(round($value['samt'],2), 2, '.', '');
if ($value['tariff']['origin']=='US') {
$eli->IsDomestic ='N';
	} else {
$eli->IsDomestic ='N';
}
//echo 'qty='.$value['tariff']['tariff_qty'].' weight= '.$value['tariff']['weight_g'].'<p>';
$eli->CommodityCode =rtrim($value['tariff']['schedule_b']);
$eli->ScheduleB =rtrim($value['tariff']['schedule_b']);
$eli->ECCN ='';
$eli->Weight->Weight =round($value['tariff']['tariff_qty']*($value['tariff']['weight_g']/1000),2);
$eli->Weight->WeightUnit ='K';
$eli->GrossWeight->Weight =round($value['tariff']['tariff_qty']*($value['tariff']['weight_g']/1000),2);
$eli->GrossWeight->WeightUnit ='K';
$eli->License ='';
$eli->LicenseSymbol ='';
$eli->ManufactureCountryCode =rtrim($value['tariff']['origin']);
$eli->ManufactureCountryName = rtrim($rs_ctry_cde[$value['tariff']['origin']]);
$sample->ExportDeclaration->addExportLineItem($eli);
$lineno++;
$tariff_total_weight_k += $eli->GrossWeight->Weight;
$paperless_value += round($value['tariff']['tariff_qty']*$value['samt'],2);
if ($_GET['debug']==1) {
	echo '<p>value is '.round($value['tariff']['tariff_qty']*$value['samt'],2);
	echo '<p>paperless value is '.$paperless_value;
	echo '<p>tariff total weight k'.$tariff_total_weight_k;
}
}

$sql =' SELECT csw_dhl_ship_details.*,ccc.h_in, ccc.w_in, ccc.l_in, ccc.t_in FROM csw_dhl_ship_details ';
$sql .=' join csw_carton_code as ccc on ccc.carton_cde=csw_dhl_ship_details.carton_cde ';
$sql .= ' where invoice='.$_GET['invoice'];
$rs_cartons_query=mysql_query($sql,$conn) or die('carton query');
$rs_cartons=array();
$carton_count=0;
if (mysql_num_rows($rs_cartons_query)) {
	while ($rs_cartons_row=mysql_fetch_array($rs_cartons_query)) {
if ($_GET['debug']) {
echo '<p><pre>rs_cartons_row<br>';
var_dump($rs_cartons_row);
echo '</pre></p>';
}		
	$rs_cartons[$rs_cartons_row['id']]=$rs_cartons_row;
$carton_count++;
}
}
if ($_GET['mode']=='staging') {
	$rs_cartons=array();
	$carton_count=1;
	echo '<p>weight = '.round(($tariff_total_weight_k/2.5),2)."<br>";
	$rs_cartons[] =array(
		'weight_lbs'=>round(($tariff_total_weight_k/2.5),2),
		'w_in' =>12,
		'h_in' =>12,
		'l_in' =>12
	);
	
}
$sample->Reference->ReferenceID = $yourData['shipmentReferenceID']; //any string identifier
$sample->Reference->ReferenceType = 'St';

$sample->ShipmentDetails->NumberOfPieces = $carton_count;

$piece_id=1;
$total_weight=0;
if ($_GET['debug']) {
echo '<p><pre>rs_cartons<br>';
var_dump($rs_cartons);
echo '</pre></p>';
}
reset($rs_cartons);
//$cur_carton=1;
foreach ($rs_cartons as $key=>$value) {
	
//$piece_id='C'.$cur_carton;	
$piece = new Piece();
$piece->PieceID = $piece_id;
$piece->PackageType = 'YP'; //YP is "your packaging"
$piece->Weight = number_format(round($value['weight_lbs'],2), 2, '.', ''); //set to metric or imperial
$piece->DimWeight = number_format(round($value['weight_lbs'],2), 2, '.', '');
$piece->Width = $value['w_in'];
$piece->Height = $value['h_in'];
$piece->Depth = $value['l_in'];
$sample->ShipmentDetails->addPiece($piece);
$piece_id++;
$total_weight+=round($value['weight_lbs'],2);
//$cur_carton++;
}


$sample->ShipmentDetails->Weight = number_format(round($total_weight,2), 2, '.', '');
$sample->ShipmentDetails->WeightUnit = 'L'; // L is for pounds, K is for Kilo
$sample->ShipmentDetails->GlobalProductCode = 'P';
$sample->ShipmentDetails->LocalProductCode = 'P';
$sample->ShipmentDetails->Date = date('Y-m-d');
$sample->ShipmentDetails->Contents = $yourData['shipmentContents']; //string to describe contents e.g.,'international shipment contents';
$sample->ShipmentDetails->DoorTo = 'DD'; //see API docs for full list
$sample->ShipmentDetails->DimensionUnit = 'I';
//$sample->ShipmentDetails->InsuredAmount = number_format(round($total_value,2), 2, '.', '');
$sample->ShipmentDetails->PackageType = 'YP';
$sample->ShipmentDetails->IsDutiable = 'Y';
$sample->ShipmentDetails->CurrencyCode = 'USD';

$sample->Shipper->ShipperID = $yourData['yourshipperID']; //can be any string identifier used like a code, e.g., 'my_company'
$sample->Shipper->CompanyName = $yourData['yourshipperCompanyName']; //full company name of shipping company;
$sample->Shipper->SuiteDepartmentName = '';
$sample->Shipper->addAddressLine($yourData['yourshipperAddress']);
//$sample->Shipper->addAddressLine('');
//$sample->Shipper->addAddressLine('');
$sample->Shipper->City = $yourData['yourshipperCity'];
$sample->Shipper->Division = $yourData['yourshipperStateName'];
$sample->Shipper->DivisionCode = $yourData['yourshipperStatecode'];
$sample->Shipper->PostalCode = $yourData['yourshipperPostalCode'];
$sample->Shipper->OriginServiceAreaCode = ''; //I didn't need
$sample->Shipper->OriginFacilityCode = ''; //I didn't need
$sample->Shipper->CountryCode = $yourData['yourshipperCountryCode'];
$sample->Shipper->CountryName = $yourData['yourshipperCountryName'];
$sample->Shipper->FederalTaxId = '';
$sample->Shipper->StateTaxId = '';
$sample->Shipper->Contact->PersonName = $yourData['yourshipperContactName'];
$sample->Shipper->Contact->PhoneNumber = $yourData['yourshipperContactPhone'];
$sample->Shipper->Contact->PhoneExtension = $yourData['yourshipperContactExt'];
$sample->Shipper->Contact->FaxNumber = $yourData['yourshipperFax'];
$sample->Shipper->Contact->Telex = $yourData['yourshipperTelex'];
$sample->Shipper->Contact->Email = $yourData['yourshipperEmail'];
//$sample->Shipper->Suburb = '';

/*
ShipperID,
CompanyName,
$sample->Shipper->SuiteDepartmentName?,
RegisteredAccount?,
(AddressLine,AddressLine?,AddressLine?),
City?,
Division?,
DivisionCode?,
PostalCode?,
OriginServiceAreaCode?,
OriginFacilityCode?,
CountryCode,
CountryName,
FederalTaxId?,
StateTaxId?,
Contact?,
Suburb?
*/
//	$paperless_allowed=1;
//	$paperless_limit=$rs_ctry['allowed'];
if ($_GET['debug']==1) {
	echo '<br>paperless allowed = '.$paperless_allowed;
	echo '<br>paperless limit = '.$paperless_limit;
	echo '<br>paperless value = '.$paperless_value;
	echo '<p>';
}
if ($paperless_allowed and ($paperless_limit==0 or $paperless_limit>=$paperless_value)) {
$specialService = new SpecialService();
$specialService->SpecialServiceType = 'WY';
$sample->addSpecialService($specialService);
if ($_GET['debug']==1) {
	echo '<br>shipment is paperless  ';
	echo '<p>';
}

}
/*
$specialService = new SpecialService();
$specialService->SpecialServiceType = 'I';
$sample->addSpecialService($specialService);
*/
$sample->EProcShip = 'N';
$sample->LabelImageFormat = 'PDF';

// Call DHL XML API
$start = microtime(true);

// Display the XML that will be sent to DHL
$request= $sample->toXML();

// DHL webservice client using the staging environment
//$client = new WebserviceClient('staging');
if ($_GET['debug']!=1 or $mode='staging') {
$client = new WebserviceClient($mode);

// Call the DHL service and display the XML result


//echo htmlentities($str, ENT_QUOTES);



$result=$client->call($sample);
}
//echo '<html><head></head><body style="width: 400px;Margin: 30px;padding: 30px;"><div style="display: block;float:left"><div style="float:left; display block;margin: 20px">';
//echo '$config= <br><pre>';
//var_dump($config);
//echo '</pre>';
//echo '<br>';
//echo '$applicationEnvironment= '.$applicationEnvironment;
//echo '<br>';
//echo '$configFilename= '.$configFilename;
//echo '<br>';
//echo '$scanOption= '.$scanOption;
//echo '<br>';
//echo '$autoloadDir= '.$autoloadDir;
//echo '<p>';
/*
echo '<pre>';
for ($i=1;$i<=100;$i++) {
echo "\n";
}
*/
if ($_GET['debug']==1) {
echo '<p>Request<p>';
$request=str_replace('<',"\n<",$request);
echo '<pre>';
echo htmlentities($request);
echo '<p>Response<p>';
$result=str_replace('<',"<",$result);
echo htmlentities($result);
echo '<p>';
if ($_GET['mode']='staging') {
	require_once ('./ups_api/inc/config.php');
require_once './ups_api/inc/pear/XML/Unserializer.php';
//		require_once '/www/alexcommgrp/lib/ups_api/inc/pear/XML/Parser.php';

$unserializer = new XML_Unserializer(array('returnResult' => true));
$response_array = $unserializer->unserialize($result);
if(isset($response_array["LabelImage"]["MultiLabels"]["MultiLabel"]["DocImageVal"])) {
	$sql='select * from csw_dhl_ship where invoice='.$_GET['invoice'];
	
	$rs_check_query=mysql_query($sql,$conn) or die($sql.' check query');

	if (mysql_num_rows($rs_check_query)) {
		$sql = 'update csw_dhl_ship set ';
		$sql .= 'test_passed =now() ';
		$sql .= 'where invoice='.$_GET['invoice'];
	} else {
			$sql = 'insert into csw_dhl_ship (invoice,test_passed,date) values ';
			$sql .= '( '.$_GET['invoice'].', ';
			$sql .= 'now(), ';
			$sql .= 'now() )';
	}
	$rs_upins_query=mysql_query($sql,$conn) or die($sql.' update/insert test query');

	
	
$cmi_pdf =	$response_array["LabelImage"]["MultiLabels"]["MultiLabel"]["DocImageVal"];
	echo '<form action="http://www.alexcommgrp.com/lib/DHLAPI/get_cmi_test_pdf.php?mode=staging" method="post">';
	echo '<input type="hidden" name="cmi_pdf" value="'.$cmi_pdf.'">';
	echo '<input type="hidden" name="invoice" value="'.$_GET['invoice'].'">';
	
	echo '<button>See the invoice</button>';
	echo '</form>';
}//test succeded
}//staging
die();

}
//echo "<p>";
//$out =preg_split('/\r\n|\r|\n/',htmlentities($request));
//echo 'count out = '.count($out)."<p>";
//foreach ($out as $key=>$val) {
//	$line=$key+1;
//	echo $line.". ".$val."<br>";
//}
//echo '</pre><p><pre>Result<p>';
//echo htmlentities($result);
//echo '</pre><p>Result<p>';
//echo '<p>';
//echo PHP_EOL . 'Executed in ' . (microtime(true) - $start) . ' seconds.' . PHP_EOL;
//echo '</div></div></body></html>';
