<cfinclude template="head.cfm"/>

<body>

<div class="container">

    <cfinclude template="navbar.cfm"/>

    <div class="jumbotron">
        <form action="create_user.cfm" method="POST">
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

    <cfinclude template="footer.cfm"/>

</div> <!-- /container -->

</body>
</html>