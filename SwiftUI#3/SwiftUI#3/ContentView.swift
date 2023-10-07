//
//  ContentView.swift
//  SwiftUI#3
//
//  Created by Даниил Ермоленко on 07.10.2023.
//

import SwiftUI

struct ContentView: View {
    @Namespace var namespace
    @State private var tap = false
//    @State private var isPresed = false
    
    private let fontSize1: CGFloat = 100
    private let fontSize2: CGFloat = 60
    private let offset1: CGFloat = 10
    private let offset2: CGFloat = 40
    
    var body: some View {
        Button(action: {
            animateButton()
        }) {
            
            let image1 = Image(systemName: "play.fill")
                .font(.system(size: fontSize1))
                .foregroundStyle(.gray)
                .offset(x: offset1)
                .scaleEffect(tap ? 1 : 0)
                .opacity(tap ? 0 : 1)
            
            let image2 = Image(systemName: "play.fill")
                .font(.system(size: fontSize2))
                .scaleEffect(tap ? 1 : 0)
                .opacity(tap ? 1 : 0.5)
                .offset(x: 0)
            
            let image3 = Image(systemName: "play.fill")
                .font(.system(size: fontSize2))
                .offset(x: tap ? offset2 : 0)
            
            let image4 = Image(systemName: "play.fill")
                .font(.system(size: fontSize2))
                .scaleEffect(tap ? 0 : 1)
                .offset(x: offset2)
                .opacity(tap ? 0.5 : 1)
            
            ZStack {
                image1
                image2
                image3
                image4
            }
            
        }
        .foregroundStyle(.cyan)
        .buttonStyle(PlainButtonStyle())
        .padding()
    }
    
    private func animateButton() {
//        isPresed = true
        withAnimation(.interpolatingSpring(stiffness: 235, damping: 15)) {
            tap.toggle()
//            isPresed = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            tap.toggle()
        }
    }
}

#Preview {
    ContentView()
}

//Circle()
//    .frame(width: 150, height: 150)
//    .foregroundColor(.black.opacity(0.1))
    
