//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Logan Steven Bartell on 1/20/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPress(_ sender: UIButton) {
        label.text = "This app rocks!"
    }
    
}

