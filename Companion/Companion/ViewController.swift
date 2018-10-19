//
//  ViewController.swift
//  Companion
//
//  Created by Thato MEKWA on 2018/10/15.
//  Copyright © 2018 Thato MEKWA. All rights reserved.
//

import UIKit

var token: String = ""
var uid: String = ""

class ViewController: UIViewController {

    @IBOutlet weak var searchLoginText: UITextField!
    let apiCall = ApiController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View is loaded")

        apiCall.getToken()
        print("======================== \(token) =========================")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchButton(_ sender: Any) {
        let loginString = searchLoginText.text
        searchedUser.removeAll()
        apiCall.getUser(login: loginString!, with: {mssg in
            print("Mss: ", mssg.login)
            print("Mss: ", mssg.first_name)
            searchedUser.append(mssg)
        })
    }
}

