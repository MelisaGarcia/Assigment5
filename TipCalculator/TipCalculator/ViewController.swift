//
//  ViewController.swift
//  TipCalculator
//
//  Created by Andrea Dancek on 2020-05-07.
//  Copyright © 2020 Melisa Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var tipPercentajeField: UITextField!
    @IBOutlet var billAmountField: UITextField!
    @IBOutlet var tipPercentajeSlider: UISlider!
    @IBOutlet var calculateButton: UIButton!
    @IBOutlet var BillAmountLabel: UILabel!
    @IBOutlet var tipPercentajeLabel: UILabel!
    @IBOutlet var tipAmountFixLabel: UILabel!

    @IBOutlet var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientView = GradientView(frame: self.view.bounds)
          self.view.insertSubview(gradientView, at: 0)
        registerForKayboardNotification()
    }
    
    private func registerForKayboardNotification (){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown(_ notification: Notification){
        guard let info = notification.userInfo, let keyboardFrame = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else {return}
        
        let keyboardHeight  = keyboardFrame.cgRectValue.size.height
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc func keyboardWillBeHidden(_ notification: Notification){
        scrollView.contentInset  = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    func calculateTotal(){
        let percentaje = tipPercentajeField.text!
        let percentajeValue = (percentaje as NSString).doubleValue
        let bill = billAmountField.text!
        let billValue = (bill as NSString).doubleValue
        let tip = (percentajeValue * billValue) / 100.0
        tipAmountLabel.text = String(format: "%.1f", tip)
        
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        tipAmountLabel.resignFirstResponder()
        tipPercentajeField.resignFirstResponder()
        billAmountField.resignFirstResponder()
        tipPercentajeSlider.resignFirstResponder()
        calculateButton.resignFirstResponder()
//        billAmountField.resignFirstResponder()
        tipPercentajeLabel.resignFirstResponder()
        tipAmountFixLabel.resignFirstResponder()
    }
    
    @IBAction func tipSliderChange(_ sender: Any) {
        tipPercentajeField.text = String("\((tipPercentajeSlider.value * 10).rounded()/10)%")
        calculateTotal()
    }
    @IBAction func TipPercentageChange(_ sender: Any) {
        calculateTotal()
    }
    
    
    @IBAction func calculateTipAmount(_ sender: Any) {
       calculateTotal()
    }
    
    @IBAction func billAmountTotal(_ sender: Any) {
        calculateTotal()
    }
    
}

