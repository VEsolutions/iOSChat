//
//  ViewController.swift
//  Chat
//
//  Created by Björn Englesson on 05/01/13.
//  Copyright (c) 2015 Björn Englesson. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet var chatRoom: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Events
    @IBAction func buttonInitChat(sender: UIButton){
        self.view.endEditing(true)
        println("The button was pressed so initilize the chat!")        
    }
    
    // iOS Touch functions
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
}

