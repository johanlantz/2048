//
//  Board.swift
//  GameEngine
//
//  Created by johan on 07/04/2017.
//  Copyright © 2017 ilantz. All rights reserved.
//

import Foundation

class Board {
    
    var score:Int = 0
    
    var board:[[Int]] = [[2,2,2,2],
                         [2,2,2,2],
                         [2,2,2,2],
                         [2,2,2,2]]
    
    func clear() {
        for row in 0...3 {
            for column in 0...3 {
                board[row][column] = 0
            }
        }
        score = 0
    }
    
    func printScore () {
        print("your score is: " + String(score))
    }
    
    func show() {
        for row in board {
            print (row)
        }
        print("---------------------")
    }
 
    func initialize() {
        var rowIndex = Int(arc4random_uniform(3))
        var columnIndex = Int(arc4random_uniform(3))
        board[rowIndex][columnIndex] = 2
        
        repeat {
            rowIndex = Int(arc4random_uniform(3))
            columnIndex = Int(arc4random_uniform(3))
        } while (board[rowIndex][columnIndex] == 2)
        
        board[rowIndex][columnIndex] = 2
    }
    
    func moveUp(isUserAction:Bool = true) {
        //Only need to check rows 1->3 moving upwards
        var didMove = false;
        for column in 0...3 {
            var nextRowCanMerge = true
            for row in (1...3).reversed() {
                if board[row][column] == 0 {
                    continue
                } else {
                    //we have a number in this row, check if previous is the same or 0
                    if board[row-1][column] == 0 {
                        board[row-1][column] = board[row][column];
                        board[row][column] = 0;
                        didMove = true;
                        nextRowCanMerge = true
                    } else if board[row-1][column] == board[row][column] && isUserAction {
                        if nextRowCanMerge {
                            score = score + (board[row-1][column] + board[row][column])
                            board[row-1][column] = board[row-1][column] + board[row][column]
                            board[row][column] = 0;
                            didMove = true;
                            nextRowCanMerge = false
                        } else {
                            nextRowCanMerge = true
                        }
                    } else {
                        nextRowCanMerge = true
                    }
                }
            }
        }
        
        //If we have merged bricks the recursive call can not automerge new options, only fill slots that have a 0
        if (didMove) {
            moveUp(isUserAction: false)
        }
    }
    
    func moveDown(isUserAction:Bool = true) {
        //Only need to check rows 0->2 moving downward
        var didMove = false;
        for column in 0...3 {
            var nextRowCanMerge = true
            for row in (0...2) {
                if board[row][column] == 0 {
                    continue
                } else {
                    //we have a number in this row, check if next is the same or 0
                    if board[row+1][column] == 0 {
                        board[row+1][column] =  board[row][column];
                        board[row][column] = 0;
                        didMove = true;
                        nextRowCanMerge = true
                    } else if board[row+1][column] == board[row][column] && isUserAction {
                        if nextRowCanMerge {
                            score = score + (board[row+1][column] + board[row][column])
                            board[row+1][column] = board[row+1][column] + board[row][column];
                            board[row][column] = 0;
                            didMove = true;
                            nextRowCanMerge = false
                        } else {
                            nextRowCanMerge = true
                        }
                    } else {
                        nextRowCanMerge = true
                    }
                }
            }
        }
        
        if (didMove) {
            moveDown(isUserAction: false)
        }
    }
    
    func moveRight(isUserAction:Bool = true) {
        //Only need to check column 0->2 moving right
        var didMove = false;
        for row in 0...3 {
            var nextColumnCanMerge = true
            for column in (0...2) {
                if board[row][column] == 0 {
                    continue
                } else {
                    //we have a number in this column, check if next is the same or 0
                    if board[row][column+1] == 0 {
                        board[row][column+1] =  board[row][column];
                        board[row][column] = 0;
                        didMove = true;
                        nextColumnCanMerge = true
                    } else if board[row][column+1] == board[row][column] && isUserAction {
                        if nextColumnCanMerge {
                            score = score + (board[row][column+1] + board[row][column])
                            board[row][column+1] = board[row][column+1] + board[row][column];
                            board[row][column] = 0;
                            didMove = true;
                            nextColumnCanMerge = false
                        } else {
                            nextColumnCanMerge = true
                        }
                    } else {
                        nextColumnCanMerge = true
                    }
                }
            }
        }
        
        if (didMove) {
            moveRight(isUserAction: false)
        }
    }
    
    func moveLeft(isUserAction:Bool = true) {
        //Only need to check column 0->2 moving right
        var didMove = false;
        for row in 0...3 {
            var nextColumnCanMerge = true
            for column in (1...3).reversed() {
                if board[row][column] == 0 {
                    continue
                } else {
                    //we have a number in this column, check if next is the same or 0
                    if board[row][column-1] == 0 {
                        board[row][column-1] =  board[row][column];
                        board[row][column] = 0;
                        didMove = true;
                        nextColumnCanMerge = true
                    } else if board[row][column-1] == board[row][column] && isUserAction {
                        if nextColumnCanMerge {
                            score = score + (board[row][column-1] + board[row][column])
                            board[row][column-1] = board[row][column-1] + board[row][column];
                            board[row][column] = 0;
                            didMove = true;
                            nextColumnCanMerge = false
                        } else {
                            nextColumnCanMerge = true
                        }
                    } else {
                        nextColumnCanMerge = true
                    }
                }
            }
        }
        
        if (didMove) {
            moveLeft(isUserAction: false)
        }
    }
    
    func addBrick() {
        var rowIndex: Int
        var columnIndex: Int
        
        repeat {
            rowIndex = Int(arc4random_uniform(4))
            columnIndex = Int(arc4random_uniform(4))
            print ("hello")
        } while (board[rowIndex][columnIndex] != 0)
        
        board[rowIndex][columnIndex] = (Int(arc4random_uniform(2)) + 1) * 2
    }
    
    func hasAnyZeros() -> Bool {
        for row in 0...3 {
            for column in 0...3 {
                if board[row][column] == 0 {
                    return true
                }
            }
        }
        print ("no Zeroes")
        return false 
    }
} //end of class
