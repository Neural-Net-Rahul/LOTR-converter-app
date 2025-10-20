import SwiftUI

struct ShowExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                Text("Here at the Prancing Pony, we are happy to go ahead with the world's best exchange rates! This is said by the hobbit Frodo Baggins in the inn's common room. He tries to cover for his companion, Peregrin Took, who is about to reveal too much information about their journey.")
                    .font(.title3)
                    .padding()
                
                ExchangeRateInfo(leftImage: .goldpiece, data: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
                ExchangeRateInfo(leftImage: .goldpenny, data: "1 Gold Penny = 4 Silver Pieces", rightImage: .silverpiece)
                ExchangeRateInfo(leftImage: .silverpiece, data: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
                ExchangeRateInfo(leftImage: .silverpenny, data: "1 Silver Penny = 100 Copper Pennies", rightImage: .copperpenny)
                
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
            }
            .foregroundColor(.black)
        }
    }
}

#Preview {
    ShowExchangeInfo()
}
