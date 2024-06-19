//
//  recordView.swift
//  NC2_MachineLearning
//
//  Created by 김예림 on 6/18/24.
//

import SwiftUI
import SoundAnalysis

struct RecordView: View {
    
    //@StateObject var audioRecorder: AudioRecorder
    //var observer : ResultsObserver
    
    //@Binding var isNext: Bool
    //@State var observer : ResultsObserver
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack {
                Spacer().frame(height: 80)
                Text("아래 문장을 대화하듯 읽어주세요!")
                    .foregroundStyle(Color.black)
                    .font(.Dnf20)
                    .padding(.bottom,20)
                VStack{
                    Text("너는 진짜 인생을 참\n스펙타클하게 사는것같아!\n정말 존경한다!")
                        .foregroundStyle(Color.black)
                        .font(.preMedium22)
                        .lineSpacing(5)
                        .tracking(-0.2)
                }
                .frame(width:350 ,height: 175)
                .background(Color(hexColor: "EFF1F5"))
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 20
                    )
                )
                Spacer()
                
                RecordButton(audioRecorder: AudioRecorder())
                
            }
        }
    }
}

//#Preview {
//    RecordView()
//}
