//
//  ViewController.swift
//  Swipes & Shakes
//
//  Created by Сергей Голенко on 27.12.2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let sounds = ["bird","kwa","osel","pig","woow"]
    var player = AVAudioPlayer()
    

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
            let ramdomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            guard let path = Bundle.main.path(forResource: sounds[ramdomNumber], ofType: "mp3") else {return}
            print(path)
            let url = URL(fileURLWithPath: path)
            
            do {
                player = try AVAudioPlayer(contentsOf:url)
                player.play()
            } catch let error{
                print("error")
            }
        }
    }
    
    
    @objc func swiped(gesture:UIGestureRecognizer){
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .left:player.stop()
            case .right:player.play()
            default:
                break
            }
        }
    }

}

