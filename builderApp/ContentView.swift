import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var selectCurrencySheet = false
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height : 200)
                
                Text("Currency Converter")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                HStack {
                    VStack {
                        HStack {
                            Image(leftCurrency.image)
                                .resizable()
                                .frame(width: 33, height: 33)
                            
                            Text(leftCurrency.currencyName)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            selectCurrencySheet.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)

                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                    }

                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)

                    VStack {
                        HStack {
                            Text(rightCurrency.currencyName)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Image(rightCurrency.image)
                                .resizable()
                                .frame(width: 33, height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            selectCurrencySheet.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .keyboardType(.decimalPad)

                Spacer()
                
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                    }
                    .padding(.trailing)
                }
            }
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount){
            if(leftAmount == ""){ rightAmount = ""; return; }
            if(rightTyping) { return }
            if let leftValue = Double(leftAmount) {
                rightAmount = leftCurrency.convert(to: rightCurrency, amount: leftValue)
            }
        }
        .onChange(of: rightAmount){
            if(rightAmount == ""){ leftAmount = ""; return; }
            if(leftTyping) { return }
            if let rightValue = Double(rightAmount) {
                leftAmount = rightCurrency.convert(to: leftCurrency, amount: rightValue)
            }
        }
        .onChange(of: leftCurrency){
            if let rightValue = Double(rightAmount) {
                leftAmount = rightCurrency.convert(to: leftCurrency, amount: rightValue)
            }
        }
        .onChange(of: rightCurrency){
            if let leftValue = Double(leftAmount) {
                rightAmount = leftCurrency.convert(to: rightCurrency, amount: leftValue)
            }
        }
        .sheet(isPresented: $showExchangeInfo) {
            ShowExchangeInfo()
        }
        .sheet(isPresented: $selectCurrencySheet) {
            SelectCurrency(currencyStartWith: $leftCurrency, currencyConvertTo: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
