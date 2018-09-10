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
   
    static func getRandomJoke() {
        
        // Fetch Request
        Alamofire.request("http://api.icndb.com/jokes/random", method: .get, headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                if (response.result.error == nil) {
                    //debugPrint("HTTP Response Body: \(response.data)")
                    let str = NSString.init(data: response.data!, encoding: String.Encoding.utf8.rawValue)
                    print(str)
                }
                else {
                    debugPrint("HTTP Request failed: \(response.result.error)")
                }
        }
    }
    
    


}
