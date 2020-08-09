//
//  ViewController.swift
//  UIKit 3 - UISlider
//
//  Created by Андрей Дютин on 09.08.2020.
//  Copyright © 2020 Андрей Дютин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        slider.value = 1
        label.text = String(slider.value)
        label.textAlignment = .center
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .black
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        label.text = String(sender.value)
        
        let backgrandColor = self.view.backgroundColor
        self.view.backgroundColor = backgrandColor?.withAlphaComponent(CGFloat(sender.value))
    }
    
}

