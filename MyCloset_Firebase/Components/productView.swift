//
//  productView.swift
//  MyCloset_Firebase
//
//  Created by Özen Munise on 2024/05/23.
//

import SwiftUI

struct productView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                NavigationLink(destination: ProductDetailsView()) {
                    ZStack(alignment: .topLeading) {
                        GeometryReader { innerGeometry in
                            Image("sweatshirt")
                                .resizable()
                              
                                .frame(width: min(innerGeometry.size.width * 1, 180))
                        }
                      

                        VStack {
                            HStack {
                                VStack(spacing: -4) {
                                    Image("deliverySmall")
                                        .foregroundColor(.red)
                                    Image("tagSmall")
                                        .foregroundColor(.blue)
                                    Image("saleSmall")
                                        .foregroundColor(.green)
                                    Image("couponSmall")
                                        .foregroundColor(.orange)
                                    
                                    Spacer()
                                }
                                .padding(.top, 4)
                                
                                Spacer()
                                
                                VStack {
                                    Image("newSmall")
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                }
                            }
                            .padding(.top, 4)
                            .frame(width: min(geometry.size.width * 0.85, 170), height: 180)
                            
                            HStack {
                                Text("10,000")
                                    .fontWeight(.semibold)
                                    .background(Color.white.opacity(0.5))
                                    .cornerRadius(5)
                                    .foregroundColor(.black)
                                    .frame(width: min(geometry.size.width * 0.85, 170), height: 20, alignment: .leading)
                                    .padding(4)
                            }
                        }
                    }
                    .cornerRadius(5)
                }
                .padding(0)
                
                HStack {
                    Button(action: {}) {
                        Image("magnify_plus")
                            .font(.custom("Noto Sans JP Light", size: 40))
                            .foregroundColor(.gray)
                    }
                    .frame(width: 40, height: 40)
                    .cornerRadius(50)
                    .padding(4)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image("like_heart")
                            .font(.custom("Noto Sans JP Light", size: 40))
                            .foregroundColor(.gray)
                    }
                    .frame(width: 40, height: 40)
                    .cornerRadius(50)
                    .padding(4)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image("share_linear")
                            .font(.custom("Noto Sans JP Light", size: 40))
                            .foregroundColor(.gray)
                    }
                    .frame(width: 40, height: 40)
                    .cornerRadius(50)
                    .padding(4)
                }
                .frame(width: min(geometry.size.width * 0.9, 180), height: 30)
            }
            .cornerRadius(10)
            .padding(12)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .inset(by: -4)
                    .stroke(Color.white, lineWidth: 8)
                    .shadow(color: Color.black.opacity(0.25), radius: 3, x: 1, y: 1)
                    .cornerRadius(10)
            )
        }
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: 180) // Set the max width to 180
    }
}

struct productView_Previews: PreviewProvider {
    static var previews: some View {
        productView()
    }
}
