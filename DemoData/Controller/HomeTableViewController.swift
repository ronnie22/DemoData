//
//  HomeTableViewController.swift
//  DemoData
//
//  Created by Raunak Sinha on 20/05/21.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var nameManager = NameManager()
    
    var allNames: [String]?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        nameManager.delegate = self
    }
   
    
    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let count = allNames {
            return count.count
        }
        print("2")
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // Configure the cell...
        if let silceArray = allNames {
            cell.textLabel?.text = silceArray[indexPath.row]
        }
        
        print("3")
        return cell
    }

}

extension HomeTableViewController: NameManagerDelegate {
    
    func didUpdateName(_ names: [String]) {
        DispatchQueue.main.async {
            print("11")
            self.allNames = names
//            self.tableView.reloadData()
            print(names[0],"10")
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
