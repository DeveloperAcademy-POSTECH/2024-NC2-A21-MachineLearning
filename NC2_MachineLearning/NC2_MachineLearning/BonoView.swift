////
////  BonoView.swift
////  NC2_MachineLearning
////
////  Created by 김예림 on 6/19/24.
////
//
//import SwiftUI
//
//struct BonoRecordView: View {
//    @State var recordManager: RecordManager = .init()
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                if !recordManager.tappedRecordButton {
//                    Button(
//                        action: {
//                            recordManager.startRecord()
//                        },
//                        label: {
//                            Text("녹음 시작")
//                        }
//                    )
//                } else {
//                    Button(
//                        action: {
//                            recordManager.finishRecord()
//                        },
//                        label: {
//                            Text("녹음 완료")
//                        }
//                    )
//                    
//                }
//            }
//            .navigationDestination(
//                isPresented: $recordManager.tappedFinishRecordButton,
//                destination: {
//                    // recordManager가 가진 타입(녹음 결과)을 넣은 View로 이동
//                    ResultView(type: recordManager.resultType)
//                }
//            )
//        }
//    }
//}
//
////@Observable
////class RecordManager {
////    var tappedRecordButton: Bool = false
////    var tappedFinishRecordButton: Bool = false
////    var resultType: UserRecordResultType = .bono
////    
////    func startRecord() {
////        // 어쩌구 시작
////        tappedRecordButton = true
////    }
////    
////    func finishRecord() {
////        // 뭔진 모르는데 일단 분석중 굳 !~
////        resultType = .kuro // 결과 반영
////        tappedFinishRecordButton = true // 화면 이동
////    }
////}
//
//enum Reading {
//    case first
//    case second
//    case third
//}
//
//extension ReadingData {
//    var title: String {
//        switch self {
//        case .kuro:
//            "쿠로입니당"
//        case .bono:
//            "보노입니당"
//        }
//    }
//}
//
//struct ResultView: View {
//    let type: UserRecordResultType
//    
//    var body: some View {
//        Text(type.title)
//    }
//}
//
//
//
//#Preview {
//    BonoRecordView()
//}
