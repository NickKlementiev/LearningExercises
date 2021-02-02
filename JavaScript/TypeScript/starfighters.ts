import {Spacecraft, ContainerShip} from "./base-ships"

export class MillenniumFalcon extends Spacecraft {
	constructor() {
		super("Hyperdrive");
	}
	jumpIntoHyperspace() {
		if (Math.random() >= 0.5) {
			super.jumpIntoHyperspace();
		}
		else {
			console.log("Failed to jump into hyperspace");
		}
	}
}

