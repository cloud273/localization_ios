/*
 * Copyright © 2021 DUNGNGUYEN. All rights reserved.
 */

import Foundation

class CLUtility {
    
    static func localized(_ key: String) -> String {
        return "\(key)_\(CLLocalization.selectedLanguage)"
    }
    
}
