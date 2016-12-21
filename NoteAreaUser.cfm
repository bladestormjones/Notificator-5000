<cfoutput>
    <cfset date = DateFormat( #myQuery2.timestamp# )/>
    <cfset time = TimeFormat( #myQuery2.timestamp# )/>
    <cfset datetime = #date# & " " & #time#/>
    <h4 id="usernote_#myQuery2.id#">Note #myquery2.id#</h4>
<blockquote>#myquery2.note#</blockquote>#datetime#<br>
<hr>
<div style='float:left'>
<form action="delete_note.cfm" method="post">
        <input type="hidden" name="deleteID" value="#myquery2.id#">
        <input type="hidden" name="usernote" value="yes">
    <button type="submit" class="btn btn-danger">
        <i class="fa fa-trash-o fa-lg"> Delete</i>
    </button>
</form>
</div>
<div style='float:left'>
    &nbsp;
</div>
<div style='float:left'>
<form action="edit.cfm" method="post">
        <input type="hidden" name="editID" value="#myquery2.id#">
        <input type="hidden" name="usernote" value="yes">
    <button type="submit" class="btn btn-success">
        <i class="fa fa-pencil-square-o fa-lg"> Edit</i>
    </button>
</form>
</div>
<br><br>
</cfoutput>