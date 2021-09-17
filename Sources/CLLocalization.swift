/*
 * Copyright © 2021 DUNGNGUYEN. All rights reserved.
 */

import UIKit

public class CLLocalization {
    
    public static let languageChangedNotification = Notification.Name.init(rawValue: "com.cloud273.localization.languageChangedNotification")
    
    private static let instance = CLLocalization.init()
    
    private let store = UserDefaults.init(suiteName: "com.cloud273.localization.store")!
    private let key = "code"
    private var data: [String: String]?
    private var codes: [String]?
    private var code: String?
    
    public static func initialize(_ supportedLanguages: [String]) {
        instance.initialize(supportedLanguages)
    }
    
    public static func setLanguage(_ language: String?) {
        instance.setLanguage(language)
    }
    
    public static var language: String {
        get {
            return instance.code ?? ""
        }
    }
    
    public static var supportedLanguages: [String] {
        get {
            return instance.codes ?? []
        }
    }
    
    static func getValue(_ key: String) -> String {
        return instance.data?[key] ?? key
    }
    
}

private extension CLLocalization {
    
    func initialize(_ supportedLanguages: [String]) {
        if codes == nil {
            guard !supportedLanguages.isEmpty else {
                fatalError("-----------------INITIALIZED FAIL: WRONG INPUT-------------")
            }
            codes = supportedLanguages
            setLanguage(store.string(forKey: key))
        }
    }
    
    func setLanguage(_ language: String?) {
        guard let codes = codes else {
            fatalError("-----------------UNINITIALIZED-------------")
        }
        guard language == nil || codes.contains(language!) else {
            fatalError("-----------------LANGUAGE ISN'T IN LIST-------------")
        }
        var c: String
        if let language = language {
            store.set(language, forKey: key)
            c = language
        } else {
            store.removeObject(forKey: key)
            c = preferLanguage
        }
        store.synchronize()
        if c != code {
            code = c
            data = getData()
            NotificationCenter.default.post(name: CLLocalization.languageChangedNotification, object: nil)
        }
    }
    
}

private extension CLLocalization {
    
    var preferLanguage: String {
        get {
            let supportLanguages = codes!
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
    
    func loadJson(_ filename: String) -> [String: String] {
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            if let result = try? JSONSerialization.jsonObject(with: Data.init(contentsOf: URL.init(fileURLWithPath: path)), options: .allowFragments) as? [String: String] {
                return result
            } else {
                fatalError("-----------------LANGUAGE FILE \(filename) FAIL-------------")
            }
        } else {
            fatalError("-----------------LANGUAGE FILE \(filename) NOT FOUND-------------")
        }
    }
    
    
    func getData() -> [String: String] {
        let filename =  "localization_\(code!)"
        return loadJson(filename)
    }
    
}


