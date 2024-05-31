//
//  productDetailsView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/30.
//

import SwiftUI

struct productDetailsView: View {
    @Binding var productName: String
    @Binding var productDescription: String
    @Binding var productPrice: String

    var body: some View {
        Group {
            TextField("Product Name", text: $productName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            TextField("Product Description", text: $productDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            TextField("Product Price", text: $productPrice)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .keyboardType(.decimalPad)
        }
    }
}

struct CustomActionSheet: View {
    @Binding var showImagePicker: Bool
    @Binding var sourceType: UIImagePickerController.SourceType
    @Binding var showCustomActionSheet: Bool

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    self.sourceType = .camera
                    self.showImagePicker = true
                    self.showCustomActionSheet = false
                }) {
                    VStack {
                        Image(systemName: "camera")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                        Text("Camera")
                            .foregroundColor(.blue)
                    }
                }
                Spacer()
                Button(action: {
                    self.sourceType = .photoLibrary
                    self.showImagePicker = true
                    self.showCustomActionSheet = false
                }) {
                    VStack {
                        Image(systemName: "photo.on.rectangle")
                            .font(.largeTitle)
                            .foregroundColor(.green)
                        Text("Photo Library")
                            .foregroundColor(.green)
                    }
                }
                Spacer()
            }
            .padding()
            Button("Cancel") {
                self.showCustomActionSheet = false
            }
            .foregroundColor(.red)
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width, height: 200)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20)
        .padding(.horizontal, 20)
    }
}

extension View {
    func customActionSheet(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> some View) -> some View {
        ZStack {
            self
            if isPresented.wrappedValue {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        isPresented.wrappedValue = false
                    }
                content()
                    .transition(.move(edge: .bottom))
                    .animation(.spring())
            }
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var isPresented: Bool
    var sourceType: UIImagePickerController.SourceType

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }
            parent.isPresented = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
             parent.isPresented = false
         }
     }
 }
