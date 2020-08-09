//
//  ViewController.swift
//  UIKit 9 - UITextView
//
//  Created by Андрей Дютин on 09.08.2020.
//  Copyright © 2020 Андрей Дютин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewConstrain: NSLayoutConstraint!
    @IBOutlet weak var stepper: UIStepper!
    @IBAction func sizeFontStepper(_ sender: UIStepper) {
        let font = textView.font?.fontName
        let fontsize = CGFloat(sender.value)
        textView.font = UIFont(name: font!, size: fontsize)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        //textView.text = ""
        textView.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 12)
        textView.backgroundColor = self.view.backgroundColor
        textView.layer.cornerRadius = 10
        textView.textColor = .black
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
        stepper.value = 12
        stepper.minimumValue = 5
        stepper.maximumValue = 20
        stepper.tintColor = .white
        stepper.backgroundColor = .gray
        stepper.layer.cornerRadius = 10
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)//for any object
//        textView.resignFirstResponder()//for some object
    }
    
    @objc func updateTextView(notification: Notification) {
        guard
            let userInfo = notification.userInfo as? [String: Any],
            let keaboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            else { return }
        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = UIEdgeInsets.zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0,
                                                 left: 0,
                                                 bottom: keaboardFrame.height - textViewConstrain.constant,
                                                 right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        textView.scrollRangeToVisible(textView.selectedRange)
    }

}

extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .white
        textView.textColor = .gray
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = self.view.backgroundColor
        textView.textColor = .black
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = "\(textView.text.count)"
        return textView.text.count + (text.count - range.length) <= 5000
    }

}

