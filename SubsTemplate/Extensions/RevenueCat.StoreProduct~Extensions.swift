//
//  RevenueCat.StoreProduct~Extensions.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/16/22.
//

import Foundation

import StoreKit
import RevenueCat

extension StoreProduct {

  /// $4.99
  func localizedPrice() -> String { sk1Product?.localizedPrice() ?? "" }

  /// $3.33 for $9.99 per quartal
  func localizedUnitPrice() -> String { sk1Product?.localizedUnitPrice() ?? "" }

  /// $4.99 per month
  func localizedPricePerPeriod() -> String { sk1Product?.localizedPricePerPeriod() ?? "" }

  /// $3.33 per month for 9.99$ per quartal
  func localizedPricePerUnit() -> String { sk1Product?.localizedPricePerUnit() ?? "" }

  /// $4.99/month
  func localizedPriceSlashPeriod() -> String { sk1Product?.localizedPriceSlashPeriod() ?? "" }

  /// $3.33/month for 9.99$ per quartal
  func localizedPriceSlashPeriodUnit() -> String { sk1Product?.localizedPriceSlashPeriodUnit() ?? "" }

  func localizedPeriodUnit() -> String { sk1Product?.localizedPeriodUnit() ?? "" }

  func localizedPeriod() -> String { sk1Product?.localizedPeriod() ?? "" }

  func getTrialCount() -> Int { sk1Product?.getTrialCount() ?? 0 }

}

// MARK: - Private.SKProduct

fileprivate extension SKProduct {

  private static let numberFormatter = NumberFormatter {
    $0.numberStyle = .currency
    $0.formatterBehavior = .behavior10_4
  }
  private var numberFormatter: NumberFormatter {
    let result = Self.numberFormatter
    result.locale = priceLocale
    return result
  }

  /// $4.99
  func localizedPrice() -> String {
    numberFormatter.string(from: price) ?? ""
  }

  /// $3.33 for $9.99 per quartal
  func localizedUnitPrice() -> String {
    let unitPrice = price.dividing(by: .init(integerLiteral: subscriptionPeriod?.numberOfUnits ?? 1))
    return numberFormatter.string(from: unitPrice) ?? ""
  }

  /// $4.99 per month
  func localizedPricePerPeriod() -> String {
    L10n.Subs.pricePerPeriod(localizedPrice(), localizedPeriod())
  }

  /// $3.33 per month for 9.99$ per quartal
  func localizedPricePerUnit() -> String {
    L10n.Subs.pricePerPeriod(localizedUnitPrice(), localizedPeriodUnit())
  }

  /// $4.99/month
  func localizedPriceSlashPeriod() -> String {
    L10n.Subs.priceSlashPeriod(localizedPrice(), localizedPeriod())
  }

  /// $3.33/month for 9.99$ per quartal
  func localizedPriceSlashPeriodUnit() -> String {
    L10n.Subs.priceSlashPeriod(localizedUnitPrice(), localizedPeriodUnit())
  }

  func localizedPeriodUnit() -> String {
    subscriptionPeriod?.map {
      typealias L10n = SubsTemplate.L10n.Subs.Period
      switch $0.unit {
      case .day: return L10n.day
      case .week: return L10n.week
      case .month: return L10n.month
      case .year: return L10n.year
      @unknown default: return ""
      }
    } ?? ""
  }

  func localizedPeriod() -> String {
    subscriptionPeriod?.map {
      typealias L10n = SubsTemplate.L10n.Subs.Period
      switch $0.unit {
      case .day:
        if $0.numberOfUnits == 7 {
          return L10n.week
        }
        return L10n.day
      case .week: return L10n.week
      case .month:
        if $0.numberOfUnits == 3 {
          return L10n.quartal
        }
        return L10n.month
      case .year: return L10n.year
      @unknown default: return ""
      }
    } ?? ""
  }

  func getTrialCount() -> Int {
    if introductoryPrice?.subscriptionPeriod.numberOfUnits == 1 {
      return 7
    }
    else {
      return introductoryPrice?.subscriptionPeriod.numberOfUnits ?? 0
    }
  }

}
