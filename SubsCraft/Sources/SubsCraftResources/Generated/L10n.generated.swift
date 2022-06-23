// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces

public enum L10n {

  public enum Apple {
    public enum Login {
      /// Log out
      public static let signout = L10n.tr("Localizable", "apple.login.signout")
    }
  }

  public enum Att {
    public enum Request {
      /// Ok, I understand
      public static let cta = L10n.tr("Localizable", "att.request.cta")
      /// You can always review your decision and make changes in settings at any time
      public static let note = L10n.tr("Localizable", "att.request.note")
      /// Enable tracking
      public static let title = L10n.tr("Localizable", "att.request.title")
      public enum Description {
        /// For a better user experience
        public static let first = L10n.tr("Localizable", "att.request.description.first")
        /// For content that aligns with your interests
        public static let second = L10n.tr("Localizable", "att.request.description.second")
      }
    }
  }

  public enum Check {
    public enum Internet {
      /// Please, check your internet connection and try again later
      public static let title = L10n.tr("Localizable", "check.internet.title")
    }
  }

  public enum DefaultBanner {
    /// Premium\nNo ads & more features!
    public static let title = L10n.tr("Localizable", "default_banner.title")
    public enum Upgrade {
      /// UPGRADE
      public static let title = L10n.tr("Localizable", "default_banner.upgrade.title")
    }
  }

  public enum General {
    public enum Button {
      /// Back
      public static let back = L10n.tr("Localizable", "general.button.back")
      /// Close
      public static let close = L10n.tr("Localizable", "general.button.close")
      /// Done
      public static let done = L10n.tr("Localizable", "general.button.done")
      /// Ok
      public static let ok = L10n.tr("Localizable", "general.button.ok")
      /// Retry
      public static let retry = L10n.tr("Localizable", "general.button.retry")
    }
  }

  public enum NoInternet {
    /// No internet connection, try later
    public static let subtitle = L10n.tr("Localizable", "no_internet.subtitle")
    /// Ooops
    public static let title = L10n.tr("Localizable", "no_internet.title")
  }

  public enum NoMailApp {
    /// You don't have Mail app
    public static let subtitle = L10n.tr("Localizable", "no_mail_app.subtitle")
    /// Ooops
    public static let title = L10n.tr("Localizable", "no_mail_app.title")
  }

  public enum Settings {
    public enum ContactUs {
      /// We would love to hear from you
      public static let subtitle = L10n.tr("Localizable", "settings.contact_us.subtitle")
      /// Contact Us
      public static let title = L10n.tr("Localizable", "settings.contact_us.title")
    }
    public enum HelpSupport {
      public enum Section {
        /// Help & Support
        public static let title = L10n.tr("Localizable", "settings.help_support.section.title")
      }
    }
    public enum Privacy {
      /// And other legal texts
      public static let subtitle = L10n.tr("Localizable", "settings.privacy.subtitle")
      /// Privacy Policy
      public static let title = L10n.tr("Localizable", "settings.privacy.title")
    }
    public enum Rateapp {
      /// Rate the App
      public static let title = L10n.tr("Localizable", "settings.rateapp.title")
    }
    public enum Restore {
      /// We’ll find stuff you have already bought
      public static let subtitle = L10n.tr("Localizable", "settings.restore.subtitle")
      /// Restore Purchases
      public static let title = L10n.tr("Localizable", "settings.restore.title")
    }
    public enum RestoreFail {
      /// Sorry, it looks like you don't have any purchases 
      public static let subtitle = L10n.tr("Localizable", "settings.restore_fail.subtitle")
    }
    public enum Share {
      /// Share via your favorite messenger
      public static let subtitle = L10n.tr("Localizable", "settings.share.subtitle")
    }
    public enum ShareApp {
      /// Share App
      public static let title = L10n.tr("Localizable", "settings.share_app.title")
    }
  }

  public enum Start {
    /// Will be possible if you grant access to:
    public static let subtitle = L10n.tr("Localizable", "start.subtitle")
    /// Best weather experience
    public static let title = L10n.tr("Localizable", "start.title")
    public enum Button {
      /// Ok, I understand
      public static let `continue` = L10n.tr("Localizable", "start.button.continue")
    }
    public enum Feature {
      /// Location, so that the app can ensure that you get the most accurate local weather data
      public static let first = L10n.tr("Localizable", "start.feature.first")
      /// Notifications, to be aware of important, dangerous and disrupting weather changes
      public static let second = L10n.tr("Localizable", "start.feature.second")
    }
  }

