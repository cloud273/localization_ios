/*
 * Copyright © 2021 DUNGNGUYEN. All rights reserved.
 */

import UIKit

private var localizeNormalKey: UInt8 = 0
private var localizeHighlightedKey: UInt8 = 1
private var localizeSelectedKey: UInt8 = 2
private var localizeDisabledKey: UInt8 = 3

public extension UIButton {
    
    @IBInspectable
    var lNormal: String? {
        get {
            return objc_getAssociatedObject(self, &localizeNormalKey) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeNormalKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            removeObserver()
            addObserver()
            update()
        }
    }
    
    @IBInspectable
    var lHighlighted: String? {
        get {
            return objc_getAssociatedObject(self, &localizeHighlightedKey) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeHighlightedKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            removeObserver()
            addObserver()
            update()
        }
    }
    
    @IBInspectable
    var lSelected: String? {
        get {
            return objc_getAssociatedObject(self, &localizeSelectedKey) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeSelectedKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            removeObserver()
            addObserver()
            update()
        }
    }
    
    @IBInspectable
    var lDisabled: String? {
        get {
            return objc_getAssociatedObject(self, &localizeDisabledKey) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeDisabledKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
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
        if let key = self.lNormal, !key.isEmpty {
            self.setTitle(key.localized, for: .normal)
        }
        if let key = self.lHighlighted, !key.isEmpty {
            self.setTitle(key.localized, for: .highlighted)
        }
        if let key = self.lSelected, !key.isEmpty {
            self.setTitle(key.localized, for: .selected)
        }
        if let key = self.lDisabled, !key.isEmpty {
            self.setTitle(key.localized, for: .disabled)
        }
    }
}
