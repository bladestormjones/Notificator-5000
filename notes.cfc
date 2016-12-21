component {

    function init() {
        variables.created = now();


        return this;
    }

    public query function when() {
        return variables.created;
    }

    function addNote(required string note, required string author) {

    }
}