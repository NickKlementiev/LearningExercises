// Flatmap

const school = [{
	name: "Class M1",
	students: [{
		nome: "John",
		grade: 8.1
	}, {
		name: "Mary",
		grade: 9.3
	}]
}, {
	name: "Class M2",
	students: [{
		name: "Rebecca",
		grade: 8.9
	}, {
		name: "Robert",
		grade: 7.3
	}]
}];

const getStudentGrade = student => student.grade;
const getClassGrades = c => c.students.map(getStudentGrade);

const grades1 = school.map(getClassGrades);
console.log(grades1);

Array.prototype.flatMap = function(callback) {
	return Array.prototype.concat.apply([], this.map(callback));
}

const grades2 = school.flatMap(getClassGrades);
console.log(grades2);
