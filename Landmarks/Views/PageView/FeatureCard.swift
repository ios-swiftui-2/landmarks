import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark
    
    var body: some View {
        if #available(iOS 15.0, *) {
            landmark.featureImage?
                .resizable()
                .aspectRatio(3 / 2, contentMode: .fit)
                .overlay {
                    TextOverlay(landmark: landmark)
                }
        } else {
            landmark.featureImage?
                .resizable()
                .aspectRatio(3 / 2, contentMode: .fit)
        }
    }
}

struct TextOverlay: View {
    var landmark: Landmark
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.yellow.opacity(0.6), .yellow.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
    }
}
