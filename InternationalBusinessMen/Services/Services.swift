import Foundation
import Combine
import Alamofire
import AlamofireNetworkActivityLogger

/// The API URL, based on the build configuration.
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
    
    /// The singleton instance of APIServices.
    static let shared = APIServices()
    
    /// The private initializer to ensure the singleton instance is used.
    private init() {
        // Start logging network activity.
        NetworkActivityLogger.shared.startLogging()
        
        #if DEBUG
        // If in debug mode, set the logging level to debug.
        NetworkActivityLogger.shared.level = .debug
        #endif
    }
    
    // TODO: Implement request methods.
}
