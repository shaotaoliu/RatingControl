import SwiftUI

@available(iOS 13.0, *)
@available(macOS 11.0, *)
public enum RatingImage: String, CaseIterable, Identifiable {
    case star = "SF_star"
    case heart = "SF_heart"
    case thumbsUp = "SF_hand.thumbsup"
    case bookmark = "SF_bookmark"
    case flag = "SF_flag"
    case bell = "SF_bell"
    case baseball
    case basketball
    case football
    case custom
    
    var fillImage: Image {
        rawValue.prefix(3) == "SF_" ?
            Image(systemName: String(rawValue.dropFirst(3)) + ".fill") :
            rawValue == "custom" ?
            Image("\(rawValue).fill") :
            Image("\(rawValue).fill", bundle: .module)
    }
    
    var openImage: Image {
        rawValue.prefix(3) == "SF_" ?
            Image(systemName: String(rawValue.dropFirst(3))) :
            rawValue == "custom" ?
            Image(rawValue) :
            Image(rawValue, bundle: .module)
    }
    
    public var id: String {
        "\(self)"
    }
}
