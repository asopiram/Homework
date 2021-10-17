//
//  main.swift
//  Homework6
//
//  Created by Дмитрий Шароваров on 14.10.2021.
//
//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

import Foundation

struct queue<Element: Comparable> {
    
    var items = [Element]()
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        print("Next queue \(items.first!)")
        return items.removeFirst()
        
    }
    
    func filter(item: Element) {
        print("Find \(items.filter{$0 == item})")
    }
    
    mutating func propertySorf() -> [Element] {
        return items.sorted(by: >)
        
    }
    
    subscript (index: Int) -> Element? {
        return (index < items.count ? items[index]: nil)
    }
    
    func printCount(){
        print(items.count)
    }
    
}

var queueue = queue<String>(items:["Russia"])
queueue.push("Germany")
queueue.push("USA")
queueue.push("France")
queueue.push("Portugese")
print(queueue.items)
print("Filtred: \(queueue.propertySorf())")

queueue.push("Austria")
queueue.filter(item: "Portugese")
queueue.printCount()

print(queueue)
if queueue[3] != nil {
    print(queueue[3]!)
} else {}

if queueue[3] != nil {
    print(queueue[1]!)
} else {}



