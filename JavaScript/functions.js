// function declaration
function sum(x, y) {
	return x + y;
}

// function expression
const sub = function(x, y) {
	return x - y;
}

// named function expression
const mult = function mult(x,y) {
	return x * y;
}

// arrow functions
const div = (x, y) => x / y;

// IIFE (Immediately Invoked Function Expression)
(function() {
	console.log("Will be executed immediately!");
	console.log("Running away from the global scope!");
})()
