//
//  DelegatePractice.swift
//  TextFieldWithDelegatePattern
//
//  Created by peppermint100 on 2023/02/23.
//

import Foundation

    
protocol WheelDelegate {
    func roll()
    func stop()
}

class Wheel {
    var delegate: WheelDelegate?
    
    func roll() {
        delegate?.roll()
    }
    
    func stop() {
        delegate?.stop()
    }
}

class Car: WheelDelegate {
    func roll() {
        print("Car Wheel is rolling")
    }
    
    func stop() {
        print("Car Wheel is stopping")
    }
}

class MotorCycle: WheelDelegate {
     func roll() {
        print("MotorCycle Wheel is rolling")
    }
    
    func stop() {
        print("MotorCycle Wheel is stopping")
    }
}

// 바퀴를 돌리면 자동차가 roll함
// 바퀴를 멈추면 자동차가 stop함
func main() {
    let car = Car()
    let wheelForCar = Wheel()
    
    wheelForCar.delegate = car
    
    wheelForCar.roll()
    wheelForCar.stop()
    
    let motorCycle = MotorCycle()
    let wheelForMotorCycle = Wheel()
    
    wheelForMotorCycle.delegate = motorCycle
    
    wheelForMotorCycle.roll()
    wheelForMotorCycle.stop()
}
