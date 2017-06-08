//
//  ViewController.swift
//  QuickToDo
//
//  Created by Deborah on 6/8/17.
//  Copyright © 2017 Deborah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //Outlets
    
    @IBOutlet var itemField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        //Delegate For Text Field
        
        self.itemField.delegate = self
    
        //Close On Tap
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    //Actions
    
    @IBAction func addAction(_ sender: Any) {
        
        saveItem()
        
    }
    
    func saveItem() {
        
        //Save Item Permanently
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var items:[String]
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
            items.append(itemField.text!)
            
        } else {
            
            items = [itemField.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        itemField.text = ""
    }
    
    //Close Keyboard With Return
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return false
    }
    
    //Close Keyboard With Tap
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }

} // End Class
