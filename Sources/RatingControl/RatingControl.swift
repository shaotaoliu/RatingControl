import SwiftUI

@available(macOS 11.0, *)
@available(iOS 13.0, *)
public struct RatingControl: View {

    private let maxRating: Int
    @Binding private var currentRating: Int
    private var size: Int
    private var color: Color
    private var ratingImage: RatingImage
    
    public init(maxRating: Int,
                currentRating: Binding<Int>,
                size: Int = 50,
                color: Color = .yellow,
                ratingImage: RatingImage = .star) {
        
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.size = size
        self.color = color
        self.ratingImage = ratingImage
    }
    
    public var body: some View {
        HStack {
            ForEach(0..<maxRating, id: \.self) { rating in
                (rating < currentRating ?
                    ratingImage.fillImage :
                    ratingImage.openImage)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(color)
                    .onTapGesture {
                        if rating == 0, currentRating < 2 {
                            currentRating = 1 - currentRating
                        }
                        else {
                            currentRating = rating + 1
                        }
                    }
            }
        }
        .frame(width: CGFloat(maxRating * size))
    }
}

@available(macOS 11.0, *)
@available(iOS 13.0, *)
struct RatingControl_Previews: PreviewProvider {
    static var previews: some View {
        RatingControl(maxRating: 5, currentRating: .constant(3))
    }
}
