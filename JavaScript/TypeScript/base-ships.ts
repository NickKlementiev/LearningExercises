interface ContainerShip {
	cargoContainers: number
}

class Spacecraft {
	constructor(public propulsor: string) {
		this.propulsor = propulsor;
	}
	jumpIntoHyperspace() {
		console.log(`Entered hyperspace with ${this.propulsor}`);
	}
}

export {Spacecraft, ContainerShip};
