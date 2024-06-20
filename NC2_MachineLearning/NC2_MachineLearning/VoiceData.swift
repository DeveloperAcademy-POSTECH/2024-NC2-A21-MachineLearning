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
    
    
    init(voice1: VoiceData = VoiceData(name: "나른한 힐링 마스터", imageName: "voice1", features: ["저음의","부드러운","차분한"], description: "목소리가 좋다는 소릴 많이 들어요(다방 DJ재질) \n 목소리는 좋지만 텐션은 좀 낮아요 \n 만약 교수님이라면 학생들이 모두 잠들 수 있습니다", bestImageName: "사랑스런치와와", worstImageName: "고뇌의전교1등"), voice2: VoiceData = VoiceData(name: "바이크타는 터프가이", imageName: "voice2", features: ["저음의","거친","날카로운"], description: "가오에 살고 가오에 죽는 타입이에요 \n 건실하게 살아도 망나니로 오해받을 수 있어요 \n 의외로 속은 여린면이 있어요", bestImageName: "수줍은고양이", worstImageName: "고민팔이소녀"), voice3: VoiceData = VoiceData(name: "팔방미인 해결사", imageName: "voice3", features: ["중간의","신뢰가는","싹싹한"], description: "문제 해결에 능숙한 이미지를 줘요 \n 차분하고 냉정하게 상황을 판단해요 \n  누구나 쉽게 접근할 수 있는 분위기를 만들어요.", bestImageName: "고민팔이소녀", worstImageName: "수줍은고양이"), voice4: VoiceData = VoiceData(name: "해맑은 동네 인싸", imageName: "voice4", features: ["고음의","부드러운","친절한"], description: "항상 웃음 소리가 끊이지 않는 것처럼 말해요  \n 사람들 사이에서 인기가 많아요 \n 누구든 편안하게 대할 수 있는 능력을 가졌어요", bestImageName: "고뇌의전교1등", worstImageName: "사랑스런치와와"), voice5: VoiceData = VoiceData(name: "고뇌에 빠진 전교1등", imageName: "voice5", features: ["저음의","중성적인","신뢰가는"], description: "지적이고 뛰어난 능력을 가졌어요 \n 사람들과 거리를 두는 경향이 있어요 \n 그치만 자신을 이해해주는 사람이 필요해요", bestImageName: "해맑은동네인싸", worstImageName: "나른한힐링마스터"), voice6: VoiceData = VoiceData(name: "수줍은 고양이", imageName: "voice6", features: ["고음의","수줍은","차분한"], description: "낯가림이 심해서 처음엔 접근하기 어려워요 \n 친해지면 충분히 사랑스러운 친구가 될 수 있어요 \n 사람들 앞에서는 조금 떨리는 느낌을 주기도 해요", bestImageName: "바이크터프가이", worstImageName: "팔방미인해결사"), voice7: VoiceData = VoiceData(name: "고민팔이 소녀", imageName: "voice7", features: ["중음의","부드러운","차분한"], description: "듣는 사람들에게 위로가 되는 느낌을 줘요 \n 본인도 고민이 많지만 사람들에게 말을 잘 안해요 \n 차분한성품으로 주변 사람들에게 신뢰받아요", bestImageName: "팔방미인해결사", worstImageName: "바이크터프가이"), voice8: VoiceData = VoiceData(name: "사랑스런 치와와", imageName: "voice8", features: ["고음의","사랑스런","귀여운"], description: "듣는 사람들에게 사랑받는 이미지를 전달해요 \n 말투가 사랑스럽고 귀여워요 \n 때문에 많은 사람들이 친근하게 대해주려고 해요", bestImageName: "나른한힐링마스터", worstImageName: "해맑은동네인싸")) {
        self.voice1 = voice1
        self.voice2 = voice2
        self.voice3 = voice3
        self.voice4 = voice4
        self.voice5 = voice5
        self.voice6 = voice6
        self.voice7 = voice7
        self.voice8 = voice8
    }
    
    var voice1 = VoiceData(name: "나른한 힐링 마스터", imageName: "voice1", features: ["저음의","부드러운","차분한"], description: "목소리가 좋다는 소릴 많이 들어요(다방 DJ재질) \n 목소리는 좋지만 텐션은 좀 낮아요 \n 만약 교수님이라면 학생들이 모두 잠들 수 있습니다", bestImageName: "사랑스런치와와", worstImageName: "고뇌의전교1등")
    
    var voice2 = VoiceData(name: "바이크타는 터프가이", imageName: "voice2", features: ["저음의","거친","날카로운"], description: "가오에 살고 가오에 죽는 타입이에요 \n 건실하게 살아도 망나니로 오해받을 수 있어요 \n 의외로 속은 여린면이 있어요", bestImageName: "수줍은고양이", worstImageName: "고민팔이소녀")
    
    var voice3 = VoiceData(name: "팔방미인 해결사", imageName: "voice3", features: ["중간의","신뢰가는","싹싹한"], description: "문제 해결에 능숙한 이미지를 줘요 \n 차분하고 냉정하게 상황을 판단해요 \n  누구나 쉽게 접근할 수 있는 분위기를 만들어요.", bestImageName: "고민팔이소녀", worstImageName: "수줍은고양이")
    
    var voice4 = VoiceData(name: "해맑은 동네 인싸", imageName: "voice4", features: ["고음의","부드러운","친절한"], description: "항상 웃음 소리가 끊이지 않는 것처럼 말해요  \n 사람들 사이에서 인기가 많아요 \n 누구든 편안하게 대할 수 있는 능력을 가졌어요", bestImageName: "고뇌의전교1등", worstImageName: "사랑스런치와와")
    
    var voice5 = VoiceData(name: "고뇌에 빠진 전교1등", imageName: "voice5", features: ["저음의","중성적인","신뢰가는"], description: "지적이고 뛰어난 능력을 가졌어요 \n 사람들과 거리를 두는 경향이 있어요 \n 그치만 자신을 이해해주는 사람이 필요해요", bestImageName: "해맑은동네인싸", worstImageName: "나른한힐링마스터")
    
    var voice6 = VoiceData(name: "수줍은 고양이", imageName: "voice6", features: ["고음의","수줍은","차분한"], description: "낯가림이 심해서 처음엔 접근하기 어려워요 \n 친해지면 충분히 사랑스러운 친구가 될 수 있어요 \n 사람들 앞에서는 조금 떨리는 느낌을 주기도 해요", bestImageName: "바이크터프가이", worstImageName: "팔방미인해결사")
    
    var voice7 = VoiceData(name: "고민팔이 소녀", imageName: "voice7", features: ["중음의","부드러운","차분한"], description: "듣는 사람들에게 위로가 되는 느낌을 줘요 \n 본인도 고민이 많지만 사람들에게 말을 잘 안해요 \n 차분한성품으로 주변 사람들에게 신뢰받아요", bestImageName: "팔방미인해결사", worstImageName: "바이크터프가이")
    
    var voice8 = VoiceData(name: "사랑스런 치와와", imageName: "voice8", features: ["고음의","사랑스런","귀여운"], description: "듣는 사람들에게 사랑받는 이미지를 전달해요 \n 말투가 사랑스럽고 귀여워요 \n 때문에 많은 사람들이 친근하게 대해주려고 해요", bestImageName: "나른한힐링마스터", worstImageName: "해맑은동네인싸")
}
    
    //#Preview {
    //    VoiceDataView()
    //}
