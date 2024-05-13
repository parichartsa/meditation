//
//  TimeComponents.swift
//  Meditation
//
//  Created by parichartsa on 13/5/2567 BE.
//

import SwiftUI

extension TimeComponents {
    static let positional : DataComponentsFormatter = {
        print("Initializing Time Components Formatter.positional")
        let formatter = DataComponentsFormatter()
        
        formatter.allowedUnits = [.minute, .second]
        formatter.unitStyle = positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter
    }()
}
