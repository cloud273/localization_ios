/*
 * Copyright © 2021 DUNGNGUYEN. All rights reserved.
 */

import Foundation

class CLUtility {
    
    static func localized(_ key: String) -> String {
        let code = CLLocalization.language
        if code.isEmpty {
            return key
        } else {
            return "\(key)_\(code)"
        }
    }
    
}
