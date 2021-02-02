var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var Person = /** @class */ (function () {
    function Person(personName, hairColor) {
        this.personName = personName;
        this.hairColor = hairColor;
        this.personName = personName;
        this.hairColor = hairColor;
    }
    Person.prototype.speak = function () {
        console.log("Hello! My name is " + this.personName);
    };
    return Person;
}());
var p1 = new Person("Robert", "Black");
console.log(p1);
p1.speak();
var Father = /** @class */ (function (_super) {
    __extends(Father, _super);
    function Father(personName, hairColor, wifeName) {
        var _this = _super.call(this, personName, hairColor) || this;
        _this.wifeName = wifeName;
        _this.wifeName = wifeName;
        return _this;
    }
    return Father;
}(Person));
var f1 = new Father("Peter", "Blonde", "Jessica");
f1.speak();
