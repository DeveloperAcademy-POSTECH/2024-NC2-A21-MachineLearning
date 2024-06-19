//
//  recordView.swift
//  NC2_MachineLearning
//
//  Created by 김예림 on 6/18/24.
//

import SwiftUI
import SoundAnalysis

struct RecordView: View {
    
    //var observer : ResultsObserver
    
    //@Binding var isNext: Bool
    //@State var observer : ResultsObserver
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack {
                Text("아래 문장을 대화하듯 읽어주세요!")
                    .foregroundStyle(Color.black)
                    .font(.Dnf20)
                    .padding(.bottom,20)
                    .padding(.top, 110)
                
                VStack(alignment: .leading){
                    Text("\" 잘못되고 있는 것에 집중하면 안 돼.\n항상 상황을 바꿀 방법이 있어. \"")
                        .foregroundStyle(Color.black)
                        .font(.preMedium20)
                        .lineSpacing(6)
                        .tracking(-0.6)
                    
                    HStack{
                        Text("Excerpt")
                            .font(.preSemiBold16)
                            .foregroundStyle(Color(hexColor: "B9C1D2"))
                        
                        Divider()
                            .frame(width: 1,height: 12)
                            .background(Color(hexColor: "B9C1D2"))
                        
                        Text("InsideOut, Joy")
                            .font(.preSemiBold16)
                            .foregroundStyle(Color(hexColor: "B9C1D2"))
                    }.padding(.top,3)
                }
                .padding(.horizontal, 37)
                .padding(.vertical,35)
                .background(Color(hexColor: "EFF1F5"))
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 20
                    )
                )
                Spacer()
                
                RecordButton(audioRecorder: AudioRecorder(), voiceData: VoiceData())
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    RecordView()
}
