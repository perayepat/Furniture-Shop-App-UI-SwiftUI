//
//  TopMenuBar.swift
//  Furniture_app
//
//  Created by Pat on 2022/08/08.
//

import SwiftUI

struct TopMenuBarView: View {
    var body: some View {
        HStack{
            Button {
                //TODO: Add Menu functionality
                
            } label: {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            Spacer()
            Button {
                //TODO: Add Profile functionality
            } label: {
                Image("Profile")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

struct TopMenuBar_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuBarView()
            .previewLayout(.sizeThatFits)
            
    }
}
