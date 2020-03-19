//
//  ProfileContentView.swift
//  Divvy
//
//  Created by Henry Calderon on 3/3/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import SwiftUI

struct ProfileContentView: View {
    var body: some View {
        VStack{
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height:200)
            
            profileImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading){
                Text("Harold")
                    .font(.title)
                HStack(alignment: .top) {
                    Text("Shopper")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
    }
}

struct ProfileContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileContentView()
    }
}
