//
//  recordView.swift
//  NC2_MachineLearning
//
//  Created by 김예림 on 6/18/24.
//

import SwiftUI

struct RecordView: View {
    var body: some View {
        VStack {
            Spacer().frame(height: 80)
            Text("아래 문장을 대화하듯 읽어주세요!")
                .font(.Dnf20)
                .padding(.bottom,22)
            VStack{
                Text("너는 진짜 인생을 참 스펙타클하게 사는것같아!정말 존경한다!")
                    .font(.preMedium22)
            }
            .frame(width:350 ,height: 175)
            .background(Color(hexColor: "EFF1F5"))
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 30
                )
            )
            Spacer()
        }
    }
}

#Preview {
    recordView()
}
