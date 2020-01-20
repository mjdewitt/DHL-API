<?php

// this depends on the php Pear xml unserializer

require_once './pear/XML/Unserializer.php'; //set to the appropriate directory
//		require_once '/www/alexcommgrp/lib/ups_api/inc/pear/XML/Parser.php';

$unserializer = new XML_Unserializer(array('returnResult' => true));
$response_array = $unserializer->unserialize($result);

// build the dom objects
//		$dom_response = new DOMDocument();
//		$dom_response->loadXML($response);
//		$dom_xpath = new DOMXPath($this->response);
//		$dom_root_node = $dom_xpath->query(
//		'/'.$this->getRootNodeName())->item(0);

// check if we should return the raw XML data
//		if ($return_raw_xml) {
//			return $response;
//		} // end if we should return the raw XML

// return the response as an array

//$image_pdf=	$response_array;
// <AirwayBillNumber>5090613253</AirwayBillNumber>

$carton_count=$carton_count;
$total_weight=$total_weight;
if (isset($_GET['invoice'])) $invoice=$_GET['invoice'];
if (isset($response_array["Response"]["Status"]["ActionStatus"])) {

	$status = $response_array["Response"]["Status"]["ActionStatus"];
		error_log('status is '.$status);
} else {
	$status = '';
}
if (isset($response_array["Response"]["Status"]["Condition"]["ConditionCode"])) {
	$error_cde =	$response_array["Response"]["Status"]["Condition"]["ConditionCode"];
			error_log('error_code is '.$error_cde);
} else {
	$error_cde = '';
}
if (isset($response_array["Response"]["Status"]["Condition"]["ConditionData"])) {
	$error_desc =	$response_array["Response"]["Status"]["Condition"]["ConditionData"];
				error_log('error_desc is '.$error_desc);
} else {
	$error_desc = '';
}



//<Condition> <ConditionCode>ESB_GLS_GENERIC_ERR_001</ConditionCode> <ConditionData>ESB GLS exception while processing shipmet. Please contact help desk.</ConditionData> </Condition>
if (isset($response_array["AirwayBillNumber"])) {
$awbnum = $response_array["AirwayBillNumber"];
			error_log('awbnum is '.$awbnum);
} else {
	$awbnum = '';
}
if (isset($response_array["LabelImage"]["MultiLabels"]["MultiLabel"]["DocImageVal"])) {
	$cmi_pdf =	$response_array["LabelImage"]["MultiLabels"]["MultiLabel"]["DocImageVal"];
				error_log('cmi_pdf has length '.strlen($cmi_pdf));
} else {
	$cmi_pdf = '';
}
if (isset($response_array["LabelImage"]["OutputImage"])) {
	$awb_pdf =	$response_array["LabelImage"]["OutputImage"];
					error_log('awb_pdf has length '.strlen($awb_pdf));
	
} else {
	$awb_pdf =	'';
}


if (isset($response_array["Pieces"])) {
	if (count($response_array["Pieces"])==1) {
		$lp_png =	$response_array["Pieces"]["Piece"]["LicensePlateBarCode"];
		$lp_number =	$response_array["Pieces"]["Piece"]["LicensePlate"];
	} else {
		$lp_png =	$response_array["Pieces"]["Piece"][0]["LicensePlateBarCode"];
		$lp_number =	$response_array["Pieces"]["Piece"][0]["LicensePlate"];
}
} else {
		$lp_png =	'';
		$lp_number =	'';

}
$response = $result;


