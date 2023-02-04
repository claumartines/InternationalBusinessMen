import Foundation

// ######################################################################
// Not used in the project but I keep it as EXAMPLE for bigger projects
// ######################################################################


extension Data {
    func jsonObject() -> Any? {
        return try? JSONSerialization.jsonObject(with: self, options: [])
    }
    
    func decode<T: Decodable>(_ type: T.Type) -> T? {
        return try? JSONDecoder().decode(type, from: self)
    }
}
