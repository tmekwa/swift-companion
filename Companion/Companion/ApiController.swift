//
//  ApiController.swift
//  Companion
//
//  Created by Thato MEKWA on 2018/10/16.
//  Copyright © 2018 Thato MEKWA. All rights reserved.
//

import UIKit

class ApiController: NSObject
{
    let uid = "a6ae8ca7fcf1f6562ed5dcc2f8996eeae6db9f5d14416b79ed0e6871e5f1f7d0"
    let secret = "064594a028ddfcf58a0f4308fc9dc23daf6da80780891189527bc7f8d0bfffac"
    
    func getToken() {
        let url = URL(string: "https://api.intra.42.fr/v2/oauth/token")
        
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = "grant_type=client_credentials&client_id=\(uid)&client_secret=\(secret)".data(using: String.Encoding.utf8)
        let group = DispatchGroup();
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            (data, response, error) in
            if let err = error{
                print(err)
            }
            else if let d = data{
                do{
                    if let dic : NSDictionary = try JSONSerialization.jsonObject(with: d, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary{
                        if let temp = dic["access_token"]
                        {
                            token = temp as! String
                            print("get token: ", token)
                        }
                    }
                }
                catch(let err){
                    print(err)
                }
            }
            group.leave()
        }
        group.enter()
        task.resume()
        group.wait()
    }
    
    func getUser(login: String, with f: @escaping (Message) -> ()) {
        print("Login: \(login)")
        var request = URLRequest(url: URL(string: "https://api.intra.42.fr/v2/users/\(login)?access_token=\(token)")!)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in
            if error != nil {
                print(error as Any)
            } else {
                guard let data = data else { return }
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        do {
                            let json = String(bytes: data, encoding: .utf8)
                            //print("JSON========= \(json)")
                            let _messages = try JSONDecoder().decode(Message.self, from: (json?.data(using: .utf8)!)!)
                            print("\(_messages.first_name)")
//                            print("\(json)")
                            print("json finished")
                            DispatchQueue.main.async {
                                f(_messages)
                            }
                        }
                        catch (let err) {
                            print("Catch Error if its comming here: ", err)
                        }
                    }
                }
            }
        }
        task.resume()
    }
}
