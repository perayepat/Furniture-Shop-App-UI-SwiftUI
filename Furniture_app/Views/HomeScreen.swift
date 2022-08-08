//
//  HomeScreen.swift
//  Furniture_app
//
//  Created by Pat on 2022/08/08.
//

import SwiftUI

struct HomeScreen: View{
    @State private var selectedIndex: Int = 0
    private let categories = ["All","Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    var body: some View{
        ZStack {
            //MARK: - Background Color
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading){
                    TopMenuBarView()
                    TagLineView()
                        .padding()
                    SearchAndScanView()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(0 ..< categories.count){ i in
                                //Based on the index it will be equal to active
                                CategoryView(isActive: i == selectedIndex, text: categories[i])
                                    .onTapGesture {
                                        selectedIndex = i
                                    }
                                    .animation(.easeInOut, value: selectedIndex)
                            }
                        }
                        .padding()
                    }
                    Text("Popular")
                        .font(.custom("PlayfairDisplay-Bold", size: 24))
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image("chair_\(index + 1)"), size: 210)
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                    
                    Text("Best")
                        .font(.custom("PlayfairDisplay-Bold", size: 24))
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image("chair_\(index + 1)"), size: 180)
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                    .padding(.bottom,100)
                    
                }
            }
            
            //MARK: - Custom NavBar
            HStack{
                BottomNavBarItem(image: Image("Home"), action: {})
                BottomNavBarItem(image: Image("fav"), action: {})
                BottomNavBarItem(image: Image("shop"), action: {})
                BottomNavBarItem(image: Image("User"), action: {})
            }
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .padding()
            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
            .frame(maxHeight: .infinity, alignment: .bottom)
            
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct TagLineView: View {
    var body: some View {
        VStack{
            Text("Find the \nBest ")
                .font(.custom("PlayfairDisplay-Regular", size: 28))
                .foregroundColor(Color("Primary"))
            + Text("Furniture")
                .font(.custom("PlayfairDisplay-Bold", size: 30))
                .foregroundColor(Color("Primary"))
        }
    }
}

struct SearchAndScanView: View {
    @State private var search: String = ""
    var body: some View {
        HStack{
            HStack {
                Image("Search")
                    .padding(.trailing,8)
                TextField("Search Furniture", text: $search)
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(15)
            .padding(.trailing)
            
            Button {
                //TODO: - Scanning functionality
            } label: {
                Image("scanner")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("Primary"))
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            //TODO: - Make this a dynamic element
            Text(text)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : .black.opacity(0.5))
            
            if isActive {
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20)
            Text("Luxury Swedian chair")
                .font(.title3)
                .fontWeight(.bold)
            HStack(spacing: 2){
                ForEach(0 ..< 5){item in
                    Image("star")
                }
                Spacer()
                Text("$1299.99")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: ()-> Void
    var body: some View {
        
        Button(action: action) {
            image
                .resizable()
                .frame(width: 20, height: 20)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color("Primary"))
        }

    }
}

