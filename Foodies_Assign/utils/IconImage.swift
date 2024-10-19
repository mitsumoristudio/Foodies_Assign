//
//  IconImage.swift
//  Foodies_Assign
//
//  Created by Satoshi Mitsumori on 10/19/24.
//

import Foundation
import SwiftUI

struct IconImage: View {
    var body: some View {
        VStack() {
            Image("cuisine")
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
                .foregroundColor(Color.black).opacity(0.9)
                .clipShape(Circle())
                .shadow(radius: 8)
            //    .saturation(4.0)
        }
    }
}

struct IconImage_Preview: PreviewProvider {
    static var previews: some View {
        IconImage()
    }
}

