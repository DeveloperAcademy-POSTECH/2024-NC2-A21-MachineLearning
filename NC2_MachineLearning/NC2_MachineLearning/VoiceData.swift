//
//  VoiceData1.swift
//  NC2_MachineLearning
//
//  Created by 김예림 on 6/18/24.
//

import Foundation
//import SwiftUI

struct VoiceData {
    var name: String
    var imageName: String
    var features: [String]
    var description: String
    var bestImageName: String
    var worstImageName: String
}

struct VoiceUserType {
    
    init(voice1: VoiceData = VoiceData(name: "나른한 힐링 마스터", imageName: "test", features: ["저음의","부드러운","차분한"], description: "가오에 살고 가오에 죽는 타입이에요 \n 목소리는 좋지만 사실 가진건 쥐뿔도없답니다", bestImageName: "깨발랄 귀염둥이", worstImageName: "깨발랄 귀염둥이"), voice2: VoiceData = VoiceData(name: "바이크타는 터프가이", imageName: "", features: ["저음의","거친","날카로운"], description: "가오에 살고 가오에 죽는 타입이에요 목소리는 좋지만 사실 가진건 쥐뿔도없답니다", bestImageName: "", worstImageName: ""), voice3: VoiceData = VoiceData(name: "팔방미인 해결사", imageName: "", features: ["중간의","신뢰가는","싹싹한"], description: "가오에 살고 가오에 죽는 타입이에요 목소리는 좋지만 사실 가진건 쥐뿔도없답니다", bestImageName: "", worstImageName: ""), voice4: VoiceData = VoiceData(name: "해맑은 동네 인싸", imageName: "", features: ["고음의","부드러운","친절한"], description: "가오에 살고 가오에 죽는 타입이에요 목소리는 좋지만 사실 가진건 쥐뿔도없답니다", bestImageName: "깨발랄 귀염둥이", worstImageName: "")) {
        self.voice1 = voice1
        self.voice2 = voice2
        self.voice3 = voice3
        self.voice4 = voice4
    }
    
    var voice1 = VoiceData(name: "나른한 힐링 마스터", imageName: "test", features: ["저음의","부드러운","차분한"], description: "가오에 살고 가오에 죽는 타입이에요 \n 목소리는 좋지만 사실 가진건 쥐뿔도없답니다", bestImageName: "깨발랄 귀염둥이", worstImageName: "깨발랄 귀염둥이")
    
    var voice2 = VoiceData(name: "바이크타는 터프가이", imageName: "", features: ["저음의","거친","날카로운"], description: "가오에 살고 가오에 죽는 타입이에요 목소리는 좋지만 사실 가진건 쥐뿔도없답니다", bestImageName: "", worstImageName: "")
    
    var voice3 = VoiceData(name: "팔방미인 해결사", imageName: "", features: ["중간의","신뢰가는","싹싹한"], description: "가오에 살고 가오에 죽는 타입이에요 목소리는 좋지만 사실 가진건 쥐뿔도없답니다", bestImageName: "", worstImageName: "")
    
    var voice4 = VoiceData(name: "해맑은 동네 인싸", imageName: "", features: ["고음의","부드러운","친절한"], description: "가오에 살고 가오에 죽는 타입이에요 목소리는 좋지만 사실 가진건 쥐뿔도없답니다", bestImageName: "깨발랄 귀염둥이", worstImageName: "")
}

//#Preview {
//    VoiceDataView()
//}
