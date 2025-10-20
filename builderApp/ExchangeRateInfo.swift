import SwiftUI

struct ExchangeRateInfo: View {
    let leftImage: ImageResource
    let data: String
    let rightImage: ImageResource

    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .frame(width: 33, height: 33)
            Text(data)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRateInfo(leftImage: .goldpiece, data: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
}
