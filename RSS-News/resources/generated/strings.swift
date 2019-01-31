// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {

  internal enum About {
    /// About
    internal static let title = L10n.tr("Localizable", "about.title")

    internal enum Information {

      internal enum About {
        /// Belarus News is news aggregator application from Belarusian information portals.
        internal static let text = L10n.tr("Localizable", "about.information.about.text")
        /// ABOUT APP
        internal static let title = L10n.tr("Localizable", "about.information.about.title")
      }

      internal enum CopyrightInfo {
        /// All rights to the materials contained in the application belong to the sources, a link to which is accompanied by the application. Placed news in the application lead only to the source site. The application uses publicly available materials posted by information portals or agencies through an Rich Site Summary - RSS.
        internal static let text = L10n.tr("Localizable", "about.information.copyright-info.text")
        /// RESTRICTION INFORMATION
        internal static let title = L10n.tr("Localizable", "about.information.copyright-info.title")
      }

      internal enum Developer {
        /// Alexander Tereshkov © 2019\nE-mail: n1cs@bk.ru
        internal static let text = L10n.tr("Localizable", "about.information.developer.text")
        /// DEVELOPER
        internal static let title = L10n.tr("Localizable", "about.information.developer.title")
      }
    }
  }

  internal enum Bookmarks {
    /// Bookmarks
    internal static let title = L10n.tr("Localizable", "bookmarks.title")

    internal enum List {
      /// You don't have any bookmarks yet.
      internal static let empty = L10n.tr("Localizable", "bookmarks.list.empty")
    }
  }

  internal enum Categories {
    /// Categories
    internal static let title = L10n.tr("Localizable", "categories.title")
  }

  internal enum Category {
    /// Accidents
    internal static let accidents = L10n.tr("Localizable", "category.accidents")
    /// Auto
    internal static let auto = L10n.tr("Localizable", "category.auto")
    /// Culture
    internal static let culture = L10n.tr("Localizable", "category.culture")
    /// Economics
    internal static let economics = L10n.tr("Localizable", "category.economics")
    /// Education
    internal static let education = L10n.tr("Localizable", "category.education")
    /// Finance
    internal static let finance = L10n.tr("Localizable", "category.finance")
    /// Health
    internal static let health = L10n.tr("Localizable", "category.health")
    /// Lady
    internal static let lady = L10n.tr("Localizable", "category.lady")
    /// Main
    internal static let main = L10n.tr("Localizable", "category.main")
    /// People and society
    internal static let peopleSociety = L10n.tr("Localizable", "category.people-society")
    /// Politics
    internal static let politics = L10n.tr("Localizable", "category.politics")
    /// Radio
    internal static let radio = L10n.tr("Localizable", "category.radio")
    /// Realty
    internal static let realt = L10n.tr("Localizable", "category.realt")
    /// Realty
    internal static let realty = L10n.tr("Localizable", "category.realty")
    /// Society
    internal static let society = L10n.tr("Localizable", "category.society")
    /// Sport
    internal static let sport = L10n.tr("Localizable", "category.sport")
    /// Technology
    internal static let technology = L10n.tr("Localizable", "category.technology")
    /// World
    internal static let world = L10n.tr("Localizable", "category.world")
  }

  internal enum Feed {
    /// Feed
    internal static let title = L10n.tr("Localizable", "feed.title")
  }

  internal enum InitialSettings {

    internal enum NavBar {
      /// Skip
      internal static let skip = L10n.tr("Localizable", "initial-settings.nav-bar.skip")
    }
  }

  internal enum LaunchScreen {
    /// Belarus News
    internal static let title = L10n.tr("Localizable", "launch-screen.title")
  }

  internal enum Main {

    internal enum TabBar {

      internal enum Tab1 {
        /// Feed
        internal static let title = L10n.tr("Localizable", "main.tab-bar.tab1.title")
      }

      internal enum Tab2 {
        /// Categories
        internal static let title = L10n.tr("Localizable", "main.tab-bar.tab2.title")
      }

      internal enum Tab3 {
        /// Bookmarks
        internal static let title = L10n.tr("Localizable", "main.tab-bar.tab3.title")
      }

      internal enum Tab4 {
        /// Settings
        internal static let title = L10n.tr("Localizable", "main.tab-bar.tab4.title")
      }
    }
  }

  internal enum Menu {

    internal enum Item {

      internal enum About {
        /// About
        internal static let title = L10n.tr("Localizable", "menu.item.about.title")
      }

      internal enum FontSize {
        /// Font size
        internal static let title = L10n.tr("Localizable", "menu.item.font-size.title")
      }

      internal enum Region {
        /// Region
        internal static let title = L10n.tr("Localizable", "menu.item.region.title")
      }

      internal enum Source {
        /// News source
        internal static let title = L10n.tr("Localizable", "menu.item.source.title")
      }

      internal enum Theme {
        /// Theme
        internal static let title = L10n.tr("Localizable", "menu.item.theme.title")
      }
    }
  }

  internal enum News {

    internal enum Item {

      internal enum Link {
        /// From: %@
        internal static func source(_ p1: String) -> String {
          return L10n.tr("Localizable", "news.item.link.source", p1)
        }
      }
    }

    internal enum Preview {

      internal enum Action {
        /// Add to Bookmarks
        internal static let addToBookmarks = L10n.tr("Localizable", "news.preview.action.add-to-bookmarks")
        /// Remove from Bookmarks
        internal static let removeFromBookmarks = L10n.tr("Localizable", "news.preview.action.remove-from-bookmarks")
      }
    }
  }

  internal enum NoInternet {

    internal enum View {
      /// No Internet connection
      internal static let list = L10n.tr("Localizable", "no-internet.view.list")
    }
  }

  internal enum Onboarding {

    internal enum Theme {
      /// You could change default white theme to the dark one if you want. You can change it anytime in the Settings.
      internal static let informationText = L10n.tr("Localizable", "onboarding.theme.information-text")
    }
  }

  internal enum Provider {

    internal enum TutBy {
      /// TUT.by
      internal static let name = L10n.tr("Localizable", "provider.tut-by.name")
    }
  }

  internal enum Settings {
    /// Settings
    internal static let title = L10n.tr("Localizable", "settings.title")

    internal enum Font {
      /// Default
      internal static let `default` = L10n.tr("Localizable", "settings.font.default")
      /// Large
      internal static let large = L10n.tr("Localizable", "settings.font.large")
      /// Small
      internal static let small = L10n.tr("Localizable", "settings.font.small")
    }
  }

  internal enum SettingsCity {
    /// News region
    internal static let title = L10n.tr("Localizable", "settings-city.title")

    internal enum Information {

      internal enum Alert {
        /// You can choose preferred news provider (so far only one, but we are already working on the function of selecting several active sources).
        internal static let message = L10n.tr("Localizable", "settings-city.information.alert.message")
        /// News provider
        internal static let title = L10n.tr("Localizable", "settings-city.information.alert.title")

        internal enum Action {
          /// OK
          internal static let ok = L10n.tr("Localizable", "settings-city.information.alert.action.ok")
        }
      }
    }
  }

  internal enum SettingsProvider {
    /// News provider
    internal static let title = L10n.tr("Localizable", "settings-provider.title")

    internal enum Information {

      internal enum Alert {
        /// You can choose preferred news provider (so far only one, but we are already working on the function of selecting several active sources).
        internal static let message = L10n.tr("Localizable", "settings-provider.information.alert.message")
        /// News provider
        internal static let title = L10n.tr("Localizable", "settings-provider.information.alert.title")

        internal enum Action {
          /// OK
          internal static let ok = L10n.tr("Localizable", "settings-provider.information.alert.action.ok")
        }
      }
    }
  }

  internal enum SettingsTheme {
    /// Theme
    internal static let title = L10n.tr("Localizable", "settings-theme.title")
  }

  internal enum Theme {
    /// Dark
    internal static let dark = L10n.tr("Localizable", "theme.dark")
    /// Paper
    internal static let paper = L10n.tr("Localizable", "theme.paper")
    /// White
    internal static let white = L10n.tr("Localizable", "theme.white")
  }

  internal enum Time {
    /// %d day ago
    internal static func dayAgo(_ p1: Int) -> String {
      return L10n.tr("Localizable", "time.day-ago", p1)
    }
    /// %d days ago
    internal static func daysAgo(_ p1: Int) -> String {
      return L10n.tr("Localizable", "time.days-ago", p1)
    }
    /// %d hr ago
    internal static func hrAgo(_ p1: Int) -> String {
      return L10n.tr("Localizable", "time.hr-ago", p1)
    }
    /// %d hrs ago
    internal static func hrsAgo(_ p1: Int) -> String {
      return L10n.tr("Localizable", "time.hrs-ago", p1)
    }
    /// Just now
    internal static let justNow = L10n.tr("Localizable", "time.just-now")
    /// %d min ago
    internal static func minAgo(_ p1: Int) -> String {
      return L10n.tr("Localizable", "time.min-ago", p1)
    }
    /// %d mins ago
    internal static func minsAgo(_ p1: Int) -> String {
      return L10n.tr("Localizable", "time.mins-ago", p1)
    }
    /// %d secs ago
    internal static func secsAgo(_ p1: Int) -> String {
      return L10n.tr("Localizable", "time.secs-ago", p1)
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
