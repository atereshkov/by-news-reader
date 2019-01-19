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
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
