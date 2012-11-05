$(document).ready(function () {

  //initialize       
  $(".endContainer, .grid2, .grid3, .js-loading-overlay, .success-tick").hide()
  
  $(".contribute-submit, .contribute1, .contribute1-1, .contribute2, .contribute2-1, .contribute3, .contribute3-1").attr('disabled', 'disabled')
  $('input[name=know]').change(function () {
    var c = this.checked
    //disable all other fields
    if (c) {
      $(".contribute, .contribute1, .contribute1-1").attr('disabled', 'disabled');
      $(".contribute-submit").addClass("btn-primary")
      $(".contribute-submit").removeAttr('disabled')
    } else {
      reset_fields();

    }
  });

  $(".contribute").change(function () {
    //ger multiple powercut value
    num = $(".contribute option:selected").val()
    if ($(".contribute").val() != "Please select") {
      //@todo, refactor how the success icons are called
      $(".success-tick").show()
    } else {
      $(".success-tick").hide()
    }
    $(".contribute1").removeAttr('disabled')
    $(".contribute1").parents(".control-group").removeClass("current")
    $(".contribute1").parents(".control-group").addClass("current")
    //detect last div
    if (num == 1) last_div = ".contribute1-1";
    $(".grid3, .grid2").hide();
    if (num == 2) {
      $(".grid2").show();
      $(".grid3").hide();
      last_div = ".contribute2-1";
    }
    if (num == 3) {
      $(".grid2,.grid3").show();
      last_div = ".contribute3-1";
    }
  });

  //@todo, generalize this process
  $(".contribute1").change(function () {
    $(".contribute1-1").removeAttr('disabled')
    $(".contribute1").parents(".control-group").removeClass("current")
    $(".contribute1-1").parents(".control-group").addClass("current")
    //actions when dash is post selected
    if (($(".contribute1-1").val() != "Please select") && ($(".contribute1").val() == "Please select")) {
      $(".success-tick1").hide()
      $(".contribute-submit").attr('disabled', 'disabled')
    }
    if (($(".contribute1-1").val() != "Please select") && ($(".contribute1").val() != "Please select")) {
      $(".contribute-submit").addClass("btn-primary")
      $(".contribute-submit").removeAttr('disabled')
      $(".success-tick1").show()
    }
  })
  $(".contribute1-1").change(function () {
    selected = $(".contribute1-1 option:selected").val()
    //fill 2-1,3-1 with values of 1-1
    $(".contribute2-1,.contribute3-1").val(selected).attr('selected', true);
    $(".contribute2").removeAttr('disabled')
    $(".contribute1-1").parents(".control-group").removeClass("current")
    $(".contribute2").parents(".control-group").addClass("current")
    if (last_div == ".contribute1-1") {
      $(".contribute-submit").addClass("btn-primary")
      $(".contribute-submit").removeAttr('disabled');
    }
    if ($(".contribute1-1").val() != "Please select") {
      $(".success-tick1").show()
    } else {
      $(".success-tick1").hide()
      $(".contribute-submit").attr('disabled', 'disabled')
    }
  });
  $(".contribute2").change(function () {
    $(".contribute2-1").removeAttr('disabled')
    $(".contribute2").parents(".control-group").removeClass("current");
    $(".contribute3").removeAttr('disabled');
    $(".contribute2-1").parents(".control-group").addClass("current")
    //optionaly make button clickable
    $(".contribute-submit").addClass("btn-primary")
    $(".contribute-submit").removeAttr('disabled')
    //actions when dash is post selected
    if (($(".contribute2-1").val() != "Please select") && ($(".contribute2").val() == "Please select")) {
      $(".success-tick2").hide()
      $(".contribute-submit").attr('disabled', 'disabled')
    }
    if (($(".contribute2-1").val() != "Please select") && ($(".contribute2").val() != "Please select")) {
      $(".contribute-submit").addClass("btn-primary")
      $(".contribute-submit").removeAttr('disabled')
      $(".success-tick2").show()
    }
  });
  $(".contribute2-1").change(function () {
    if (last_div == ".contribute2-1") {
      $(".contribute-submit").addClass("btn-primary")
      $(".contribute-submit").removeAttr('disabled')
    }
    if ($(".contribute2-1").val() != "Please select") {
      $(".success-tick2").show()
      $(".contribute3").removeAttr('disabled')
      $(".contribute2-1").parents(".control-group").removeClass("current")
    } else {
      $(".success-tick2").hide()
      $(".contribute-submit").attr('disabled', 'disabled')
    }

    $(".contribute3").parents(".control-group").addClass("current")

  });
  $(".contribute3").change(function () {
    $(".contribute3-1").removeAttr('disabled')
    $(".contribute3").parents(".control-group").removeClass("current")
    $(".contribute3-1").parents(".control-group").addClass("current")
    //optionaly make button clickable
    $(".contribute-submit").addClass("btn-primary")
    $(".contribute-submit").removeAttr('disabled')
    //actions when dash is post selected
    if (($(".contribute3-1").val() != "Please select") && ($(".contribute3").val() == "Please select")) {
      $(".success-tick3").hide()
      $(".contribute-submit").attr('disabled', 'disabled')
    }
    if (($(".contribute3-1").val() != "Please select") && ($(".contribute3").val() != "Please select")) {
      $(".contribute-submit").addClass("btn-primary")
      $(".contribute-submit").removeAttr('disabled')
      $(".success-tick3").show()
    }
  });
  $(".contribute3-1").change(function () {
    if ($(".contribute3-1").val() != "Please select") {
      $(".success-tick3").show()
      $(".contribute3-1").parents(".control-group").removeClass("current")
      $(".contribute-submit").addClass("btn-primary")
    } else {
      $(".success-tick3").hide()
      $(".contribute-submit").attr('disabled', 'disabled')
    }
    if (last_div == ".contribute3-1" && $(".contribute2-1").val() != "Please select") {
      $(".contribute-submit").addClass("btn-primary")
      $(".contribute-submit").removeAttr('disabled')
    }
  });


  if ($(".contribute2-1").val() == "Please select") {
    $(".success-tick2").hide()
    $(".contribute-submit").attr('disabled', 'disabled')
  }
  if ($(".contribute3-1").val() == "Please select") {
    $(".success-tick3").hide()
    $(".contribute-submit").attr('disabled', 'disabled')
  }

  //handle submit
  $(".contribute-submit").click(function () {
    $(".js-loading-overlay").show()

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
    $.get(url, {},

    function (data) {
      //return from server
      $("#contribute,.js-loading-overlay").hide();
      $(".endContainer").show()
      $(".endContainer .alert").append(data).show();

    })
    return false;
  });


});
//reset fields
function reset_fields(form) {
  
  $(".grid2,.grid3").hide();
  $(".contribute").removeAttr('disabled', 'disabled');
  $(".success-tick").hide();

  // set its value to its first option
  $("select").each(function() {
    $(this).find("option:first").prop("selected", true);
  });

  $(form).children('input[type=checkbox]').each(function () {
    this.checked = false;
  });
  $(".contribute-submit").attr('disabled', 'disabled')
  $(".contribute-submit").removeClass("btn-primary")


}