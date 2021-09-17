Pod::Spec.new do |s|

  s.name         = "CLLocalization"

  s.version      = "1.0.1"

  s.summary      = "CLLocalization framework"

  s.description  = "This framework is used for localization(multi-language) application"

  s.homepage     = "https://github.com/dungnguyen2703/localization_ios.git"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = "DUNG NGUYEN"

  s.platform     = :ios, "9.0"

  s.source       = { :git => 'https://github.com/dungnguyen2703/localization_ios.git', :tag => s.version }

  s.swift_versions = ['5.0', '5.1', '5.2', '5.3']

  s.source_files = "Sources/*.swift"

  s.framework    = "UIKit"

end
