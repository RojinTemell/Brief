//
//  AppTheme.swift
//  Brief
//
//  Created by rojin on 11.05.2026.
//

import SwiftUI

protocol AppTheme {
    
    var backgroundPrimary: Color { get }
    var backgroundSecondary: Color { get }



    var surface: Color { get }
    var surfaceElevated: Color { get }



    var textPrimary: Color { get }
    var textSecondary: Color { get }
    var textTertiary: Color { get }
    var textInverse: Color { get }



    var borderSubtle: Color { get }
    var borderDefault: Color { get }



    var accentPrimary: Color { get }
    var accentSecondary: Color { get }
}
