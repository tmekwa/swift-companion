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

class SearchResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var searchedUser:[userSearched] = []
    var reloader: Any!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! SearchResultsViewCell
        cell.titleLogin.text = searchedUser[indexPath.row].login
        cell.titleFullname.text = searchedUser[indexPath.row].login
        return cell
    }
}
