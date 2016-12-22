component name="Password Hasher" hint="Hashes Passwords like you won't believe" {
	property bcrypt;

	/**
	* @hint I init this object. You actually need me!
	*/
	public password function init( )
	{
		variables.bcrypt = createObject( 'java', 'org.mindrot.jbcrypt.BCrypt' );
		return this;
	}

	/**
	* @hint Pass me a plaintext password to get an encrypted password back.
	* @password I should be a plaintext password.
	*/
	public string function encrypt( required string password )
	{
		return variables.bcrypt.hashpw( arguments.password, variables.bcrypt.genSalt( 10 ) );
	}

	/**
	* @hint Pass me a plaintext password and an encrypted string and I'll tell you if they match.
	* @password I should be a plaintext password.
	* @encryptedPassword I should be an encrypted string
	*/
	public boolean function check( required string password, required string encryptedPassword )
	{
		return variables.bcrypt.checkpw( arguments.password, arguments.encryptedPassword );
	}
}