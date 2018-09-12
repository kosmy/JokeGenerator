//
//  JGModel.swift
//  JokeGenerator
//
//  Created by Nikita Kostash on 07.09.2018.
//  Copyright © 2018 Nikita Kostash. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class JGModel: NSObject {
    
   
    static let jokeReceivedNotification = "jokeReceivedNotification"
    
    static func getRandomJoke() {
        
        // Fetch Request
        Alamofire.request("http://api.icndb.com/jokes/random", method: .get, headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                if (response.result.error == nil) {
                    //debugPrint("HTTP Response Body: \(response.data)")
                    //let str = NSString.init(data: response.data!, encoding: String.Encoding.utf8.rawValue)
                    //print(str)
                    do {
                        let json =  try JSON(data: response.data!)
                    let joke = json ["value"]["joke"].string
                    print(joke!)
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: jokeReceivedNotification), object: self, userInfo: nil)
                    }
                    catch {
                        print(error)
                    }
                }
                else {
                    debugPrint("HTTP Request failed: \(response.result.error)")
                }
        }
    }
    
    


}
