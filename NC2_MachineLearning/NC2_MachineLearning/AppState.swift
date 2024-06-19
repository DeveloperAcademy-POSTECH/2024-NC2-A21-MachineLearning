//
//  AppState.swift
//  NC2_MachineLearning
//
//  Created by 김준수(엘빈) on 6/20/24.
//




import SwiftUI

class AppState: ObservableObject {
    @Published var isInitialScreen: Bool = true
    @Published var isRecordViewActive: Bool = false
    
    func reset() {
        isInitialScreen = true
        isRecordViewActive = false
    }
}

