/*
 * Copyright © 2021 DUNGNGUYEN. All rights reserved.
 */

import UIKit

private var localizeTitleKey: UInt8 = 0
private var localizePromptKey: UInt8 = 1

public extension UINavigationItem {
    
    @IBInspectable
    var lTitle: String? {
        get {
            return objc_getAssociatedObject(self, &localizeTitleKey) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizeTitleKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            removeObserver()
            addObserver()
            update()
        }
    }
    
    @IBInspectable
    var lPrompt: String? {
        get {
            return objc_getAssociatedObject(self, &localizePromptKey) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizePromptKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
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
        if let key = self.lTitle, !key.isEmpty {
            self.title = key.localized
        }
        if let key = self.lPrompt, !key.isEmpty {
            self.prompt = key.localized
        }
    }
    
}
