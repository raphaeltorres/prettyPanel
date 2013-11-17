	</div><!--/fluid-row-->
			
	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">Ã—</button>
			<h3>Settings</h3>
		</div>
		<div class="modal-body">
			<p>Here settings can be configured...</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a>
			<a href="#" class="btn btn-primary">Save changes</a>
		</div>
	</div>
	
	<div class="clearfix"></div>
	<footer>
		<p>
			<span style="text-align:left;float:left">&copy; <a href="http://clabs.co" target="_blank">creativeLabs</a> 2013</span>
			<span style="text-align:right;float:right">Powered by: <a href="#">CompareHero</a></span>
		</p>
	</footer>
				
	</div><!--/.fluid-container-->
<!-- start: JavaScript-->
	<script src="{$baseUrl}assets/js/jquery-1.9.1.min.js"></script>
	<script src="{$baseUrl}assets/js/jquery-migrate-1.0.0.min.js"></script>
	<script src="{$baseUrl}assets/js/jquery-ui-1.10.0.custom.min.js"></script>
	<script src="{$baseUrl}assets/js/jquery.ui.touch-punch.js"></script>
	<script src="{$baseUrl}assets/js/bootstrap.min.js"></script>
	<script src="{$baseUrl}assets/js/jquery.cookie.js"></script>
	<script src='{$baseUrl}assets/js/fullcalendar.min.js'></script>
	<script src='{$baseUrl}assets/js/jquery.dataTables.min.js'></script>
	<script src="{$baseUrl}assets/js/excanvas.js"></script>
	<script src="{$baseUrl}assets/js/jquery.flot.min.js"></script>
	<script src="{$baseUrl}assets/js/jquery.flot.pie.min.js"></script>
	<script src="{$baseUrl}assets/js/jquery.flot.stack.js"></script>
	<script src="{$baseUrl}assets/js/jquery.flot.resize.min.js"></script>
	<script src="{$baseUrl}assets/js/jquery.chosen.min.js"></script>
	<script src="{$baseUrl}assets/js/jquery.uniform.min.js"></script>
	<script src="{$baseUrl}assets/js/jquery.cleditor.min.js"></script>
	<script src="{$baseUrl}assets/js/jquery.noty.js"></script>
	<script src="{$baseUrl}assets/js/jquery.elfinder.min.js"></script>
	<script src="{$baseUrl}assets/js/jquery.raty.min.js"></script>
	<script src="{$baseUrl}assets/js/jquery.iphone.toggle.js"></script>
	<script src="{$baseUrl}assets/js/jquery.uploadify-3.1.min.js"></script>
	<script src="{$baseUrl}assets/js/jquery.gritter.min.js"></script>
	<script src="{$baseUrl}assets/js/jquery.imagesloaded.js"></script>
	<script src="{$baseUrl}assets/js/jquery.masonry.min.js"></script>
	<script src="{$baseUrl}assets/js/jquery.knob.js"></script>
	<script src="{$baseUrl}assets/js/jquery.sparkline.min.js"></script>
	<script src="{$baseUrl}assets/js/custom.js"></script>
	<script src="{$baseUrl}assets/js/autoNumeric-1.7.5.js"></script>
	<script src="{$baseUrl}assets/js/jquery.easing.1.3.js"></script>
<!-- end: JavaScript-->

