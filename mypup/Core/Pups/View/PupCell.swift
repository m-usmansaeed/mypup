//
//  PupCell.swift
//  mypup
//  Copyright (c) Muhammad Usman Saeed
//
//  Using xCode 12.3, Swift 5.0
//  Running on macOS 12.6
//  Created on 11/26/23
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//


import SwiftUI

struct PupCell: View {
    @StateObject private var imageLoader = ImageLoader()
    let pup: Pup
    
    var body: some View {
        VStack(alignment:.leading) {
            HStack {
                Image(uiImage: imageLoader.image ?? UIImage(named: "placeholder")!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(pup.name ?? "")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)

                    Text(pup.bred_for ?? "")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                    
                }.padding(.leading)
            }
            Divider()
        }
        .onAppear(perform: {
            imageLoader.load(fromURLString: (pup.image?.url).unwrapped(defaultV: ""))
        })
    }
}

struct PupCell_Previews: PreviewProvider {
    static var previews: some View {
        PupCell(pup: MockData.pup1)
            .previewLayout(.fixed(width: 400, height: 200))

    }
}
