import Foundation
import SwiftUI

extension Text {
    
    // Apply bold font with big font size and blue3 color
    func styleTitle() -> some View {
        self.fontBold(25).foregroundColor(Color("blue3"))
    }
    
    // Apply bold font with normal font size and blue2 color
    func styleSubTitle() -> some View {
        self.fontBold(15).foregroundColor(Color("blue2"))
    }
    
    // Apply regular font with normal font size and blue5 color
    func styleRegular() -> some View {
        self.fontRegular(15).foregroundColor(Color("blue5"))
    }
    
    // Apply bold font with normal font size and blue5 color
    func styleBold() -> some View {
        self.fontBold(15).foregroundColor(Color("blue5"))
    }

    // Apply bold font with small font size and sPrimaryHover color
    func styleResult() -> some View {
        self.fontBold(12).foregroundColor(Color("sPrimaryHover"))
    }

    // Apply bold font with big font size and custom font
    func fontBold_bigExtTitle() -> some View { self.fontBold(30) }
    
    // Apply bold font with big font size and custom font
    func fontBold_bigTitle() -> some View { self.fontBold(25) }
    
    // Apply bold font with title font size and custom font
    func fontBold_title() -> some View { self.fontBold(20)}
    
    // Apply bold font with normal font size and custom font
    func fontBold_normal() -> some View { self.fontBold(15) }
    
    // Apply bold font with small font size and custom font
    func fontBold_small() -> some View { self.fontBold(12) }
    
    // Apply bold font with custom font and size
    func fontBold(_ size:Double) -> some View {
        self.scaledFont(name: "Roboto-Bold", size: size)
    }

    // Apply regular font with big font size and custom font
    func fontRegular_bigExtTitle() -> some View { self.fontRegular(30) }
    
    // Apply regular font with big font size and custom font
    func fontRegular_bigTitle() -> some View { self.fontRegular(25) }
    
    // Apply regular font with title font size and custom font
    func fontRegular_title() -> some View { self.fontRegular(20)}
    
    // Apply regular font with normal font size and custom font
    func fontRegular_normal() -> some View { self.fontRegular(15) }
    
    // Apply regular font with small font size and custom font
    func fontRegular_small() -> some View { self.fontRegular(12) }
    
    // Apply regular font with custom font and size
    func fontRegular(_ size:Double) -> some View {
        self.scaledFont(name: "Roboto-Regular", size: size)
    }

}
