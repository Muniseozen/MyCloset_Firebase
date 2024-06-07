import SwiftUI

struct AddProductScreen: View {
    @State private var mainImage: UIImage? = nil
    @State private var selectedImages: [UIImage] = []
    @State private var showImagePicker: Bool = false
    @State private var productName: String = ""
    @State static var productDetail: String = ""
    @State private var productDescription: String = ""

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    VStack {
                        // Main Image with Swipe
                        if !selectedImages.isEmpty {
                            TabView(selection: $mainImage) {
                                ForEach(selectedImages, id: \.self) { image in
                                    ZStack(alignment: .topLeading) {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.95)
                                            .clipped()
                                            .tag(image)
                                        
                                        if let index = selectedImages.firstIndex(of: image) {
                                            Text("\(index + 1)")
                                                .foregroundColor(.white)
                                                .font(.custom("Noto Sans JP", size: 12))
                                                .padding(8)
                                                .background(Color.black.opacity(0.7))
                                                .clipShape(Circle())
                                                .padding()
                                        }
                                    }
                                }
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                            .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.95)
                            .cornerRadius(10)
                        } else {
                            ZStack {
                                Rectangle()
                                    .fill(Color.myExtraLightGray)
                                    .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.95)
                                    .cornerRadius(10)
                                
                                Image("noImage")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.95)
                                    .clipped()
                                
                                Text("Select Image")
                                    .offset(y: geometry.size.width * 0.35)
                                    .font(.custom("Noto Sans JP", size: 24))
                                    .foregroundColor(.myGray)
                            }
                            .onTapGesture {
                                if self.selectedImages.count < 10 {
                                    self.showImagePicker = true
                                }
                            }
                        }
                        
                        // Additional Images with Numbers
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<10, id: \.self) { index in
                                    VStack {
                                        Text("\(index + 1)")
                                            .font(.custom("Noto Sans JP", size: 12))
                                            .foregroundColor(.black)
                                            .padding(6)
                                            .clipShape(Circle())
                                        if index < selectedImages.count {
                                            ZStack(alignment: .topTrailing) {
                                                Image(uiImage: selectedImages[index])
                                                    .resizable()
                                                    .frame(width: 60, height: 60)
                                                    .cornerRadius(10)
                                                    .onTapGesture {
                                                        self.mainImage = selectedImages[index]
                                                    }

                                                Button(action: {
                                                    if index < selectedImages.count {
                                                        if self.mainImage == selectedImages[index] {
                                                            self.mainImage = self.selectedImages.last
                                                        }
                                                        self.selectedImages.remove(at: index)
                                                    }
                                                }) {
                                                    Image(systemName: "xmark.circle.fill")
                                                        .foregroundColor(.red)
                                                        .background(Color.white)
                                                        .clipShape(Circle())
                                                }
                                                .offset(x: 5, y: -5)
                                            }

                                        } else {
                                            Rectangle()
                                                .fill(Color.myExtraLightGray)
                                                .frame(width: 60, height: 60)
                                                .cornerRadius(10)
                                                .overlay(
                                                    Image(systemName: "photo.badge.plus")
                                                        .font(.title2)
                                                        .foregroundColor(.myLightGray)
                                                        .onTapGesture {
                                                            self.showImagePicker = true
                                                        }
                                                )
                                        }
                                    }
                                }
                            }
                            .frame(width: geometry.size.width,alignment: .leading) // Fix the width of the ScrollView
                        }
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 0)

                    // Title
                    HStack {
                        Text("商品詳細")
                            .font(Font.custom("Noto Sans JP SemiBold", size: 20))
                        Spacer()
                        Text("Information")
                            .foregroundColor(Color(red: 0.49, green: 0.1, blue: 0.19))
                            .font(Font.custom("Noto Sans JP", size: 12).weight(.light))
                            .underline()
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(Color(red: 0.49, green: 0.1, blue: 0.19))
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    // Product details input fields
                    VStack(alignment: .center) {
                        ProductDetailsInputFields(title: "商品名", placeholder: "帽子", text: $productName, characterLimit: 40)
                            .padding()
                        
                        Divider()
                        listView(leadingIcon: "", text: "カテゴリーを選択", trailingIcon: "chevron.right", action: {
                            print("Select Category")
                        })
                        Divider()
                        SelectProductCondition()
                        Divider()
                        ProductDetailsInputFields(title: "商品詳細", placeholder: "色、素材、重さ、定価、注意点など 例) 2023年頃に1万円で購入したジャケットです。 ライト グレーで傷はありません。あわせやすいのでおすすめで す。 #ジャケット #ジャケットコーデ", text: $productDescription, characterLimit: 1000)
                            .padding()
                    }
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 0)
                    
                    VStack {
                        ShippingDetailsView()
                    }
                }
                .frame(maxWidth: geometry.size.width) // Ensure ScrollView takes full width
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(sourceType: .photoLibrary) { image in
                    if selectedImages.count < 10 {
                        selectedImages.append(image)
                        if mainImage == nil {
                            mainImage = image
                        }
                    }
                }
            }
            .background(Color.myExtraLightGray)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType
    var completion: (UIImage) -> Void

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.completion(image)
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}

struct AddProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddProductScreen()
    }
}
