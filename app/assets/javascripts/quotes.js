$(function(){
    $("form#new_quote").ajaxSuccess(function(e, xhr, settings) {
        //TODO add new quote to table
        try{
            var quote = $.parseJSON(xhr.responseText);
            $("table#quotes_list").append(
                '<tr class="clickable" onclick="window.location = \'/quotes/'+quote.id+'\' ">'+
                '<td >'+quote.name+'</td>'+
                '<td>'+quote.description+'</td>'+
                '<td>'+quote.cost_per_hour+'</td>'+
                '<td>'+quote.hours_per_day+'</td>'+
                '<td>'+quote.total_cost+'</td>'+
                '<td>'+quote.status+'</td>'+
                '<td><a href="/quotes/'+quote.id+'/edit"><i class="icon-edit"></i></a></td>'+
                '<td class="alert-error"><a href="/quotes/'+quote.id+'" data-confirm="Are you sure?" data-method="delete" rel="nofollow"><i class="icon-trash"></i></a></td>'+
                '</tr>');
            $("#no_quotes").remove();
        }catch(e){
        }
        $('#newQuoteModal').modal('hide');
    }).ajaxError(function(e, xhr, settings) {
        //TODO error response
        alert(xhr.responseText);
    });
});
