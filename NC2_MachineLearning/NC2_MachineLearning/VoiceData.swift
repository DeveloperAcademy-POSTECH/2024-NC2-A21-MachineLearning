//
//  VoiceData1.swift
//  NC2_MachineLearning
//
//  Created by 김예림 on 6/18/24.
//

import Foundation
import SwiftUI

struct Voice{
    var name: String
    var imageName: String
    var features: [String]
    var description: String
    var bestImageName: String
    var worstImageName: String
}

struct VoiceData {
    
    @State private var voice1 = Voice(name: "나른한 힐링 마스터", imageName: "", features: ["저음의","부드러운","차분한"], description: "가오에 살고 가오에 죽는 타입이에요 \n 목소리는 좋지만 사실 가진건 쥐뿔도없답니다", bestImageName: "깨발랄 귀염둥이", worstImageName: "")
    
    @State private var voice2 = Voice(name: "바이크타는 터프가이", imageName: "", features: ["저음의","거친","날카로운"], description: "가오에 살고 가오에 죽는 타입이에요 목소리는 좋지만 사실 가진건 쥐뿔도없답니다", bestImageName: "", worstImageName: "")
    
    @State private var voice3 = Voice(name: "팔방미인 해결사", imageName: "", features: ["중간의","신뢰가는","싹싹한"], description: "가오에 살고 가오에 죽는 타입이에요 목소리는 좋지만 사실 가진건 쥐뿔도없답니다", bestImageName: "", worstImageName: "")
    
    @State private var voice4 = Voice(name: "해맑은 동네 인싸", imageName: "", features: ["고음의","부드러운","친절한"], description: "가오에 살고 가오에 죽는 타입이에요 목소리는 좋지만 사실 가진건 쥐뿔도없답니다", bestImageName: "", worstImageName: "")
}

//#Preview {
//    VoiceDataView()
//}
