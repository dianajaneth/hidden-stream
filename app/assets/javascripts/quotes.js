$(function(){
    $("form#new_quote").ajaxSuccess(function(e, xhr, settings) {
        //TODO add new quote to table
        $('#newQuoteModal').modal('hide');
    }).ajaxError(function(e, xhr, settings) {
        //TODO error response
        alert(xhr.responseText);
    });
});
