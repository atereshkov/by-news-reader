// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
  internal typealias AssetColorTypeAlias = NSColor
  internal typealias Image = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  internal typealias AssetColorTypeAlias = UIColor
  internal typealias Image = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

@available(*, deprecated, renamed: "ImageAsset")
internal typealias AssetType = ImageAsset

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  internal var image: Image {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

internal struct ColorAsset {
  internal fileprivate(set) var name: String

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  internal var color: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
}

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Colors {
    internal enum Themes {
      internal enum Dark {
        internal enum Global {
          internal static let listActivityIndicator = ColorAsset(name: "ListActivityIndicator")
        }
      }
      internal enum Paper {
        internal enum Global {
          internal static let listActivityIndicator = ColorAsset(name: "ListActivityIndicator")
        }
      }
      internal enum White {
        internal enum Global {
          internal static let listActivityIndicator = ColorAsset(name: "ListActivityIndicator")
        }
      }
    }

    // swiftlint:disable trailing_comma
    internal static let allColors: [ColorAsset] = [
      Themes.Dark.Global.listActivityIndicator,
      Themes.Paper.Global.listActivityIndicator,
      Themes.White.Global.listActivityIndicator,
    ]
    internal static let allImages: [ImageAsset] = [
    ]
    // swiftlint:enable trailing_comma
    @available(*, deprecated, renamed: "allImages")
    internal static let allValues: [AssetType] = allImages
  }
  internal enum Images {
    internal enum Icons {
      internal static let bookmarkEmpty = ImageAsset(name: "bookmark-empty")
      internal static let bookmarkedNavbar = ImageAsset(name: "bookmarked-navbar")
      internal static let bookmarked = ImageAsset(name: "bookmarked")
      internal static let chevronRight = ImageAsset(name: "chevron-right")
      internal static let informationNavbar = ImageAsset(name: "information-navbar")
      internal static let markCheck = ImageAsset(name: "mark-check")
      internal static let settings = ImageAsset(name: "settings")
      internal static let share = ImageAsset(name: "share")
      internal enum TabBar {
        internal static let bookmarks = ImageAsset(name: "bookmarks")
        internal static let categories = ImageAsset(name: "categories")
        internal static let feed = ImageAsset(name: "feed")
        internal static let settingsTabBar = ImageAsset(name: "settings-tab-bar")
      }
    }
    internal enum Providers {
      internal enum Ico {
        internal static let onliner = ImageAsset(name: "onliner")
      }
    }
    internal enum Themes {
      internal enum Paper {
        internal static let testImgPaper = ImageAsset(name: "test_img_paper")
      }
      internal enum Red {
        internal static let testImgRed = ImageAsset(name: "test_img_red")
      }
      internal enum White {
        internal static let testImgWhite = ImageAsset(name: "test_img_white")
      }
    }
    internal static let flag = ImageAsset(name: "flag")

    // swiftlint:disable trailing_comma
    internal static let allColors: [ColorAsset] = [
    ]
    internal static let allImages: [ImageAsset] = [
      Icons.bookmarkEmpty,
      Icons.bookmarkedNavbar,
      Icons.bookmarked,
      Icons.chevronRight,
      Icons.informationNavbar,
      Icons.markCheck,
      Icons.settings,
      Icons.share,
      Icons.TabBar.bookmarks,
      Icons.TabBar.categories,
      Icons.TabBar.feed,
      Icons.TabBar.settingsTabBar,
      Providers.Ico.onliner,
      Themes.Paper.testImgPaper,
      Themes.Red.testImgRed,
      Themes.White.testImgWhite,
      flag,
    ]
    // swiftlint:enable trailing_comma
    @available(*, deprecated, renamed: "allImages")
    internal static let allValues: [AssetType] = allImages
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

internal extension Image {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal extension AssetColorTypeAlias {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

private final class BundleToken {}
