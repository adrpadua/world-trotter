//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Adrian Padua on 4/11/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150) // create frame for view
        let firstView = UIView(frame: firstFrame) // create view to go inside frame
        firstView.backgroundColor = UIColor.blueColor() // set view color to blue inside frame
        view.addSubview(firstView) // add the view to its frame
    }


}

