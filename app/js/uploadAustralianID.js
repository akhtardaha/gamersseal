 // Wait for PhoneGap to load
        document.addEventListener("deviceready", onDeviceReady, false);
        // PhoneGap is ready
        function onDeviceReady() {
 		// Do cool things here...
        }
 
        function getImage() {
            // Retrieve image file location from specified source
			startButtonLoading('uploadImg');
            navigator.camera.getPicture(uploadPhoto, function(message) {
				console.log('get picture failed');
				},{
				quality: 50, 
				destinationType: navigator.camera.DestinationType.FILE_URI,
				sourceType: navigator.camera.PictureSourceType.PHOTOLIBRARY
			});
 
        }
 
        function uploadPhoto(imageURI) {
			var cookie = window.localStorage.getItem("loginuserCookie");
            var options = new FileUploadOptions();
            options.fileKey="file";
            options.fileName=imageURI.substr(imageURI.lastIndexOf('/')+1);
            options.mimeType="image/jpeg";
			options.headers = {
			  Connection: "close"
		   };
 
 			var name = $('#username').val();
            var params = new Object();
            params.key = convertToSlug(name);
			params.fName=imageURI.substr(imageURI.lastIndexOf('/')+1);
            params.cookie = cookie;
 
            options.params = params;
            options.chunkedMode = false;
 
            var ft = new FileTransfer();
			
			//var url = http://bonjour.projekte-web.com/wp-content/themes/kleo/avatar_upload.php;
			var url = UPLOAD_AUSTRALIAN_ID_PIC;
			console.log(url);
			//upload_avatar(imageURI);
            ft.upload(imageURI, url, win, fail, options, true);
        }
 
        function win(r) {
            //console.log("Code = " + r.responseCode);
			endButtonLoading('uploadImg');
			
            console.log("Response = " + r.response);
			var PicName = r.response;
			var imageThumb = '<li><img src="'+AUSTRALIAN_IDS_PATH+PicName+'" alt="'+PicName+'"/></li>'
			$('.uploadedImages ul').html(imageThumb);
			//var oldPics = window.localStorage.getItem("GamesPics");
			//PicName = PicName+","+oldPics;
			window.localStorage.setItem("AustralianID",PicName);
            console.log(window.localStorage.getItem("AustralianID"));
            //console.log(r);
			//getUserInfo();
        }
 
        function fail(error) {
            console.log("Error found, Error code ="+error.code);
			//alert("An error has occurred: Code = " = error.code);
        }
		
		
		function convertToSlug(Text)
		{
			return Text
				.toLowerCase()
				.replace(/ /g,'-')
				.replace(/[^\w-]+/g,'')
				;
		}
