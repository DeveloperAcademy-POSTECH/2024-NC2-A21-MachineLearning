//
//  ContentView.swift
//  NC2_MachineLearning
//
//  Created by 김예림 on 6/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isButtonTapped: Bool = false
    @State var observer : ResultsObserver
    
    var body: some View {
            NavigationStack {
                ZStack {
                    Color.white
                        .ignoresSafeArea()
                    VStack {
                        Spacer()
                        Image("logo")
                            .resizable()
                            .frame(width: 190, height: 290)
                        
                        Spacer().frame(height: 80)
                        
                        Button(action: {
                            isButtonTapped = true
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
                        })
                        Spacer()
                    }
                    .padding()
                    .navigationDestination(isPresented: $isButtonTapped) {
                        RecordView(observer: observer)
                }
                }
            }
        
    }
}

#Preview {
    ContentView()
}
