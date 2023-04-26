//
//  EVButton.swift
//  Events
//
//  Created by Marcelo Diefenbach on 23/04/23.
//

import Foundation
import SwiftUI

struct EVButton: View {
    enum Style {
        case primary
        case secondary
        case disabled
    }
    
    let title: String
    let iconSFSymbols: String?
    let style: Style
    let action: () -> Void
    
    private var backgroundColor: Color {
        switch style {
        case .primary:
            return Color.DesignSystem.primary
        case .secondary:
            return Color.DesignSystem.secondary
        case .disabled:
            return Color.DesignSystem.black.opacity(0.3)
        }
    }
    
    var body: some View {
        Button(action: action) { // Chama a closure de ação quando o botão é pressionado
            HStack {
                if let iconSFSymbols = iconSFSymbols, !iconSFSymbols.isEmpty, iconSFSymbols != "" {
                    Image(systemName: iconSFSymbols)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.trailing, 8)
                        .foregroundColor(style == .disabled ? .DesignSystem.black : .DesignSystem.white)
                }
                
                Text(title)
                    .foregroundColor(style == .disabled ? .DesignSystem.black : .DesignSystem.white)
                    .font(.system(size: 18, weight: .semibold))
            }
            .padding(.vertical, 24)
        }
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .cornerRadius(500)
        .opacity(style == .disabled ? 0.5 : 1)
        .disabled(style == .disabled)
    }
}


struct EVButton_Previews: PreviewProvider {
    static var previews: some View {
        EVButton(title: "texto do botão", iconSFSymbols: "eraser.fill", style: .primary, action: {})
    }
}
