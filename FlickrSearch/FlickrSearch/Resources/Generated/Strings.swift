// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum FlickrAppCommonTexts {
    /// Cancel
    internal static let cancel = L10n.tr("Localizable", "FlickrAppCommonTexts.cancel", fallback: "Cancel")
    /// Search...
    internal static let search = L10n.tr("Localizable", "FlickrAppCommonTexts.search", fallback: "Search...")
  }
  internal enum FlickrDetailImageView {
    internal enum ImageDetails {
      /// Author:
      internal static let author = L10n.tr("Localizable", "FlickrDetailImageView.imageDetails.author", fallback: "Author:")
      /// Height:
      internal static let height = L10n.tr("Localizable", "FlickrDetailImageView.imageDetails.height", fallback: "Height:")
      /// Tags:
      internal static let tags = L10n.tr("Localizable", "FlickrDetailImageView.imageDetails.tags", fallback: "Tags:")
      /// Title:
      internal static let title = L10n.tr("Localizable", "FlickrDetailImageView.imageDetails.title", fallback: "Title:")
      /// Width:
      internal static let width = L10n.tr("Localizable", "FlickrDetailImageView.imageDetails.width", fallback: "Width:")
    }
  }
  internal enum FlickrSearchApiError {
    /// Authentication is required
    internal static let authenticationRequired = L10n.tr("Localizable", "FlickrSearchApiError.authenticationRequired", fallback: "Authentication is required")
    /// This is a bad request
    internal static let badRequest = L10n.tr("Localizable", "FlickrSearchApiError.badRequest", fallback: "This is a bad request")
    /// Bad URL request
    internal static let badUrl = L10n.tr("Localizable", "FlickrSearchApiError.badUrl", fallback: "Bad URL request")
    /// The received data is broken
    internal static let brokenData = L10n.tr("Localizable", "FlickrSearchApiError.brokenData", fallback: "The received data is broken")
    /// The host was not found
    internal static let couldNotFindHost = L10n.tr("Localizable", "FlickrSearchApiError.couldNotFindHost", fallback: "The host was not found")
    /// Can't convert the data to the object entity
    internal static let couldNotParseObject = L10n.tr("Localizable", "FlickrSearchApiError.couldNotParseObject", fallback: "Can't convert the data to the object entity")
  }
  internal enum FlickrSearchImageView {
    /// Flickr Search
    internal static let title = L10n.tr("Localizable", "FlickrSearchImageView.title", fallback: "Flickr Search")
    internal enum EmptyView {
      /// How about looking for something interesting?
      internal static let description = L10n.tr("Localizable", "FlickrSearchImageView.emptyView.description", fallback: "How about looking for something interesting?")
      /// Nothing here
      internal static let title = L10n.tr("Localizable", "FlickrSearchImageView.emptyView.title", fallback: "Nothing here")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