  public enum Subs {
    /// %@ per %@
    public static func pricePerPeriod(_ p1: Any, _ p2: Any) -> String {
      return L10n.tr("Localizable", "subs.price_per_period", String(describing: p1), String(describing: p2))
    }
    /// %@/%@
    public static func priceSlashPeriod(_ p1: Any, _ p2: Any) -> String {
      return L10n.tr("Localizable", "subs.price_slash_period", String(describing: p1), String(describing: p2))
    }
    /// Try Free and Subscribe
    public static let tryFreeAndSubscribe = L10n.tr("Localizable", "subs.try_free_and_subscribe")
    public enum AdditionalOffer {
      /// Here is an offer for you:
      public static let subtitle = L10n.tr("Localizable", "subs.additional_offer.subtitle")
      /// You can choose between a longer trial period (that’s 7 days instead of 3) and paying even less per quarter. Try 7 days free, then %@. Get all the premium features. Don’t miss this limited time deal!
      public static func textFormat(_ p1: Any) -> String {
        return L10n.tr("Localizable", "subs.additional_offer.text_format", String(describing: p1))
      }
      /// Not convinced?
      public static let title = L10n.tr("Localizable", "subs.additional_offer.title")
    }
    public enum Button {
      /// Remind me when internet connection is back
      public static let noInternet = L10n.tr("Localizable", "subs.button.no_internet")
      /// Privacy
      public static let privacy = L10n.tr("Localizable", "subs.button.privacy")
      /// Restore
      public static let restore = L10n.tr("Localizable", "subs.button.restore")
      /// Terms
      public static let terms = L10n.tr("Localizable", "subs.button.terms")
    }
    public enum OneButton {
      /// subscribe for %@ per %@
      public static func price(_ p1: Any, _ p2: Any) -> String {
        return L10n.tr("Localizable", "subs.one_button.price", String(describing: p1), String(describing: p2))
      }
      /// Unlimited access\nto all features
      public static let title = L10n.tr("Localizable", "subs.one_button.title")
      public enum Button {
        /// or continue with a limited version
        public static let close = L10n.tr("Localizable", "subs.one_button.button.close")
        /// Continue
        public static let `continue` = L10n.tr("Localizable", "subs.one_button.button.continue")
      }
      public enum Feature {
        /// Enjoy all features of the app
        public static let first = L10n.tr("Localizable", "subs.one_button.feature.first")
        /// Remove ads
        public static let second = L10n.tr("Localizable", "subs.one_button.feature.second")
      }
      public enum Trial {
        /// Then %@ per %@
        public static func actual(_ p1: Any, _ p2: Any) -> String {
          return L10n.tr("Localizable", "subs.one_button.trial.actual", String(describing: p1), String(describing: p2))
        }
        /// %d days trial
        public static func free(_ p1: Int) -> String {
          return L10n.tr("Localizable", "subs.one_button.trial.free", p1)
        }
      }
    }
    public enum Period {
      /// day
      public static let day = L10n.tr("Localizable", "subs.period.day")
      /// month
      public static let month = L10n.tr("Localizable", "subs.period.month")
      /// quarter
      public static let quartal = L10n.tr("Localizable", "subs.period.quartal")
      /// week
      public static let week = L10n.tr("Localizable", "subs.period.week")
      /// year
      public static let year = L10n.tr("Localizable", "subs.period.year")
    }
    public enum TwoButtons {
      /// That's just %@
      public static func infoJust(_ p1: Any) -> String {
        return L10n.tr("Localizable", "subs.two_buttons.info_just", String(describing: p1))
      }
      /// Try For Free
      public static let subtitle = L10n.tr("Localizable", "subs.two_buttons.subtitle")
      /// Enjoy all features of the app ad free and make sure that all new features are unlocked for you to use. Try for free. No commitment. Cancel anytime.
      public static let text = L10n.tr("Localizable", "subs.two_buttons.text")
      /// Enjoy all features of the app ad free and make sure that all new features are unlocked for you to use. Try %d days free, then %@. No commitment. Cancel anytime.
      public static func textFormat(_ p1: Int, _ p2: Any) -> String {
        return L10n.tr("Localizable", "subs.two_buttons.text_format", p1, String(describing: p2))
      }
      /// Enjoy all features of the app ad free and make sure that all new features are unlocked for you to use. Try %d days free, then %@. No commitment. Cancel anytime.
      public static func textFormat7(_ p1: Int, _ p2: Any) -> String {
        return L10n.tr("Localizable", "subs.two_buttons.text_format7", p1, String(describing: p2))
      }
      /// Full Access
      public static let title = L10n.tr("Localizable", "subs.two_buttons.title")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
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
