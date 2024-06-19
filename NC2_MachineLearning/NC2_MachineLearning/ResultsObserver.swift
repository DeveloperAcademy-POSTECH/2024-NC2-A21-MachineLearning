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

/// An observer that receives results from a classify sound request.
class ResultsObserver: NSObject, SNResultsObserving {
    
    @Binding var classificationResult: String
    
    init(result: Binding<String>){
        _classificationResult = result
    }
    
    /// Notifies the observer when a request generates a prediction.
    func request(_ request: SNRequest, didProduce result: SNResult) {
        // Downcast the result to a classification result.
        guard let result = result as? SNClassificationResult else  { return }
        
        
        // Get the prediction with the highest confidence.
        guard let classification = result.classifications.first else { return }
        
        
        // Get the starting time.
        let timeInSeconds = result.timeRange.start.seconds
        
        
        // Convert the time to a human-readable string.
        let formattedTime = String(format: "%.2f", timeInSeconds)
        print("Analysis result for audio at time: \(formattedTime)")
        
        
        // Convert the confidence to a percentage string.
        let percent = classification.confidence * 100.0
        let percentString = String(format: "%.2f%%", percent)
        
        
        // Print the classification's name (label) with its confidence.
        print("\(classification.identifier): \(percentString) confidence.\n")
        classificationResult = classificationResult + "Analysis result for audio at time: \(formattedTime) \(classification.identifier): \(percentString) confidence \n"
    }
    /// Notifies the observer when a request generates an error.
    func request(_ request: SNRequest, didFailWithError error: Error) {
        print("The analysis failed: \(error.localizedDescription)")
    }
    
    /// Notifies the observer when a request is complete.
    func requestDidComplete(_ request: SNRequest) {
        print("The request completed successfully!")
    }
}