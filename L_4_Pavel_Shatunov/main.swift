//
//  main.swift
//  L_4_Pavel_Shatunov
//
//  Created by Павел Шатунов on 18.03.2021.
//

import Foundation

enum TurboMode: String {
    case on = "включен"
    case off = "выключен"
}
enum WindowsStatus: String {
    case open = "открыты"
    case close = "закрыты"
}
enum EngineStatus: String {
    case on = "запущен"
    case off = "заглушен"
}
enum StatusChange {
    case openWindow, closeWindow, startEngine, stopEngine
}
enum Trailer: String {
    case link = "сцеплен"
    case disengage = "расцеплен"
}

class Car {
    let brand: String
    let releaseYear: Int
    var engineStatus: EngineStatus
    var windowStatus: WindowsStatus
    init(brand: String, releaseYear: Int, engineStatus: EngineStatus, windowStatus: WindowsStatus) {
        self.brand = brand
        self.releaseYear = releaseYear
        self.engineStatus = engineStatus
        self.windowStatus = windowStatus
    }
    func windowsAction(act: WindowsStatus) {}
    func engineAction(act: EngineStatus) {}
}
class SportCar: Car {
    var turbo: TurboMode
    init(brand: String, releaseYear: Int, engineStatus: EngineStatus, windowStatus: WindowsStatus, turbo: TurboMode) {
        self.turbo = turbo
        super.init(brand: brand, releaseYear: releaseYear, engineStatus: engineStatus, windowStatus: windowStatus)
    }
    override func windowsAction(act: WindowsStatus) {
        windowStatus = act
        print("Теперь ваши окна \(windowStatus.rawValue)")
    }
    override func engineAction(act: EngineStatus) {
        engineStatus = act
        print("Теперь ваш двигатель \(engineStatus.rawValue)")
    }
    func turboMode(act: TurboMode) {
        turbo = act
        print("Турбо режим \(turbo.rawValue)")
    }
}
class Truck: Car {
    var trailer: Trailer
    init(brand: String, releaseYear: Int, engineStatus: EngineStatus, windowStatus: WindowsStatus, trailer: Trailer) {
        self.trailer = trailer
        super.init(brand: brand, releaseYear: releaseYear, engineStatus: engineStatus, windowStatus: windowStatus)
    }
    func iWant(to: StatusChange) {
        switch to {
        case .openWindow:
            windowStatus = .open
            print("Ваши окна \(windowStatus.rawValue)")
        case .closeWindow:
            windowStatus = .close
            print("Ваши окна \(windowStatus.rawValue)")
        case .startEngine:
            engineStatus = .on
            print("Ваш двигатель \(engineStatus.rawValue)")
        case .stopEngine:
            engineStatus = .off
            print("Ваш двигатель \(engineStatus.rawValue)")
        }
    }
    func hookUp(act: Trailer) {
        trailer = act
        print("Ваш тягач \(trailer.rawValue)")
    }
}

var astonMartin = SportCar(brand: "Aston Martin", releaseYear: 2020, engineStatus: .off, windowStatus: .close, turbo: .off)
astonMartin.engineAction(act: .on)
astonMartin.windowsAction(act: .open)
astonMartin.turboMode(act: .on)

var man = Truck(brand: "MAN", releaseYear: 2012, engineStatus: .on, windowStatus: .close, trailer: .disengage)
man.hookUp(act: .link)
man.iWant(to: .stopEngine)
man.iWant(to: .openWindow)
