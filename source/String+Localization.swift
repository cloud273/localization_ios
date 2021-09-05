/*
 * Copyright © 2021 DUNGNGUYEN. All rights reserved.
 */

import UIKit

public extension String {
    
    var localized: String {
        get {
            return CLLocalization.getValue(self)
        }
    }
    
}

