//
//  mainScreen.swift
//  MyTableViewApp
//
//  Created by Christopher Fontana on 3/5/17.
//  Copyright © 2017 Christopher Fontana. All rights reserved.
//

import UIKit

class mainScreen: UIViewController {
  
    @IBOutlet weak var newLabel: UILabel!
    
    var labelTitle: String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        newLabel.text = labelTitle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
