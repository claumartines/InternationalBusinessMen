import Foundation

/// A URL extension where all API calls can be obtained.
extension URL{
    
    /// URL to rates
    static func rates()->URL?
    {
        guard let url = URL(string: "\(API.URL)/rates") else {return nil}
        return url
    }    

    /// URL to transactions
    static func transactions()->URL?
    {
        guard let url = URL(string: "\(API.URL)/transactions") else {return nil}
        return url
    }

    
}
