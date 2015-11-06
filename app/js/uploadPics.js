 // Wait for PhoneGap to load
        document.addEventListener("deviceready", onDeviceReady, false);
        // PhoneGap is ready
        function onDeviceReady() {
 		// Do cool things here...
        }
 
        function getImage(btnID) {
            // Retrieve image file location from specified source
			var imgCount = window.localStorage.getItem("imageCount");
			if(imgCount >= 5)
			{
				navigator.notification.alert(
							"You cannot Upload more then 5 images",  // message
							function(){},        // callback
						   'Upload Images',            // title
							'OK'                  // buttonName
				);
				return false;
			}
			startButtonLoading('uploadImg'+btnID);
            navigator.camera.getPicture(uploadPhoto, function(message) {
				endClassButtonLoading('uploadImg');
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
 
 			var name = $('#title').val();
            var params = new Object();
            params.key = convertToSlug(name);
			params.fName=imageURI.substr(imageURI.lastIndexOf('/')+1);
            params.cookie = cookie;
 
            options.params = params;
            options.chunkedMode = false;
 
            var ft = new FileTransfer();
			
			//var url = http://bonjour.projekte-web.com/wp-content/themes/kleo/avatar_upload.php;
			var url = UPLOAD_GAME_PICS_URL;
			console.log(url);
			//upload_avatar(imageURI);
            ft.upload(imageURI, url, win, fail, options, true);
        }
 
        function win(r) {
            //console.log("Code = " + r.responseCode);
			//endButtonLoading('uploadImg');
			endClassButtonLoading('uploadImg');
            console.log("Response = " + r.response);
			var PicName = r.response;
			
			var picID = PicName.replace(/\./g,'');
			picID = picID.replace(/\-/g,'');
			var imageThumb = '<li style="position:relative;" id="'+picID+'"><img src="'+GAME_IMAGES_PATH+PicName+'" alt="'+PicName+'"/><img style="position:absolute;right:0px;top:0px;width:16px;height:16px;" src="img/trash.png" alt="Remove" onclick="removePic(\''+PicName+'\',\''+picID+'\');"/></li>'
			$('.uploadedImages ul').append(imageThumb);
			
			var oldPics = window.localStorage.getItem("GamesPics");
			if(oldPics)
			{
				PicName = PicName+","+oldPics;
			}
			else
			{
				PicName = PicName;	
			}
			window.localStorage.setItem("GamesPics",PicName);
            console.log(window.localStorage.getItem("GamesPics"));
			
			var imageCount = window.localStorage.getItem("imageCount");
			imageCount = parseInt(imageCount) + 1;
			window.localStorage.setItem("imageCount",imageCount);
            //console.log(r);
			//getUserInfo();
        }
 
        function fail(error) {
			endClassButtonLoading('uploadImg');
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
		
		function removePic(PicName,picID)
		{
			$('.uploadedImages ul li#'+picID).remove(); 	
			var PicList = window.localStorage.getItem("GamesPics");
			//alert(PicName);
			PicList = PicList.split(',');
  			PicList.splice(PicList.indexOf(PicName), 1);
  			PicList.join(',');
			window.localStorage.setItem("GamesPics",PicList);
			var imageCount = window.localStorage.getItem("imageCount");
			imageCount = parseInt(imageCount) - 1;
			window.localStorage.setItem("imageCount",imageCount);
			//alert(window.localStorage.getItem("GamesPics"));
			
		}
		


