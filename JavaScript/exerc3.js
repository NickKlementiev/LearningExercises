function contarPalavras(string) {
    let words = 0, index = 0;
    if ((string.length != 0) && (string[0] != "")) {
        words++;
        for (index; index < string.length; index++) {
            if ((index != 0) && (string[index] == " ") && (index != string.length - 1))
                words++;
        }
    }
    return words;
};

console.log(contarPalavras("Sou uma frase"));
console.log(contarPalavras("Me divirto aprendendo a programar"));
console.log("");

function contarCaractere(caractere, string) {
    let quant = 0;
    for (let index = 0; index < string.length; index++) {
        if (string[index] == caractere)
            quant++;
    }
    return quant;
};

console.log(contarCaractere("r", "A sorte favorece os audazes"));
console.log(contarCaractere("c", "Conhece-te a ti mesmo"));
console.log("");

function buscarPalavrasSemelhantes(busca, stringArray) {
    let matching = [];
    for (let i = 0; i < stringArray.length; i++) {
        let current = stringArray[i];
        for (let index = 0; index < current.length; index++) {
            if (current[index] == busca[0]) {
                let quant = 0;
                for (let letter = 0; letter < busca.length; letter++) {
                    if (busca[letter] == current[index + letter])
                        quant++;
                }
                if (quant == busca.length) {
                    matching.push(current);
                }
            }
        }
    }
    return matching;
};

console.log(buscarPalavrasSemelhantes("pro", ["programação", "mobile", "profissional"]));
console.log(buscarPalavrasSemelhantes("python", ["javascript", "c++", "java"]));
console.log("");

function removerVogais(string) {
    let cleared = "";
    for (let i = 0; i < string.length; i++) {
        if ((string[i] != "a") && (string[i] != "A")
        && (string[i] != "e") && (string[i] != "E")
        && (string[i] != "i") && (string[i] != "I")
        && (string[i] != "o") && (string[i] != "O")
        && (string[i] != "u") && string[i] != "U")
            cleared += string[i];
    }
    return cleared;
};

console.log(removerVogais("Nikita"));
console.log(removerVogais("Cod3r"));
console.log(removerVogais("Fundamentos"));
console.log("");

function inverterObjeto(object) {
    let inverted = {};
    Object.entries(object).forEach(([key, value]) => {
        inverted[value] = key;
    });
    return inverted;
};

console.log(inverterObjeto({ 1: "a", 2: "b", 3: "c" }));
console.log(inverterObjeto(inverterObjeto({ 1: "a", 2: "b", 3: "c" })))
console.log("");

function filtrarPorQuantidadeDeDigitos(array, length) {
    let cleared = [];
    array.forEach((element) => {
        let converted = "";
        converted += element;
        if (converted.length == length)
            cleared.push(element);
    });
    return cleared;
};


console.log(filtrarPorQuantidadeDeDigitos([38, 2, 365, 10, 125, 11], 2));
console.log(filtrarPorQuantidadeDeDigitos([5, 9, 1, 125, 11], 1));
console.log("");

function segundoMaior(array) {
    let biggest = array[0], second = 0;
    array.forEach((element) => {
        if (element > biggest)
            biggest = element;
    });
    array.forEach((element) => {
        if ((element > second) && (element < biggest))
            second = element
        
    });
    return second;
}

console.log(segundoMaior([12, 16, 1, 5]));
console.log(segundoMaior([8, 4, 5, 6]));
console.log("");

alunos = {
    Joao: [8, 7.6, 8.9, 6],
    Mariana: [9, 6.6, 7.9, 8],
    Carla: [7, 7, 8, 9]
};

function receberMelhorEstudante(object) {
    let best = {};
    Object.entries(object).forEach(([key, value]) => {
        let sum = 0, quant = 0;
        value.forEach((grade) => {
            sum += grade;
            quant++;
        });
        let avg = sum / quant;
        if ((best['nome'] == undefined) || (best['media'] < avg)) {
            best['nome'] = key;
            best['media'] = avg;
        }
    });
    return best;
}

console.log(receberMelhorEstudante(alunos));
