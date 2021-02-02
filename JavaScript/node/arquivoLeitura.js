const fs = require('fs');

const caminho = __dirname + "/arquivo.json";

// forma síncrona
const conteudo = fs.readFileSync(caminho, 'utf-8');
console.log(conteudo);

// forma assíncrona
fs.readFile(caminho, 'utf-8', (err, conteudo) => {
    const config = JSON.parse(conteudo);
    console.log(`${config.db.host}:${config.db.port}`);
});

const config = require('./arquivo.json');
console.log(config.db);
//console.log(typeof(config));

fs.readdir(__dirname, (err, arquivos) => {
    console.log("Conteúdo da pasta atual:");
    console.log(arquivos);
});
