//
//  main.swift
//  GameEngine
//
//  Created by johan on 07/04/2017.
//  Copyright © 2017 ilantz. All rights reserved.
//

import Foundation


print("Welcome to the SquaresGame!")

var myBoard = Board()
myBoard.clear()

myBoard.initialize()

myBoard.show()

var command:String;


repeat {
    print ("Do your move: ")
    
    command = readLine()!
    
    if command == "w" || command == "W" {
        myBoard.moveUp()
    } else if command == "a" || command == "A" {
        myBoard.moveLeft()
    } else if command == "s" || command == "S" {
        myBoard.moveDown()
    } else if command == "d" || command == "D" {
        myBoard.moveRight()
    }
    if myBoard.hasAnyZeros() {
        myBoard.addBrick()
    }
    
    myBoard.show()
} while (command != "q")

