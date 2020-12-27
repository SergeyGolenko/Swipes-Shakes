//
//  ViewController.swift
//  Swipes & Shakes
//
//  Created by Сергей Голенко on 27.12.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake{
            print("I shaking now")
        }
    }
    
    
    @objc func swiped(gesture:UIGestureRecognizer){
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .left:print("swipe left")
            case .right:print("swipe right")
            default:
                break
            }
        }
    }

}

