/*
 * Copyright © 2021 DUNGNGUYEN. All rights reserved.
 */

import UIKit

private var localizePlaceHolderKey: UInt8 = 0

public extension UITextField {
    
    @IBInspectable
    var lPlaceHolder: String? {
        get {
            return objc_getAssociatedObject(self, &localizePlaceHolderKey) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizePlaceHolderKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
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
        if let key = self.lPlaceHolder, !key.isEmpty {
            self.placeholder = key.localized
        }
    }
    
}
