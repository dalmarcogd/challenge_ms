export abstract class BaseModel {

    private _id: Number;

    get id(): Number {
      return this._id;
    }

    set id(value: Number) {
      this._id = value;
    }

    toJSON(): string {
      const obj: any = {};

      for (const key in this) {
        if (key[0] === '_') {
            const value: any  = this[key];
          if (value) {
            if (value instanceof BaseModel) {
              obj[key.substr(1)] = value.toJSON();
            } else {
              obj[key.substr(1)] = value;
            }
          }
        }
      }
      return obj;
    }

    toString(): string {
      return this.toJSON();
    }
  }