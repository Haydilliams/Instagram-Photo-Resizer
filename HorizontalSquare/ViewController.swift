//
//  ViewController.swift
//  HorizontalSquare
//
//  Created by Hayden Williams on 1/24/18.
//  Copyright © 2018 Hayden Williams. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if let image = imageView.image {
            let newImage = image.addBorderToImage()
            
            UIView.transition(with: self.imageView,
                duration: 0.5,
                options: .transitionCrossDissolve,
                animations: { self.imageView.image = newImage },
                completion: nil)
            
            //SAVING-
            //UIImageWriteToSavedPhotosAlbum(newImage!,nil,nil,nil)
            
            
        }
        
    }
    
    @IBAction func uploadButtonPressed(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default,
                                             handler: { action in
                                                imagePicker.sourceType = .camera
                                                self.present(imagePicker, animated: true, completion: nil)
                                                print("User selected Camera action")
                                                
            })
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {
                action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
                print("User selected Photo Library Action")
            })
            alertController.addAction(photoLibraryAction)
        }
        
        alertController.popoverPresentationController?.sourceView = sender as? UIView
        
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = selectedImage
            dismiss(animated: true, completion: nil)
        }
    }
    
}

