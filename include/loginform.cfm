<div align="right">
    <cfoutput>
        <form action="#CGI.script_name#?#CGI.query_string#" method="Post">
        <table>
            <tr>
                <td>user name:</td>
                <td><input type="text" name="j_username" required></td>
            </tr>
            <tr>
                <td>password:</td>
                <td><input type="password" name="j_password" required></td>
            </tr>
        </table>
        <input type="submit" value="Log In">
    </form>
    </cfoutput>
</div>