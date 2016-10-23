//
//  HomeScreen.swift
//  Camera Fun
//
//  Created by Kyle Murray on 10/22/16.
//  Copyright © 2016 Kyle Murray. All rights reserved.
//

import Foundation
import UIKit

class SelectContaminantView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var proceedBtn: UIButton!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var selectionLabel: UILabel!
    let items : [String] = [" ", "Crude oil", "Lead", "Bacteria"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        proceedBtn.isHidden = true
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row > 0 {
            selectionLabel.text = "You have selected \(items[row])"
            proceedBtn.isHidden = false
        } else {
            selectionLabel.text = "Make your selection"
            proceedBtn.isHidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