<script type="text/javascript">
	
	// FOR TWITTER BOOTSTRAP POPOVER
	$(".querytd[data-toggle=popover]")
	      .popover({ trigger: "hover" })
	      .hover(function(e) {
	        e.preventDefault()
    })

	function message_welcome1(){
		var unique_id = $.gritter.add({
			// (string | mandatory) the heading of the notification
			title: 'Welcome on Compare Hero Dashboard',
			// (string | mandatory) the text inside the notification
			text: 'This is a sample mock up',
			// (string | optional) the image to display on the left
			image: '{$baseUrl}assets/img/avatar.jpg',
			// (bool | optional) if you want it to fade out on its own or just sit there
			sticky: false,
			// (int | optional) the time you want it to be alive for before fading out
			time: '',
			// (string | optional) the class name you want to apply to that specific message
			class_name: 'my-sticky-class'
		});
	}
	
	function message_welcome2(){
		var unique_id = $.gritter.add({
			// (string | mandatory) the heading of the notification
			title: 'Hi User',
			// (string | mandatory) the text inside the notification
			text: 'Compare Hero dashboard works on all devices, computers, tablets and smartphones. It has lots of great features. Try It!',
			// (string | optional) the image to display on the left
			image: '{$baseUrl}assets/img/avatar.jpg',
			// (bool | optional) if you want it to fade out on its own or just sit there
			sticky: false,
			// (int | optional) the time you want it to be alive for before fading out
			time: '',
			// (string | optional) the class name you want to apply to that specific message
			class_name: 'my-sticky-class'
		});
	}
	
	function message_welcome3(){
		var unique_id = $.gritter.add({
			// (string | mandatory) the heading of the notification
			title: 'Test1234!',
			// (string | mandatory) the text inside the notification
			text: 'Test1234.',
			// (string | optional) the image to display on the left
			image: '{$baseUrl}assets/img/avatar.jpg',
			// (bool | optional) if you want it to fade out on its own or just sit there
			sticky: false,
			// (int | optional) the time you want it to be alive for before fading out
			time: '',
			// (string | optional) the class name you want to apply to that specific message
			class_name: 'gritter-light'
		});
	}
	
	$(document).ready(function(){
		$('.autonum').autoNumeric();
		/*setTimeout("message_welcome1()",5000);
		setTimeout("message_welcome2()",10000);	
		setTimeout("message_welcome3()",15000);*/

		// FOR NOTIFICATIONS
		$(document).click(function() {
			$('#wrapper').fadeOut();
		});
		$(".noti_item").click(function(e) {
		    e.stopPropagation(); // This is the preferred method.
		    return false;        // This should not be used unless you do not want
		                         // any click events registering inside the div
		});

		$(".box_header").click(function(e) {
		    e.stopPropagation(); // This is the preferred method.
		    return false;        // This should not be used unless you do not want
		                         // any click events registering inside the div
		});

		$('.notif-dropdown').click(function(){
			$('#wrapper').fadeToggle();
		});

		$('.user-dropdown').click(function(){
			if ($('#wrapper').css("visibility") == "hidden") {
		        $('#wrapper').fadeIn();
		    } else {
		        $('#wrapper').fadeOut();
		    }
		});

		//prepare/show #div2 on load
		$('#div2').css('left','440px').show();

		
		$('.noti_item').click(function(){
		
			//show the loader while waiting for the actual notificaiton to be loaded
			$('#loader').show();
			// var noti_id = $(this).find('.noti_id').text();
			
			//item.php will load the actual notification based on the notification id
			// $("#actual_notification").load("item.php?id=" + noti_id, function(){
			
				//after loading the actual notification,
				//hide the loader when the actual notification was loaded
				$('#loader').hide();
				
				//animate the box
				//hide #div1 (notification list) 
				$('#div1').animate(
					{ left: '-440px' },{
						duration: '350',
						easing: 'easeOutQuint'
				});

				//then show #div2(actual notification)
				$('#div2').animate(
					{ left: 0 }, {
						duration: '350',
						easing: 'easeOutQuint'
				});

			// });
			
		});
		
		//going back to notification list
		$('#back_to_noti').click(function(){
			
			//hide #div2 (actual notification)
			
			$('#div2').animate(
				{ left: '440px' },{
					duration: '350',
					easing: 'easeOutQuint'
			});

			//then show #div1 (notification list)
			$('#div1').animate(
				{ left: 0 }, {
					duration: '350',
					easing: 'easeOutQuint'
			});

			return false;
		});		
	});	
</script>

</body>
</html>