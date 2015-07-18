//
//  ViewController.swift
//  Chat
//
//  Created by Björn Englesson on 05/01/13.
//  Copyright (c) 2015 Björn Englesson. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet var chatField: UITextView!
    @IBOutlet var message: UITextField!
    
    let socket = SocketIOClient(socketURL: "localhost:3000")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.addHandlers()
        self.socket.connect()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Handlers
    func addHandlers() {
        self.socket.onAny {println("Got event: \($0.event), with items: \($0.items)")}
        
        self.socket.on("chat message") {[weak self] data, ack in
            if let name = data?[0] as? String {
                self!.chatField.text = "\(self!.chatField.text) \n \(name)\n"
                let bottom: NSRange = NSMakeRange(count(self!.chatField.text) - 1, count(self!.chatField.text) - 1)
                self!.chatField.scrollRangeToVisible(bottom)
            }
        }
    }
    
    // Events
    @IBAction func buttonSend(sender: UIButton){
        self.socket.emit("chat message", message.text);
        message.text = ""
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

