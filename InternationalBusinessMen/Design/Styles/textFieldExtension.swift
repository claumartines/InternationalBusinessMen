import Foundation
import SwiftUI

// ######################################################################
// Not used in the project but I keep it as EXAMPLE for bigger projects
// ######################################################################

extension TextField {
    func customStyle() -> some View {
        self
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Color.white, lineWidth: 2)
            )
            .scaledFont(name: "Roboto-Regular", size: 22)
            .textFieldStyle(.roundedBorder)

    }
}

