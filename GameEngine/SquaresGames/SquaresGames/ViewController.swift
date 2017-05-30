//
//  ViewController.swift
//  SquaresGames
//
//  Created by johan on 11/04/2017.
//  Copyright © 2017 ilantz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var myBoard = Board()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myBoard.show()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }

    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
                myBoard.moveRight()
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
                myBoard.moveDown()
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                myBoard.moveLeft()
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
                myBoard.moveUp()
            default:
                break
            }
            if myBoard.hasAnyZeros() {
                myBoard.addBrick()
            }
            myBoard.show()
            myBoard.printScore()
        }
    }


}

