//
//  ImageViews.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/30.
//

import SwiftUI

struct MainImageView: View {
    @Binding var selectedImages: [UIImage]
    @Binding var mainImage: UIImage?
    @Binding var showCustomActionSheet: Bool

    var body: some View {
        VStack {
            TabView {
                if selectedImages.isEmpty {
                    ZStack {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                        Image("SelectImage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                            .clipped()
                    }
                    .padding()
                    .onTapGesture {
                        self.showCustomActionSheet = true
                    }
                } else {
                    ForEach(selectedImages.indices, id: \.self) { index in
                        ZStack(alignment: .topLeading) {
                            Image(uiImage: selectedImages[index])
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                                .clipped()
                                .onTapGesture {
                                    self.mainImage = selectedImages[index]
                                }
                            Text("\(index + 1)")
                                .padding(8)
                                .background(Color.white.opacity(0.5))
                                .foregroundColor(.black)
                                .clipShape(Circle())
                                .padding([.top, .leading], 10)
                        }
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        }
    }
}

struct AdditionalImagesView: View {
    @Binding var selectedImages: [UIImage]
    @Binding var mainImage: UIImage?
    @Binding var showCustomActionSheet: Bool

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Array(selectedImages.enumerated()), id: \.element) { index, image in
                    ZStack(alignment: .topTrailing) {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                            .onTapGesture {
                                self.mainImage = image
                            }

                        Button(action: {
                            self.selectedImages.remove(at: index)
                            if self.mainImage == image {
                                self.mainImage = self.selectedImages.last
                            }
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                                .background(Color.white)
                                .clipShape(Circle())
                                .frame(width: 24, height: 24)
                        }
                        .offset(x: 10, y: -10)
                    }
                }

                // Add Photo Button
                if selectedImages.count < 10 {
                    Button(action: {
                        self.showCustomActionSheet = true
                    }) {
                        VStack {
                            Image(systemName: "photo.badge.plus")
                                .font(.title)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.gray)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                }

                // Placeholder for empty slots
                ForEach(selectedImages.count..<10, id: \.self) { _ in
                    VStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 60, height: 60)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

