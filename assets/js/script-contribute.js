$(document).ready(function() {
    //initialize
	$(".endContainer").hide()
    $(".contribute1-1, .contribute2, .contribute1, .contribute3").attr('disabled','disabled')
        $('.controls input:radio').change(function () {

        a = $('input[name=contribute]:checked').val();
		 
        	if(a=="true")
			{
			//@todo, generalize this process
			 $(".contribute1").addClass("current")
			 $(".contribute1").removeAttr('disabled')
			 $(".contribute1").change(function(){
			 $(".success-tick").show()
			 $(".contribute1-1").removeAttr('disabled')
			  $(".contribute1").removeClass("current")
			 $(".contribute1-1").addClass("current")
			 })
			  $(".contribute1-1").change(function(){
			   $(".success-tick1-1").show()
			  $(".contribute2").removeAttr('disabled')
			  $(".contribute1-1").removeClass("current")
			 $(".contribute2").addClass("current")
			 });
			  $(".contribute2").change(function(){
			   $(".success-tick2").show()
			   $(".contribute3").removeAttr('disabled')
			  $(".contribute2").removeClass("current")
			 $(".contribute3").addClass("current")
			 });
			 $(".contribute3").change(function(){
			   $(".success-tick3").show()
			 });
			 }else if( a=="false"){
			 //disable all other fields and goto last step
			$(".contribute1-1, .contribute2, .contribute1").attr('disabled','disabled').empty()
			$(".contribute1").removeClass("current")
			$(".contribute3").addClass("current")
			$(".contribute3").removeAttr('disabled')			 
			$(".contribute3").addClass("false")	
				 $(".contribute3").change(function(){
			   $(".success-tick3").show()
			 });
				}

});
			 		 
		 //handle submit
		 $("form#contribute").submit(function(){
				  c = $('input[name=contribute]:checked').val()
		 
				 c1 = $(".contribute1 option:selected").val()
				// When
				 c1_1 = $(".contribute1-1 option:selected").val()
				//how long
				 c2 = $(".contribute2 option:selected").val()
				//area	
				c3 = $(".contribute3 option:selected").val()
				 url = "contribute/switch?type="+ c+"&c1="+c1+"&c1_1="+c1_1+"&c2="+c2+"&c3="+c3
	 
			//@todo do inline validation 
				$.get(url, {
			}, 
			function(data){   		 
				//return from server
	           $(".endContainer").show()
			    $(".endContainer .alert").append(data)
			})
            return false;
		 });
				  
			
		  
			  
			 });
		
	

	 