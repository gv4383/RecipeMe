//
//  PhotoPicker.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 5/29/22.
//

import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
