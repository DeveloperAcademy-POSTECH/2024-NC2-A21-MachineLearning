//
//  CardView.swift
//  NC2_MachineLearning
//
//  Created by 김예림 on 6/18/24.
//

import SwiftUI

struct CardView: View {
    
    //원하는 구조체를 불러오기 위해 바인딩하기
    var voiceData: VoiceData
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            ScrollView {
                VStack{
                    
                    Spacer().frame(height: 35)
                    
                    Text("\(voiceData.name)")
                        .font(.Dnf32)
                        .foregroundStyle(Color(hexColor: "5B8CDC"))
                    
                    Spacer().frame(height: 10)
                    
                    HStack{
                        ForEach(voiceData.features.indices, id: \.self) { index in
                            let model = voiceData.features[index]
                            Text("#\(model)")
                                .font(.preMedium15)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 9)
                                .foregroundStyle(.black
                                )
                                .background(
                                    Rectangle()
                                        .foregroundColor(Color(hexColor: "EFF1F5"))
                                        .cornerRadius(20)
                                )
                        }
                    }
                    
                    Spacer().frame(height: 18)
                    
                    Image(voiceData.imageName)
                    
                    //설명글
                    VStack(alignment: .leading){
                        Text("\(voiceData.name)는...")
                            .font(.preBold16)
                            .foregroundStyle(Color(hexColor: "9CA8C0"))
                        
                        Spacer().frame(height: 10)
                        
                        Text(voiceData.description)
                            .foregroundStyle(.black)
                            .tracking(-0.2)
                            .lineSpacing(3)
                        
                    }
                    //.border(Color.black)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 33)
                    .background(Color(hexColor: "EFF1F5"))
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 15
                        )
                    )
                    
                    Spacer()
                    
                    //보이스 궁합 결과
                    
                    HStack{
                        VStack(alignment:.leading){
                            Text("Best Match")
                                .font(.preBold14)
                                .foregroundStyle(Color(hexColor: "9CA8C0"))
                            
                            Text(voiceData.bestImageName)
                                .font(.Dnf18)
                                .foregroundStyle(Color(hexColor: "67738D"))
                                .padding(.trailing,20)
                            
                            Spacer().frame(height: 5)
                            
                            Image(voiceData.bestImageName)
                                .padding(.leading,40)
                        }
                        .padding(.leading,21)
                        .padding(.top,20)
                        .background(Color(hexColor: "EFF1F5"))
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 15
                            )
                        )
                        
                        VStack(alignment:.leading){
                            Text("Worst Match")
                                .font(.preBold14)
                                .foregroundStyle(Color(hexColor: "9CA8C0"))
                            
                            Text(voiceData.worstImageName)
                                .font(.Dnf20)
                                .foregroundStyle(Color(hexColor: "67738D"))
                                .padding(.trailing,5)
                            
                            Spacer().frame(height: 5)
                            
                            Image(voiceData.worstImageName)
                                .padding(.leading,40)
                        }
                        .padding(.leading,21)
                        .padding(.top,20)
                        .background(Color(hexColor: "EFF1F5"))
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 15
                            )
                        )
                    }
                    
                    Spacer().frame(height: 30)
                    
                    Button(action: {
                        
                    }, label: {
                        VStack{
                            Text("처음으로")
                                .foregroundStyle(.white)
                                .font(.Dnf25)
                        }
                        .padding(.horizontal, 134)
                        .padding(.vertical, 14)
                        //.frame(width: 362, height: 65)
                        .background(Color(hexColor: "5B8CDC"))
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 15
                            )
                        )
                    })
                    .padding(.bottom,25)
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(voiceData: VoiceData(name: "나른한 힐링 마스터", imageName: "test", features: ["저음의","부드러운","차분한"], description: "가오에 살고 가오에 죽는 타입이에요 목소리는 좋지만 사실 가진건 쥐뿔도없답니다", bestImageName: "사랑스런치와와", worstImageName: "고뇌의전교1등"))
    }
}
