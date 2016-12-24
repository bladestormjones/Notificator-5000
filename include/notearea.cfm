<cfoutput>
    <cfloop query="myQuery">
        <h4 id="note_#id#">Note #id#</h4>
        <blockquote>#note#</blockquote>#DateTimeFormat( #timestamp# )#<br>
        <hr>
        <div style='float:left'>
        <form action="/process/done.cfm" method="post">
                <input type="hidden" name="doneID" value="#id#">
                <button type="submit"#done EQ 'FALSE' ? ' class="btn btn-danger"' : ' class="btn btn-success"'#>
                <i #done EQ 'FALSE' ? ' class="fa fa-times fa-lg"' : ' class="fa fa-check fa-lg"'#></i> Done?
        </button>
        </form>
        </div>
        <div style='float:left'>
            &nbsp;
        </div>
        <div style='float:left'>
            <form action="edit.cfm" method="post">
                <input type="hidden" name="editID" value="#id#">
                <button type="submit" class="btn btn-success">
                    <i class="fa fa-pencil-square-o fa-lg"></i> Edit
                </button>
            </form>
        </div>
        <div style='float:left'>
            &nbsp;
        </div>
        <div style="float:left">
        <form action="/reminders.cfm" method="get">
                <input type="hidden" name="noteID" value="#id#">
                <button type="submit" class="btn btn-primary">
                <i class="fa fa-envelope-o fa-lg"></i> Reminders
        </button>
        </form>
        </div>
        <div style='float:left'>
            &nbsp;
        </div>
        <div style='float:left'>
        <form action="/process/delete_note.cfm" method="post">
                <input type="hidden" name="deleteID" value="#id#">
            <button type="submit" class="btn btn-danger">
                <i class="fa fa-trash-o fa-lg"></i> Delete
            </button>
        </form>
        </div>
        <br><br>
    </cfloop>
</cfoutput>