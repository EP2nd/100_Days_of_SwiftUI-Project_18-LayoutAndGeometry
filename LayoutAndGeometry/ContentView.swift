//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Edwin Przeźwiecki Jr. on 24/02/2023.
//

import SwiftUI

struct ContentView: View {
    
//    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                        /// Challenge 3:
//                            .background(colors[index % 7])
                            .background(Color(hue: min(1.0, geo.frame(in: .global).minY / fullView.size.height), saturation: 1, brightness: 1))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                        /// Challenge 1:
                            .opacity(geo.frame(in: .global).minY / 200)
                        /// Challenge 2:
                            .scaleEffect(max(0.5, geo.frame(in: .global).minY / 500))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
