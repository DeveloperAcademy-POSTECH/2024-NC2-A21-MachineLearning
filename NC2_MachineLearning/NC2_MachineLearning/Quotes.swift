//
//  Quotes.swift
//  NC2_MachineLearning
//
//  Created by 김준수(엘빈) on 6/20/24.
//

import SwiftUI

struct QuoteData {
    let quote: String
    let movieTitle: String
}

enum QuoteManager {
    static let quotes: [QuoteData] = [
        QuoteData(quote: "\" 잘못되고 있는 것에 집중하면 안 돼.\n항상 상황을 바꿀 방법이 있어. \"", movieTitle: "InsideOut, Joy"),
        QuoteData(quote: "\" 다시 시도해. 다시 해보는 것을 두려워하지 마. \"", movieTitle: "The Matrix, Morpheus"),
        QuoteData(quote: "\" 이 일은 전혀 제 기술을 테스트하지 않고 시작했어. \"", movieTitle: "Inception, Cobb"),
        QuoteData(quote: "\" 당신이 할 수 있는 건 우리가 할 수 있는 최선을 다하는 것이다. 그게 전부야. \"", movieTitle: "Forrest Gump, Forrest Gump"),
        QuoteData(quote: "\" 당신이 꿈꾸는 건 사실이 될 수 있어. 그래야만 한다. \"", movieTitle: "The Shawshank Redemption, Red")
    ]
}



