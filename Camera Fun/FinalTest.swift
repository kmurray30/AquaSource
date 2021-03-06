//
//  FinalTest.swift
//  Camera Fun
//
//  Created by Kyle Murray on 10/21/16.
//  Copyright © 2016 Kyle Murray. All rights reserved.
//

import UIKit

class FinalTest: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var results : Double = 2.5
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var pickedImage: UIImageView!
    @IBOutlet weak var instructions: UILabel!
    //    @IBOutlet weak var isCameraAvailableLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        finishButton.isHidden = true
        resultsLabel.isHidden = true
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
            //            isCameraAvailableLabel.text = "Camera not available"
            //            isCameraAvailableLabel.textColor = UIColor.init(red: 0.961, green: 0.957, blue: 0945, alpha: 1)
        }
    }
    
    func presentCalibrationViews() {
        // Do math here to get results value
        finishButton.isHidden = false
        resultsLabel.text = "Sample contains \(results)% oil"
        resultsLabel.isHidden = false
        instructions.isHidden = true
        
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

