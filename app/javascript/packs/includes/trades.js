$(function(){


  $("#send-message-to-trade").on("click", function(){
  	var trade_id = $("#trade_id").val(),
  	    username = $("#message-username").val(),
  	    email = $("#message-email").val(),
  	    message = $("#message-text").val();

    $.ajax({
      url: "/trade/message",
      method: "POST",
      datatype: "json",
      data: {
      	trade_id: trade_id,
      	username: username,
      	email: email,
      	message: message
      },
      success: function(data){
      	console.log(data);
      }
    });

  });	

  $('#email-modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var modal = $(this);
  });
});  

