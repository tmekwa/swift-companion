//
//  SearchResultsViewController.swift
//  Companion
//
//  Created by Thato MEKWA on 2018/10/15.
//  Copyright © 2018 Thato MEKWA. All rights reserved.
//

import UIKit

struct userSearched {
    var login:String!
    var fullname:String!
}

var changeScreen = false

struct Message: Decodable {
    let id: Int
    let email:String
    let correction_point:Int
    let login: String
    let first_name:String
    let url: String
    let last_name:String
    let wallet:Double
    
}

var searchedUser:[Message] = []

class SearchResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var reloadTimer: Any!
    
    @IBOutlet weak var tableViewLogin: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.reloadTableResults), userInfo: nil, repeats: true)
//        self.delegate
        // Do any additional setup after loading the view.
    }

    @objc func reloadTableResults() {
        tableViewLogin.reloadData()
        if (changeScreen == true) {
            print("Change screen")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func f(_ Message: Message) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(searchedUser.count)
        return searchedUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewLogin.dequeueReusableCell(withIdentifier: "searchCell") as! SearchResultsViewCell
        print(searchedUser[indexPath.row].login)
        print(searchedUser[indexPath.row].first_name)
        cell.titleLogin.text = searchedUser[indexPath.row].login
        cell.titleFullname.text = searchedUser[indexPath.row].first_name
        return cell
    }
}
