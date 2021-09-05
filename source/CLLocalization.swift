/*
 * Copyright © 2021 DUNGNGUYEN. All rights reserved.
 */

import UIKit

public class CLLocalization {
    
    public static let languageChangedNotification = Notification.Name.init(rawValue: "com.cloud273.localization.languageChangedNotification")
    
    private static let instance = CLLocalization.init()
    
    private var code: String = ""
    private var data = [String: String]()
    private var codes = [String]()
        
    public static func initialize(_ supportedLanguages: [String], currentLanguage: String? = nil) {
        instance.initialize(supportedLanguages, selectedLanguage: currentLanguage)
    }
    
    public static var selectedLanguage: String {
        get {
            return instance.selectedLanguage()
        }
        set {
            instance.setLanguage(newValue)
        }
    }
    
    public static var supportedLanguages: [String] {
        get {
            return instance.supportedLanguages()
        }
    }
    
    static func getValue(_ key: String) -> String {
        return instance.getValue(key)
    }
    
}

private extension CLLocalization {
    
    var preferLanguage: String {
        get {
            let supportLanguages = supportedLanguages()
            var preferredLanguages = [String]()
            let languages = Locale.preferredLanguages
            for item in languages {
                let components = item.components(separatedBy: "-")
                if components.count > 1 {
                    let lastComponent = components.last!
                    preferredLanguages.append(String(item.prefix(item.count - lastComponent.count - 1)))
                } else {
                    preferredLanguages.append(item)
                }
            }
            return preferredLanguages.first { (code) -> Bool in
                    return supportLanguages.contains(code)
                } ?? supportLanguages.first!
        }
    }
    
}

private extension CLLocalization {
    
    func loadJson(_ filename: String) -> Any? {
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            if let result = try? JSONSerialization.jsonObject(with: Data.init(contentsOf: URL.init(fileURLWithPath: path)), options: .allowFragments) {
                return result
            } else {
                fatalError("-----------------LANGUAGE FILE \(filename) FAIL-------------")
            }
        } else {
            fatalError("-----------------LANGUAGE FILE \(filename) NOT FOUND-------------")
        }
        return nil
    }
    
}

private extension CLLocalization {
    
    func getData() -> [String: String] {
        let filename =  "localization_\(code)"
        if let data = loadJson(filename) as? [String: String] {
            return data
        } else {
            fatalError("-----------------LANGUAGE FILE \(filename) IS INVALID-------------")
        }
    }
    
    func supportedLanguages() -> [String] {
        return codes
    }
    
    func selectedLanguage() -> String {
        return code
    }
    
    func initialize(_ supportedLanguages: [String], selectedLanguage: String?) {
        codes = supportedLanguages
        code = selectedLanguage ?? preferLanguage
        data = getData()
        NotificationCenter.default.post(name: CLLocalization.languageChangedNotification, object: nil)
    }
    
    func setLanguage(_ c: String) {
        if c != code {
            code = c
            data = getData()
            NotificationCenter.default.post(name: CLLocalization.languageChangedNotification, object: nil)
        }
    }
    
    func getValue(_ key: String) -> String {
        return data[key] ?? key
    }
    
}
