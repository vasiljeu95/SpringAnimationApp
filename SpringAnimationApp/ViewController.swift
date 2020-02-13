//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by Stepan Vasilyeu on 2/12/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet var coreAnimationView: UIView!
    @IBOutlet var springAnimationView: SpringView!
    @IBOutlet var springAnimationButton: SpringButton!
    
    private var originCoordinate: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        originCoordinate = coreAnimationView.frame.origin.y
        springAnimationView.animate()
        springAnimationButton.animate()
    }

    @IBAction func startCoreAnimationButton(_ sender: UIButton) {
        sender.pulsate()
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.autoreverse, .repeat],
                       animations: {
                        // для того чтобы вьюха с анимацией не "уезжала" за свои границы
                        if self.coreAnimationView.frame.origin.y == self.originCoordinate {
                            self.coreAnimationView.frame.origin.y += 40
                        } else {
                            self.coreAnimationView.frame.origin.y -= 40
                        }
                        
        })
    }
    
    @IBAction func springButton(_ sender: Any) {
        
        springAnimationView.animation = "pop"
        springAnimationView.curve = "easeIn"
        springAnimationView.force = 2
        springAnimationView.duration = 1
        springAnimationView.velocity = 0.5
        springAnimationView.animate()
        
        springAnimationButton.animation = "squeezeUp"
        springAnimationButton.curve = "easeIn"
        springAnimationButton.force = 1
        springAnimationButton.duration = 2
        springAnimationButton.animate()
    }
    
    
    
    //    @IBAction func newButtonAnimation(_ sender: UIButton) {
//
//        UIView.animate(withDuration: 0.5,
//                       delay: 0,
//                       options: [],
//                       animations: {
//                        self.coreAnimationView.frame.origin.y -= 40
//        })
//    }
    
}

