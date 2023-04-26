import SwiftUI

public extension Font {
    struct DesignSystem {
        public static let bigTitleBold = Font.custom("Nohemi-Bold", size: 40, relativeTo: .largeTitle)
        public static let largeTitleBold = Font.custom("Nohemi-Bold", size: 32, relativeTo: .largeTitle)
        public static let titleBold = Font.custom("Nohemi-Bold", size: 24, relativeTo: .title2)
        public static let normalRegular = Font.custom("Nohemi-Regular", size: 16, relativeTo: .headline)
        public static let normalBold = Font.custom("Nohemi-Bold", size: 16, relativeTo: .headline)
        public static let bodyRegular = Font.custom("Nohemi-Regular", size: 12, relativeTo: .caption)
        public static let bodyBold = Font.custom("Nohemi-Bold", size: 12, relativeTo: .caption)
    }
}
