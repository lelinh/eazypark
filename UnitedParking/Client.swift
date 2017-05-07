//
//  Client.swift
//  UnitedParking
//
//  Created by Linh Le on 4/23/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit
import Alamofire

class Client: NSObject {

    static private let serverUrl = URL(string: "http://google.com")

    private func postRequest(_ email: String,_ password: String){
        let dict = ["username": email, "password": password] as [String: Any]
        if let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
        {
            
            
            let url = URL(string: "http://192.168.0.104:8080/SpringWeb/login")!
            //            url = URL(string: "https://httpbin.org/post")!
            
            let request = NSMutableURLRequest(url: url as URL)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.httpMethod = "POST"
            
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){ data,response,error in
                if error != nil{
                    print(error?.localizedDescription as Any)
                    return
                }
                do {
                    print(response!)
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    
                    if let parseJSON = json {
                        print(parseJSON)
                        let loginStatus = (((parseJSON["Login success"] as! Bool)))
                        if loginStatus == true{
                        }
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
            task.resume()
        }
    }
    private func getRequest(){
        
    }
    private func updateRequest(){
        
    }
    private func createRequest(){
        
    }
    static func login(_ username: String, _ password: String){
        
    }
    static func signup(_ username: String, _ password: String){
        
    }
    static func getUser(_ username: String) -> User{

        let user = User(username)
        return user
    }
    
}
