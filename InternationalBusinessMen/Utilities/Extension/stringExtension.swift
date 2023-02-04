import Foundation

// ######################################################################
// Not used in the project but I keep it as EXAMPLE for bigger projects
// ######################################################################


extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func formatUrl() -> String {
        var formattedParameter = ""
        if self.components(separatedBy: " ").filter({ !$0.isEmpty}).count == 1 {
            formattedParameter = self.trimmingCharacters(in: .whitespaces)
        } else { formattedParameter = self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "" }
        
        return formattedParameter
    }
}
