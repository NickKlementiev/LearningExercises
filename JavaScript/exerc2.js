let obj = {
    name: "Something",
    number: 45,
    weight: 38
};

function removerPropriedade(object, element) {
    let local = {};
    Object.assign(local, object);
    delete local[element];
    return local;
};

console.log(obj);
console.log(removerPropriedade(obj, "name"));
console.log(Object.is(removerPropriedade(obj, "name"), obj));
console.log("");

function filtrarNumeros(array) {
    let local = [];
    array.forEach((element) => {
        if (typeof(element) == "number")
            local.push(element);
    });
    return local;
};

console.log(filtrarNumeros([1, "d", "3", 20, true, "Nick"]));
console.log("");

function objetoParaArray(object) {
    let array = [];
    Object.entries(object).forEach(([key, value]) => {
        array.push([key, value]);
    });
    return array;
}

console.log(objetoParaArray(obj));
console.log("");

function receberSomenteParesDeIndicesPares(array) {
    let local = [];
    let indice = 0;
    array.forEach((element) => {
        if ((indice % 2 == 0) && (element % 2 == 0))
            local.push(element);
        indice++;
    });
    return local;
};

console.log(receberSomenteParesDeIndicesPares([1, 2, 3, 4]));
console.log(receberSomenteParesDeIndicesPares([10, 70, 22, 43]));
console.log("");

function checarAnoBissexto(ano) {
    if (ano % 4 == 0) {
        if (ano % 100 != 0)
            return true;
        else if ((ano % 100 == 0) && (ano % 400 == 0))
            return true;
    }
    return false;
};

console.log(checarAnoBissexto(2020));
console.log(checarAnoBissexto(2000));
console.log(checarAnoBissexto(2100));
console.log("");

function somarNumeros(array) {
    let sum = 0;
    array.forEach((element) => {
        if (typeof(element) == "number")
            sum += element;
    });
    return sum;
}

console.log(somarNumeros([10, 10, 10]));
console.log(somarNumeros([15, 15, 15, 15]));
console.log("");

function despesasTotais(objectArray) {
    let sum = 0;
    objectArray.forEach((object) => {
        sum += object["price"];
    });
    return sum;
}

let products = [
    { name: "Jornal online", category: "Informação", price: 89.99 },
    { name: "Cinema", category: "Entretenimento", price: 150 }
];

let products2 = [
    { name: "GalaxyS20", category: "Eletrônicos", price: 3599.99 },
    { name: "Macbook Pro", category: "Eletrônicos", price: 30099.90 }
];

console.log(despesasTotais(products));
console.log(despesasTotais(products2));
console.log("");

function calcularMedia(array) {
    let sum = 0, length = 0;
    array.forEach((element) => {
        sum += element
        length++;
    });
    return (sum / length);
};

console.log(calcularMedia([0, 10]));
console.log(calcularMedia([1, 2, 3, 4, 5]));
console.log("");

function areaDoTriangulo(b, h) {
    return (b * h) / 2;
}

console.log(areaDoTriangulo(10, 15));
console.log(areaDoTriangulo(7, 9));
console.log(areaDoTriangulo(9.25, 13.1));
console.log("");

function menorNumero(array) {
    let num = array[0];
    array.forEach((element) => {
        if (element < num)
            num = element;
    });
    return num;
};

console.log(menorNumero([10, 5, 35, 65]));
console.log(menorNumero([5, -15, 50, 3]));
console.log("");

function funcaoDaSorte(x) {
    let num = Math.ceil(Math.random() * 10);
    if (x == num)
        console.log("Parabéns! O número sorteado foi o " + num);
    else
        console.log("Que pena! O número sorteado foi o " + num);
};

funcaoDaSorte(10);
funcaoDaSorte(5);
funcaoDaSorte(5);
console.log("");
