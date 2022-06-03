//
//  PhotoPicker.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 5/29/22.
//

import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var recipeImage: UIImage
    
    let recipe: Recipe
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(photoPicker: self, recipe: recipe)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let photoPicker: PhotoPicker
        let recipe: Recipe

        init(photoPicker: PhotoPicker, recipe: Recipe) {
            self.photoPicker = photoPicker
            self.recipe = recipe
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                guard let data = image.jpegData(compressionQuality: 0.1), let compressedImage = UIImage(data: data) else {
                    print("Error: there was a problem compressing the image")
                    return
                }
                photoPicker.recipeImage = compressedImage
                
                RecipeStorage.shared.update(
                    withId: recipe.id!,
                    name: recipe.name!,
                    recipeDescription: recipe.recipeDescription!,
                    ingredients: recipe.ingredients!,
                    steps: recipe.steps!,
                    totalTime: Int(recipe.totalTime),
                    recipeImage: data
                )
            } else {
                print("Error: there was a problem selecting the image")
            }

            picker.dismiss(animated: true)
        }
    }
}
