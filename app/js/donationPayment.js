/*
* Licensed to the Apache Software Foundation (ASF) under one
* or more contributor license agreements.  See the NOTICE file
* distributed with this work for additional information
* regarding copyright ownership.  The ASF licenses this file
* to you under the Apache License, Version 2.0 (the
* "License"); you may not use this file except in compliance
* with the License.  You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing,
* software distributed under the License is distributed on an
* "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
* KIND, either express or implied.  See the License for the
* specific language governing permissions and limitations
* under the License.
*/
var pay = {
   // Application Constructor
   initialize: function() {
       this.bindEvents();
   },
   // Bind Event Listeners
   //
   // Bind any events that are required on startup. Common events are:
   // 'load', 'deviceready', 'offline', and 'online'.
   bindEvents: function() {
       document.addEventListener('deviceready', this.onDeviceReady, false);
   },
   // deviceready Event Handler
   //
   // The scope of 'this' is the event. In order to call the 'receivedEvent'
   // function, we must explicity call 'app.receivedEvent(...);'
   onDeviceReady: function() {
       pay.receivedEvent('deviceready');
   },
   // Update DOM on a Received Event
   receivedEvent: function(id) {
       var parentElement = document.getElementById(id);
       var listeningElement = parentElement.querySelector('.listening');
       var receivedElement = parentElement.querySelector('.received');

       listeningElement.setAttribute('style', 'display:none;');
       receivedElement.setAttribute('style', 'display:none;');

       console.log('Received Event: ' + id);

       // start to initialize PayPalMobile library
       pay.initPaymentUI();
   },
   initPaymentUI : function () {
     var clientIDs = {
       "PayPalEnvironmentProduction": "AWd-5Mm-Tfz1uewcP6RQAk1RwbMgbadKkIr6YVSjpPmZtFLIf4nKkCTjlwIxn9zo5LEKquB-gdQGaze7",
       "PayPalEnvironmentSandbox": "AQ9dujKyuQn-E4FYsycxUqVeEkgLpms1uHqdAycMdqGyUay5cuxGplNGQ5tvTG9tZxkvfIJomJj7IABG"
     };
     PayPalMobile.init(clientIDs, pay.onPayPalMobileInit);

   },
   onSuccesfulPayment : function(payment) {
	  var ref = payment.response.id;
	 //alert("payment success: " + payment);
	 
	 	var user_id = window.localStorage.getItem("loginuserID");
		if(!(user_id))
		{
			user_id = 'Guest';
		}
		var name = window.localStorage.getItem("donationName");
		var email = window.localStorage.getItem("donationEmail");
		var phone = window.localStorage.getItem("donationPhone");
		var amount = window.localStorage.getItem("donationAmount");
		var anon = window.localStorage.getItem("anonymous");
		/*var city = window.localStorage.getItem("loginuserID");
		var state = window.localStorage.getItem("loginuserID");
		var country = window.localStorage.getItem("loginuserID");*/
		
		var url = API_URL+'make_donation/?key=1234567891011&user_id='+user_id+'&name='+name+'&email='+email+'&phone='+phone+'&amount='+amount+'&anon='+anon;
	    $.ajax({
         url:url,
        type: "POST",
		contentType: "application/json",
		dataType: 'jsonp',
		beforeSend: function (xhr){ 
        xhr.setRequestHeader('Authorization', make_base_auth('bonjour', 'aj00pw')); 
    	},
        success:function(data)
        {
			console.log(data);
			$('#deviceready').hide();
			$('.tabContent').hide();
			$('.donationTitle').html('Donation Successfully Submitted');
			$('.paymentSuccess').html('<p>Thank You, your Donation was successful and your Donation Payment Ref# '+ref+'</p><a href="index.html" style="margin-top: 10px;float: left;" class="search not-srch btn">Continue</a>');
			$('.paymentSuccess').show();
		},
        error:function(){}
    });
	 
	 
	setTimeout(function(){ console.log("payment success: " + payment); },500); 
	 //updateOrder(ref);
     
   },
   onAuthorizationCallback : function(authorization) {
	  alert("authorization: " + JSON.stringify(authorization, null, 4));  
     console.log("authorization: " + JSON.stringify(authorization, null, 4));
   },
   createPayment : function () {
     // for simplicity use predefined amount
     // optional payment details for more information check [helper js file](https://github.com/paypal/PayPal-Cordova-Plugin/blob/master/www/paypal-mobile-js-helper.js)
	 OrderTotal = parseInt($('#donationAmount').val());
	 var OrderTxt = "Donation to GamersSeal";
     var paymentDetails = new PayPalPaymentDetails(OrderTotal, "0.00", "0.00");
     var payment = new PayPalPayment(OrderTotal, "USD", OrderTxt, "Sale", paymentDetails);
     return payment;
   },
   configuration : function () {
     // for more options see `paypal-mobile-js-helper.js`
     var config = new PayPalConfiguration({merchantName: "Gamersseal", merchantPrivacyPolicyURL: "https://mytestshop.com/policy", merchantUserAgreementURL: "https://mytestshop.com/agreement"});
     return config;
   },
   onPrepareRender : function() {
     // buttons defined in index.html
     //  <button id="donatebtn"> Buy Now !</button>
     //  <button id="buyInFutureBtn"> Pay in Future !</button>
     //  <button id="profileSharingBtn"> ProfileSharing !</button>
     var donatebtn = document.getElementById("donatebtn");
     var buyInFutureBtn = document.getElementById("buyInFutureBtn");
     var profileSharingBtn = document.getElementById("profileSharingBtn");

     donatebtn.onclick = function(e) {
       // single payment
	PayPalMobile.renderSinglePaymentUI(pay.createPayment(), pay.onSuccesfulPayment, pay.onUserCanceled);
     };

    /*buyInFutureBtn.onclick = function(e) {
       // future payment
       PayPalMobile.renderFuturePaymentUI(pay.onAuthorizationCallback, pay.onUserCanceled);
     };

     profileSharingBtn.onclick = function(e) {
       // profile sharing
       PayPalMobile.renderProfileSharingUI(["profile", "email", "phone", "address", "futurepayments", "paypalattributes"], pay.onAuthorizationCallback, pay.onUserCanceled);
     };*/
   },
   onPayPalMobileInit : function() {
     // must be called
     // use PayPalEnvironmentNoNetwork mode to get look and feel of the flow
     PayPalMobile.prepareToRender("PayPalEnvironmentSandbox", pay.configuration(), pay.onPrepareRender);
   },
   onUserCanceled : function(result) {
     console.log(result);
   }
};

pay.initialize();