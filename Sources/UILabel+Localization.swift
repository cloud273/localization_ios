/*
 * Copyright © 2021 DUNGNGUYEN. All rights reserved.
 */

import UIKit

private var localizeTextKey: UInt8 = 0

public extension UILabel {
    
    @IBInspectable
    var lText: String? {
        get {
            return objc_getAssociatedObject(self, &localizeTextKey) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeTextKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            removeObserver()
            addObserver()
            update()
        }
    }
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(update), name: CLLocalization.languageChangedNotification, object: nil)
    }
    
    private func removeObserver() {
        NotificationCenter.default.removeObserver(self, name: CLLocalization.languageChangedNotification, object: nil)
    }
    
    @objc private func update() {
        if let key = self.lText, !key.isEmpty {
            self.text = key.localized
        }
    }
    
}
