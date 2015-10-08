# FlexButton
FlexButton is a subclass of UIButton on which you can customize the layout style of icon and text on the button.

# Features

-	It provides 4 layout styles.
-	It works as simple as UIButton.
-	When you adjust the size of button, the size of imageView and titleLabel will change accordingly and correctly. They will not be put into disorder. This is the essential difference to using edge inset.
-	TitleLabel and imageView will always be centered vertically and horizantally.


### Layout styles

1.	DefaultLayout  
	Same as UIButton, nothing different.
2.	HorizonLayoutTitleLeftImageRight  
	![Alt HorizonLayoutTitleLeftImageRight](https://github.com/lionhylra/FlexButton/blob/master/HorizonLayoutTitleLeftImageRight.jpg?raw=true)
3.	VerticalLayoutTitleDownImageUp  
	![Alt VerticalLayoutTitleDownImageUp](https://github.com/lionhylra/FlexButton/blob/master/VerticalLayoutTitleDownImageUp.jpg?raw=true)
4.	VerticalLayoutTitleUpImageDown  
	![Alt VerticalLayoutTitleUpImageDown](https://github.com/lionhylra/FlexButton/blob/master/VerticalLayoutTitleUpImageDown.jpg?raw=true)
	
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

Then
```swift
button.setTitle("Button Title", forState: .Normal)
button.setImage(UIImage(named: "image"), forState: .Normal)
```