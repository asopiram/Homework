//
//  main.swift
//  Homework 7
//
//  Created by Дмитрий Шароваров on 17.10.2021.
//

import Foundation


enum carRaceError: Error {
    case noFuel(fuelNeed: Int)
    case noFreeCar
    case noCar

}

struct Car {
    var fuel: Int
    var car: Int
}

class raceCar {
    var garage = ["Nissan GTR": Car(fuel: 74, car: 3),
    "Mercedes AMG GT": Car(fuel: 65, car: 2),
    "BMW M5 Competition": Car(fuel: 68, car: 3),
    "Audi RS6": Car(fuel: 73, car: 2)]

    var carFuel = 0

    func errors(carModel name: String) throws {
        guard let cars = garage[name] else{
            throw carRaceError.noCar
        }

        guard cars.car > 0 else {
            throw carRaceError.noCar
        }

        guard cars.fuel <= carFuel else {
            throw carRaceError.noFuel(fuelNeed: 20)
        }

        carFuel -= cars.fuel

        var someCar = cars
        someCar.fuel -= 15
        garage[name] = someCar

        print("Сел за руль автомобиля \(name)")
    }
}

let favoriteCar = ["Igor": "Nissan GTR", "Pavel": "Mercedes AMG GT", "Oleg": "BMW M5 Competition"]

func CarRacer(player: String, Car: raceCar) throws {
    let playerName = favoriteCar[player] ?? "Nissan GTR"
    try Car.errors(carModel: playerName)

}

var player = raceCar()
player.carFuel = 55

do {
    try CarRacer(player: "Igor", Car: player)
} catch carRaceError.noFreeCar {
    print("Нет свободного авто")
} catch carRaceError.noCar {
    print("В гараже нет такого авто")
} catch carRaceError.noFuel(let fuelneed) {
    print("Недостаточно топлива, нужно залить еще \(fuelneed) литров.")
}
