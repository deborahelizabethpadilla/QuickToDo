//
//  TableViewController.swift
//  QuickToDo
//
//  Created by Deborah on 6/8/17.
//  Copyright © 2017 Deborah. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    //Variables
    
    var items:NSMutableArray = []
    
    //Outlets

    @IBOutlet var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemsObject as? NSArray {
            
            items = tempItems as! NSMutableArray
            
        }
        
        table.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        
        var cellLabel = ""
        
        if let tempLabel = items[indexPath.row] as? String {
            
            cellLabel = tempLabel
        }
        
        cell.textLabel?.text = cellLabel
        
        return cell
    }

} // End Class
