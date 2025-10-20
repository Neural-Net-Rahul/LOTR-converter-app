import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
            ForEach(Currency.allCases) { coin in
                if(self.currency == coin){
                    CurrencyIcon(currencyImage: coin.image, currencyName: coin.currencyName)
                        .shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.red, lineWidth: 2)
                        }
                }
                else{
                    CurrencyIcon(currencyImage: coin.image, currencyName: coin.currencyName)
                        .onTapGesture {
                            self.currency = coin
                        }
                }
            }
        }
    }
}

#Preview {
    PreviewWrapper()
}

struct PreviewWrapper: View {
    @State var currency = Currency.goldPiece
    
    var body: some View {
        IconGrid(currency: $currency)
    }
}

