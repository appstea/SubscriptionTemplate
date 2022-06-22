//
//  Subs~VC.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/9/22.
//

import UIKit

import StoreKit
import SafariServices

import RevenueCat

import UIBase
import SubsResources

extension Subs {

  @objc(SubsViewController)
  class ViewController: UIBase.ViewController {

    let source: Source
    let intent: Intent

    private var onClose: ((UIViewController) -> Void)?
    private var continuation: CheckedContinuation<Void, Never>?

    // MARK: - Readonly

    var analytics: Analytics.Service? { .shared }
    var subs: Subs.Service? { .shared }

    // MARK: - Init

    init(source: Source, intent: Intent, onClose: ((UIViewController) -> Void)? = nil) {
      self.source = source
      self.intent = intent
      self.onClose = onClose
      super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
      super.viewDidLoad()
      Notification.Subs.Update
        .observe { [weak self] in self?.didUpdateSubsStatus() }
        .bind(to: self)
      analytics?.sendSubsEvent(.upsellShown(intent: intent, source: source))
    }

    func didUpdateSubsStatus() { }

    // MARK: - Public

    @MainActor
    func result() async {
      await withCheckedContinuation { c in
        continuation = c
      }
    }

    func close() {
      onClose?(self)
      continuation?.resume(returning: ())
      continuation = nil
    }

    func purchase(_ product: StoreProduct?) {
      if let product = product {
        analytics?.sendSubsEvent(
          .productSelected(intent: intent, source: source, productId: product.productIdentifier))

        subs?.purchase(product, intent: intent, source: source) { [weak self] success in
          if success {
            self?.close()
          }
          else {
            self?.checkInternetError()
          }
        }
      }
      else {
        checkInternetError()
      }
    }

    func showTerms() {
      guard let url = NSURL(string: Subs.termsString) else { return }

      let safariVC = SFSafariViewController(url: url as URL)
      safariVC.delegate = self
      present(safariVC, animated: true)
    }

    func showPolicy() {
      guard let url = NSURL(string: Subs.policyString) else { return }

      let safariVC = SFSafariViewController(url: url as URL)
      safariVC.delegate = self
      present(safariVC, animated: true)
    }

    func restorePurchases() {
      subs?.restore { [weak self] success in
        switch success {
        case .success:
          self?.close()
        case .error:
          self?.checkInternetError()
        case .noProducts:
          UIService.shared?.showAlert(title: "", message: L10n.Settings.RestoreFail.subtitle)
        }
      }
    }

  }
}

// MARK: - SFSafariViewControllerDelegate

extension Subs.ViewController: SFSafariViewControllerDelegate {

  func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
    controller.dismiss(animated: true)
  }

}

// MARK: - Private

private extension Subs.ViewController {

  func checkInternetError() {
    if UIService.shared?.checkInternetConnection() == true {
      UIService.shared?.showAlert(title: "", message: L10n.Settings.RestoreFail.subtitle)
    }
    else {
      UIService.shared?.showAlert(title: L10n.NoInternet.title, message: L10n.NoInternet.subtitle)
    }
  }

}
