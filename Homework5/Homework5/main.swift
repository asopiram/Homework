//
//  main.swift
//  Homework5
//
//  Created by Дмитрий Шароваров on 10.10.2021.
//
/*
1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести сами объекты в консоль.
 */

import Foundation

enum engine {
    case stop, run
}

enum windows {
    case open, close
}

enum tank{
    case full, empty
}


protocol Car: AnyObject {//AnyObject нужен, когда мы хоти использовать экземпляры любого класса. Таким образом мы можем обращаться к enum, который находится вне протокола
    var model: String {get}
    var year: Int {get}
    var engine: engine {get set}
    var windows: windows {get set}
    var tank: tank {get set}
    
    
}


extension Car {
    func Engine (engineStatus: engine) {
        switch engineStatus {
        case .stop:
            print("\(model): Двигатель заглушен")
            self.engine = .stop
        case .run:
            print("\(model): Двигатель запущен")
            self.engine = .run
        }
    }
    
    func Windows (windowsStatus: windows) {
        switch windowsStatus {
        case .open:
            print("\(model): Окна открыты")
            self.windows = .open
        case .close:
            print("\(model): Окна закрыты")
            self.windows = .close
        }
    }
    
    func Tank (tankStatus: tank) {
        switch tankStatus {
        case .full:
            print("\(model): Бак заполнен")
            self.tank = .full
        case .empty:
            print("\(model): Бак пустой")
            self.tank = .empty
        }
    }
}

enum fuel {
    case diesel, gasoline
}

enum body {
    case targa, cabrio, coupe
}

protocol TrunkCar: Car {//протокол для грузовиков - тип топлива
    var fuel: fuel {get set}
}

protocol SportCar: Car {//протокол для спорткара - тип кузова
    var body: body {get set}
}


class trunkCar: TrunkCar {
    var model: String
    var year: Int
    var windows: windows
    var engine: engine
    var tank: tank
    var fuel: fuel

    init(model: String, year: Int, fuel: fuel){
        self.model = model
        self.year = year
        self.windows = .close
        self.engine = .stop
        self.tank = .empty
        self.fuel = fuel
    }
}

class sportCar: SportCar {
    var model: String
    var year: Int
    var windows: windows
    var engine: engine
    var tank: tank
    var body: body

    init(model: String, year: Int, body: body){
        self.model = model
        self.year = year
        self.windows = .close
        self.engine = .stop
        self.tank = .empty
        self.body = body
    }
}

extension trunkCar: CustomStringConvertible {
    var description: String {
        return "Авто \(model). Статус двигателя: \(engine). Статус окон: \(windows). Бак: \(tank). Тип топлива: \(fuel)"
    }
}

extension sportCar: CustomStringConvertible {
    var description: String {
        return "Авто \(model). Статус двигателя: \(engine). Статус окон: \(windows). Бак: \(tank). Тип кузова: \(body)"
    }
}

var SportCar1 = sportCar(model: "Lamborghini", year: 2021, body: .cabrio)
SportCar1.Tank(tankStatus: .full)
SportCar1.Engine(engineStatus: .run)
print(SportCar1.description)
var SportCar2 = sportCar(model: "Bugatti", year: 2020, body: .targa)
SportCar1.Tank(tankStatus: .full)
SportCar2.Windows(windowsStatus: .open)
print(SportCar2.description)

var TrunkCar1 = trunkCar(model: "MAN", year: 2015, fuel: .diesel)
TrunkCar1.Tank(tankStatus: .full)
print(TrunkCar1.description)
var TrunkCar2 = trunkCar(model: "SCANIA", year: 2012, fuel: .gasoline)
TrunkCar2.Windows(windowsStatus: .open)
print(TrunkCar2.description)

