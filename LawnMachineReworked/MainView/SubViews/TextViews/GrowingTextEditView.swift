//
//  GrowingTextEditView.swift
//  LawnMachineReworked
//
//  Created by Joshua Hauer on 8/10/24.
//

import SwiftUI

//struct GrowingTextEditor: View {
//    @Binding var text: String
//    @State private var textHeight: CGFloat = 40
//
//    var body: some View {
//        VStack {
//            TextEditor(text: $text)
//                .frame(minHeight: textHeight, maxHeight: textHeight)
//                .background(GeometryReader { geometry in
//                    Color.clear
//                        .onChange(of: text) { newValue in
//                            adjustHeight(in: geometry)
//                        }
//                })
//                .cornerRadius(8)
//        }
//    }
//
//    private func adjustHeight(in geometry: GeometryProxy) {
//        let size = geometry.size
//        let newHeight = size.height
//        if newHeight != textHeight {
//            DispatchQueue.main.async {
//                self.textHeight = newHeight
//            }
//        }
//    }
//}




