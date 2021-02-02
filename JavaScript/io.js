const io = require("console-read-write");

async function main() {
	// Simple readline scenario
	io.write("I will print whatever you write!");
	io.write(await io.read());

	// Simple question scenario
	io.write(`Hello ${await io.ask("Who are you?")}!`);

	// Since you are not blocking the IO, you can go wild with while loops
	let saidHi = false;
	while (!saidHi) {
		io.write("Say \"Hi\" or I will repeat!");
		saidHi = await io.read() == "Hi";
	}
	io.write("You can leave now!");
}

main();
