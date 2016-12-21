<cfinclude template="/include/head.cfm"/>

<body>

<div class="container">

    <cfinclude template="/include/navbar.cfm"/>

    <div class="jumbotron">
        <form action="process/create_user.cfm" method="POST">
            Username:<br>
            <input type="text" name="username" placeholder="Username" required><br>
            Password:<br>
            <input type="password" name="password" placeholder="Password" required><br>
            Email:<br>
            <input type="text" name="Email" placeholder="example@example.com" required/><br>
            <br>
            <input type="submit" value="Submit"/>
        </form>

    </div>

    <cfinclude template="/include/footer.cfm"/>

</div> <!-- /container -->

</body>
</html>