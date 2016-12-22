<cfscript>
	/* Create the object */
	variables.passwordObj = new components.password();

	/* Have a look at it first, it's got hints which tell you what everything does */
	writeDump( variables.passwordObj );

	/* Let's set a password... */
	variables.plaintextPW = 'ThisSquirrelIsAngry';

	/* ...and encrypt it. */
	variables.encryptedPW = variables.passwordObj.encrypt( variables.plaintextPW );

	/* Dump them, so we can see what we have */
	writeDump( 'Plaintext: ' & variables.plaintextPW );
	writeDump( 'Encrypted: ' & variables.encryptedPW );

	/* Now check if they match! */
	variables.check_isTheSame = variables.passwordObj.check( variables.plaintextPW, variables.encryptedPW );
	variables.check_isNotTheSame = variables.passwordObj.check( 'SomethingElseCompletely', variables.encryptedPW );

	writeDump( 'Is the Same: ' & variables.check_isTheSame );
	writeDump( 'Is not the Same: ' & variables.check_isNotTheSame );

	/*
		So what now?
		1. Well, you'll want to store encryptedPW in your database.
		2. If a user tries to log in, select based on username Only and grab the encrypted pass from the DB.
		3. Then check if the plaintext password submitted during login matches the encrypted pass in the DB using the 'check' function.
	*/
</cfscript>