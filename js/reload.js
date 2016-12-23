/**
 * @author Link.McKinney
 */
$(document).ready(function(){

    //executes function after page loads in browser
    startRefresh();

    //creates timer, gets data from page and updates the #myupdate_div dic
    function startRefresh() {
        setTimeout(startRefresh, 1000);
        $.get('includeData.cfm', function(data) {
            $('#myupdate_div').html(data);
        });

    };

});