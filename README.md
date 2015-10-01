# FlexButton
FlexButton is a subclass of UIButton on which you can customize the layout style of icon and text on the button.

# Features

-	It provides 4 layout styles.
-	It works as simple as UIButton.

### Layout styles

1.	DefaultLayout
	Same as UIButton, nothing different.
2.	HorizonLayoutTitleLeftImageRight
	
3.	VerticalLayoutTitleDownImageUp

4.	VerticalLayoutTitleUpImageDown

# How to use

Use designated initializer:
```swift
let button = FlexButton(layoutStyle: FlexButtonLayoutStyle.HorizonLayoutTitleLeftImageRight)
```

Or use UIButton's convenience initializer:
```swift
let button = FlexButton(type: UIButtonType.Custom)
button.layoutStyle = .VerticalLayoutTitleDownImageUp
```