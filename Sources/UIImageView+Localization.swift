/*
 * Copyright © 2021 DUNGNGUYEN. All rights reserved.
 */

import UIKit

private var localizeImageKey: UInt8 = 0

public extension UIImageView {
    
    @IBInspectable
    var lImage: String? {
        get {
            return objc_getAssociatedObject(self, &localizeImageKey) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeImageKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
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
        if let key = self.lImage, !key.isEmpty {
            self.image = UIImage.init(named: CLUtility.localized(key))
        }
    }
    
}
