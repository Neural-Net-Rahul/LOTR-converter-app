import TipKit

struct CurrencyTip: Tip {
    var title: Text {
        Text("Change Currency")
    }
    var message: Text? {
        Text("You can change the currency you are converting from and to by tapping on the currency icons.")
    }
    var image: Image? {
        Image(systemName: "hand.tap.fill")
    }
}
