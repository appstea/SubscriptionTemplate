// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces

internal typealias L10n = UISubsLocalization

internal enum UISubsLocalization {

  internal enum Apple {
    internal enum Login {
      /// Log out
      internal static let signout = UISubsLocalization.tr("Localizable", "apple.login.signout")
    }
  }

  internal enum Att {
    internal enum Request {
      /// Ok, I understand
      internal static let cta = UISubsLocalization.tr("Localizable", "att.request.cta")
      /// You can always review your decision and make changes in settings at any time
      internal static let note = UISubsLocalization.tr("Localizable", "att.request.note")
      /// Enable tracking
      internal static let title = UISubsLocalization.tr("Localizable", "att.request.title")
      internal enum Description {
        /// For a better user experience
        internal static let first = UISubsLocalization.tr("Localizable", "att.request.description.first")
        /// For content that aligns with your interests
        internal static let second = UISubsLocalization.tr("Localizable", "att.request.description.second")
      }
    }
  }

  internal enum Check {
    internal enum Internet {
      /// Please, check your internet connection and try again later
      internal static let title = UISubsLocalization.tr("Localizable", "check.internet.title")
    }
  }

  internal enum DefaultBanner {
    /// Premium\nNo ads & more features!
    internal static let title = UISubsLocalization.tr("Localizable", "default_banner.title")
    internal enum Upgrade {
      /// UPGRADE
      internal static let title = UISubsLocalization.tr("Localizable", "default_banner.upgrade.title")
    }
  }

  internal enum General {
    internal enum Button {
      /// Back
      internal static let back = UISubsLocalization.tr("Localizable", "general.button.back")
      /// Close
      internal static let close = UISubsLocalization.tr("Localizable", "general.button.close")
      /// Done
      internal static let done = UISubsLocalization.tr("Localizable", "general.button.done")
      /// Ok
      internal static let ok = UISubsLocalization.tr("Localizable", "general.button.ok")
      /// Retry
      internal static let retry = UISubsLocalization.tr("Localizable", "general.button.retry")
    }
  }

  internal enum NoInternet {
    /// No internet connection, try later
    internal static let subtitle = UISubsLocalization.tr("Localizable", "no_internet.subtitle")
    /// Ooops
    internal static let title = UISubsLocalization.tr("Localizable", "no_internet.title")
  }

  internal enum NoMailApp {
    /// You don't have Mail app
    internal static let subtitle = UISubsLocalization.tr("Localizable", "no_mail_app.subtitle")
    /// Ooops
    internal static let title = UISubsLocalization.tr("Localizable", "no_mail_app.title")
  }

  internal enum Settings {
    internal enum ContactUs {
      /// We would love to hear from you
      internal static let subtitle = UISubsLocalization.tr("Localizable", "settings.contact_us.subtitle")
      /// Contact Us
      internal static let title = UISubsLocalization.tr("Localizable", "settings.contact_us.title")
    }
    internal enum HelpSupport {
      internal enum Section {
        /// Help & Support
        internal static let title = UISubsLocalization.tr("Localizable", "settings.help_support.section.title")
      }
    }
    internal enum Privacy {
      /// And other legal texts
      internal static let subtitle = UISubsLocalization.tr("Localizable", "settings.privacy.subtitle")
      /// Privacy Policy
      internal static let title = UISubsLocalization.tr("Localizable", "settings.privacy.title")
    }
    internal enum Rateapp {
      /// Rate the App
      internal static let title = UISubsLocalization.tr("Localizable", "settings.rateapp.title")
    }
    internal enum Restore {
      /// We’ll find stuff you have already bought
      internal static let subtitle = UISubsLocalization.tr("Localizable", "settings.restore.subtitle")
      /// Restore Purchases
      internal static let title = UISubsLocalization.tr("Localizable", "settings.restore.title")
    }
    internal enum RestoreFail {
      /// Sorry, it looks like you don't have any purchases 
      internal static let subtitle = UISubsLocalization.tr("Localizable", "settings.restore_fail.subtitle")
    }
    internal enum Share {
      /// Share via your favorite messenger
      internal static let subtitle = UISubsLocalization.tr("Localizable", "settings.share.subtitle")
    }
    internal enum ShareApp {
      /// Share App
      internal static let title = UISubsLocalization.tr("Localizable", "settings.share_app.title")
    }
  }

  internal enum Start {
    /// Will be possible if you grant access to:
    internal static let subtitle = UISubsLocalization.tr("Localizable", "start.subtitle")
    /// Best weather experience
    internal static let title = UISubsLocalization.tr("Localizable", "start.title")
    internal enum Button {
      /// Ok, I understand
      internal static let `continue` = UISubsLocalization.tr("Localizable", "start.button.continue")
    }
    internal enum Feature {
      /// Location, so that the app can ensure that you get the most accurate local weather data
      internal static let first = UISubsLocalization.tr("Localizable", "start.feature.first")
      /// Notifications, to be aware of important, dangerous and disrupting weather changes
      internal static let second = UISubsLocalization.tr("Localizable", "start.feature.second")
    }
  }

