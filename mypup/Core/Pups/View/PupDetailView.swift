//
//  PupDetailView.swift
//  mypup
//  Copyright (c) Muhammad Usman Saeed
//
//  Using xCode 12.3, Swift 5.0
//  Running on macOS 12.6
//  Created on 11/27/23
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

struct PupDetailView: View {
    
    @StateObject private var imageLoader = ImageLoader()
    @StateObject private var settingsViewModel = SettingsViewModel()

    let pup: Pup
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    Image(uiImage: imageLoader.image ?? UIImage(named: "placeholder")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text(pup.name ?? "")
                            .font(.headline)
                        Text(pup.temperament ?? "")
                            .font(.footnote)
                        
                        
                        HStack {
                            Text("Bred For:")
                            Text(pup.bred_for ?? "")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                        
                        HStack {
                            Text("Average LIfe Span:")
                            Text(pup.life_span ?? "")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                        
                        HStack {
                            Text("Average Weight:")
                            Text(settingsViewModel.settings.isUnitImperial ?
                                 pup.weight?.imperial ?? "" :
                                    pup.weight?.metric ?? "")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        }
                        
                        HStack {
                            Text("Average Height:")
                            Text(settingsViewModel.settings.isUnitImperial == true ?
                                 pup.height?.imperial ?? "" :
                                    pup.height?.metric ?? "")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        }
                        
                        Text(pup.pup_description ?? "")
                        
                        Spacer()
                    }.padding()
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("Details")
                }
            }.onAppear(perform: {
                imageLoader.load(fromURLString: (pup.image?.url).unwrapped(defaultV: ""))
                settingsViewModel.getData()
            })
    }

}

struct PupDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PupDetailView(pup: MockData.pup2)
    }
}
