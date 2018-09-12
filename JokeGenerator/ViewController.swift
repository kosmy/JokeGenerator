//
//  ViewController.swift
//  JokeGenerator
//
//  Created by Nikita Kostash on 07.09.2018.
//  Copyright © 2018 Nikita Kostash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        subscribeNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        unsubscribeNotifications()
    }
    @IBAction func getJoke() {
        JGModel.getRandomJoke()
        
        UIView.animate(withDuration: 1) {
            
        }
    }
    
    func subscribeNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(displayJoke(notification:)), name: NSNotification.Name(rawValue: JGModel.jokeReceivedNotification), object: nil)
    }
    
   @objc func displayJoke(notification: Notification) {
    print(notification.userInfo)
    headerLabel.text = notification.userInfo?[JGModel.kJokeText] as? String
    }
    
    func unsubscribeNotifications() {
         NotificationCenter.default.removeObserver(self)
    }
}

