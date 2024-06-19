//
//  ResultsObserver.swift
//  NC2_MachineLearning
//
//  Created by 김예림 on 6/19/24.
//

import Foundation
import SwiftUI
import AVFoundation
import SoundAnalysis

//오디오 분석으로 부터 결과 받는 타입 구현
/// An observer that receives results from a classify sound request.
class ResultsObserver: NSObject, SNResultsObserving {
    
    @Binding var classificationResult: String
    
    //각 시간 범위의 classification 결과를 저장할 딕셔너리
    private var classifications: [String: Double] = [:]
    
    init(result: Binding<String>){
        _classificationResult = result
    }
    
    /// Notifies the observer when a request generates a prediction.
    func request(_ request: SNRequest, didProduce result: SNResult) {
        
        // 결과를 SNClassificationResult로부터 받아옴
        // SNClassificationResul은 시간 범위에 대해 가장 높은 순위의 예측 결과를 가져온다고 함
        guard let result = result as? SNClassificationResult else  { return }
        
        
        //classifications는 [SNClassification]임
        //이는 상위 분류 후보를 나열한 배열을 나타냄
        //classification.first니까 젤 높은 순위의 후보를 데려옴
        guard let classification = result.classifications.first else { return }
        
        
        // Get the starting time.
        // timeRange는 클라이언트가 제공하는 오디오 스트림 시간 범위를 의미함
        // 가장 높은 예측 후보의 오디오 시간 범위의!! 시작 시간
        // 시간 범위가 정해지는 기준을 모르겠음;;
        let timeInSeconds = result.timeRange.start.seconds
        
        
        //출력값 : Analysis result for audio at time: 0.49
        let formattedTime = String(format: "%.2f", timeInSeconds)
        print("Analysis result for audio at time: \(formattedTime)")
        
        
        // 얼마나 유사한지 퍼센티지
        // 정확도 -> classification.confidence 이거는 1일 때 정확도가 젤 높음
        let percent = classification.confidence * 100.0
        let percentString = String(format: "%.2f%%", percent)
        
        
        // Print the classification's name (label) with its confidence.
        // classification.identifier는 정의된 모델 클래스
        print("\(classification.identifier): \(percentString) confidence.\n")
        classificationResult = classificationResult + "Analysis result for audio at time: \(formattedTime) \(classification.identifier): \(percentString) confidence \n"
        
        classifications[classification.identifier, default: 0.0] += classification.confidence
    }
    /// Notifies the observer when a request generates an error.
    func request(_ request: SNRequest, didFailWithError error: Error) {
        print("The analysis failed: \(error.localizedDescription)")
    }
    
    /// Notifies the observer when a request is complete.
    func requestDidComplete(_ request: SNRequest) {
        print("The request completed successfully!")
        
        //가장 많이 도출된 classification 결과값을 구하는 로직
        var mostFrequentClassification = classifications.max(by: { $0.value < $1.value })
        // 가장 많이 도출된 identifier
        var identifier = mostFrequentClassification?.key
        // 가장 많이 도출된 identifier의 퍼센트
        var totalConfidence = mostFrequentClassification!.value * 100.0
        var percentString = String(format: "%.2f%%", totalConfidence)
        
    }
}