//if (false ) {
if ($awbnum) {
	//$sql='select * from csw_dhl_ship where invoice='.$invoice;
	$sql='SELECT * FROM csw_dhl_ship_details where invoice='.$invoice.' order by id';

	$rs_details_query=mysql_query($sql,$conn) or die($sql." cannot query 15b");
	$lp_count=0;
	while ( $rs_details=mysql_fetch_array($rs_details_query)){
		if (isset($response_array["Pieces"]["Piece"][$lp_count]["LicensePlateBarCode"]) && $response_array["Pieces"]["Piece"][$lp_count]["LicensePlateBarCode"]) {
			$sql='update csw_dhl_ship_details ';
			$sql.=' set licenseplate="'.$response_array["Pieces"]["Piece"][$lp_count]["LicensePlate"].'", ' ;
			$sql.=' licenseplate_pdf="'.$response_array["Pieces"]["Piece"][$lp_count]["LicensePlateBarCode"].'" ' ;
			$sql.=' where invoice='.$invoice.' and id='.$rs_details['id'];
			//				echo '<p>'.$sql.'<p>';
			$rs_update_query=mysql_query($sql,$conn) or die($sql." cannot query 15c");

		}
		$lp_count++;
	}

$sql='select * from csw_dhl_ship where invoice='.$invoice;
		$rs_check_query=mysql_query($sql,$conn) or die($sql." cannot query check 15b");
error_log('rows: '.mysql_num_rows($rs_check_query));
	if (mysql_num_rows($rs_check_query)==0)		{
	$sql = 'insert into csw_dhl_ship (invoice,awb, cmi_pdf,awb_pdf,total_weight_lbs,total_carton_count,licenseplate,response,date) values ( ';
	$sql .=''.$invoice.',';
	$sql .=''.$awbnum.',';
	$sql .='"'.$cmi_pdf.'",';
	$sql .='"'.$awb_pdf.'",';
	$sql .=''.$total_weight.',';
	$sql .=''.$carton_count.',';
	$sql .='"'.$lp_number.'",';	
	$sql .='"'. htmlspecialchars($response).'",';
	$sql .=' now() )';
} else {
//(invoice,awb, cmi_pdf,awb_pdf,total_weight_lbs,total_carton_count,licenseplate,response,date) 
		$sql = 'update csw_dhl_ship set ';
	$sql .=' invoice='.$invoice.',';
	$sql .=' awb="'.$awbnum.'",';
	$sql .=' cmi_pdf="'.$cmi_pdf.'",';
	$sql .=' awb_pdf="'.$awb_pdf.'",';
	$sql .=' total_weight_lbs='.$total_weight.',';
	$sql .=' total_carton_count='.$carton_count.',';
	$sql .=' licenseplate="'.$lp_number.'",';	
	$sql .=' response="'. base64_encode($response).'",';
	$sql .=' date= now() where invoice='.$invoice;
	
}

	//}
	//echo '<p>'.$sql."<p>";
	$rs_insert_query=mysql_query($sql,$conn) or die($sql." cannot insert/update");

	echo "\n\nSuccess";
} else {
	//	var_dump($response_array);
//echo '<pre>';
for ($i=1;$i<=200;$i++) {
//echo "\n";
}	
	echo "<pre>\n\n".
	'Error'."\n\n".
	$error_cde."<p>\n\n".
	$error_desc."<p>\n\n".
	"Response: ".
	str_replace('&lt;',"\n&lt;",$response);
	echo '</pre>';
	// 	htmlspecialchars($response);
/*
echo '<pre>';
for ($i=1;$i<=100;$i++) {
echo "\n";
}
*/
echo '<p>Request: ';
echo $request;
//echo htmlentities($request);
	

}

?>

<?php
// uncomment for debugging
// <img src="download.png">
//     $data=file_get_contents('./DHLAPI/download.png');
//        $data = base64_decode($image_pdf);
//header('Content-Disposition: inline');
//header('Content-type: image/png');
//$im = imagecreatefromPNG ($data);
//echo 'im ='.$im.$data;
//imagePNG($data) ;
//        header('Content-Type: image/png');
//        header('Content-Type: application/pdf');
//        header('Content-Disposition: inline; filename="invoice.pdf"');
//        header('Content-Disposition: inline; filename="licenseplate.png"');
//        header('Content-Transfer-Encoding: binary');
//       header('Accept-Ranges: bytes');
//       echo $data;
//     <img src="data:image/png;base64,'.$image_pdf.'">';
?>

