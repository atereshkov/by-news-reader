// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {

  internal enum Main {

    internal enum TabBar {

      internal enum Tab1 {
        /// FEED
        internal static let title = L10n.tr("Localizable", "main.tab-bar.tab1.title")
      }

      internal enum Tab2 {
        /// CATEGORIES
        internal static let title = L10n.tr("Localizable", "main.tab-bar.tab2.title")
      }

      internal enum Tab3 {
        /// BOOKMARKS
        internal static let title = L10n.tr("Localizable", "main.tab-bar.tab3.title")
      }

      internal enum Tab4 {
        /// SETTINGS
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

      internal enum City {
        /// Choose city
        internal static let title = L10n.tr("Localizable", "menu.item.city.title")
      }

      internal enum FontSize {
        /// Font size
        internal static let title = L10n.tr("Localizable", "menu.item.font-size.title")
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

  internal enum Theme {
    /// Dark
    internal static let dark = L10n.tr("Localizable", "theme.dark")
    /// Paper
    internal static let paper = L10n.tr("Localizable", "theme.paper")
    /// White
    internal static let white = L10n.tr("Localizable", "theme.white")
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
