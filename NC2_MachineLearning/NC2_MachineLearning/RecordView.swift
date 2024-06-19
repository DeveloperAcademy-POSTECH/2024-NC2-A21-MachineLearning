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
    @State private var showWaveform = false
    @StateObject var audioRecorder: AudioRecorder = AudioRecorder()//여기서 애초에 인스턴스를 먼저 생성하면 됩니다. 그이후 하위뷰로 전달하면 됩니다.
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
                VStack{
                    Text("\" 잘못되고 있는 것에 집중하면 안 돼.\n항상 상황을 바꿀 방법이 있어. \"")
                        .foregroundStyle(Color.black)
                        .font(.preMedium20)
                        .lineSpacing(6)
                        .tracking(-0.6)
                }
                .padding(.horizontal, 37)
                .padding(.vertical, 40)
                .background(Color(hexColor: "EFF1F5"))
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 20
                    )
                )
                Spacer()
                
                if showWaveform {
                    WaveformView()
                        .frame(height: 200) // 적절한 높이 설정
                        .transition(.slide)
                        .animation(.easeInOut, value: showWaveform)
                }
                
                RecordButton(audioRecorder: audioRecorder, showWaveform: $showWaveform)
                //AudioRecorder() <-웨이브폼이 바뀌면서 오디오 레코더를 한번더 인스턴스를 생성했기 떄문에
            //isPlaying값이 유지가 안됐던거라.  위를 보세요
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    RecordView()
}
