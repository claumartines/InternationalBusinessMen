import Foundation
import SwiftUI

// ######################################################################
// Not used in the project but I keep it as EXAMPLE for bigger projects
// ######################################################################

extension Image {
    
    func iconBox(size:CGFloat = 20, color:Color = Color("blackground"), colorFore:Color = .white) -> some View {
        self
            .resizable()
            .foregroundColor(colorFore)
            .frame(width: size, height: size)
            .padding(size)
            .background(color)
            .cornerRadius(size)
    }

}
