import Foundation

/// An extension on the `URL` class to provide URLs for accessing the API endpoints.
extension URL {
    
    /// Returns the URL for accessing the rates endpoint.
    static func rates() -> URL? {
        // Constructs the URL for the rates endpoint, using the base API URL from the `API` struct.
        guard let url = URL(string: "\(API.URL)/rates") else {
            return nil
        }
        return url
    }
    
    /// Returns the URL for accessing the transactions endpoint.
    static func transactions() -> URL? {
        // Constructs the URL for the transactions endpoint, using the base API URL from the `API` struct.
        guard let url = URL(string: "\(API.URL)/transactions") else {
            return nil
        }
        return url
    }
    
}
