//
//  Color+hexColor.swift
//  mc2
//
//  Created by 김예림 on 5/19/24.
//

import Foundation
import SwiftUI
import UIKit

extension Color {
    init(hexColor: String, opacity: Double = 1.0) {
        let hex = Int(hexColor, radix: 16)!
        
        let red = Double((hex >> 16) & 0xff) / 255
        let green = Double((hex >> 8) & 0xff) / 255
        let blue = Double((hex >> 0) & 0xff) / 255

        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
//    
//    static let gray100 = Color(hexColor: "F2F5F9") // F2F4F9 -> F2F5F9
//    static let gray200 = Color(hexColor: "ECEFF4")
//    static let gray300 = Color(hexColor: "DCE1E9")
//    static let gray400 = Color(hexColor: "CED2DA")
//    static let gray500 = Color(hexColor: "9BA4AB")
//    static let gray600 = Color(hexColor: "727A82")
//    static let gray700 = Color(hexColor: "464C56")
//    static let gray800 = Color(hexColor: "222935")
//    static let gray900 = Color(hexColor: "13161D")
//    
//    static let numRed = Color(hexColor: "FD3672")
//    static let numGreen = Color(hexColor: "00C7BE")
//    static let numBlue = Color(hexColor: "007AFF")
//    
//    static let pickerLabel = gray700
//    static let iconGray = gray700
//    static let bg = gray100
//    static let divider = gray300
//    static let historyInput = gray500
//    static let historyOutput = gray800
//    static let wonText = gray800
//    static let outputText = gray900
}

extension UIColor {
    static let numRed = UIColor(hexColor: "FD3672")
    static let numGreen = UIColor(hexColor: "00C7BE")
    static let numBlue = UIColor(hexColor: "007AFF")
    static let clearGray = UIColor(hexColor: "DCE1E9")
    static let placeHolderGray = UIColor(hexColor: "CED2DA")
    
    static let gray300 = UIColor(hexColor: "DCE1E9")
    
    // Convenience initializer to create UIColor from hex string
    convenience init(hexColor: String) {
        let hex = hexColor.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
