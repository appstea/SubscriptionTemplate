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
      public static let nsUserTrackingUsageDescription = "NSUserTrackingUsageDescription"
    }
    /// App & Subs
    public static var cfBundleDisplayName: String { Localization.tr("InfoPlist", Keys.cfBundleDisplayName) }
    /// We woud like to undertstand how you installed this app.
    public static var nsUserTrackingUsageDescription: String { Localization.tr("InfoPlist", Keys.nsUserTrackingUsageDescription) }
  }
  enum Localizable {
    public enum Keys { 
    }
    public enum Accessibility {
      public enum Keys { 
      }
      public enum Label {
        public enum Keys { 
          public static let humidity = "accessibility.label.humidity"
        }
        /// Humidity
        public static var humidity: String { Localization.tr("Localizable", Keys.humidity) }
        public enum Temp {
          public enum Keys { 
            public static let max = "accessibility.label.temp.max"
            public static let min = "accessibility.label.temp.min"
          }
          /// Maximum
          public static var max: String { Localization.tr("Localizable", Keys.max) }
          /// Minimum
          public static var min: String { Localization.tr("Localizable", Keys.min) }
        }
      }
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
    public enum CurrentWeather {
      public enum Keys { 
      }
      /// %@ feels like
      public static func feelsLike(_ p1: String) -> String {
        return Localization.tr("Localizable", "current_weather.feels_like", p1)
      }
      /// %@ pressure
      public static func pressure(_ p1: String) -> String {
        return Localization.tr("Localizable", "current_weather.pressure", p1)
      }
      /// %@ wind
      public static func wind(_ p1: String) -> String {
        return Localization.tr("Localizable", "current_weather.wind", p1)
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
    public enum EmptyView {
      public enum Keys { 
        public static let subtitle = "empty_view.subtitle"
        public static let title = "empty_view.title"
      }
      /// Select your location to start
      public static var subtitle: String { Localization.tr("Localizable", Keys.subtitle) }
      /// My location
      public static var title: String { Localization.tr("Localizable", Keys.title) }
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
    public enum Hour {
      public enum Keys { 
      }
      public enum Cell {
        public enum Keys { 
          public static let now = "hour.cell.now"
          public static let sunrise = "hour.cell.sunrise"
          public static let sunset = "hour.cell.sunset"
        }
        /// Now
        public static var now: String { Localization.tr("Localizable", Keys.now) }
        /// Sunrise
        public static var sunrise: String { Localization.tr("Localizable", Keys.sunrise) }
        /// Sunset
        public static var sunset: String { Localization.tr("Localizable", Keys.sunset) }
      }
    }
    public enum Imperial {
      public enum Keys { 
        public static let value = "imperial.value"
      }
      /// imperial
      public static var value: String { Localization.tr("Localizable", Keys.value) }
    }
    public enum Metric {
      public enum Keys { 
        public static let value = "metric.value"
      }
      /// metric
      public static var value: String { Localization.tr("Localizable", Keys.value) }
    }
    public enum NextDay {
      public enum Keys { 
      }
      public enum Cell {
        public enum Keys { 
          public static let today = "next_day.cell.today"
        }
        /// Today
        public static var today: String { Localization.tr("Localizable", Keys.today) }
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
    public enum Notification {
      public enum Keys { 
      }
      public enum _3DaysAgo {
        public enum Keys { 
        }
        /// Forecast is: %@, %@. %@\nOpen the app to compare the forecast with the actual weather observation data.
        public static func description(_ p1: String, _ p2: String, _ p3: String) -> String {
          return Localization.tr("Localizable", "notification.3_days_ago.description", p1, p2, p3)
        }
        /// %@
        public static func title(_ p1: String) -> String {
          return Localization.tr("Localizable", "notification.3_days_ago.title", p1)
        }
      }
      public enum _5DaysAgo {
        public enum Keys { 
        }
        /// Forecast is: %@, %@. %@\nOpen the app to compare the forecast with the actual weather observation data.
        public static func description(_ p1: String, _ p2: String, _ p3: String) -> String {
          return Localization.tr("Localizable", "notification.5_days_ago.description", p1, p2, p3)
        }
        /// %@
        public static func title(_ p1: String) -> String {
          return Localization.tr("Localizable", "notification.5_days_ago.title", p1)
        }
      }
      public enum Comparing {
        public enum Keys { 
          public static let colder = "notification.comparing.colder"
          public static let warmer = "notification.comparing.warmer"
        }
        /// colder
        public static var colder: String { Localization.tr("Localizable", Keys.colder) }
        /// warmer
        public static var warmer: String { Localization.tr("Localizable", Keys.warmer) }
      }
      public enum EveningForecast {
        public enum Keys { 
        }
        /// %@ %@, min: %@, max: %@
        public static func description(_ p1: String, _ p2: String, _ p3: String, _ p4: String) -> String {
          return Localization.tr("Localizable", "notification.evening_forecast.description", p1, p2, p3, p4)
        }
        /// %@. Tomorrow:
        public static func title(_ p1: String) -> String {
          return Localization.tr("Localizable", "notification.evening_forecast.title", p1)
        }
      }
      public enum InternetComesBack {
        public enum Keys { 
          public static let description = "notification.internet_comes_back.description"
          public static let title = "notification.internet_comes_back.title"
        }
        /// 
        public static var description: String { Localization.tr("Localizable", Keys.description) }
        /// 
        public static var title: String { Localization.tr("Localizable", Keys.title) }
      }
      public enum MonthAgo {
        public enum Keys { 
        }
        /// Exactly a month ago the weather was: %@, %@. %@\nOpen the app to check how the weather changed in one month.
        public static func description(_ p1: String, _ p2: String, _ p3: String) -> String {
          return Localization.tr("Localizable", "notification.month_ago.description", p1, p2, p3)
        }
        /// %@
        public static func title(_ p1: String) -> String {
          return Localization.tr("Localizable", "notification.month_ago.title", p1)
        }
      }
      public enum MorningComparingForecast {
        public enum Keys { 
        }
        /// %@ %@, %@. %@ %@ than yesterday.
        public static func description(_ p1: String, _ p2: String, _ p3: String, _ p4: String, _ p5: String) -> String {
          return Localization.tr("Localizable", "notification.morning_comparing_forecast.description", p1, p2, p3, p4, p5)
        }
        /// %@. Morning outlook:
        public static func title(_ p1: String) -> String {
          return Localization.tr("Localizable", "notification.morning_comparing_forecast.title", p1)
        }
      }
      public enum MorningForecast {
        public enum Keys { 
        }
        /// %@ %@, %@
        public static func description(_ p1: String, _ p2: String, _ p3: String) -> String {
          return Localization.tr("Localizable", "notification.morning_forecast.description", p1, p2, p3)
        }
        /// %@. Morning outlook:
        public static func title(_ p1: String) -> String {
          return Localization.tr("Localizable", "notification.morning_forecast.title", p1)
        }
      }
      public enum NoLocation {
        public enum Keys { 
          public static let description = "notification.no_location.description"
        }
        /// Please enable location permission in settings or add any city in the app.
        public static var description: String { Localization.tr("Localizable", Keys.description) }
        /// %@
        public static func title(_ p1: String) -> String {
          return Localization.tr("Localizable", "notification.no_location.title", p1)
        }
      }
      public enum WeekAgo {
        public enum Keys { 
        }
        /// Exactly a week ago the weather was: %@, %@. %@\nOpen the app to check how the weather changed in one week.
        public static func description(_ p1: String, _ p2: String, _ p3: String) -> String {
          return Localization.tr("Localizable", "notification.week_ago.description", p1, p2, p3)
        }
        /// %@
        public static func title(_ p1: String) -> String {
          return Localization.tr("Localizable", "notification.week_ago.title", p1)
        }
      }
      public enum YearAgo {
        public enum Keys { 
        }
        /// Exactly a year ago the weather was: %@, %@. %@\nOpen the app to check how the weather changed in one year.
        public static func description(_ p1: String, _ p2: String, _ p3: String) -> String {
          return Localization.tr("Localizable", "notification.year_ago.description", p1, p2, p3)
        }
        /// %@
        public static func title(_ p1: String) -> String {
          return Localization.tr("Localizable", "notification.year_ago.title", p1)
        }
      }
    }
    public enum Pressure {
      public enum Keys { 
      }
      public enum Hpa {
        public enum Keys { 
          public static let value = "pressure.hpa.value"
        }
        /// hPa
        public static var value: String { Localization.tr("Localizable", Keys.value) }
        public enum Expanded {
          public enum Keys { 
            public static let value = "pressure.hpa.expanded.value"
          }
          /// hectopascals
          public static var value: String { Localization.tr("Localizable", Keys.value) }
        }
      }
      public enum Inches {
        public enum Keys { 
          public static let value = "pressure.inches.value"
        }
        /// inches
        public static var value: String { Localization.tr("Localizable", Keys.value) }
        public enum Expanded {
          public enum Keys { 
            public static let value = "pressure.inches.expanded.value"
          }
          /// inches
          public static var value: String { Localization.tr("Localizable", Keys.value) }
        }
      }
      public enum Kpa {
        public enum Keys { 
          public static let value = "pressure.kpa.value"
        }
        /// kPa
        public static var value: String { Localization.tr("Localizable", Keys.value) }
        public enum Expanded {
          public enum Keys { 
            public static let value = "pressure.kpa.expanded.value"
          }
          /// kilopascals
          public static var value: String { Localization.tr("Localizable", Keys.value) }
        }
      }
      public enum Mm {
        public enum Keys { 
          public static let value = "pressure.mm.value"
        }
        /// mm
        public static var value: String { Localization.tr("Localizable", Keys.value) }
        public enum Expanded {
          public enum Keys { 
            public static let value = "pressure.mm.expanded.value"
          }
          /// millimeters
          public static var value: String { Localization.tr("Localizable", Keys.value) }
        }
      }
    }
    public enum Rain {
      public enum Keys { 
        public static let value = "rain.value"
      }
      /// mm
      public static var value: String { Localization.tr("Localizable", Keys.value) }
      public enum Expanded {
        public enum Keys { 
          public static let value = "rain.expanded.value"
        }
        /// millimeters
        public static var value: String { Localization.tr("Localizable", Keys.value) }
      }
    }
    public enum Search {
      public enum Keys { 
        public static let myCities = "search.my_cities"
        public static let title = "search.title"
      }
      /// My locations
      public static var myCities: String { Localization.tr("Localizable", Keys.myCities) }
      /// Search
      public static var title: String { Localization.tr("Localizable", Keys.title) }
      public enum Bar {
        public enum Keys { 
          public static let placeholder = "search.bar.placeholder"
        }
        /// Type location name
        public static var placeholder: String { Localization.tr("Localizable", Keys.placeholder) }
      }
    }
    public enum Settings {
      public enum Keys { 
        public static let title = "settings.title"
      }
      /// Settings
      public static var title: String { Localization.tr("Localizable", Keys.title) }
      public enum Connect {
        public enum Keys { 
        }
        public enum Section {
          public enum Keys { 
            public static let title = "settings.connect.section.title"
          }
          /// Connect
          public static var title: String { Localization.tr("Localizable", Keys.title) }
        }
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
      public enum EveningReport {
        public enum Keys { 
          public static let title = "settings.evening_report.title"
        }
        /// Evening forecast
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
      public enum MorningReport {
        public enum Keys { 
          public static let title = "settings.morning_report.title"
        }
        /// Morning report
        public static var title: String { Localization.tr("Localizable", Keys.title) }
      }
      public enum NotificationCenter {
        public enum Keys { 
        }
        public enum Section {
          public enum Keys { 
            public static let title = "settings.notification_center.section.title"
          }
          /// Notification Center
          public static var title: String { Localization.tr("Localizable", Keys.title) }
        }
      }
      public enum Notifications {
        public enum Keys { 
          public static let title = "settings.notifications.title"
        }
        /// Receive daily notifications
        public static var title: String { Localization.tr("Localizable", Keys.title) }
      }
      public enum Pressure {
        public enum Keys { 
          public static let title = "settings.pressure.title"
        }
        /// Pressure
        public static var title: String { Localization.tr("Localizable", Keys.title) }
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
      public enum Rate {
        public enum Keys { 
          public static let subtitle = "settings.rate.subtitle"
        }
        /// Help more users enjoy the weather
        public static var subtitle: String { Localization.tr("Localizable", Keys.subtitle) }
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
      public enum Temperature {
        public enum Keys { 
          public static let title = "settings.temperature.title"
        }
        /// Temperature
        public static var title: String { Localization.tr("Localizable", Keys.title) }
      }
      public enum Weather {
        public enum Keys { 
        }
        public enum Section {
          public enum Keys { 
            public static let title = "settings.weather.section.title"
          }
          /// Weather
          public static var title: String { Localization.tr("Localizable", Keys.title) }
        }
      }
      public enum Wind {
        public enum Keys { 
          public static let title = "settings.wind.title"
        }
        /// Wind
        public static var title: String { Localization.tr("Localizable", Keys.title) }
      }
    }
    public enum Siri {
      public enum Keys { 
      }
      public enum Donate {
        public enum Keys { 
          public static let prase = "siri.donate.prase"
        }
        /// Weather forecast 
        public static var prase: String { Localization.tr("Localizable", Keys.prase) }
      }
      public enum Intent {
        public enum Keys { 
          public static let noCity = "siri.intent.no_city"
          public static let noData = "siri.intent.no_data"
        }
        /// Please, add any city in the app to see forecast
        public static var noCity: String { Localization.tr("Localizable", Keys.noCity) }
        /// Problems with data loading, try again later
        public static var noData: String { Localization.tr("Localizable", Keys.noData) }
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
    public enum Temperature {
      public enum Keys { 
        public static let celsius = "temperature.celsius"
        public static let fahrenheit = "temperature.fahrenheit"
      }
      /// °c
      public static var celsius: String { Localization.tr("Localizable", Keys.celsius) }
      /// °f
      public static var fahrenheit: String { Localization.tr("Localizable", Keys.fahrenheit) }
      public enum Celsius {
        public enum Keys { 
          public static let expanded = "temperature.celsius.expanded"
        }
        /// celsius
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
      public enum Fahrenheit {
        public enum Keys { 
          public static let expanded = "temperature.fahrenheit.expanded"
        }
        /// fahrenheit
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
    }
    public enum Visibility {
      public enum Keys { 
        public static let value = "visibility.value"
      }
      /// km
      public static var value: String { Localization.tr("Localizable", Keys.value) }
    }
    public enum Widget {
      public enum Keys { 
      }
      public enum LoadingData {
        public enum Keys { 
          public static let error = "widget.loading_data.error"
        }
        /// Problems with data loading, try again later
        public static var error: String { Localization.tr("Localizable", Keys.error) }
      }
      public enum Modern {
        public enum Keys { 
        }
        public enum Medium {
          public enum Keys { 
            public static let subtitle = "widget.modern.medium.subtitle"
            public static let title = "widget.modern.medium.title"
          }
          /// Current weather conditions for the selected location along with the forecast for the coming hours 
          public static var subtitle: String { Localization.tr("Localizable", Keys.subtitle) }
          /// Short Term Forecast 
          public static var title: String { Localization.tr("Localizable", Keys.title) }
        }
        public enum MediumMidTerm {
          public enum Keys { 
            public static let subtitle = "widget.modern.medium_mid_term.subtitle"
            public static let title = "widget.modern.medium_mid_term.title"
          }
          /// Current weather conditions for the selected location along with the forecast for the coming days
          public static var subtitle: String { Localization.tr("Localizable", Keys.subtitle) }
          /// Next Days Outlook
          public static var title: String { Localization.tr("Localizable", Keys.title) }
        }
        public enum Small {
          public enum Keys { 
            public static let subtitle = "widget.modern.small.subtitle"
            public static let title = "widget.modern.small.title"
          }
          /// Current weather conditions for the selected location right on your Home Screen or in Notification Center
          public static var subtitle: String { Localization.tr("Localizable", Keys.subtitle) }
          /// Current Conditions
          public static var title: String { Localization.tr("Localizable", Keys.title) }
        }
        public enum Square {
          public enum Keys { 
            public static let subtitle = "widget.modern.square.subtitle"
            public static let title = "widget.modern.square.title"
          }
          /// Short and long term forecast on the same widget
          public static var subtitle: String { Localization.tr("Localizable", Keys.subtitle) }
          /// All At Once
          public static var title: String { Localization.tr("Localizable", Keys.title) }
        }
      }
      public enum NoLocation {
        public enum Keys { 
          public static let title = "widget.no_location.title"
        }
        /// Please enable location permission in settings or add any city in the app
        public static var title: String { Localization.tr("Localizable", Keys.title) }
      }
    }
    public enum WidgetConfiguration {
      public enum Keys { 
        public static let locationPlaceholder = "widget_configuration.location_placeholder"
      }
      /// Add
      public static var locationPlaceholder: String { Localization.tr("Localizable", Keys.locationPlaceholder) }
    }
    public enum Wind {
      public enum Keys { 
        public static let e = "wind.e"
        public static let ene = "wind.ene"
        public static let ese = "wind.ese"
        public static let n = "wind.n"
        public static let ne = "wind.ne"
        public static let nne = "wind.nne"
        public static let nnw = "wind.nnw"
        public static let nw = "wind.nw"
        public static let s = "wind.s"
        public static let se = "wind.se"
        public static let sse = "wind.sse"
        public static let ssw = "wind.ssw"
        public static let sw = "wind.sw"
        public static let w = "wind.w"
        public static let wnw = "wind.wnw"
        public static let wsw = "wind.wsw"
      }
      /// E
      public static var e: String { Localization.tr("Localizable", Keys.e) }
      /// ENE
      public static var ene: String { Localization.tr("Localizable", Keys.ene) }
      /// ESE
      public static var ese: String { Localization.tr("Localizable", Keys.ese) }
      /// N
      public static var n: String { Localization.tr("Localizable", Keys.n) }
      /// NE
      public static var ne: String { Localization.tr("Localizable", Keys.ne) }
      /// NNE
      public static var nne: String { Localization.tr("Localizable", Keys.nne) }
      /// NNW
      public static var nnw: String { Localization.tr("Localizable", Keys.nnw) }
      /// NW
      public static var nw: String { Localization.tr("Localizable", Keys.nw) }
      /// S
      public static var s: String { Localization.tr("Localizable", Keys.s) }
      /// SE
      public static var se: String { Localization.tr("Localizable", Keys.se) }
      /// SSE
      public static var sse: String { Localization.tr("Localizable", Keys.sse) }
      /// SSW
      public static var ssw: String { Localization.tr("Localizable", Keys.ssw) }
      /// SW
      public static var sw: String { Localization.tr("Localizable", Keys.sw) }
      /// W
      public static var w: String { Localization.tr("Localizable", Keys.w) }
      /// WNW
      public static var wnw: String { Localization.tr("Localizable", Keys.wnw) }
      /// WSW
      public static var wsw: String { Localization.tr("Localizable", Keys.wsw) }
      public enum E {
        public enum Keys { 
          public static let expanded = "wind.e.expanded"
        }
        /// East
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
      public enum Ene {
        public enum Keys { 
          public static let expanded = "wind.ene.expanded"
        }
        /// East North East
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
      public enum Ese {
        public enum Keys { 
          public static let expanded = "wind.ese.expanded"
        }
        /// East South East
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
      public enum N {
        public enum Keys { 
          public static let expanded = "wind.n.expanded"
        }
        /// North
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
      public enum Ne {
        public enum Keys { 
          public static let expanded = "wind.ne.expanded"
        }
        /// North East
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
      public enum Nne {
        public enum Keys { 
          public static let expanded = "wind.nne.expanded"
        }
        /// North North East
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
      public enum Nnw {
        public enum Keys { 
          public static let expanded = "wind.nnw.expanded"
        }
        /// North North West
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
      public enum Nw {
        public enum Keys { 
          public static let expanded = "wind.nw.expanded"
        }
        /// North West
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
      public enum S {
        public enum Keys { 
          public static let expanded = "wind.s.expanded"
        }
        /// South
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
      public enum Se {
        public enum Keys { 
          public static let expanded = "wind.se.expanded"
        }
        /// South East
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
      public enum Speed {
        public enum Keys { 
          public static let kmph = "wind.speed.kmph"
          public static let knots = "wind.speed.knots"
          public static let mph = "wind.speed.mph"
          public static let mps = "wind.speed.mps"
        }
        /// km/h
        public static var kmph: String { Localization.tr("Localizable", Keys.kmph) }
        /// knots
        public static var knots: String { Localization.tr("Localizable", Keys.knots) }
        /// mph
        public static var mph: String { Localization.tr("Localizable", Keys.mph) }
        /// m/s
        public static var mps: String { Localization.tr("Localizable", Keys.mps) }
        public enum Kmph {
          public enum Keys { 
            public static let expanded = "wind.speed.kmph.expanded"
          }
          /// kilometers per hour
          public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
        }
        public enum Knots {
          public enum Keys { 
            public static let expanded = "wind.speed.knots.expanded"
          }
          /// knots
          public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
        }
        public enum Mph {
          public enum Keys { 
            public static let expanded = "wind.speed.mph.expanded"
          }
          /// miles per hour
          public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
        }
        public enum Mps {
          public enum Keys { 
            public static let expanded = "wind.speed.mps.expanded"
          }
          /// meters per second
          public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
        }
      }
      public enum Sse {
        public enum Keys { 
          public static let expanded = "wind.sse.expanded"
        }
        /// South South East
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
      public enum Ssw {
        public enum Keys { 
          public static let expanded = "wind.ssw.expanded"
        }
        /// South South West
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
      public enum Sw {
        public enum Keys { 
          public static let expanded = "wind.sw.expanded"
        }
        /// South West
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
      public enum W {
        public enum Keys { 
          public static let expanded = "wind.w.expanded"
        }
        /// West
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
      public enum Wnw {
        public enum Keys { 
          public static let expanded = "wind.wnw.expanded"
        }
        /// West North West
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
      public enum Wsw {
        public enum Keys { 
          public static let expanded = "wind.wsw.expanded"
        }
        /// West South West
        public static var expanded: String { Localization.tr("Localizable", Keys.expanded) }
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name
