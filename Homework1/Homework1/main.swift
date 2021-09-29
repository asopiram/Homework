
//
//  main.swift
//  Hometask-1
//
//  Created by Дмитрий Шароваров on 26.09.2021.
//

import Foundation

// Задание 1. Найти корни квадратного уравнения
print("Задание №1")

let a:Double = 2
let b:Double = -4
let c:Double = 2
print("Уравнение \(a)x^2 + \(b)x + \(c)")

var D = b * b - 4 * a * c
print("Дискриминант равен \(D)")

var x1:Double
var x2:Double

if (D > 0) {
    x1 = (-b + sqrt(D)) / 2 / a
    x2 = (-b - sqrt(D)) / 2 / a
    print("Уравнение имеет два решения x1 = \(x1), x2 = \(x2)")
    
} else if (D == 0){
    x1 = (-b) / 2 / a
    print("Уравнение имеет одно решение x = \(x1)")
    
} else {
    print("Уравнение не имеет решения")
    
}


//Задание 2. Найти гипотенузу прямоугольного треугольника, его периментр и площадь
print()
print("Задание №2")

let catet1:Double = 3
let catet2:Double = 4

let hypotenuse = sqrt(catet1 * catet1 + catet2 * catet2)
print("Гипотенуза = \(hypotenuse)")

let perimert = catet1 + catet2 + hypotenuse
print("Периметр = \(perimert)")

let square = (catet1 + catet2) / 2
print("Площадь = \(square)")

//Посчитать размер депозита через 5 лет после вложения
print()
print("Задание №3")

let deposit:Double = 10000
let percent:Double = 6
let month:UInt = 60

var profit = deposit

for _ in 1...month {
    profit += profit * percent / 12 / 100
}
 print("Через 5 лет ваш депозит составит \(profit)")

