//
//  ContentView.swift
//  NC2_MachineLearning
//
//  Created by 김예림 on 6/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width: 190, height: 290)
                
                Spacer().frame(height: 80)
                
                Button(action: {
                    
                }, label: {
                    VStack{
                        Text("Start")
                            .font(.Dnf32)
                            .foregroundStyle(Color(.white))
                    }
                    .frame(width: 190, height: 80)
                    .background(Color(hexColor: "5B8CDC"))
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 35
                        )
                    )
                    //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                })
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
