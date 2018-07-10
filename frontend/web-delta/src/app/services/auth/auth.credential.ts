export class AuthCredential {
    private _email: String;
    private _username: String;
    private _password: String;

    constructor(email: String, password: String) {
      this.email = email;
      this.username = email ? email.split('@')[0] : undefined;
      this.password = password;
    }

    public get email(): String {
      return this._email;
    }

    public set email(email: String) {
      this._email = email;
    }

    public get username(): String {
      return this._username;
    }

    public set username(username: String) {
      this._username = username;
    }

    public get password(): String {
      return this._password;
    }

    public set password(password: String) {
      this._password = password;
    }
  }
  