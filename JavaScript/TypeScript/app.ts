import {Spacecraft, ContainerShip} from "./base-ships";
import {MillenniumFalcon} from "./starfighters";

import * as _ from "lodash";

console.log(_.pad("Typescript Examples", 50, "="));

let ship = new Spacecraft("Mediumdrive");

let falcon = new MillenniumFalcon;

ship.jumpIntoHyperspace();
falcon.jumpIntoHyperspace();
