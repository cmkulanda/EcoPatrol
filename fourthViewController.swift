//
//  fourthViewController.swift
//  EcoPatrol
//
//  Created by Scholar on 8/5/21.
//

import UIKit

class fourthViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var colors: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var displayImage: UIImageView!
    
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

    }
    
    @IBAction func submitSightingTapped(_ sender: UIButton) {
    }
    
    @IBAction func takePhotoTapped(_ sender: UIButton) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated : true, completion : nil)


    }
    
    @IBAction func photoLibraryTapped(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated : true, completion : nil)

    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           
           if let selectedImage = info [UIImagePickerController.InfoKey.originalImage] as? UIImage {
               displayImage.image = selectedImage
           }
           imagePicker.dismiss(animated: true, completion: nil)
       }

    
    
    

}
