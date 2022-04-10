<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentPage.aspx.cs" Inherits="CoriunderExamen.PaymentPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	 <%--<script src="http://ajax.microsoft.com/ajax/jQuery/jquery-1.4.4.js" 
          type="text/javascript"></script>--%>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <style>
		.content{
			padding-right: 15px;
			padding-left: 15px;margin-right: auto;margin-left: auto; width: 1170px;
		}
		.content-details{
			width: 50%; 
			border-radius: 2px; 
			padding: 10px; 
			padding-top: 10px;
		}
        .row{
            margin-right: -15px;
           margin-left: -15px;
        }
        .full-row{
            width: 100%;
        }
        .half-row{
            width: 50%;
            float:left;

        }
        .details-area{
			padding-top: 15px;
            font-family: sans-serif; 
            color: #545454; 
            margin: 2px 0 0;

        }
       .details-area.table-view{
           line-height: 35px;
           padding-bottom: 15px;
       }
	   .tr-table {
            margin-bottom: 8px;
       }
       .details-area.table-view.td-cell{
           display: inherit;
    border: 1px solid #ddd;
    border-radius: 4px;
    background: #fff;
       }
       .details-area.table-view.td-cell-text{
         display: inherit;
    padding-right: 10px;
    padding-left: 5px;
    font-weight: 500;
}
       
       .color-red{
           color:red;
       }
       input{
		   border: 1px solid #ddd;
           height: 40px;
    margin-top: 0;
    margin-bottom: 0;
    margin-left: 0;
    width: 100%;
	border-radius: 4px;
    font-size: 15px;
    color: #545454;
    padding: 0 10px;
       }
        input[type=text].error, input[type=email].error, input[type=tel].error, input[type=number].error {
            border: 1px #f00 solid !important;
            background-color: #fff8f8 !important;
            color: #545454 !important;
            background-repeat: no-repeat !important;
            background-position: right !important;
            background-size: 13px !important;
            background-position-x: 96% !important;
        }
       .month{
           vertical-align: middle;
    display: inline-block;
    width: 55%;
    height: 40px;
    overflow: hidden;   
    border: 1px solid #ddd;
    border-radius: 4px;
    line-height: 30px;
       }
	   .month select{
		   background: transparent;
    width: 100%;
    padding: 6px;
    font-size: 13px;
    line-height: 1;
    border: 0;
    border-radius: 0;
    -webkit-appearance: none;
    height: 38px;
	   }
       .year{
           vertical-align: middle;
    display: inline-block;
    width: 42%;
    height: 40px;
    overflow: hidden;
    border: 1px solid #ddd;
    border-radius: 4px;
    line-height: 30px;
       }
	     .year select{
		   background: transparent;
    width: 100%;
    padding: 6px;
    font-size: 13px;
    line-height: 1;
    border: 0;
    border-radius: 0;
    -webkit-appearance: none;
    height: 38px;
	   }
		 .country{
    vertical-align: middle;
    display: inline-block;
    width: 100%;
    height: 40px;
    overflow: hidden;
    border: 1px solid #ddd;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    line-height: 30px;
}
		  .country select{
		   background: transparent;
    width: 100%;
    padding: 6px;
    font-size: 13px;
    line-height: 1;
    border: 0;
    border-radius: 0;
    -webkit-appearance: none;
    height: 40px;
	   }
       .clear-both{
           clear: both;
       }
	   .wrap-button {
    float: left;
    width: 100%;
    margin-bottom: 20px;
    margin-top: 30px;
}
	   input[type=button]{
    background-color:darkgreen;
    width: 100%;
    border: 0;
    cursor: pointer;
    color: #fff;
    border-radius: 5px;
    font-family: sans-serif;
    font-size: 16px;
    padding: 5px 15px;
    text-transform: uppercase;
    height: 40px;
	   }
	     input[type=button].inputDisabled{
    pointer-events: none;
	   background-color:darkseagreen;
    width: 100%;
    border: 0;
    cursor: pointer;
    color: #fff;
    border-radius: 5px;
    font-family: sans-serif;
    font-size: 16px;
    padding: 5px 15px;
    text-transform: uppercase;
    height: 40px;
	   }
   p {
	   text-align: center;
	   border: 1px solid #aaa;
	   background: #fff8f8;
	   padding: 10px;
	   cursor: pointer;
	   border-radius: 5px;
    font-family: sans-serif;
    font-size: 16px;
   }
   .wrap-payment-msg {
    padding: 20px;
    line-height: 30px;
}
   .details-payment {
       display:none;
    border: 1px solid #c5c5c5;
    background-color: #fafafa;
    min-height: 350px;
    box-shadow: 0 4px 4px 0 rgb(0 0 0 / 20%), 0 3px 10px 0 rgb(0 0 0 / 19%);
    border-radius: 5px;
}
   
 
    </style>

	<script type="text/javascript">
        $(document).ready(function () {
            $("#RedID").css({ "background-color": "red" });
		});

        function focusToValidate() {
          

            if ($('input').hasClass('error')) {
                $('input[type=button]').addClass('inputDisabled');
              
               

            } else {
                $('input[type=button]').removeClass('inputDisabled');
              
            }
        }

		function fieldValidator(element) {
            
			if ($('#' + element).val() == '') {

				$('#' + element).addClass('error');
			}
			else {
                $('#' + element).removeClass('error');
            }
            
          
            if ($('input').hasClass('error')) {
                $('input[type=button]').addClass('inputDisabled');
            
			}
			else {
                $('input[type=button]').removeClass('inputDisabled');
              
              
            }
		}
        function Save() {

            var cardNum = $("#ccInput").val();
            var expMonth = $("#monthChoose").val();
            var expYear = $("#yearChoose").val();
            var cVV2 = $("#cvvInput").val();
            var member = $("#cardholderNameInput").val();
            var email = $("#emailInput").val();
            var billingAddress1 = $("#addressInput").val();
            var billingCity = $("#addressCityInput").val();
            var billingZipCode = $("#addressZipCodeInput").val();
            var billingCountry = $("#addressCountryChoose").val();
            var phoneNumber = $("#phoneInput").val();


            var paymentDetails = { CardNum: cardNum, ExpMonth: expMonth, ExpYear: expYear, CVV2: cVV2, Member: member, Email: email, BillingAddress1: billingAddress1, BillingCity: billingCity, BillingZipCode: billingZipCode, BillingCountry: billingCountry, PhoneNumber: phoneNumber, Amount: '4.5' };
            CoriunderExamen.PaymentService.SavePaymentDetails(paymentDetails, SearchSuccesCallback);

            function SearchSuccesCallback(result) {

               
                if (result["ErrorMessage"] == null) {
                    var transactionID = result["TransactionID"];
                    var transactionDate = result["TransactionDate"];
                    //$("#transID").val("12345");
                    //$("#transDate").val(transactionDate);
                    //$(".details-payment").css({ "display": "block" });
                    //document.getElementById("transID").value = result["TransactionID"];
                    //document.getElementById("transDate").value = result["TransactionDate"];
                    $("#details-area").css({ "display": "none" });
                    
                    $('input[type=button]').addClass('inputDisabled');
                   
                    alert("Transaction ID: " + transactionID + ", Transaction Date: " + transactionDate);

                }
                else {
                    alert(result["ErrorMessage"]);
                }

            }

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path ="~/PaymentService.asmx" />
            </Services>
        </asp:ScriptManager>
        <div class="">
           <div class="content">
           
            
               <div class="content-details">
                         
                        <div style="font-family: sans-serif; color: #545454; font-size: 14px; font-weight: 500;">Order details </div>
                        <div style="font-family: sans-serif; color: #545454; font-size: 18px;">Pay for  Purchase</div>
                        
                        <div style="clear:both;"></div>
                       
                                                          
            
               <div style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd;">
                   <div style="line-height: 30px; color: #545454; text-transform: none; font-family: sans-serif; font-size: 16px; font-weight: 500;">
                        <div>Total<span style="font-size: 16px; padding-left: 10px; padding-right: 10px; float: right;">$4.70</span> 
                            
                        </div>
             
               </div> 
                        </div>
<div class="row half-row details-payment">
    <div class="wrap-payment-msg" style="text-align: center;">
        
                <div class="success-notifaction">
                   
                    
                    <span>The payment completed successfully.</span></div>
                <div class="MsgMerchant">
                    Transaction ID: <span id="transID"></span><br />
                    Transaction Date: <span id="transDate"></span>
                </div>
                <div class="check-detalis">
					
				</div>
            
        <div class="MsgMerchant">
            </div>
    </div>

</div>


                    <div id="details-area">

                    <div class="table-view">
				               
                <div class="full-row tr-table">

                    <div class="td-cell-text">
                        Card Number:<span class="color-red"> *</span>
                    </div>

                    <div class="td-cell">
                        <span id="creditCard" dir="ltr" style="direction:ltr !important;">
                            <input name="ccInput" type="text" id="ccInput"  onmouseout="fieldValidator(this.id)" autocomplete="off" maxlength="20" onkeypress=""/>

                        </span>                     
                    </div>               
                </div>  
                       
                
                
                 <div class="half-row">
                <div class="tr-table">
                    
                    <div class="td-cell-text">
                        Expiration  Date:<span class="color-red"> *</span>
                    </div>
                    <div>
                        <div class="month">
                            <select name="monthChoose" id="monthChoose" required="required">
	<option selected="selected" value=""></option>
	<option value="1">01 - January</option>
	<option value="2">02 - February</option>
	<option value="3">03 - March</option>
	<option value="4">04 - April</option>
	<option value="5">05 - May</option>
	<option value="6">06 - June</option>
	<option value="7">07 - July</option>
	<option value="8">08 - August</option>
	<option value="9">09 - September</option>
	<option value="10">10 - October</option>
	<option value="11">11 - November</option>
	<option value="12">12 - December</option>

</select>
                           
                        </div>
                        <div class="year">
                            <select name="yearChoose" id="yearChoose"  required="required">
	<option selected="selected" value="" ></option>
	<option value="2021">2021</option>
	<option value="2022">2022</option>
	<option value="2023">2023</option>
	<option value="2024">2024</option>
	<option value="2025">2025</option>
	<option value="2026">2026</option>
	<option value="2027">2027</option>
	<option value="2028">2028</option>
	<option value="2029">2029</option>
	<option value="2030">2030</option>
	<option value="2031">2031</option>

</select>
                        </div>
                    
                    </div>
 
                </div>
                </div>

               
                <div class="half-row">
                <div class="tr-table">
					
                    <div class="td-cell-text">

                        CVV:
                    </div>

                    <div class="td-cell" style="display: block;">
                        <input name="cvvInput" maxlength="4" id="cvvInput"  autocomplete="off" required="required" type="text" <%--onkeydown="limitCvv(this);" onkeyup="limitCvv(this);"--%>  onmouseout="fieldValidator(this.id)" />
 
                    </div>
                </div>
                </div>
                

                <div class="full-row">
					<div class="tr-table">
                <div id="cardholderName">
                    <div class="td-cell-text">
                        Cardholder Name:<span class="color-red"> *</span>
                    </div>
                    <div class="td-cell">
                        <input name="cardholderNameInput" maxlength="24" id="cardholderNameInput" type="text" required="required" onmouseout="fieldValidator(this.id)" />
 
                    </div>
                </div>
                </div>
					 </div>
           
                <div class="full-row">
					<div class="tr-table">
                <div id="email">
					    <div class="td-cell-text">
						    Email Address:
                            
                        </div>
					    <div class="td-cell">
						    <input name="emailInput" maxlength="255" id="emailInput" type="email" placeholder="Example@example.com"  onmouseout="fieldValidator(this.id)" />
			 
					    </div>
				    </div>
						</div>
                </div>
			</div>
            <div class="clear-both">
            </div>      
        <div>
          
            <div id="adressBlock">
                


</div>
    <div class="table-view">
        
            <div class="full-row">
				<div class="tr-table">
            <div id="address">
                <div class="td-cell-text">
                    Address 1:
                    
                </div>
                <div class="td-cell">
                    <input name="addressInput" maxlength="255" id="addressInput" type="text" placeholder="Street address, P.O. box, company name, c/o" onmouseout="fieldValidator(this.id)" />					
                </div>
            </div>
					 </div>
            </div>
        
            <div class="half-row">
				<div class="tr-table">
            <div id="addressCity">
                <div class="td-cell-text">
                    City:
					
                </div>
                <div class="td-cell">
                    <input name="addressCityInput" id="addressCityInput" type="text" onmouseout="fieldValidator(this.id)" />
                </div>
            </div>
            </div>
				</div>
        
            <div class="half-row">
				<div class="tr-table">
            <div id="addressZipCode">
                <div class="td-cell-text">
                    Zip Code:
					
                </div>
                <div class="td-cell">
                    <input name="addressZipCodeInput" type="text" id="addressZipCodeInput" />
                </div>
            </div>
            </div>
				 </div>
		 <div class="half-row">
			 <div class="tr-table">
        <div id="addressCountry">
               
                <div class="td-cell-text">
                    Country:
					
                </div>
               <div class="td-cell">
                    <div class="country">
						<select name="addressCountryChoose"  id="addressCountryChoose">
	<option selected="selected" value=""></option>
	<option value="0"></option>
	<option value="1">Afghanistan</option>
	<option value="303">Aland Islands</option>
	<option value="6">Albania</option>
	<option value="7">Algeria</option>
	<option value="8">American Samoa</option>
	<option value="9">Andorra</option>
	<option value="10">Angola</option>
	<option value="240">Anguilla</option>
	<option value="241">Antarctica</option>
	<option value="12">Antigua</option>
	<option value="13">Argentina</option>
	<option value="14">Armenia</option>
	<option value="242">Aruba</option>
	<option value="17">Australia</option>
	<option value="19">Austria</option>
	<option value="20">Azerbaijan</option>
	<option value="21">Bahamas</option>
	<option value="22">Bahrain</option>
	<option value="23">Bangladesh</option>
	<option value="24">Barbados</option>
	<option value="26">Belarus</option>
	<option value="27">Belgium</option>
	<option value="28">Belize</option>
	<option value="29">Benin</option>
	<option value="30">Bermuda</option>
	<option value="243">Bhutan</option>
	<option value="32">Bolivia</option>
	<option value="33">Bosniaand Herzegovina</option>
	<option value="34">Botswana</option>
	<option value="244">Bouvet island</option>
	<option value="35">Brazil</option>
	<option value="301">British Indian Ocean Territory</option>
	<option value="37">Brunei</option>
	<option value="38">Bulgaria</option>
	<option value="39">Burkina Faso</option>
	<option value="40">Burundi</option>
	<option value="41">Cambodia</option>
	<option value="42">Cameroon</option>
	<option value="43">Canada</option>
	<option value="250">Cape verde</option>
	<option value="45">Cayman Islands</option>
	<option value="247">Central african republic</option>
	<option value="47">Chad</option>
	<option value="48">Chile</option>
	<option value="49">China</option>
	<option value="251">Christmas island</option>
	<option value="245">Cocos (keeling) islands</option>
	<option value="52">Colombia</option>
	<option value="261">Comoros</option>
	<option value="246">Congo, DRC</option>
	<option value="54">Congo, ROC</option>
	<option value="248">Cook islands</option>
	<option value="57">Costa Rica</option>
	<option value="58">Croatia</option>
	<option value="59">Cuba</option>
	<option value="307">Curacao</option>
	<option value="60">Cyprus</option>
	<option value="61">Czech Republic</option>
	<option value="62">Denmark</option>
	<option value="64">Djibouti</option>
	<option value="252">Dominica</option>
	<option value="66">Dominican Republic</option>
	<option value="67">Ecuador</option>
	<option value="68">Egypt</option>
	<option value="69">El Salvador </option>
	<option value="70">Equatorial Guinea</option>
	<option value="71">Eritrea</option>
	<option value="72">Estonia</option>
	<option value="73">Ethiopia</option>
	<option value="74">F.Y.R. of Macedonia</option>
	<option value="254">Falkland islands (malvinas)</option>
	<option value="255">Faroe islands</option>
	<option value="77">Fiji Islands</option>
	<option value="78">Finland</option>
	<option value="79">France</option>
	<option value="81">French Guiana</option>
	<option value="82">French Polynesia</option>
	<option value="302">French Southern and Antarctic Lands</option>
	<option value="83">Gabon</option>
	<option value="84">Gambia</option>
	<option value="85">Georgia</option>
	<option value="86">Germany</option>
	<option value="87">Ghana</option>
	<option value="88">Gibraltar</option>
	<option value="89">Greece</option>
	<option value="90">Greenland</option>
	<option value="256">Grenada</option>
	<option value="92">Guadeloupe</option>
	<option value="93">Guam</option>
	<option value="95">Guatemala</option>
	<option value="298">Guernsey</option>
	<option value="97">Guinea</option>
	<option value="96">Guinea-Bissau</option>
	<option value="98">Guyana</option>
	<option value="99">Haiti</option>
	<option value="300">Heard Island and McDonald Islands</option>
	<option value="288">Holy see (vatican city state)</option>
	<option value="100">Honduras</option>
	<option value="101">Hong Kong SAR</option>
	<option value="102">Hungary</option>
	<option value="103">Iceland</option>
	<option value="104">India</option>
	<option value="105">Indonesia</option>
	<option value="112">Iran</option>
	<option value="113">Iraq</option>
	<option value="114">Ireland</option>
	<option value="296">Isle of Man</option>
	<option value="115">Israel</option>
	<option value="116">Italy</option>
	<option value="117">Ivory Coast</option>
	<option value="118">Jamaica</option>
	<option value="119">Japan</option>
	<option value="297">Jersey</option>
	<option value="120">Jordan</option>
	<option value="121">Kazakhstan</option>
	<option value="122">Kenya</option>
	<option value="260">Kiribati</option>
	<option value="125">Korea</option>
	<option value="124">Korea (North)</option>
	<option value="234">Kuwait</option>
	<option value="126">Kyrgyz Republic</option>
	<option value="263">Lao, PDR</option>
	<option value="128">Latvia</option>
	<option value="129">Lebanon</option>
	<option value="130">Lesotho</option>
	<option value="131">Liberia</option>
	<option value="132">Libya</option>
	<option value="133">Liechtenstein</option>
	<option value="134">Lithuania</option>
	<option value="135">Luxembourg</option>
	<option value="136">Macau</option>
	<option value="137">Madagascar</option>
	<option value="138">Malawi</option>
	<option value="139">Malaysia</option>
	<option value="140">Maldives</option>
	<option value="141">Mali</option>
	<option value="142">Malta</option>
	<option value="265">Marshall islands</option>
	<option value="144">Martinique</option>
	<option value="145">Mauritania</option>
	<option value="146">Mauritius</option>
	<option value="293">Mayotte</option>
	<option value="148">Mexico</option>
	<option value="149">Micronesia</option>
	<option value="150">Moldova</option>
	<option value="151">Monaco</option>
	<option value="152">Mongolia</option>
	<option value="295">Montenegro</option>
	<option value="267">Montserrat</option>
	<option value="154">Morocco</option>
	<option value="155">Mozambique</option>
	<option value="156">Myanmar</option>
	<option value="157">Namibia</option>
	<option value="270">Nauru</option>
	<option value="159">Nepal</option>
	<option value="160">Netherlands</option>
	<option value="161">Netherlands Antilles</option>
	<option value="268">New caledonia</option>
	<option value="164">New Zealand</option>
	<option value="165">Nicaragua</option>
	<option value="166">Niger</option>
	<option value="167">Nigeria</option>
	<option value="271">Niue</option>
	<option value="269">Norfolk island</option>
	<option value="266">Northern mariana islands</option>
	<option value="170">Norway</option>
	<option value="171">Oman</option>
	<option value="172">Pakistan</option>
	<option value="275">Palau</option>
	<option value="174">Panama</option>
	<option value="175">Papua New Guinea</option>
	<option value="176">Paraguay</option>
	<option value="177">Peru</option>
	<option value="178">Philippines</option>
	<option value="273">Pitcairn</option>
	<option value="179">Poland</option>
	<option value="180">Portugal</option>
	<option value="181">Puerto Rico</option>
	<option value="182">Qatar</option>
	<option value="276">Reunion</option>
	<option value="184">Romania</option>
	<option value="186">Russia</option>
	<option value="187">Rwanda</option>
	<option value="278">Saint helena</option>
	<option value="262">Saint kitts and nevis</option>
	<option value="264">Saint lucia</option>
	<option value="272">Saint pierre and miquelon</option>
	<option value="289">Saint vincent &amp; the grenadines</option>
	<option value="304">Saint-Barth&#233;lemy</option>
	<option value="305">Saint-Martin (French part)</option>
	<option value="190">San Marino</option>
	<option value="280">Sao tome and principe</option>
	<option value="192">Saudi Arabia</option>
	<option value="193">Senegal</option>
	<option value="294">Serbia</option>
	<option value="249">Serbia and montenegro</option>
	<option value="194">Seychelle Islands</option>
	<option value="195">Sierra Leone</option>
	<option value="196">Singapore</option>
	<option value="197">Slovak Republic</option>
	<option value="5">Slovenia</option>
	<option value="277">Solomon islands</option>
	<option value="3">Somalia</option>
	<option value="2">South Africa</option>
	<option value="299">South Georgia and the South Sandwich Islands</option>
	<option value="306">South Sudan</option>
	<option value="198">Spain</option>
	<option value="199">SriLanka</option>
	<option value="204">Sudan</option>
	<option value="205">Suriname</option>
	<option value="279">Svalbard and jan mayen</option>
	<option value="206">Swaziland</option>
	<option value="207">Sweden</option>
	<option value="208">Switzerland</option>
	<option value="209">Syria</option>
	<option value="210">Taiwan</option>
	<option value="211">Tajikistan</option>
	<option value="212">Tanzania</option>
	<option value="213">Thailand</option>
	<option value="284">Timor-leste</option>
	<option value="215">Togo</option>
	<option value="283">Tokelau</option>
	<option value="285">Tonga</option>
	<option value="218">Trinidad and Tobago</option>
	<option value="219">Tunisia</option>
	<option value="220">Turkey</option>
	<option value="221">Turkmenistan</option>
	<option value="281">Turks and caicos islands</option>
	<option value="286">Tuvalu</option>
	<option value="229">U.S.Virgin Islands</option>
	<option value="224">Uganda</option>
	<option value="225">Ukraine</option>
	<option value="226">United Arab Emirates</option>
	<option value="227">United Kingdom</option>
	<option value="228">United States</option>
	<option value="230">Uruguay</option>
	<option value="287">US minor outlying islands</option>
	<option value="18">Uzbekistan</option>
	<option value="291">Vanuatu</option>
	<option value="55">Venezuela</option>
	<option value="233">Vietnam</option>
	<option value="290">Virgin islands, british</option>
	<option value="292">Wallis and futuna</option>
	<option value="253">Western sahara</option>
	<option value="235">Western Samoa</option>
	<option value="236">Yemen</option>
	<option value="238">Zambia</option>
	<option value="239">Zimbabwe</option>

</select>
											
                    </div>
                </div>
            </div>
            </div>
			 </div>
		 </div>
    </div>
              
                <div class="clear-both">
                </div>
            
          
        <div>
            <div id="section-03">
               
      <div id="personalDetails">                
                <div class="table-view">
                                       
                        <div class="full-row">
							<div class="tr-table">

                        <div id="personalDetailsPhone">
                            <div class="td-cell-text">
                                Phone Number:<span class="color-red"> *</span>
                            </div>
                            <div class="td-cell">
                                <input name="phoneInput" maxlength="30" id="phoneInput" type="tel" onblur="this.value=removeSpaces(this.value);"  <%--onkeydown="limitphone(this);"--%> onkeyup="limitphone(this);" onmouseout="fieldValidator(this.id)" />
                            </div>
                        </div>
                        </div>
							 </div>                   
                </div>
                       
    </div>
</div>

                <div class="clear-both"></div>
            </div>
</div>
				   <div class="full-row" >

		<div class="wrap-button" onmouseover="focusToValidate()">
 			
			<input type="button" name="btnSave" value="Pay" onclick="Save()" id="btnSave"/>
			<div>
				<p>Please review the submitted info.</p>
			</div> 
			
 
		</div>
	</div>
        </div>
               </div>  
             </div>
                                                                            
         
             
    
                          
    </form>
</body>
</html>
