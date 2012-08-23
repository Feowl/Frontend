$(document).ready(function() {
    //initialize
	//btn-primary 
	$(".endContainer, .grid2, .grid3").hide()
    $(".contribute1, .contribute1-2, .contribute2, .contribute2-1, .contribute3, .contribute3-1").attr('disabled','disabled')

        $(".contribute").change(function(){
		//ger multiple powercut value
		   num = $(".contribute option:selected").val()
			 $(".success-tick").show()
			 $(".contribute1").removeAttr('disabled')
			  $(".contribute1").removeClass("current")
			 $(".contribute1").addClass("current")
			 //show grids
		      if(num==2)
			  $(".grid2").show();
			  if(num==3)
			  $(".grid2,.grid3").show();
		    });
        
			//@todo, generalize this process
			 $(".contribute1").change(function(){
			 $(".contribute1-2").removeAttr('disabled')
			  $(".contribute1").removeClass("current")
			 $(".contribute1-2").addClass("current")
			 })
			  $(".contribute1-2").change(function(){
			  selected = $(".contribute1-2 option:selected").val()

			  //fill 2-1,3-1 with values of 1-1
			  $(".contribute2-1,.contribute3-1").val( selected ).attr('selected',true);

			   $(".success-tick1").show()
			  $(".contribute2").removeAttr('disabled')
			  $(".contribute1-2").removeClass("current")
			 $(".contribute2").addClass("current")
			 });
			  $(".contribute2").change(function(){
			   $(".contribute2-1").removeAttr('disabled')
			  $(".contribute2").removeClass("current")
			 $(".contribute2-1").addClass("current")
			 });
			   $(".contribute2-1").change(function(){
			   $(".success-tick2").show()
			   $(".contribute3").removeAttr('disabled')
			  $(".contribute2-1").removeClass("current")
			 $(".contribute3").addClass("current")
			 });
			    $(".contribute3").change(function(){
			   $(".contribute3-1").removeAttr('disabled')
			  $(".contribute3").removeClass("current")
			 $(".contribute3-1").addClass("current")
			 });
			 $(".contribute3-1").change(function(){
			   $(".success-tick3").show()
			    $(".contribute3-1").removeClass("current")
				$(".contribute-submit").addClass("btn-primary")
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
		
	

	 