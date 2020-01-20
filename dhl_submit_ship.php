<?php

//example script to query order to be shipped via DHL
// this calculates totals needed later for the proper submission of shipment details for customs invoice


if (!isset($_GET['debug'])) $_GET['debug']=0;



//require($functions);
//mysql connect
$conn=mysql_connect($host,$dbuser,$dbpassword) or die("cannot connect");
mysql_select_db($db,$conn) or die("cannot change db");

$pagemode="";


if ($pagemode=="") {


	//	 create summary data from selected order

	$sql = '	 select sales,diff,convert(decimal(8,6),diff/sales) pct ';
	$sql .= '	from ';
	$sql .= '	(select tord.invoice,sum(tord.samt) sales,sum(tord.pstge) shipping from tord where tord.prd_cde!="cntlcsw" group by invoice) as tordsum ';
	$sql .= '	join ';
	$sql .= '	(select tord.invoice,tord.samt+tord.mchrg diff from tord where tord.prd_cde="product") as disc on disc.invoice=tordsum.invoice ';
	$sql .= '	 where tordsum.invoice='.$_GET['invoice'];


	// this example is using mssql and freetds
	$rs_adj_query=mssql_query($sql,$tdslink)  or die("cannot query total");
	if (mssql_num_rows($rs_adj_query))
	{
		$rs_adj=mssql_fetch_array($rs_adj_query);
	}
	$adj=(1+(float)$rs_adj['pct']);

	// query out just shipping products and not any free items/downloadable items etc.
	$sql  = 'select * from tord where prd_cde not in ("bad_product") and invoice='.$_GET['invoice'];

	$rs_order=array();
	//	echo '<p>'.$sql."<p>";
	$rs_order_query=mssql_query($sql,$tdslink)  or die("cannot query orders");

	if (mssql_num_rows($rs_order_query))
	{

		// for each product lookup schedule B tarrif information - see sql example table, prd_tarrif_example.sql
		while($rs_order_row=mssql_fetch_array($rs_order_query)) {
			$sql='select * from prd_tariff where prd_cde="'.$rs_order_row['prd_cde'].'"';
			$rs_prd_query=mysql_query($sql,$conn)  or die("cannot query tariff");

			if (mysql_num_rows($rs_prd_query))
			{
				$prd_tariff=Array();
				while ( $rs_prd_row=mysql_fetch_array($rs_prd_query) ) {

					// populate $prd_tarrif array
					$prd_tariff['tariff'] = array(

					'schedule_b'=>$rs_prd_row['schedule_b'],
					'tariff_desc'=>$rs_prd_row['tariff_desc'],
					'tariff_qty'=>$rs_order_row['copies']*$rs_prd_row['mult'],
					'origin'=>$rs_prd_row['origin'],
					'mult'=>$rs_prd_row['mult'],
					'weight_g'=>$rs_prd_row['weight_g'],
					'h_in' => $rs_prd_row['h_in'],
					'w_in' => $rs_prd_row['w_in'],
					'd_in' => $rs_prd_row['d_in']
					);
					$rs_order[$rs_order_row['lineno_']]=array_merge($rs_order_row,$prd_tariff);

				} //while prd_row


			} //if prd_row

		} //while order
	}//if order
	$total_value=0;
	reset($rs_order);
	$filing_type='FTR'; //set permanetly
	$ftsr='30.37(a)'; //always this value

	foreach ($rs_order as $key=>$value) {
		if ($_GET['debug']) {
			echo '<p><pre>rs_order<br>';
			var_dump($value);
			echo '</pre></p>';
		}

// something you have to consider: if you sell in bulk (packages of 10) or you include free items with purchase, you have to take these into
// account when calculating the per item quantity and cost. calculate the true quantity and price of each lineitem.

//if needed, adjust sales amount for proper customs declaration

		$samt_adj=round($value['samt']*$adj,2);
		$qty_adj=$value['copies']*$value['tariff']['mult'];
		$rs_order[$key]['samt']=round($samt_adj/$qty_adj,2); 
		$total_value += $rs_order[$key]['samt']*$qty_adj;
		
		//this is a customs rule for shipments valued over $2500
		if ($rs_order[$key]['samt']*$qty_adj>2500) {         
			$filing_type='ITN';
			$itn='x(999999999999)';

		}

	}

	// example query to pull orders which have not been processed
	$sql  =' select sent.*,subs.custcontact,tsubs.phone,tsubs.pext,tsubs.e_mail_add,tord.odte from sent ';
	$sql .=' join ord on ord.invoice=sent.invoice and ord.prd_cde="summary" '; //just pull the order summary record
	$sql .=' join subs on subs.subs_num=ord.subs_num ';
	$sql .=' where sent.invoice='.$_GET["invoice"];

	$rs_subs=array();
	//echo $sql."<p>";
	$rs_subs_query=mssql_query($sql,$tdslink)  or die("cannot query orders");

	$rs_subs=mssql_fetch_array($rs_subs_query);
	foreach ($rs_subs as $key=>$value) {
		$rs_subs[$key] = ltrim(rtrim($value));

	}
	reset($rs_subs);

	if (count($rs_subs))  //there are shipments to process
	{

// these values like the ITN and FTR values above can also be set in dhl_elements.php
		$origin_name="Shipper company name";
		$origin_street_number="123";
		$origin_street="Easy";
		$origin_street_type=" Street";
		$origin_city="Shipper city";
		$origin_state="shipper state code";
		$origin_zip_code="shipper postalcode";
		$origin_country="shipper country code 2 character";

		// prepare and submit shipment info to DHL
		require_once './DHLAPI/dhl_elements.php';

		//if you want to save the response
		require_once './DHLAPI/dhl_save_response.php';

	} //have rows
	else
	{

		echo "bad invoice";
	} //mysqlnum rows


} //pagemode=""

unset($link);
unset($stmt);
mssql_close($tdslink);
mysql_close($conn);


