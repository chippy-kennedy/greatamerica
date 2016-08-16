/*
 * Function to Load Elements on Body (No partials)
 *
 */
$(window).load(function() {
	console.log("Custom JS Loaded"); 

	//Form POST Submit
	$('#form').submit(function(e){
		e.preventDefault();

		$.ajax({
			url:'/job',
			type: 'POST',
			data: $(this).serialize(),
			dataType: 'html',
			success: function(result) {
				$('#form-col').hide();
				$('#res-col').html(result);
			}
		});
	});

});

//Functions for post AJAX Load
$('#job-page').load( function(){
	console.log("Ajax JS Loaded"); 
	/*
	 * Facebook Share Animation 
	 */
	$('.btn-share').hover(function() {
		console.log("Facebook Hover");
		$(this).fadeOut( 500 );
		$('.facebook-share').fadeIn( 500 );
	});
});
