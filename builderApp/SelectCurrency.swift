import SwiftUI

enum ImageRes{
    case goldpiece
}

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var currencyStartWith: Currency
    @Binding var currencyConvertTo: Currency


    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Select the currency you are starting with:")
                IconGrid(currency: $currencyStartWith)

                Spacer()
                
                Text("Select the currency you would like to convert to:")
                IconGrid(currency: $currencyConvertTo)

                Spacer()
                
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
            }
            .multilineTextAlignment(.center)
            .fontWeight(.bold)
            .padding()
        }
        .foregroundColor(.black)
    }
}

#Preview {
    PreviewWrapperSC()
}

struct PreviewWrapperSC: View {
    @State var currencyStartWith = Currency.goldPiece
    @State var currencyConvertTo = Currency.silverPiece

    var body: some View {
        SelectCurrency(currencyStartWith: $currencyStartWith, currencyConvertTo: $currencyConvertTo)
    }
}

