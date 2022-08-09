//
//  ProductDetailView.swift
//  Furniture_app
//
//  Created by Pat on 2022/08/09.
//

import SwiftUI


struct ProductDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                Image("chair_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                    .offset(y: -60)
                DescriptionView()
                    .offset(y: -110)
                
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack{
                Text("$1299")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                Button {
                    
                } label: {
                    Text("Add to Cart")
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(12)
                        .foregroundColor(Color("Primary"))
                    
                }
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(50, corners: [.topLeft])
            .frame(maxHeight: .infinity, alignment: .bottom)
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton(action: {
            presentationMode.wrappedValue.dismiss()
        }),trailing: Image("threeDot")
        )
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Luxury Chair")
                .font(.title)
                .bold()
            HStack(spacing: 4){
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical,8)
            
            Text("Scandinavian design is noted for clean, minimal but highly functional furniture pieces used to complement clutter-free spaces filled with natural light. Its simple lines and neutral palettes accentuated with a bright color or two create deceptively uncomplicated spaces you won't want to leave.")
                .lineSpacing(8.0)
                .foregroundColor(.secondary)
            
            HStack(alignment: .top){
                VStack (alignment: .leading){
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    Text("Height: 120 cm")
                        .foregroundColor(.secondary)
                    Text("Width: 80 cm")
                        .foregroundColor(.secondary)
                    Text("Diameter: 70 cm")
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading){
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    Text("Jati Wood, Canvas, \nAmazing Love")
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            HStack(alignment: .bottom){
                VStack{
                    Text("Colors")
                        .fontWeight(.semibold)
                    
                    HStack{
                        ColorDotView(color: .white)
                        ColorDotView(color: Color("Primary"))
                        ColorDotView(color: .black)
                    }
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("Quantity")
                        .fontWeight(.semibold)
                    HStack{
                        Button {
                            
                        } label: {
                            Image(systemName: "minus")
                                .padding(.all,8)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal,8)
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .padding(.all,8)
                        }
                        .background(Color("Primary"))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                        
                    }
                }
            }
        }
        .padding()
        .background(Color("Bg"))
        .cornerRadius(40)
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct CustomBackButton: View {
    let action: ()-> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .padding(.all,12)
                .background(Color.white)
                .clipShape(Circle())
                .foregroundColor(.black)
        }
        
    }
}
