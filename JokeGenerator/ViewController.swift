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
    

    @IBAction func getJoke() {
        JGModel.getRandomJoke()
    }
    
}

