//
//  ViewController.swift
//  RGDoneKeyboard
//
//  Created by iRohitGaur on 05/16/2020.
//  Copyright (c) 2020 iRohitGaur. All rights reserved.
//

import UIKit
import RGDoneKeyboard

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.RGDoneKeyboard(dismissOnTap: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

