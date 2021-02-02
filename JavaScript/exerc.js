function cumprimentar(nome) {
    return `Olá, ${nome}!`;
}

console.log(cumprimentar("Nick"));

function dias(idade) {
    return idade * 365;
}

console.log(`Eu tenho 70 anos, que são ${dias(70)} dias`);

function calcularSalario(salario) {
    return `Salário igual a R\$${salario}`;
}

console.log(calcularSalario(1300.35));

function nomeDoMes(numero) {
    const nomes = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto",
                "Setembro", "Outubro", "Novembro", "Dezembro"];
    if (numero >= 1 || numero <= 12)
        return nomes[numero - 1];
    else
        return null;
}

console.log(nomeDoMes(12));

let result = (x, y) => (x > y) || (x === y);
console.log("");
console.log(result(1, 2));
console.log(result(4, 1));
console.log(result(0, "0"));

function inverso(x) {
    if (typeof(x) == "number")
        return -x;
    else if (typeof(x) == "boolean")
        return !x;
    else
        return "Boolean or number expected, parameter is of type " + typeof(x);
}

console.log("");
console.log(inverso(3));
console.log(inverso(false));
console.log(inverso("Nick"));

function estaEntre(number, min, max, inclusive) {
    return inclusive == true ? (number >= min) && (number <= max) : (number > min) && (number < max);
}

console.log("");
console.log(estaEntre(10, 10, 20));
console.log(estaEntre(15, 10, 20));
console.log(estaEntre(10, 10, 20, true));

function multiplicar(x, y) {
    if (x > 0 && y > 0) {
        let sum = 0;
        for (let i = 0; i < y; i++)
            sum += x;
        return sum;
    }
    else
        return "One or more parameters are negative";
}

console.log("");
console.log(multiplicar(2, 3));
console.log(multiplicar(2, -3));

function repetir(element, times) {
    let array = [];
    for (let i = 0; i < times; i++)
        array.push(element);
    return array;
}

console.log("");
console.log(repetir("console", 2));
console.log(repetir(7, 2));

function simboloMais(times) {
    let string = "";
    for (let i = 0; i < times; i++)
        string += "+";
    return string;
}

console.log("");
console.log(simboloMais(2));
console.log(simboloMais(4));

function receberPrimeiroEUltimoElemento(x) {
    let local = [];
    local.push(x[0]);
    local.push(x[x.length - 1]);
    return local;
}

console.log(receberPrimeiroEUltimoElemento([0, 1, 2]));
console.log(receberPrimeiroEUltimoElemento(["a", "b", "c"]));
