import SwiftUI

public extension Color {
    struct DesignSystem {
        public static var primary: Color {
            if UITraitCollection.current.userInterfaceStyle == .dark {
                return Color(red: 0.242, green: 0.306, blue: 0.879, opacity: 1)
            } else {
                return Color(red: 0.242, green: 0.306, blue: 0.879, opacity: 1)
            }
        }
        
        public static var secondary: Color {
            if UITraitCollection.current.userInterfaceStyle == .dark {
                return Color(red: 1, green: 0.455, blue: 0.2, opacity: 1)
            } else {
                return Color(red: 1, green: 0.455, blue: 0.2, opacity: 1)
            }
        }
        
        public static var white: Color {
            if UITraitCollection.current.userInterfaceStyle == .dark {
                return Color(red: 0, green: 0, blue: 0, opacity: 1)
            } else {
                return Color(red: 1, green: 1, blue: 1, opacity: 1)
            }
        }
        
        public static var black: Color {
            if UITraitCollection.current.userInterfaceStyle == .dark {
                return Color(red: 1, green: 1, blue: 1, opacity: 1)
            } else {
                return Color(red: 0, green: 0, blue: 0, opacity: 1)
            }
        }
        
        public static var gray: Color {
            if UITraitCollection.current.userInterfaceStyle == .dark {
                return Color(red: 0.237, green: 0.237, blue: 0.237, opacity: 1)
            } else {
                return Color(red: 0.237, green: 0.237, blue: 0.237, opacity: 1)
            }
        }
    }
}

