//
//  HomeViewController.swift
//  DemoData
//
//  Created by Raunak Sinha on 21/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var manager = NameManager()
    
    var result: [String]?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        manager.delegate = self
        manager.getNames()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func refreshButtonTapped(_ sender: UIBarButtonItem) {
        manager.getNames()
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.setHidesBackButton(true, animated: false)
    }

}


//MARK: - TableViewDegateMethod

extension HomeViewController: UITabBarDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let name = result {
            cell.textLabel?.text = name[indexPath.row]
        }
        return cell
    }
    
}


//MARK: - DelegateMethod

extension HomeViewController: NameManagerDelegate {
    func didUpdateName(_ names: [String]) {
        DispatchQueue.main.async { [self] in
            result = names
            tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
