import Foundation
import SwiftUI


extension Text {
    
    func styleTitle() -> some View {
        self.fontBold_bigTitle()
            .foregroundColor(Color("blue3"))
    }
    func styleSubTitle() -> some View {
        self.fontBold_normal()
            .foregroundColor(Color("blue2"))
    }
    func styleRegular() -> some View {
        self.fontRegular_normal()
            .foregroundColor(Color("blue5"))
    }
    func styleBold() -> some View {
        self.fontBold_normal()
            .foregroundColor(Color("blue5"))
    }

    func styleResult() -> some View {
        self.fontBold_small()
            .foregroundColor(Color("sPrimaryHover"))
    }

    // -----------------------
    
    func fontBold_bigExtTitle() -> some View { self.fontBold(30) }
    func fontBold_bigTitle() -> some View { self.fontBold(25) }
    func fontBold_title() -> some View { self.fontBold(20)}
    func fontBold_normal() -> some View { self.fontBold(15) }
    func fontBold_small() -> some View { self.fontBold(12) }
    func fontBold(_ size:Double) -> some View {
        self.scaledFont(name: "Roboto-Bold", size: size)
    }

    func fontRegular_bigExtTitle() -> some View { self.fontRegular(30) }
    func fontRegular_bigTitle() -> some View { self.fontRegular(25) }
    func fontRegular_title() -> some View { self.fontRegular(20)}
    func fontRegular_normal() -> some View { self.fontRegular(15) }
    func fontRegular_small() -> some View { self.fontRegular(12) }
    func fontRegular(_ size:Double) -> some View {
        self.scaledFont(name: "Roboto-Regular", size: size)
    }

}

// BOTTONES
extension Text {
}

