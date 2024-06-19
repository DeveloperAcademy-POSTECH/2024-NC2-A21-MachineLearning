//
//  recordView.swift
//  NC2_MachineLearning
//
//  Created by 김예림 on 6/18/24.
//

import SwiftUI
import SoundAnalysis

struct RecordView: View {
voiceSave
    //@State private var result: String = ""
    var userType: VoiceUserType = VoiceUserType()
    @State var recordManager: RecordManager = .init(audioRecorder: AudioRecorder(), tappedRecordButton: false, tappedFinishRecordButton: false)
    
// =======
    
//     //var observer : ResultsObserver
    
//     //@Binding var isNext: Bool
//     //@State var observer : ResultsObserver
//     @State private var showWaveform = false
//     @StateObject var audioRecorder: AudioRecorder = AudioRecorder()//여기서 애초에 인스턴스를 먼저 생성하면 됩니다. 그이후 하위뷰로 전달하면 됩니다.
// >>>>>>> main
    var body: some View {
        NavigationStack {
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
     voiceSave
                    Spacer()
                    VStack{
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
                    .navigationDestination(isPresented:  $recordManager.tappedFinishRecordButton){
                        CardView(voiceData: userType.voice1)
                    }
                    //RecordButton(audioRecorder: AudioRecorder(), voiceData: VoiceData())
                    
                    Spacer()
                    
                }
// =======
//                 )
//                 Spacer()
                
//                 if showWaveform {
//                     WaveformView()
//                         .frame(height: 200) // 적절한 높이 설정
//                         .transition(.slide)
//                         .animation(.easeInOut, value: showWaveform)
//                 }
                
//                 RecordButton(audioRecorder: audioRecorder, showWaveform: $showWaveform)
//                 //AudioRecorder() <-웨이브폼이 바뀌면서 오디오 레코더를 한번더 인스턴스를 생성했기 떄문에
//             //isPlaying값이 유지가 안됐던거라.  위를 보세요
                
//                 Spacer()
                
// >>>>>>> main
            }
        }
    }
}

@Observable
class RecordManager {
    var audioRecorder: AudioRecorder
    var tappedRecordButton: Bool = false
    var tappedFinishRecordButton: Bool = false
    //var resultType: UserRecordResultType = .bono
    
    init(audioRecorder: AudioRecorder, tappedRecordButton: Bool, tappedFinishRecordButton: Bool) {
        self.audioRecorder = audioRecorder
        self.tappedRecordButton = tappedRecordButton
        self.tappedFinishRecordButton = tappedFinishRecordButton
        //self.resultType = resultType
    }
    
    func startRecord() {
        // 어쩌구 시작
        print("startRecord")
        tappedRecordButton = true
        audioRecorder.startRecording()
        print("hi")
        
    }
    
    func finishRecord() {
        // 뭔진 모르는데 일단 분석중 굳 !~
        //resultType = .kuro // 결과 반영
        tappedFinishRecordButton = true // 화면 이동
        audioRecorder.stopRecording()
        print("finishRecord")
    }
}

#Preview {
    RecordView()
}
