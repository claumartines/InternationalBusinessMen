import Foundation
import Combine
import Alamofire
import AlamofireNetworkActivityLogger

/// API, environment configuration, where you get back the url
struct API {
    
    #if STAGING
    // STAGING
        static let URL = "https://android-ios-service.herokuapp.com"
    #else
    // PRODUCTION
        static let URL = "https://android-ios-service.herokuapp.com"
    #endif

}


/// APIServices is the class responsible for making all requests to the API.
class APIServices {
    static let shared = APIServices()
    private init(){
        NetworkActivityLogger.shared.startLogging()
        #if DEBUG
            NetworkActivityLogger.shared.level = .debug
        #endif

    }
    
}

