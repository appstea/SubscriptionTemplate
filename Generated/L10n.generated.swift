// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

public typealias L10n = Localization.Localizable

public extension Bundle {
    @objc
    static var l10n: Bundle { Bundle(for: BundleToken.self) }
}

// MARK: - Implementation Details

private final class BundleToken {}

public enum Localization {

  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public extension Localization {
  enum InfoPlist {
    public enum Keys { 
      public static let cfBundleDisplayName = "CFBundleDisplayName"
      public static let nsCalendarsUsageDescription = "NSCalendarsUsageDescription"
      public static let nsLocationAlwaysAndWhenInUseUsageDescription = "NSLocationAlwaysAndWhenInUseUsageDescription"
      public static let nsLocationAlwaysUsageDescription = "NSLocationAlwaysUsageDescription"
      public static let nsLocationUsageDescription = "NSLocationUsageDescription"
      public static let nsLocationWhenInUseUsageDescription = "NSLocationWhenInUseUsageDescription"
      public static let nsSiriUsageDescription = "NSSiriUsageDescription"
      public static let nsUserTrackingUsageDescription = "NSUserTrackingUsageDescription"
    }
    /// Apps&Subs
    public static var cfBundleDisplayName: String { Localization.tr("InfoPlist", Keys.cfBundleDisplayName) }
    /// Climate needs your calendar to provide personalised advertising experience tailored to you
    public static var nsCalendarsUsageDescription: String { Localization.tr("InfoPlist", Keys.nsCalendarsUsageDescription) }
    /// Get local weather and alerts for new destinations as you travel.
    public static var nsLocationAlwaysAndWhenInUseUsageDescription: String { Localization.tr("InfoPlist", Keys.nsLocationAlwaysAndWhenInUseUsageDescription) }
    /// Get local weather and alerts for new destinations as you travel.
    public static var nsLocationAlwaysUsageDescription: String { Localization.tr("InfoPlist", Keys.nsLocationAlwaysUsageDescription) }
    /// Get local weather for your specific location.
    public static var nsLocationUsageDescription: String { Localization.tr("InfoPlist", Keys.nsLocationUsageDescription) }
    /// Get local weather for your specific location.
    public static var nsLocationWhenInUseUsageDescription: String { Localization.tr("InfoPlist", Keys.nsLocationWhenInUseUsageDescription) }
    /// Shortcuts
    public static var nsSiriUsageDescription: String { Localization.tr("InfoPlist", Keys.nsSiriUsageDescription) }
    /// We woud like to undertstand how you installed this app.
    public static var nsUserTrackingUsageDescription: String { Localization.tr("InfoPlist", Keys.nsUserTrackingUsageDescription) }
  }
  enum Localizable {
    public enum Keys { 
    }
    public enum Apple {
      public enum Keys { 
      }
      public enum Login {
        public enum Keys { 
          public static let signout = "apple.login.signout"
        }
        /// Log out
        public static var signout: String { Localization.tr("Localizable", Keys.signout) }
      }
    }
    public enum Att {
      public enum Keys { 
      }
      public enum Request {
        public enum Keys { 
          public static let cta = "att.request.cta"
          public static let note = "att.request.note"
          public static let title = "att.request.title"
        }
        /// Ok, I understand
        public static var cta: String { Localization.tr("Localizable", Keys.cta) }
        /// You can always review your decision and make changes in settings at any time
        public static var note: String { Localization.tr("Localizable", Keys.note) }
        /// Enable tracking
        public static var title: String { Localization.tr("Localizable", Keys.title) }
        public enum Description {
          public enum Keys { 
            public static let first = "att.request.description.first"
            public static let second = "att.request.description.second"
          }
          /// For a better user experience
          public static var first: String { Localization.tr("Localizable", Keys.first) }
          /// For content that aligns with your interests
          public static var second: String { Localization.tr("Localizable", Keys.second) }
        }
      }
    }
    public enum Check {
      public enum Keys { 
      }
      public enum Internet {
        public enum Keys { 
          public static let title = "check.internet.title"
        }
        /// Please, check your internet connection and try again later
        public static var title: String { Localization.tr("Localizable", Keys.title) }
      }
    }
    public enum DefaultBanner {
      public enum Keys { 
        public static let title = "default_banner.title"
      }
      /// Premium\nNo ads & more features!
      public static var title: String { Localization.tr("Localizable", Keys.title) }
      public enum Upgrade {
        public enum Keys { 
          public static let title = "default_banner.upgrade.title"
        }
        /// UPGRADE
        public static var title: String { Localization.tr("Localizable", Keys.title) }
      }
    }
    public enum General {
      public enum Keys { 
      }
      public enum Button {
        public enum Keys { 
          public static let back = "general.button.back"
          public static let close = "general.button.close"
          public static let done = "general.button.done"
          public static let ok = "general.button.ok"
          public static let retry = "general.button.retry"
        }
        /// Back
        public static var back: String { Localization.tr("Localizable", Keys.back) }
        /// Close
        public static var close: String { Localization.tr("Localizable", Keys.close) }
        /// Done
        public static var done: String { Localization.tr("Localizable", Keys.done) }
        /// Ok
        public static var ok: String { Localization.tr("Localizable", Keys.ok) }
        /// Retry
        public static var retry: String { Localization.tr("Localizable", Keys.retry) }
      }
    }
    public enum NoInternet {
      public enum Keys { 
        public static let subtitle = "no_internet.subtitle"
        public static let title = "no_internet.title"
      }
      /// No internet connection, try later
      public static var subtitle: String { Localization.tr("Localizable", Keys.subtitle) }
      /// Ooops
      public static var title: String { Localization.tr("Localizable", Keys.title) }
    }
    public enum NoMailApp {
      public enum Keys { 
        public static let subtitle = "no_mail_app.subtitle"
        public static let title = "no_mail_app.title"
      }
      /// You don't have Mail app
      public static var subtitle: String { Localization.tr("Localizable", Keys.subtitle) }
      /// Ooops
      public static var title: String { Localization.tr("Localizable", Keys.title) }
    }
    public enum Settings {
      public enum Keys { 
      }
      public enum ContactUs {
        public enum Keys { 
          public static let subtitle = "settings.contact_us.subtitle"
          public static let title = "settings.contact_us.title"
        }
        /// We would love to hear from you
        public static var subtitle: String { Localization.tr("Localizable", Keys.subtitle) }
        /// Contact Us
        public static var title: String { Localization.tr("Localizable", Keys.title) }
      }
      public enum HelpSupport {
        public enum Keys { 
        }
        public enum Section {
          public enum Keys { 
            public static let title = "settings.help_support.section.title"
          }
          /// Help & Support
          public static var title: String { Localization.tr("Localizable", Keys.title) }
        }
      }
      public enum Privacy {
        public enum Keys { 
          public static let subtitle = "settings.privacy.subtitle"
          public static let title = "settings.privacy.title"
        }
        /// And other legal texts
        public static var subtitle: String { Localization.tr("Localizable", Keys.subtitle) }
        /// Privacy Policy
        public static var title: String { Localization.tr("Localizable", Keys.title) }
      }
      public enum Rateapp {
        public enum Keys { 
          public static let title = "settings.rateapp.title"
        }
        /// Rate the App
        public static var title: String { Localization.tr("Localizable", Keys.title) }
      }
      public enum Restore {
        public enum Keys { 
          public static let subtitle = "settings.restore.subtitle"
          public static let title = "settings.restore.title"
        }
        /// We’ll find stuff you have already bought
        public static var subtitle: String { Localization.tr("Localizable", Keys.subtitle) }
        /// Restore Purchases
        public static var title: String { Localization.tr("Localizable", Keys.title) }
      }
      public enum RestoreFail {
        public enum Keys { 
          public static let subtitle = "settings.restore_fail.subtitle"
        }
        /// Sorry, it looks like you don't have any purchases 
        public static var subtitle: String { Localization.tr("Localizable", Keys.subtitle) }
      }
      public enum Share {
        public enum Keys { 
          public static let subtitle = "settings.share.subtitle"
        }
        /// Share via your favorite messenger
        public static var subtitle: String { Localization.tr("Localizable", Keys.subtitle) }
      }
      public enum ShareApp {
        public enum Keys { 
          public static let title = "settings.share_app.title"
        }
        /// Share App
        public static var title: String { Localization.tr("Localizable", Keys.title) }
      }
    }
    public enum Start {
      public enum Keys { 
        public static let subtitle = "start.subtitle"
        public static let title = "start.title"
      }
      /// Will be possible if you grant access to:
      public static var subtitle: String { Localization.tr("Localizable", Keys.subtitle) }
      /// Best weather experience
      public static var title: String { Localization.tr("Localizable", Keys.title) }
      public enum Button {
        public enum Keys { 
          public static let `continue` = "start.button.continue"
        }
        /// Ok, I understand
        public static var `continue`: String { Localization.tr("Localizable", Keys.`continue`) }
      }
      public enum Feature {
        public enum Keys { 
          public static let first = "start.feature.first"
          public static let second = "start.feature.second"
        }
        /// Location, so that the app can ensure that you get the most accurate local weather data
        public static var first: String { Localization.tr("Localizable", Keys.first) }
        /// Notifications, to be aware of important, dangerous and disrupting weather changes
        public static var second: String { Localization.tr("Localizable", Keys.second) }
      }
    }
    public enum Subs {
      public enum Keys { 
        public static let tryFreeAndSubscribe = "subs.try_free_and_subscribe"
      }
      /// %@ per %@
      public static func pricePerPeriod(_ p1: String, _ p2: String) -> String {
        return Localization.tr("Localizable", "subs.price_per_period", p1, p2)
      }
      /// %@/%@
      public static func priceSlashPeriod(_ p1: String, _ p2: String) -> String {
        return Localization.tr("Localizable", "subs.price_slash_period", p1, p2)
      }
      /// Try Free and Subscribe
      public static var tryFreeAndSubscribe: String { Localization.tr("Localizable", Keys.tryFreeAndSubscribe) }
      public enum AdditionalOffer {
        public enum Keys { 
          public static let subtitle = "subs.additional_offer.subtitle"
          public static let title = "subs.additional_offer.title"
        }
        /// Here is an offer for you:
        public static var subtitle: String { Localization.tr("Localizable", Keys.subtitle) }
        /// You can choose between a longer trial period (that’s 7 days instead of 3) and paying even less per quarter. Try 7 days free, then %@. Get all the premium features. Don’t miss this limited time deal!
        public static func textFormat(_ p1: String) -> String {
          return Localization.tr("Localizable", "subs.additional_offer.text_format", p1)
        }
        /// Not convinced?
        public static var title: String { Localization.tr("Localizable", Keys.title) }
      }
      public enum Button {
        public enum Keys { 
          public static let noInternet = "subs.button.no_internet"
          public static let privacy = "subs.button.privacy"
          public static let restore = "subs.button.restore"
          public static let terms = "subs.button.terms"
        }
        /// Remind me when internet connection is back
        public static var noInternet: String { Localization.tr("Localizable", Keys.noInternet) }
        /// Privacy
        public static var privacy: String { Localization.tr("Localizable", Keys.privacy) }
        /// Restore
        public static var restore: String { Localization.tr("Localizable", Keys.restore) }
        /// Terms
        public static var terms: String { Localization.tr("Localizable", Keys.terms) }
      }
      public enum OneButton {
        public enum Keys { 
          public static let title = "subs.one_button.title"
        }
        /// subscribe for %@ per %@
        public static func price(_ p1: String, _ p2: String) -> String {
          return Localization.tr("Localizable", "subs.one_button.price", p1, p2)
        }
        /// Unlimited access\nto all features
        public static var title: String { Localization.tr("Localizable", Keys.title) }
        public enum Button {
          public enum Keys { 
            public static let close = "subs.one_button.button.close"
            public static let `continue` = "subs.one_button.button.continue"
          }
          /// or continue with a limited version
          public static var close: String { Localization.tr("Localizable", Keys.close) }
          /// Continue
          public static var `continue`: String { Localization.tr("Localizable", Keys.`continue`) }
        }
        public enum Feature {
          public enum Keys { 
            public static let first = "subs.one_button.feature.first"
            public static let second = "subs.one_button.feature.second"
          }
          /// Enjoy all features of the app
          public static var first: String { Localization.tr("Localizable", Keys.first) }
          /// Remove ads
          public static var second: String { Localization.tr("Localizable", Keys.second) }
        }
        public enum Trial {
          public enum Keys { 
          }
          /// Then %@ per %@
          public static func actual(_ p1: String, _ p2: String) -> String {
            return Localization.tr("Localizable", "subs.one_button.trial.actual", p1, p2)
          }
          /// %d days trial
          public static func free(_ p1: Int) -> String {
            return Localization.tr("Localizable", "subs.one_button.trial.free", p1)
          }
        }
      }
      public enum Period {
        public enum Keys { 
          public static let day = "subs.period.day"
          public static let month = "subs.period.month"
          public static let quartal = "subs.period.quartal"
          public static let week = "subs.period.week"
          public static let year = "subs.period.year"
        }
        /// day
        public static var day: String { Localization.tr("Localizable", Keys.day) }
        /// month
        public static var month: String { Localization.tr("Localizable", Keys.month) }
        /// quarter
        public static var quartal: String { Localization.tr("Localizable", Keys.quartal) }
        /// week
        public static var week: String { Localization.tr("Localizable", Keys.week) }
        /// year
        public static var year: String { Localization.tr("Localizable", Keys.year) }
      }
      public enum TwoButtons {
        public enum Keys { 
          public static let subtitle = "subs.two_buttons.subtitle"
          public static let text = "subs.two_buttons.text"
          public static let title = "subs.two_buttons.title"
        }
        /// That's just %@
        public static func infoJust(_ p1: String) -> String {
          return Localization.tr("Localizable", "subs.two_buttons.info_just", p1)
        }
        /// Try For Free
        public static var subtitle: String { Localization.tr("Localizable", Keys.subtitle) }
        /// Enjoy all features of the app ad free and make sure that all new features are unlocked for you to use. Try for free. No commitment. Cancel anytime.
        public static var text: String { Localization.tr("Localizable", Keys.text) }
        /// Enjoy all features of the app ad free and make sure that all new features are unlocked for you to use. Try %d days free, then %@. No commitment. Cancel anytime.
        public static func textFormat(_ p1: Int, _ p2: String) -> String {
          return Localization.tr("Localizable", "subs.two_buttons.text_format", p1, p2)
        }
        /// Enjoy all features of the app ad free and make sure that all new features are unlocked for you to use. Try %d days free, then %@. No commitment. Cancel anytime.
        public static func textFormat7(_ p1: Int, _ p2: String) -> String {
          return Localization.tr("Localizable", "subs.two_buttons.text_format7", p1, p2)
        }
        /// Full Access
        public static var title: String { Localization.tr("Localizable", Keys.title) }
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name
