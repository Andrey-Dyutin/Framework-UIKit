//
//  ViewController.swift
//  UIKit 1 - UIButton and UILable
//
//  Created by Андрей Дютин on 08.08.2020.
//  Copyright © 2020 Андрей Дютин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet var actionButtons: [UIButton]!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.isHidden = true
        label.font = label.font.withSize(35)
        
        button.isHidden = true
        
        for button in actionButtons {
            button.setTitleColor(.blue, for: .normal)
            button.backgroundColor = .green
        }
        
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
    }

    @IBAction func pressedButton(_ sender: UIButton) {
        label.isHidden = false
        button.isHidden = false
        
        if sender.tag == 0 {
            label.text = "Hello,  World"
            label.textColor = .red
        } else if sender.tag == 1 {
            label.text = "Hi there"
            label.textColor = .blue
        } else if sender.tag == 2 {
            label.isHidden = true
            label.isHidden = true
        }
    }
}

