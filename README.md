# CLLocalization


## What's this?

`CLLocalization` is a Localization library written in Swift.

## Requirements

* iOS 9.0+

## Installation

#### CocoaPods

```
pod 'CLLocalization'
```

## Usage

#### Required files: 

Add files to your project:

- English: 'localization_en.json'

- Vietnamese: 'localization_vi.json'

- And more ....

Content of file:

```json
{
    "button": "My button",
    "label": "My label",
    "cancel": "Cancel",
    "next": "Next",
    "input": "Tap here to input"
}
```

#### Initialize list of supported language:

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    CLLocalization.initialize(["en", "vi"])
    return true
}

```
Note: Device language will be used
  
#### Change language:

- Change to target language:

```swift
CLLocalization.setLanguage("en")
     
```
  
- Change back to use device language:

```swift
CLLocalization.setLanguage(nil)

```
  
#### Storyboard:

- UILabel:

![UIButton](./Documents/Image/label.png)

- UIButton:

![UIButton](./Documents/Image/button.png)

- UITextField:

![UIButton](./Documents/Image/text_field.png)

- UINavigationItem:

![UIButton](./Documents/Image/navigation_item.png)

- UIBarItem:

![UIButton](./Documents/Image/bar_item.png)

#### Code:

```swift
import CLLocalization
```

- UILabel:

```swift
label.lText = "label"
```

- UIButton:

```swift
button.lNormal = "button_normal"
button.lHighlighted = "button_hightlighted"
button.lSelected = "button_selected"
button.lDisabled = "button_disabled"
```

- UITextField:

```swift
textField.lPlaceHolder = "text_field_place_holder"
```

- UINavigationItem:

```swift
navigationItem.lTitle = "navigation_title"
navigationItem.lPrompt = "navigation_prompt"
```

- UIBarItem:

```swift
barItem.lTitle = "bar_item_title"
```

- String

```swift
let localizedString = "text".localized
```

## Example

Please find in project

## Contribution

You are welcome to fork and submit pull requests.

## License

`CLLocalization` is open-sourced software, licensed under the `MIT` license.
