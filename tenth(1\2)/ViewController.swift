//
//  ViewController.swift
//  tenth(1\2)
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 qiuyue. All rights reserved.
//

import UIKit

extension UIButton {
    func setup() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth =  1
        self.backgroundColor = UIColor.yellow
        
        self.addTarget(self, action: #selector(springUp(_:)), for: .touchUpInside)
        self.addTarget(self, action: #selector(springDown(_:)), for: .touchDown)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    
    @objc func springUp(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 50, options: .allowUserInteraction, animations: {
            sender.bounds.size.width -= 10
            sender.bounds.size.height -= 10
        }, completion: nil)
    }
    
    @objc func springDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 50, options: .allowUserInteraction, animations: {
            sender.bounds.size.width += 10
            sender.bounds.size.height += 10
        }, completion: nil)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var testview: UIView!
    @IBAction func transformanim(_ sender: AnyObject) {
        UIView.animate(withDuration: 2) {
            var trans = CGAffineTransform(scaleX: 2, y: 2)
            trans = trans.rotated(by: CGFloat(M_PI))
            trans = trans.translatedBy(x: 100, y: 100)
            self.testview.transform = trans
            self.testview.transform = CGAffineTransform.identity
            
        }
        //        testview.transform = CGAffineTransform.identity
       

    }
    @IBAction func animate(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 1, animations: {
            self.testview.center.x += 200.0
        },completion: { _ in
            UIView.animate(withDuration: 1, animations: {
                self.testview.center.x -= 200.0
            }, completion:nil)
        })
        
        
        
    }
    @IBAction func keyframes(_ sender: AnyObject) {
        UIView.animateKeyframes(withDuration: 2,
                                delay: 0,
                                options: [],
                                animations:
            {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                    self.testview.center.x += 200.0
                })
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                    self.testview.center.y += 100.0
                })
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                    self.testview.center.x -= 200.0
                })
                UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                    self.testview.center.y -= 100.0
                })
                
        }, completion: nil)
        
        
    }
    
   
    @IBAction func clear(_ sender: AnyObject) {
        testview.layer.removeAllAnimations()
        for layer in testview.layer.sublayers! {
            if layer is CATransformLayer || layer is CAShapeLayer {
                layer.removeFromSuperlayer()
            }
        }
        for layer in view.layer.sublayers! {
            if layer is CAShapeLayer {
                layer.removeFromSuperlayer()
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.testview.layer.shadowColor = UIColor.black.cgColor
        self.testview.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.testview.layer.shadowOpacity = 0.5
        self.testview.layer.shadowRadius = 5
        testview.layer.cornerRadius = 5
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

