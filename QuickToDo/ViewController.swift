//
//  ViewController.swift
//  QuickToDo
//
//  Created by Deborah on 6/8/17.
//  Copyright © 2017 Deborah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    
    @IBOutlet var itemField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Actions
    
    @IBAction func addAction(_ sender: Any) {
        
        saveItem()
        
    }
    
    func saveItem() {
        
        //Save Item Permanently
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var items:NSMutableArray
        
        if let tempItems = itemsObject as? NSArray {
            
            items = tempItems as! NSMutableArray
            
            items.addingObjects(from: [itemField.text!])
            
        } else {
            
            items = [itemField.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        itemField.text = ""
    }

} // End Class
