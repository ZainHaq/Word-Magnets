//
//  ViewController.swift
//  Word Magnets
//
//  Created by Zain on 4/23/16.
//  Copyright © 2016 Zain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var newWordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var wordArray = ["I", "am", "a", "cool", "guy"]
        
        for word in wordArray {
            var label = UILabel();
            label.text = word;
            label.font = UIFont.systemFontOfSize(32);
            label.sizeToFit();
            label.center = CGPoint(x:150, y:200);
            
            var x = CGFloat(arc4random_uniform(300))
            var y = CGFloat(arc4random_uniform(400))
            
            label.center = CGPoint(x:x, y:y);
            
            view.addSubview(label);
            
            var panGesture = UIPanGestureRecognizer(target: self, action: Selector("handlePanGesture:"))
            label.addGestureRecognizer(panGesture);
            label.userInteractionEnabled = true;
        }
        
    }
    
    

    @IBAction func addButtonPressed(sender: AnyObject) {
        
        var label = UILabel();
        label.text = newWordTextField.text;
        label.font = UIFont.systemFontOfSize(32);
        label.sizeToFit();
        label.center = CGPoint(x:150, y:200);
        
        var x = CGFloat(arc4random_uniform(300))
        var y = CGFloat(arc4random_uniform(400))
        
        label.center = CGPoint(x:x, y:y);
        
        view.addSubview(label);
        
        var panGesture = UIPanGestureRecognizer(target: self, action: Selector("handlePanGesture:"))
        label.addGestureRecognizer(panGesture);
        label.userInteractionEnabled = true;
        
        newWordTextField.text = "";
        
    }
    
    func handlePanGesture(panGesture: UIPanGestureRecognizer) {
        
        print("Tap");
        
        var translation = panGesture.translationInView(view);
        
        panGesture.setTranslation(CGPoint(x:0, y:0), inView:view)
        
        var label = panGesture.view as! UILabel // we know its a label
        
        label.center.x = label.center.x + translation.x;
        label.center.y = label.center.y + translation.y;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

