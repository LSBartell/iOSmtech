//
//  ViewController.swift
//  funWithUIKit
//
//  Created by Logan Steven Bartell on 1/20/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textLabel.textColor = .red
        button.tintColor = .red
    }

    @IBAction func slider(_ sender: UISlider) {
        if sender.value == 1.0 {
            textLabel.text = "Full"
        } else if sender.value == 0.0 {
            textLabel.text = "Empty"
        }
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        textLabel.text = "Button Tapped"
        textLabel.textColor = .red
    }
    
}

