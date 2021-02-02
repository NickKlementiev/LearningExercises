const person = {
	name: "Rebecca",
	age: 2,
	weight: 13
}

console.log(Object.keys(person));
console.log(Object.values(person));
console.log(Object.entries(person));

Object.entries(person).forEach(([key, value]) => {
	console.log(`${key}: ${value}`);
})
/*Object.entries(person).forEach(e => {
	console.log(`${e[0]}: ${e[1]}`);
})*/

Object.defineProperty(person, "dateBorn", {
	enumerable: false,
	writable: false,
	value: "01/01/2019"
});

person.dateBorn = "01/01/2017";
console.log(person.dateBorn);
console.log(Object.keys(person));

// Object.assign
const dest = { a: 1 }
const o1 = { b: 1 }
const o2 = { c: 3, a: 4 }
const obj = Object.assign(dest, o1, o2);

console.log(obj);
Object.freeze(obj);
obj.c = 1234;
console.log(obj);
