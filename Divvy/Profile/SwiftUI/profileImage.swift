//
//  profileImage.swift
//  Divvy
//
//  Created by Henry Calderon on 3/3/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import SwiftUI

struct profileImage: View {
    var body: some View {
        Image("profileMan")
        .resizable()
            .aspectRatio(contentMode: .fit)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct profileImage_Previews: PreviewProvider {
    static var previews: some View {
        profileImage()
    }
}

