//
//  PupListView.swift
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

struct PupListView: View {
    
    @StateObject var viewModal = PuppiesViewModal()

    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModal.puppeis, id: \.id) { pup in
                    NavigationLink {
                        PupDetailView(pup: pup)
                    } label: {
                        PupCell(pup: pup)
                    }
                    .listRowSeparator(.hidden)
                    
                    
                }.listStyle(.plain)
                    .navigationTitle("Puppies")
                    .navigationBarTitleDisplayMode(.inline)
                
            }.onAppear {
                if viewModal.puppeis.count == 0 {
                    viewModal.getAppetizers()
                }
                
            }
            
            
            if viewModal.isLoading {
                LoadingView()
            }
            
        }.alert(item: $viewModal.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PupListView()
    }
}


//NavigationStack {
//           ScrollView(showsIndicators: false) {
//               LazyVStack {
//                   ForEach(0...10, id: \.self) { thread in
//                       ThreadCell()
//                   }
//               }
//           }.refreshable {
//               print("DEBEG: Refresh thread")
//           }
//           .navigationTitle("Threads")
//           .navigationBarTitleDisplayMode(.inline)
//       }.toolbar {
//           ToolbarItem(placement: .topBarTrailing) {
//               Image(systemName: "arrow.counterclockwise")
//                   .foregroundColor(.black)
//           }
//
//       }
