//
//  StandardTests.swift
//  Camera Fun
//
//  Created by Kyle Murray on 10/22/16.
//  Copyright © 2016 Kyle Murray. All rights reserved.
//

import UIKit

class StandardTests: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var standardLabel: UILabel!
    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var calAddButton: UIButton!
    @IBOutlet weak var pickedImage: UIImageView!
    @IBOutlet weak var instruction: UILabel!
    var nthStandard : String = "1st"
    var nth : Int = 0
    var numList : [String] = ["1st", "2nd", "3rd", "4th", "5th"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        textField.delegate = self
        calAddButton.isHidden = true
        testButton.isHidden = true
        if nth < numList.count {
            standardLabel.text = "\(numList[nth]) standard"
        } else {
            standardLabel.text = "\(nth + 1)th standard"
        }
    }
    
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        textField.resignFirstResponder()
    //        return false
    //    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is StandardTests {
            let NextVC : StandardTests = segue.destination as! StandardTests
            NextVC.nth = nth + 1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cameraButtonAction(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            ;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            presentCalibrationViews()
        } else {
        }
    }
    
    func presentCalibrationViews() {
        calAddButton.isHidden = false
        testButton.isHidden = false
        instruction.isHidden = true
    }
    
    @IBAction func photoLibraryAction(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            ;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
            presentCalibrationViews()
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        pickedImage.image = image
        self.dismiss(animated: true, completion: nil);
    }
    
    
}

