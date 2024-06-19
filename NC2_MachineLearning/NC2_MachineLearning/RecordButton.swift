//
//  RecordButton.swift
//  NC2_MachineLearning
//
//  Created by 김예림 on 6/19/24.
//

import SwiftUI
import SoundAnalysis

struct RecordButton: View {
    
    //오디오 녹음
    @ObservedObject var audioRecorder: AudioRecorder
    
    //@State var observer : ResultsObserver
    
    //분석 결과에 따른 voiceData 전달 -> CardView로 이동
    var voiceData: VoiceData
//    let audioFileURL: URL
//    
//    //초기화 필요
//    init(audioRecorder: AudioRecorder, observer: ResultsObserver, voiceData: VoiceData) {
//        self.audioRecorder = audioRecorder
//        self.observer = observer
//        self.voiceData = voiceData
//        if let recordedFile = audioRecorder.recordedFile {
//            self.audioFileURL = recordedFile
//        }
//    }
    
    var body: some View {
            HStack {
                
                
            }
    }
//    func classifySound(){
//        let audioFileAnalyzer = try! SNAudioFileAnalyzer(url: audioFileURL)
//        
//        let request = try! SNClassifySoundRequest(mlModel: voiceClassifier().model)
//        do{
//            try? audioFileAnalyzer.add(request, withObserver: observer)
//            try audioFileAnalyzer.analyze()
//        }
//    }
}

//#Preview {
//    //var voiceData: VoiceData
//    RecordButton(audioRecorder: AudioRecorder(), voiceData: VoiceData, voiceData: )
//}
