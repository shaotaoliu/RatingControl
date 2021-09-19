import SwiftUI

struct ContentView: View {
    
    @State var maxRating: Int = 5
    @State var currentRating: Int = 3
    @State var size: Double = 50.0
    @State var color: Color = Color.yellow
    @State var ratingImage: RatingImage = RatingImage.star
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Rating Control Demo")
                    .font(.title)
                    .bold()
                
                Form {
                    Stepper(value: $maxRating, in: 3...10, onEditingChanged: { result in
                        if currentRating > maxRating {
                            currentRating = maxRating
                        }
                    }, label: {
                        HStack {
                            Text("Max Rating")
                            Spacer()
                            Text("\(maxRating)")
                        }
                    })
                    
                    Stepper(value: $currentRating, in: 0...maxRating) {
                        HStack {
                            Text("Current Rating")
                            Spacer()
                            Text("\(currentRating)")
                        }
                    }
                    
                    Picker("Rating Image", selection: $ratingImage) {
                        ForEach(RatingImage.allCases, id: \.self) {
                            Text($0.id.capitalized).tag($0)
                        }
                    }
                    
                    HStack {
                        Text("Size")
                        
                        Slider(value: $size, in: 20...80,
                               minimumValueLabel: Text("20"),
                               maximumValueLabel: Text("80"),
                               label: {
                                Text("Size")
                               })
                    }
                    
                    ColorPicker("Color", selection: $color)
                }
                
                RatingControl(maxRating: maxRating, currentRating: $currentRating, size: Int(size), color: color, ratingImage: ratingImage)
                    .padding()
                
                Text("Current Rating: \(currentRating)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
