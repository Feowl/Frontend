
$(document).ready(function () {

  var $contribute = $("#contribute");

  /**
   * Validates the contribute form
   * @param  {Object} e The event
   * @return {[type]}   [description]
   */
  function contributeFormValidation(e) {

    var powerCutsNumber = $contribute.find("[name=contribute]").val();
    // Are we selecting a number of powercuts ?
    if( e && $contribute.find("[name=contribute]").is(e.target) ) {
      // Shoud we uncheck the "don't" know checkox ?
       $contribute.find("[name=know]").prop("checked", isNaN( $(this).val() ) );
    } 

    // Activate temporary all select box
    $contribute.find("select").prop("disabled", false);

    var notKnown = $contribute.find("[name=know]").is(":checked");
    // reduce the powercuts number if we don't know
    if(notKnown) {
      powerCutsNumber = 0;
      $contribute.find("select").prop("disabled", true);
    }

    // Show the detail form according the number of powercuts
    $contribute.find(".detail").each(function(i) {
      var isActive = i <= powerCutsNumber-1;
      $(this).toggleClass("inactive", !isActive).find(":input").prop("disabled", !isActive);
    });

    // Show or hide the success tick
    $contribute.find(".ctrl-group").each(function() {
      var $this = $(this);
      // Succeed if the ctrl group contain no empty field
      $this.toggleClass("succeed", $this.find(":input[value='']").length === 0);
    });
    
    // Disabled all current state
    $contribute.find(".current").removeClass("current");

    // Select activeted inputs
    var $allActivatedInputs = $contribute.find("select:not(:disabled)"),
    // Select empty inputs
            $allEmptyInputs = $allActivatedInputs.filter(function() { return $(this).val() == ""; });

    // Add a current class to the first uncompleted and activated selectbox
    $allEmptyInputs.eq(0).parents("label").addClass("current");


    // To know if the form is OK, all activated input must be full
    var allCompleted = $allEmptyInputs.length === 0;
    // Activate the submit button
    $contribute.find(":input[type=submit]").prop("disabled", !notKnown && !allCompleted );
  }


  /**
   * Reset the form
   */
  function reset_fields() {    
    $contribute.each(function() { this.reset() });
    contributeFormValidation();
  }

  // Initialize the form by validating the data       
  contributeFormValidation();

  // Trigger the form validation when we change something
  $contribute.on("change", contributeFormValidation);
  // Trigger the form reset
  $contribute.on("click", "a.reset", reset_fields);

  // Handle submit on the form
  // @TODO Refine this ugly submition way
  $contribute.on("submit", function(event) {
    
    event.preventDefault();

    // Loading mode
    $contribute.loading();

    var content = new Array();
    content[0] = $(".contribute option:selected").val()
    content[1] = $('input[name=know]:checked').val()
    content[2] = $(".contribute1 option:selected").val()
    content[3] = $(".contribute1-1 option:selected").val()
    num_pc = $(".contribute option:selected").val()

    if (num_pc == 2) {
      content[4] = $(".contribute2 option:selected").val()
      content[5] = $(".contribute2-1 option:selected").val()
    }
    if (num_pc == 3) {
      content[6] = $(".contribute3 option:selected").val()
      content[7] = $(".contribute3-1 option:selected").val()
    }
    url = "contribute/switch?content=" + content

    //@todo do inline validation 
    $.get(url, function (data) {
      // Get out of the loading mode
      $contribute.loading(false);
      $(".endContainer").show()
      $(".endContainer .alert").append(data).show();
    })

    return false;
  });


});
