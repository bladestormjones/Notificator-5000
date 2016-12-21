<cfquery name="myQuery" datasource="notes">
    SELECT * FROM notes
</cfquery>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>Notify V0.0.4</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/jumbotron-narrow.css" rel="stylesheet">
</head>

<body>

<div class="container">
    <cfinclude template="include/navbar.cfm"/>

    <div class="jumbotron">
        <h1>MoSCoW:<br>Notificator 5000</h1>
        <h4>Must Have:</h4>
        <strike>- The ability to make new notes.<br></strike>
        <strike>- The ability to look at old notes.<br></strike>
        <h4>Should Have:</h4>
        <strike>- Different users so you can make personal notes.<br></strike>
        - Ability to make new users<br>
        - Ability to edit users<br>
        <strike>- Ability to edit notes<br></strike>
        <strike>- Ability to delete notes.<br></strike>
        <h4>Could Have:</h4>
        <strike>- User login.<br></strike>
        - Ability to delete users and all their notes.<br>
        - Ability to set notes to "done" and a filter function for notes based on "done and not done".<br>
        - Ability to add a reminder time to a note and to send a mail around that time. (tip: scheduled tasks)<br>
    </div>

    <cfinclude template="include/footer.cfm"/>

</div> <!-- /container -->

</body>
</html>