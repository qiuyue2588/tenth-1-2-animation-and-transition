//
//  TransitionViewController.swift
//  tenth(1\2)
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 qiuyue. All rights reserved.
//

import UIKit

class TransitionViewController: UIViewController, UIViewControllerTransitioningDelegate  {

    @IBOutlet weak var testView: UIView!
    
    @IBAction func transition1(_ sender: AnyObject) {
        
        let view = UIView(frame: testView.bounds)
        view.backgroundColor = UIColor.green
        
        UIView.transition(with: testView, duration: 2, options: .transitionFlipFromLeft, animations: {
            self.testView.addSubview(view)
        }, completion: nil)
        
        
    }
    @IBAction func transition2(_ sender: AnyObject) {
        
        if let view1 = testView.subviews.first {
            
            let view2 = UIView(frame: testView.bounds)
            view2.backgroundColor = UIColor.blue
            
            UIView.transition(from: view1, to: view2, duration: 2, options: [.transitionFlipFromLeft] , completion: nil)
        }
        
    }
    
    @IBAction func transitionCustom(_ sender: AnyObject) {
        let tvc = storyboard?.instantiateViewController(withIdentifier: "SecondVC")
        tvc?.modalPresentationStyle = .custom
        tvc?.transitioningDelegate = self
        present(tvc!, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("self:\(self)")
        print("presentationController:\(self.presentationController)")
        print("presentedViewController:\(self.presentedViewController)")
        print("presentingViewController:\(self.presentingViewController)")
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return MyPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationCustom(isPresenting: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationCustom(isPresenting: false)
    }
    

}
