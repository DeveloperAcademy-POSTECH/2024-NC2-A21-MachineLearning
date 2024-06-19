//
//  RecordButton.swift
//  NC2_MachineLearning
//
//  Created by 김예림 on 6/19/24.
//

import SwiftUI
import SoundAnalysis

struct RecordButton: View {
    
    @ObservedObject var audioRecorder: AudioRecorder
    //var voiceData: VoiceData
    //위의 audioRecorder는 아직 생성이 안되었는데, audioFileURL을 불러오려 하니 계속 에러가 떴던 것!
    //    var audioFileURL: URL? {
    //        audioRecorder.recordedFile
    //    }
    @Binding var showWaveform: Bool
    var body: some View {
        NavigationStack { //여기에 들어가면 안되고 제일 상단에 한번만 선언해야댑니다 알겠습니까 쿠로?
            HStack {
                
                Button(
                    action: {

                        if audioRecorder.isRecording {
                            showWaveform = false
                            audioRecorder.stopRecording()
                            print("스탑")

                        } else {
                            showWaveform = true
                            audioRecorder.startRecording()
                            print(audioRecorder.isRecording)
                            print("시작")

                        }
                        
                        //showWaveform.toggle()
                    },
                    label: {
                        ZStack {
                            Circle()
                                .foregroundColor(Color(red: 0.36, green: 0.55, blue: 0.86))
                                .frame(width: 111, height: 111)
                            Circle()
                                .foregroundColor(Color(red: 0.59, green: 0.8, blue: 0.98))
                                .frame(width: 81.57682, height: 81.57682)
                            Circle()
                                .foregroundColor(Color(red: 0.83, green: 0.96, blue: 1))
                                .frame(width: 66.71552, height: 66.71551)
                            Image(audioRecorder.isRecording ? "stop" : "mike")
                            
                        }
                    
                    })
                .navigationDestination(isPresented: $audioRecorder.isNext){
                        //CardView(voiceData: voiceData.$voice1)
                    }
                
            }
        }
    }
}

#Preview {
    RecordButton(audioRecorder: AudioRecorder(),showWaveform: .constant(false))
}
