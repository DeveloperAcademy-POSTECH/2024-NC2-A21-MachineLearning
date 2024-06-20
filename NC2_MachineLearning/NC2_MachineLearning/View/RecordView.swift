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

    @State private var selectedQuoteIndex = Int.random(in: 0..<QuoteManager.quotes.count)
    @StateObject var recordManager: RecordManager
    
    init() {
        let observer = ResultsObserver(result: .constant(""))
        let audioRecorder = AudioRecorder()
        _recordManager = StateObject(wrappedValue: RecordManager(observer: observer, audioRecorder: audioRecorder, voiceUserType: VoiceUserType(), voiceData: VoiceData(name: "", imageName: "", features: ["","",""], description: "", bestImageName: "", worstImageName: ""), userType: ""))
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
                        Text(QuoteManager.quotes[selectedQuoteIndex].quote)
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
                            
                            Text(QuoteManager.quotes[selectedQuoteIndex].movieTitle)
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
                
                CardView(voiceData: recordManager.voiceData)
            }
        }
        .onAppear {
            result = ""
            selectedQuoteIndex = 0
        }
    }
}

class RecordManager: ObservableObject {
    var observer: ResultsObserver
    var audioRecorder: AudioRecorder
    var voiceUserType: VoiceUserType
    var voiceData: VoiceData
    var userType: String
    //var audioFileURL:URL = audioRecorder.recordedFile
    @Published var tappedRecordButton: Bool = false
    @Published var tappedFinishRecordButton: Bool = false
    @Published var showWaveform = false
    
    init(observer: ResultsObserver, audioRecorder: AudioRecorder, voiceUserType: VoiceUserType, voiceData: VoiceData, userType: String) {
        self.observer = observer
        self.audioRecorder = audioRecorder
        self.voiceUserType = voiceUserType
        self.voiceData = voiceData
        self.userType = userType
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
        userType = observer.mostClassificationIdentifier
        print(userType)
        
        if userType == "01_male"{
            voiceData = voiceUserType.voice1
        }
        else if userType == "02_male" {
            voiceData = voiceUserType.voice2
        }
        else if userType == "03_male" {
            voiceData = voiceUserType.voice3
        }
        else if userType == "04_male" {
            voiceData = voiceUserType.voice4
        }
        else if userType == "05_female" {
            voiceData = voiceUserType.voice5
        }
        else if userType == "06_female" {
            voiceData = voiceUserType.voice6
        }
        else if userType == "07_female" {
            voiceData = voiceUserType.voice7
        }
        else if userType == "08_female" {
            voiceData = voiceUserType.voice8
        }
    }
    
}

#Preview {
    RecordView()
}
