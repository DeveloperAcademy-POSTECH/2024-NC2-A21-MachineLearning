//
//  WaveformView.swift
//  NC2_MachineLearning
//
//  Created by 김준수(엘빈) on 6/19/24.
//

import SwiftUI

struct WaveformView: View {
    @State private var isAction = false
    var body: some View {
        HStack(spacing:5){
            
            ForEach(0 ..< 15) { item in
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(red: 0.36, green: 0.55, blue: 0.86))
                    .frame(width: 5.76504, height: CGFloat.random(in: isAction ? 5...30 : 13...60))
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 0.4).repeatForever(autoreverses: true)) {
                isAction.toggle()
                
            }
        }
    }
}
#Preview {
    WaveformView()
}
