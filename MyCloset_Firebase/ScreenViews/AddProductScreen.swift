//
//  AddProductScreen.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI

struct AddProductScreen: View {
    @State private var mainImage: UIImage? = nil
    @State private var selectedImages: [UIImage] = []
    @State private var showImagePicker: Bool = false
    @State private var newImage: UIImage? = nil
    @State private var showCustomActionSheet: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary

    @State private var productName: String = ""
    @State private var productDescription: String = ""
    @State private var productPrice: String = ""

    var body: some View {
        VStack(spacing: 20) {
            // Main Image
            MainImageView(selectedImages: $selectedImages, mainImage: $mainImage, showCustomActionSheet: $showCustomActionSheet)
            
            // Additional Images
            AdditionalImagesView(selectedImages: $selectedImages, mainImage: $mainImage, showCustomActionSheet: $showCustomActionSheet)
            
            // Text Fields
            productDetailsView(productName: $productName, productDescription: $productDescription, productPrice: $productPrice)

            Spacer()
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$newImage, isPresented: self.$showImagePicker, sourceType: self.sourceType)
        }
        .onChange(of: newImage) { newImage in
            if let newImage = newImage {
                if self.selectedImages.count < 10 {
                    self.selectedImages.append(newImage)
                    self.mainImage = newImage
                }
                self.newImage = nil
            }
        }
        .customActionSheet(isPresented: $showCustomActionSheet) {
            CustomActionSheet(showImagePicker: $showImagePicker, sourceType: $sourceType, showCustomActionSheet: $showCustomActionSheet)
        }
        .padding()
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductScreen()
    }
}

