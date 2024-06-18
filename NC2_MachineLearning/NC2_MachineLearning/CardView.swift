//
//  CardView.swift
//  NC2_MachineLearning
//
//  Created by 김예림 on 6/18/24.
//

import SwiftUI

struct CardView: View {
    @Binding var voiceData: Voice
    
    var body: some View {
        VStack{
            
            Text("목소리만 좋은 거렁뱅이")
                .font(.Dnf32)
                .foregroundStyle(Color(hexColor: "5B8CDC"))
                .padding(.top, 50)
            
            ChipLayout(verticalSpacing: 12, horizontalSpacing: 12) {
                HStack{
                    Spacer()
                    ForEach(voiceData.features.indices, id: \.self) { index in
                        let model = voiceData.features[index]
                        Text(model)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(
                                Capsule().foregroundStyle(Color(hexColor: "EFF1F5"))
                            )
                    }
                    Spacer()
                }
                
            }
            
            Spacer()
            
        }//.border(.black)
    }
}

//MARK: - ChipLayout

struct ChipLayout: Layout {
    var verticalSpacing: CGFloat = 0
    var horizontalSpacing: CGFloat = 0
    
    // scrollView에서 height = nil
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout Cache) -> CGSize {
        print("--sizeThatFits--", cache)
        return CGSize(width: proposal.width ?? 0, height: cache.height)
    }
    
    // proposal 제공 뷰크기
    // bounds 위치
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout Cache) {
        print("--placeSubviews--")
        print("bound: ", bounds)
        print("proposal: ", proposal)
        
        var sumX: CGFloat = bounds.minX
        var sumY: CGFloat = bounds.minY
        
        for index in subviews.indices {
            let view = subviews[index]
            let viewSize = view.sizeThatFits(.unspecified)
            guard let proposalWidth = proposal.width else { continue }
            
            // 가로 끝인경우 아래로 이동
            if (sumX + viewSize.width > proposalWidth) {
                sumX = bounds.minX
                sumY += viewSize.height
                sumY += verticalSpacing
            }
            
            let point = CGPoint(x: sumX, y: sumY)
            // anchor: point의 기준 적용지점
            // proposal: unspecified, infinity -> 넘어감, zero -> 사라짐, size -> 제안한크기 만큼 지정됨
            view.place(at: point, anchor: .topLeading, proposal: proposal)
            sumX += viewSize.width
            sumX += horizontalSpacing
            
            
        }
        if let firstViewSize = subviews.first?.sizeThatFits(.unspecified) {
            // sumY는 topLeading 기준의 좌표이므로 height를 구하려면
            // chip뷰의 height를 더해야 전체 높이값이 나옵니다.
            cache.height = sumY + firstViewSize.height
        }
    }
    
    struct Cache {
        var height: CGFloat
    }
    
    func makeCache(subviews: Subviews) -> Cache {
        print("make cache")
        return Cache(height: 0)
    }
    
    func updateCache(_ cache: inout Cache, subviews: Subviews) {
        print("update cache", cache)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(voiceData: .constant(Voice(name: "나른한 힐링 마스터", features: ["저음의","부드러운","차분한"], description: "가오에 살고 가오에 죽는 타입이에요 목소리는 좋지만 사실 가진건 쥐뿔도없답니다", goodImageName: "", badImageName: "")))
    }
}
