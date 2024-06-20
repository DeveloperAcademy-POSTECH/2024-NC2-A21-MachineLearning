//
//  recordView.swift
//  NC2_MachineLearning
//
//  Created by 김예림 on 6/18/24.
//

import SwiftUI
import SoundAnalysis
import AVFoundation

struct RecordView: View {
    @State var result: String = ""
    var userType: VoiceUserType = VoiceUserType()
    
    @StateObject var recordManager: RecordManager
    
    init() {
        let observer = ResultsObserver(result: .constant(""))
        let audioRecorder = AudioRecorder()
        _recordManager = StateObject(wrappedValue: RecordManager(observer: observer, audioRecorder: audioRecorder))
    }
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.white
                    .ignoresSafeArea()
                VStack {
                    Spacer().frame(height: 30)
                    Text("아래 문장을 대화하듯 읽어주세요!")
                        .foregroundStyle(Color.black)
                        .font(.Dnf20)
                        .padding(.bottom,20)
                    
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
                    
                    Spacer().frame(height: 80)
                    
                    VStack{
                        VStack{
                            if recordManager.showWaveform {
                                WaveformView()
                                    .frame(height: 200) // 적절한 높이 설정
                                    .transition(.slide)
                                    .animation(.easeInOut, value: recordManager.showWaveform)
                            }
                        }.frame(width: 280, height: 100)
                            .padding(10)
                        if !recordManager.tappedRecordButton {
                            Button(
                                action: {
                                    print("hello")
                                    recordManager.startRecord()
                                    
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
                                        Image("mike")
                                    }
                                })
                        } else {
                            Button(
                                action: {
                                    recordManager.finishRecord()
                                    print("finish")
                                    recordManager.classifySound()
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
                                        Image("stop")
                                    }
                                })
                        }
                    }
                }
            }.navigationDestination(isPresented:  $recordManager.tappedFinishRecordButton){
                CardView(voiceData: userType.voice1)
            }
        }
    }
}

class RecordManager: ObservableObject {
    var observer: ResultsObserver
    var audioRecorder: AudioRecorder
    //var audioFileURL:URL = audioRecorder.recordedFile
    @Published var tappedRecordButton: Bool = false
    @Published var tappedFinishRecordButton: Bool = false
    @Published var showWaveform = false
    
    init(observer: ResultsObserver, audioRecorder: AudioRecorder) {
        self.observer = observer
        self.audioRecorder = audioRecorder
    }
    
    func startRecord() {
        // 어쩌구 시작
        print("startRecord")
        showWaveform = true
        //showWaveform.toggle()
        tappedRecordButton = true
        audioRecorder.startRecording()
        print("hi")
        
    }
    
    func finishRecord() {
        // 뭔진 모르는데 일단 분석중 굳 !~
        // 결과 반영
        showWaveform = false
        tappedFinishRecordButton = true // 화면 이동
        audioRecorder.stopRecording()
        print("finishRecord")
    }
    
    func classifySound(){
        let audioFileAnalyzer = try! SNAudioFileAnalyzer(url: audioRecorder.recordedFile!)
        
        let request = try! SNClassifySoundRequest(mlModel: voiceClassifier().model)
        do{
            try? audioFileAnalyzer.add(request, withObserver: observer)
            try audioFileAnalyzer.analyze()
        }
    }
}

#Preview {
    RecordView()
}
