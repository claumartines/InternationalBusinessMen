import Foundation

// ######################################################################
// Not used in the project but I keep it as EXAMPLE for bigger projects
// ######################################################################


extension String {
    /// Checks if a string is a valid email address
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func isValidPassword(_ handler: @escaping (Bool, String?) -> ()) {
        if self.count < 8 {
            handler(false, "PASSWORD_ERROR_MESSAGE_TYPE_MIN_8_CHARS")
        }
        if !NSPredicate(format:"SELF MATCHES %@", ".*[0-9]+.*").evaluate(with: self) {
            // least one digit
            handler(false, "PASSWORD_ERROR_MESSAGE_TYPE_MIN_1_NUM")
        }
        if !NSPredicate(format:"SELF MATCHES %@", ".*[A-Z]+.*").evaluate(with: self) {
            // least one uppercase
            handler(false, "PASSWORD_ERROR_MESSAGE_TYPE_UPPER_CHAR")
        }
        if !NSPredicate(format:"SELF MATCHES %@", ".*[a-z]+.*").evaluate(with: self) {
            // least one lowercase
            handler(false, "PASSWORD_ERROR_MESSAGE_TYPE_LOWWER_CHAR")
        }
        
        handler(true, nil)
    }
}
