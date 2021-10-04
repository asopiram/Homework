//
//  main.swift
//  Homework3
//
//  Created by Дмитрий Шароваров on 04.10.2021.
//

import Foundation

enum car: String{
    case Sport, Trunk
}

enum Engine: String{
    case on = "ON"
    case off = "OFF"
    
}

enum actionEngine{
    case start, turnOff
    
}

enum Windows: String {
    case opened = "opened"
    case closed = "closed"
    
    
}

enum Trunk {
    case emptyTrunk(empty: String)
    case fullTrunk(full: String)
    case halfTrunk(kg: Double)

}

struct Car {
    var carType: car
    var brand: String
    var year: Int
    var trunkVolume: Double
    var trunk: Trunk
    var engine: Engine
    var windows: Windows
    
    mutating func actionEngine(action: Engine){
        switch action {
        case .off: print("\(brand) engine now is \(action.rawValue)")
            self.engine = .off
        case .on: print("\(brand) engine now is \(action.rawValue)")
            self.engine = .on
        }
       
    }
    mutating func actionWindows(action: Windows){
        switch action {
        case .opened: print("\(brand) windows now are \(action.rawValue)")
            self.engine = .off
        case .closed: print("\(brand) windows now are \(action.rawValue)")
            self.engine = .on
        }

    }
    func statusEngine(){
        print("\(brand) engine is \(engine.rawValue)")
        
    }
    func statusWindows(){
        print("\(brand) windows are \(windows.rawValue)")
        
    }
    
    func description(){
        print("\(carType) vehicle \(brand), \(year) year of release. Engine is \(engine.rawValue). Trunk is \(trunk). Windows are \(windows)")
        
    }
}

var vehicle1 = Car(carType: .Sport, brand: "Nissan", year: 2000, trunkVolume: 250, trunk: .emptyTrunk(empty: "empty"), engine: .on, windows: .opened)
var vehicle2 = Car(carType: .Sport, brand: "Buick", year: 2021, trunkVolume: 250, trunk: .halfTrunk(kg: 150), engine: .off, windows: .closed)
var vehicle3 = Car(carType: .Trunk, brand: "Volvo", year: 2015, trunkVolume: 5000, trunk: .fullTrunk(full: "FULL LOAD"), engine: .off, windows: .closed)

vehicle1.description()
vehicle2.description()
vehicle3.description()

vehicle1.actionEngine(action: .off)
vehicle2.actionEngine(action: .on)
 
vehicle1.actionWindows(action: .closed)
vehicle2.actionWindows(action: .opened)

vehicle1.statusEngine()
vehicle1.statusWindows()

vehicle2.statusEngine()
vehicle2.statusWindows()
