// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
  }
}

internal struct SceneType<T: Any> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

internal struct InitialSceneType<T: Any> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }
}

internal protocol SegueType: RawRepresentable { }

internal extension UIViewController {
  func perform<S: SegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    let identifier = segue.rawValue
    performSegue(withIdentifier: identifier, sender: sender)
  }
}

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
  internal enum About: StoryboardType {
    internal static let storyboardName = "About"

    internal static let initialScene = InitialSceneType<RSS_News.AboutView>(storyboard: About.self)
  }
  internal enum Bookmarks: StoryboardType {
    internal static let storyboardName = "Bookmarks"

    internal static let initialScene = InitialSceneType<RSS_News.BookmarksView>(storyboard: Bookmarks.self)
  }
  internal enum BookmarksIPad: StoryboardType {
    internal static let storyboardName = "BookmarksIPad"

    internal static let initialScene = InitialSceneType<RSS_News.BookmarksView>(storyboard: BookmarksIPad.self)
  }
  internal enum Categories: StoryboardType {
    internal static let storyboardName = "Categories"

    internal static let initialScene = InitialSceneType<RSS_News.CategoriesView>(storyboard: Categories.self)
  }
  internal enum CategoriesIPad: StoryboardType {
    internal static let storyboardName = "CategoriesIPad"

    internal static let initialScene = InitialSceneType<RSS_News.CategoriesView>(storyboard: CategoriesIPad.self)
  }
  internal enum CategoryNews: StoryboardType {
    internal static let storyboardName = "CategoryNews"

    internal static let initialScene = InitialSceneType<RSS_News.CategoryNewsView>(storyboard: CategoryNews.self)
  }
  internal enum CategoryNewsIPad: StoryboardType {
    internal static let storyboardName = "CategoryNewsIPad"

    internal static let initialScene = InitialSceneType<RSS_News.CategoryNewsView>(storyboard: CategoryNewsIPad.self)
  }
  internal enum InitialSettings: StoryboardType {
    internal static let storyboardName = "InitialSettings"

    internal static let initialScene = InitialSceneType<RSS_News.InitialSettingsView>(storyboard: InitialSettings.self)
  }
  internal enum Main: StoryboardType {
    internal static let storyboardName = "Main"

    internal static let initialScene = InitialSceneType<RSS_News.MainView>(storyboard: Main.self)
  }
  internal enum MainIPad: StoryboardType {
    internal static let storyboardName = "MainIPad"

    internal static let initialScene = InitialSceneType<RSS_News.MainView>(storyboard: MainIPad.self)
  }
  internal enum News: StoryboardType {
    internal static let storyboardName = "News"

    internal static let initialScene = InitialSceneType<RSS_News.NewsView>(storyboard: News.self)
  }
  internal enum NewsDetail: StoryboardType {
    internal static let storyboardName = "NewsDetail"

    internal static let initialScene = InitialSceneType<RSS_News.NewsDetailView>(storyboard: NewsDetail.self)
  }
  internal enum NewsIPad: StoryboardType {
    internal static let storyboardName = "NewsIPad"

    internal static let initialScene = InitialSceneType<RSS_News.NewsView>(storyboard: NewsIPad.self)
  }
  internal enum OnboardingPageProvider: StoryboardType {
    internal static let storyboardName = "OnboardingPageProvider"

    internal static let initialScene = InitialSceneType<RSS_News.OnboardingPageProviderView>(storyboard: OnboardingPageProvider.self)
  }
  internal enum OnboardingPageTheme: StoryboardType {
    internal static let storyboardName = "OnboardingPageTheme"

    internal static let initialScene = InitialSceneType<RSS_News.OnboardingPageThemeView>(storyboard: OnboardingPageTheme.self)
  }
  internal enum Settings: StoryboardType {
    internal static let storyboardName = "Settings"

    internal static let initialScene = InitialSceneType<RSS_News.SettingsView>(storyboard: Settings.self)
  }
  internal enum SettingsCity: StoryboardType {
    internal static let storyboardName = "SettingsCity"

    internal static let initialScene = InitialSceneType<RSS_News.SettingsCityView>(storyboard: SettingsCity.self)
  }
  internal enum SettingsIPad: StoryboardType {
    internal static let storyboardName = "SettingsIPad"

    internal static let initialScene = InitialSceneType<RSS_News.SettingsView>(storyboard: SettingsIPad.self)
  }
  internal enum SettingsProvider: StoryboardType {
    internal static let storyboardName = "SettingsProvider"

    internal static let initialScene = InitialSceneType<RSS_News.SettingsProviderView>(storyboard: SettingsProvider.self)
  }
  internal enum SettingsProviderIPad: StoryboardType {
    internal static let storyboardName = "SettingsProviderIPad"

    internal static let initialScene = InitialSceneType<RSS_News.SettingsProviderView>(storyboard: SettingsProviderIPad.self)
  }
  internal enum SettingsTheme: StoryboardType {
    internal static let storyboardName = "SettingsTheme"

    internal static let initialScene = InitialSceneType<RSS_News.SettingsThemeView>(storyboard: SettingsTheme.self)
  }
  internal enum SettingsThemeIPad: StoryboardType {
    internal static let storyboardName = "SettingsThemeIPad"

    internal static let initialScene = InitialSceneType<RSS_News.SettingsThemeView>(storyboard: SettingsThemeIPad.self)
  }
}

internal enum StoryboardSegue {
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

private final class BundleToken {}
