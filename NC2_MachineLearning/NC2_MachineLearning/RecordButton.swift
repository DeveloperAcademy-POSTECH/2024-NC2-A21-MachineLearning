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
    
    
//    init(audioRecorder: AudioRecorder) {
//        self.audioRecorder = audioRecorder
//    }
    
    //위의 audioRecorder는 아직 생성이 안되었는데, audioFileURL을 불러오려 하니 계속 에러가 떴던 것!
    var audioFileURL: URL? {
        audioRecorder.recordedFile
    }
    
    var body: some View {
        HStack {
            Button(
                action: {
                    audioRecorder.isRecording
                    ? audioRecorder.stopRecording()
                    : audioRecorder.startRecording()
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
            //{
//                Text(audioRecorder.isRecording ? "음성메모 종료" : "음성메모 시작")
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(audioRecorder.isRecording ? Color.red : Color.blue)
//                    .cornerRadius(10)
//            }
        }
    }
}

//#Preview {
//    RecordButton(audioRecorder: AudioRecorder(), observer: ResultsObserver(result: Binding<String>))
//}