  internal enum Subs {
    /// %@ per %@
    internal static func pricePerPeriod(_ p1: Any, _ p2: Any) -> String {
      return UISubsLocalization.tr("Localizable", "subs.price_per_period", String(describing: p1), String(describing: p2))
    }
    /// %@/%@
    internal static func priceSlashPeriod(_ p1: Any, _ p2: Any) -> String {
      return UISubsLocalization.tr("Localizable", "subs.price_slash_period", String(describing: p1), String(describing: p2))
    }
    /// Try Free and Subscribe
    internal static let tryFreeAndSubscribe = UISubsLocalization.tr("Localizable", "subs.try_free_and_subscribe")
    internal enum AdditionalOffer {
      /// Here is an offer for you:
      internal static let subtitle = UISubsLocalization.tr("Localizable", "subs.additional_offer.subtitle")
      /// You can choose between a longer trial period (that’s 7 days instead of 3) and paying even less per quarter. Try 7 days free, then %@. Get all the premium features. Don’t miss this limited time deal!
      internal static func textFormat(_ p1: Any) -> String {
        return UISubsLocalization.tr("Localizable", "subs.additional_offer.text_format", String(describing: p1))
      }
      /// Not convinced?
      internal static let title = UISubsLocalization.tr("Localizable", "subs.additional_offer.title")
    }
    internal enum Button {
      /// Remind me when internet connection is back
      internal static let noInternet = UISubsLocalization.tr("Localizable", "subs.button.no_internet")
      /// Privacy
      internal static let privacy = UISubsLocalization.tr("Localizable", "subs.button.privacy")
      /// Restore
      internal static let restore = UISubsLocalization.tr("Localizable", "subs.button.restore")
      /// Terms
      internal static let terms = UISubsLocalization.tr("Localizable", "subs.button.terms")
    }
    internal enum OneButton {
      /// subscribe for %@ per %@
      internal static func price(_ p1: Any, _ p2: Any) -> String {
        return UISubsLocalization.tr("Localizable", "subs.one_button.price", String(describing: p1), String(describing: p2))
      }
      /// Unlimited access\nto all features
      internal static let title = UISubsLocalization.tr("Localizable", "subs.one_button.title")
      internal enum Button {
        /// or continue with a limited version
        internal static let close = UISubsLocalization.tr("Localizable", "subs.one_button.button.close")
        /// Continue
        internal static let `continue` = UISubsLocalization.tr("Localizable", "subs.one_button.button.continue")
      }
      internal enum Feature {
        /// Enjoy all features of the app
        internal static let first = UISubsLocalization.tr("Localizable", "subs.one_button.feature.first")
        /// Remove ads
        internal static let second = UISubsLocalization.tr("Localizable", "subs.one_button.feature.second")
      }
      internal enum Trial {
        /// Then %@ per %@
        internal static func actual(_ p1: Any, _ p2: Any) -> String {
          return UISubsLocalization.tr("Localizable", "subs.one_button.trial.actual", String(describing: p1), String(describing: p2))
        }
        /// %d days trial
        internal static func free(_ p1: Int) -> String {
          return UISubsLocalization.tr("Localizable", "subs.one_button.trial.free", p1)
        }
      }
    }
    internal enum Period {
      /// day
      internal static let day = UISubsLocalization.tr("Localizable", "subs.period.day")
      /// month
      internal static let month = UISubsLocalization.tr("Localizable", "subs.period.month")
      /// quarter
      internal static let quartal = UISubsLocalization.tr("Localizable", "subs.period.quartal")
      /// week
      internal static let week = UISubsLocalization.tr("Localizable", "subs.period.week")
      /// year
      internal static let year = UISubsLocalization.tr("Localizable", "subs.period.year")
    }
    internal enum TwoButtons {
      /// That's just %@
      internal static func infoJust(_ p1: Any) -> String {
        return UISubsLocalization.tr("Localizable", "subs.two_buttons.info_just", String(describing: p1))
      }
      /// Try For Free
      internal static let subtitle = UISubsLocalization.tr("Localizable", "subs.two_buttons.subtitle")
      /// Enjoy all features of the app ad free and make sure that all new features are unlocked for you to use. Try for free. No commitment. Cancel anytime.
      internal static let text = UISubsLocalization.tr("Localizable", "subs.two_buttons.text")
      /// Enjoy all features of the app ad free and make sure that all new features are unlocked for you to use. Try %d days free, then %@. No commitment. Cancel anytime.
      internal static func textFormat(_ p1: Int, _ p2: Any) -> String {
        return UISubsLocalization.tr("Localizable", "subs.two_buttons.text_format", p1, String(describing: p2))
      }
      /// Enjoy all features of the app ad free and make sure that all new features are unlocked for you to use. Try %d days free, then %@. No commitment. Cancel anytime.
      internal static func textFormat7(_ p1: Int, _ p2: Any) -> String {
        return UISubsLocalization.tr("Localizable", "subs.two_buttons.text_format7", p1, String(describing: p2))
      }
      /// Full Access
      internal static let title = UISubsLocalization.tr("Localizable", "subs.two_buttons.title")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension UISubsLocalization {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle = Bundle.module
}
// swiftlint:enable convenience_type
