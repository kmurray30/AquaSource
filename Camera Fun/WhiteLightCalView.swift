//
//  ViewController.swift
//  Camera Fun
// 
//  Created by Kyle Murray on 10/21/16.
//  Copyright © 2016 Kyle Murray. All rights reserved.
// 

import UIKit

class WhiteLightCalView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var whiteLightInstruction: UILabel!
    @IBOutlet weak var blueInstruction: UILabel!
    @IBOutlet weak var greenInstruction: UILabel!
    @IBOutlet weak var calibrateButton: UIButton!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueLine: UIView!
    @IBOutlet weak var greenLine: UIView!
    @IBOutlet weak var pickedImage: UIImageView!
    
    var bluePercent : Float = 0
    var greenPercent : Float = 0
//    @IBOutlet weak var isCameraAvailableLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        blueInstruction.isHidden = true
        greenInstruction.isHidden = true
        blueSlider.isHidden = true
        greenSlider.isHidden = true
        blueLine.isHidden = true
        greenLine.isHidden = true
        calibrateButton.isHidden = true
    }
    
    @IBAction func blueSlider(_ sender: AnyObject) {
        bluePercent = (sender.value - sender.minimumValue) / (sender.maximumValue - sender.minimumValue)
        let xLocFloat : Float = bluePercent * 315
        let xLoc : Int = 29 + Int(xLocFloat)
//        print(bluePercent)
        blueLine.center = CGPoint(x: xLoc, y: 326)
        blueLine.bringSubview(toFront: blueLine)
    }
    
    @IBAction func greenSlider(_ sender: AnyObject) {
        greenPercent = (sender.value - sender.minimumValue) / (sender.maximumValue - sender.minimumValue)
        let xLocFloat : Float = greenPercent * 315
        let xLoc : Int = 29 + Int(xLocFloat)
//        print(greenPercent)
        greenLine.center = CGPoint(x: xLoc, y: 335)
        greenLine.bringSubview(toFront: greenLine)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//    }
    
    @IBAction func saveCalibrationPercent(_ sender: AnyObject) {
//        var singleton: Singleton = Singleton.getInstance()
//        singleton.bluePercent = bluePercent
//        singleton.greenPercent = greenPercent
        let singleton: Singleton = Singleton.getInstance
        singleton.bluePercent = bluePercent
        singleton.greenPercent = greenPercent
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
        blueInstruction.isHidden = false
        greenInstruction.isHidden = false
        blueSlider.isHidden = false
        greenSlider.isHidden = false
        blueLine.isHidden = false
        greenLine.isHidden = false
        calibrateButton.isHidden = false
        whiteLightInstruction.isHidden = true
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
    
//    class Helper{
//        static func presentCalibrationViews() {
//            // do a post request and return post data
//            
//        }
//    }
    

}

