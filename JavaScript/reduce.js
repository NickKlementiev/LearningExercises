Array.prototype.reduce2 = function(callback, startValue) {
	if (startValue != undefined) {
		let current = startValue;
		for (let i = 0; i < this.length; i++) {
			current = callback(current, this[i], i, this);
		}
		return current;
	}
	else {
		let current = this[0];
		for (let i = 1; i < this.length; i++) {
			current = callback(current, this[i], i, this);
		}
		return current;
	}
}

const students = [
	{name: "John", grade: 7.3, scholarship: false},
	{name: "Mary", grade: 9.2, scholarship: true},
	{name: "Peter", grade: 9.8, scholarship: false},
	{name: "Juniper", grade: 8.7, scholarship: true}
];

// Challenge 1: Do all the students have scholarships?
const allScholarship = students.map(student => student.scholarship).reduce2(function(current, next) {
	return current && next;
});
console.log("All:", allScholarship);

// Challenge 2: Do any of the students have scholarships?
const anyScholarship = students.map(student => student.scholarship).reduce2(function(current, next) {
	return current || next;
});
console.log("Any:", anyScholarship);

const numbers = [1, 2, 3, 4, 5];

console.log(numbers.reduce2(function(current, next) {
	return current + next;
}));
console.log(numbers.reduce2(function(current, next) {
	return current + next;
}, 10));
