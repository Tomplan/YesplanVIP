## The VIP cycle

Squeaky is an opinionated remix of the Clean Swift templates.

To learn more about Clean Swift and the VIP cycle, read:

http://clean-swift.com/clean-swift-ios-architecture

There is a sample app available at:

https://github.com/Clean-Swift/CleanStore

## Templates

Templates are shared from the repo and have to be managed manually. To install the Squeaky Clean Swift Xcode templates clone or download this repo and then:

`$: make install_templates`

To uninstall the Clean Swift Xcode templates, run:

`$: make uninstall_templates`

## Using Squeaky Clean

Add the pod to your Podfile

`pod 'Squeaky', git: 'https://github.com/ajself/squeaky-clean.git'`

Install the Squeaky pod

`$: pod install`

And the Squeaky pod includes only a single helpful file: ViewConfigurable.

It is important to first understand [Clean Swift](http://clean-swift.com/clean-swift-ios-architecture) in general, then read the following to see how Squeaky Clean differs.

For the most part the Squeaky Clean templates differ very little from Clean Swift with a few changes:

1. `UITableViewController` and `UICollectionView` class inheritance have been removed in favor of a `UIViewController` with a `UITableView` or `UICollectionView` view instance and conforming to data source and delegate protocols.
1. References to storyboards and xibs and related methods are removed in favor of generating views with view code.
1. A new `View` template is available organized to Squeaky format.
1. `UIView` and `UIViewController` templates will assume Cartography is available and automatically import it.

## Squeaky Format

View Controllers/Views are now organized into logical sections using extensions.
  1. Properties and initialization
  1. Object lifecycle (instance specific methods such as `viewDidLoad`)
  1. View configuration by conforming to `ViewConfigurable`
  1. Public API
  1. Private API

View Controllers will have an extra section  after `Object lifecycle` for `VIP configuration` that glues the VIP cycle components together and manage any routing/VIP related tasks.

## Why view code?

There's a lot of reasons. Mainly:
* Working in a team with version control
* When designing a complex layout
* When we want to easily keep track of constraints
* When we want to reuse the view controllers and build a hierarchy
* Storyboards still rely heavily on strings. Sure, there are tools to help in your code but you still need to copy/paste strings in the Storyboard itself.
* Segues can become a mess
* Not all view customization can happen in a storyboard so when do you know to go to the View/View Controller? Where do you put custom view code that coincides with a storyboard in a View Controller?

There's also a lot written expanding on these so I'll leave it to them to explain:

* [Why I Don't Use Storyboards](https://www.bobthedeveloper.io/blog/why-i-don’t-use-storyboard)
* [iOS — Start an app without a storyboard](https://medium.com/ios-os-x-development/ios-start-an-app-without-storyboard-5f57e3251a25)
* [A UIViewController and UIViews Without Storyboard (swift 3)](https://medium.com/@Dougly/a-uiviewcontroller-and-uiviews-without-storyboard-swift-3-543096e78f2)
* [iOS User Interfaces: Storyboards vs. NIBs vs. Custom Code](https://www.toptal.com/ios/ios-user-interfaces-storyboards-vs-nibs-vs-custom-code)
* Makes it easier to do [Playground Driven Development](https://talk.objc.io/episodes/S01E51-playground-driven-development-at-kickstarter)
* [Let’s talk about why I think you need to stop using storyboards](http://softauthor.com/ios-ui-design-programmatically-xcode-9-swift-4/)

It's up to you to decide if you need Storyboards but for the most part they are the 👹

My preference is using Squeaky Clean with [Cartography](https://github.com/robb/Cartography).

✌️ AJ
