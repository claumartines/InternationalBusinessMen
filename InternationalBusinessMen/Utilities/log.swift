//
//  Created by Claudenir on 26/12/2022.
//

import Foundation

func logDebug(_ t:String){
    #if DEBUG
        print(t)
    #endif
}
