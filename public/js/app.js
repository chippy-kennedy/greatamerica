$( document ).ready(function() {

	$(function (){
		$('#form').submit(function(e){
			e.preventDefault();
			
			$('#form').validate();
			var $inputs = $("input:first").val();

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


});
