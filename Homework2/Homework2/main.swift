//
//  main.swift
//  Homework2
//
//  Created by Дмитрий Шароваров on 29.09.2021.
//

import Foundation

//Задание 1. Проверка четности числа

print("Задание 1")

func numberevenCheck(_ number: Int){
    if (number % 2 == 0) {
        print("Число \(number) четное")
        
    } else {
        print("Число \(number) нечетное")
    }
    
}

numberevenCheck(10)
numberevenCheck(13)
numberevenCheck(55)

//Задание 2. Делимость на 3

print()
print("Задание 2")

func number3Check(_ number: Int){
    if (number % 3 == 0) {
        print("Число \(number) делится на 3")
        
    } else {
        print("Число \(number) не делится на 3")
    }
    
}

number3Check(11)
number3Check(12)
number3Check(172)


//Задание 3. Создать массив из 100 возрастающих чисел

print()
print("Задание 3")

var array = [Int] () //создали пустой массив
for i in 0...99 {//пробежали значения от 0 до 99. по умолчанию шаг +1
    array.append(i)//добавили элемент в массив
}

print(array)


//Задание 4. Удалить из массива все четные числа и все, которые не делятся на 3

print()
print("Задание 4")

for n in array {
    if ((n % 2) == 0 || (n % 3) != 0) {
        array.remove(at: array.firstIndex(of: n)!)
        
    }
}
print("Обновленный массив \(array)")


//Задание 5. Создать функцию, которая создает массив из 50 чисел Фибоначчи

print()
print("Задание 5")


func fibonacci(_ num: Int) -> [Decimal] {
    var fibArray = [Decimal]()
    
    switch num {
    
    case 1:
        fibArray.append(0)
    case 2:
        fibArray.append(0)
        fibArray.append(1)
    default:
        fibArray.append(0)
        fibArray.append(1)
        
        var n = 2
        while n < num + 2 {
            let m = fibArray[n-1] + fibArray[n-2]
            fibArray.append(m)
            n += 1
        }
    }
    return fibArray // возвращаем массив
}

print(fibonacci(100))


// Задание 6. Создать массив из простых чисел

print()
print("Задание 6")

func primeNumber(x: Int) -> [Int]{ //Хотел сделать следующим образом: мы задаем число простых чисел, которое мы хотим получить. Для этого передаем это число в функцию.
   
    var primeNum = [Int](2...x)// создаем массив до х. Однако я не придумал как добавить к массиву число х+1 если величина массива меньше х и затем прокрутить проверку на простоту числа...
    for i in primeNum {// выбираем число i в массиве
        for g in primeNum {// выбираем число g  в массиве
            if g % i == 0 && g != i {//устанавливаем условие, что g должно нацело делиться на i и при этом g не равно i
                primeNum.remove(at: primeNum.firstIndex(of: g)!) //удаляем элемент с индексом первого найденного g, удовлетворяющего условию выше
            }
        }
    
    }

    return(primeNum)
}

print(primeNumber(x: 50))
