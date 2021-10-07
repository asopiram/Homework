//
//  main.swift
//  Homework4
//
//  Created by Дмитрий Шароваров on 06.10.2021.
//
/*
1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.
*/

import Foundation

class Car {
    let brand: String
    let productionYear: Int
    var engine: EngineStatus = .off
    var windows: WindowsStatus = .closed
    var tank: TankSpace = .empty
    
    enum EngineStatus: CustomStringConvertible {// статус двигателя
        case on, off
        
        var description: String {
            switch self {
            case .on:
                return "Двигатель запущен"
            case .off:
                return "Двигатель заглушен"
            }
        }
    }
    
    enum WindowsStatus: CustomStringConvertible { // статус окон
        case opened, closed
        
        var description: String {
            switch self {
            case .opened:
                return "Окна открыты"
            case .closed:
                return "Окна закрыты"
            }
        }
    }
    
    enum TrunkBodyType: CustomStringConvertible { // тип кузова грузовика
        case van, concreteMixer, manipulator
        
        var description: String {
            switch self {
            case .van:
                return "Обычный грузовик"
            case .concreteMixer:
                return "Бетономешалка"
            case .manipulator:
                return "Манипулятор"
                
            }
        }
    }
    
    enum SporterBodyType: CustomStringConvertible { // тип кузова спорткара
        case coupe, roadster, cabrio, supercar
        
        var description: String {
            switch self {
            case .coupe:
                return "Купэ"
            case .roadster:
                return "Роадстер"
            case .cabrio:
                return "Кабриолет"
            case .supercar:
                return "Суперкар"
            }
        }
    
    }
    
    enum SporterTransmission: CustomStringConvertible { // тип трансмисии спортакара
        case manual, auto, robotic
        
        var description: String{
            switch self {
            case .manual:
                return "механическая КПП"
            case .auto:
                return "автоматическая КПП"
            case .robotic:
                return "роботизированная КПП"
            }
        }
        
    }
    
    enum TankSpace: CustomStringConvertible {// cостояние топливного бака
        case empty, full
        
        var description: String{
            switch self {
            case .empty:
                return "Бак пустой"
            case .full:
                return "Полный бак"
            
            }
        }
    }
    
    enum FuelType: CustomStringConvertible {
        case petrol, diesel
        var description: String{
            switch self {
            case .petrol:
                return "Бензиновый двигатель"
            case .diesel:
                return "Дизельный двигатель"
            }
        }
    }
            
    enum Action { // перечисление действий
        case switchEngine(EngineStatus)
        case switchWindows(WindowsStatus)
        case loadCargo(Double)
        case attachTrunkBody(TrunkBodyType)
        case fillTank
    }
    
    init(brand: String, productionYear: Int) {
        self.brand = brand
        self.productionYear = productionYear
    }
    func perform(action: Action){}//создали пустой метод действия
    
}

//создаем класс для грузовика
class TrunkCar: Car, CustomStringConvertible {
    
    let maxCargoSpace: Double
    var currentCargoSpace: Double = 0
    var body: TrunkBodyType?
    var fuel: FuelType
    
    var description: String {
        let bodyDescription = body?.description ?? "Отцеплен"
        
        return "\(brand)\nГод выпуска: \(productionYear)\n\(fuel)\n\(tank)\nКузов: \(bodyDescription) \nЗагрузка \(currentCargoSpace)/\(maxCargoSpace)\nСостояние: \(engine) | \(windows)\n"
    }
    
    init(brand: String, productionYear: Int, fuel: FuelType, tank: TankSpace, maxCargoSpace: Double, body: TrunkBodyType?) {
        self.body = body
        self.maxCargoSpace = maxCargoSpace
        self.fuel = fuel
        super.init(brand: brand, productionYear: productionYear)
    }
    
    override func perform(action: Action) {
        switch action {
        case .switchEngine(let status):
            engine = status
        case .switchWindows(let status):
            windows = status
        case .loadCargo(let load):
            guard body != nil else {
                return
            }
   
            let fullLoad = load + currentCargoSpace
            switch fullLoad {
                case _ where fullLoad > maxCargoSpace:
                    currentCargoSpace = maxCargoSpace
            case _ where fullLoad < 0:
                currentCargoSpace = 0
            default:
                currentCargoSpace += load
            }
            
        case .attachTrunkBody(let newBody):
            self.body = newBody
            currentCargoSpace = 0
        default:
            break
        }
    }
}

//создаем класс для спортивной машины
class SportCar: Car, CustomStringConvertible {
    
    var horsePower: Int = 0
    var topSpeed: Int = 0
    var fuel: FuelType
   // var tank: TankSpace
    var transmission: SporterTransmission
    var body: SporterBodyType
    
    var description: String {
        return "\(brand)\nГод выпуска: \(productionYear)\n\(transmission)\n\(body)\n\(fuel)\n\(tank)\nHP: \(horsePower) лошадиных сил \nМаксимальная скорость: \(topSpeed) км/ч\nСостояние: \(engine) | \(windows)\n"
    }
    init(brand: String, productionYear: Int, transmission: SporterTransmission , body: SporterBodyType, fuel: FuelType, tank: TankSpace, horsePower: Int, topSpeed: Int) {
        self.horsePower = horsePower
        self.topSpeed = topSpeed
        self.fuel = fuel
        self.transmission = transmission
        self.body = body
        super.init(brand: brand, productionYear: productionYear)
    }
    
    override func perform(action: Action) {
        switch action {
        case .switchEngine(let status):
            engine = status
        case .switchWindows(let status):
            windows = status
        case .fillTank:
            print("Бак заполнен")
        default:
            break
        
        }
    }
}

var manTruck = TrunkCar(brand: "SCANIA", productionYear: 2015, fuel: .diesel, tank: .empty, maxCargoSpace: 1500, body: .manipulator)
manTruck.perform(action: .attachTrunkBody(.concreteMixer))
manTruck.perform(action: .loadCargo(1000))
manTruck.perform(action: .switchEngine(.on))
print(manTruck)

var ferrari = SportCar(brand: "Ferrari", productionYear: 2020, transmission: .manual, body: .supercar, fuel: .petrol, tank: .empty, horsePower: 550, topSpeed: 325)
ferrari.perform(action: .switchWindows(.closed))
ferrari.perform(action: .fillTank)
ferrari.perform(action: .switchEngine(.on))
print(ferrari)
