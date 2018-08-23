//
//  ViewController.swift
//
//
//  Created by Aaqib Hussain on 03/08/2015.
//  Copyright (c) 2015 Kode Snippets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var container: ContainerViewController!
    
    @IBOutlet var sendTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        
        
        if sender.selectedSegmentIndex == 0{
            
            container!.segueIdentifierReceivedFromParent("first")
            
        }else{
            
            container!.segueIdentifierReceivedFromParent("second")
            let controller = container.currentViewController as? SecondViewController
            controller?.delegate = self
            
        }
        
    }
    
    @IBAction func getText(_ sender: UIButton) {
        
        if let getFirstVCObject = self.container.currentViewController as? FirstViewController{
            let getText = getFirstVCObject.firstVCTextfield.text!
            print(getText)
        }
        
    }
    
    
    
    @IBAction func sendAction(_ sender: AnyObject) {
        
        
        if container.currentViewController.isKind(of: FirstViewController.self){
            
            if let getFirstVCObject = self.container.currentViewController as? FirstViewController
            {
                let getText = self.sendTextField.text
                getFirstVCObject.firstVCLabel.text  = getText!
                
            }
        }
        else if container.currentViewController.isKind(of: SecondViewController.self){
            
            if let getSecondVCObject = self.container.currentViewController as? SecondViewController
            {
                let getText = self.sendTextField.text
                getSecondVCObject.secondVCLabel.text = getText!
                
                
            }
            
            
            
            
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "container"{
            container = segue.destination as! ContainerViewController
            //For adding animation to the transition of containerviews you can use container's object property
            // animationDurationWithOptions and pass in the time duration and transition animation option as a tuple
            // Animations that can be used
            // .transitionFlipFromLeft, .transitionFlipFromRight, .transitionCurlUp
            // .transitionCurlDown, .transitionCrossDissolve, .transitionFlipFromTop
            container.animationDurationWithOptions = (0.5, .transitionCrossDissolve)
        }
    }
    
    
    
}
extension ViewController: SecondViewDelegate{
    
    func sendToThirdViewController() {
        container.segueIdentifierReceivedFromParent("third")
    }
    
    
}
