//
//  Permissions~VC.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/9/22.
//

import UIKit

import SwiftyAttributes
import PinLayout

import StackCraft

import Utils
import Stored
import UIBase
import UICommon
import SubsCraftResources

extension Stored {

  @StorageKey("subscription.didPassPrepermission", defaultValue: false)
  fileprivate(set) static var didPassPrepermission: Bool

}

public extension Config.UI {

  typealias Permissions = SubsCraftCore.Permissions.ViewModel

}


public enum Permissions {}

extension Permissions {

  public struct ViewModel {
    public var bgColors = [
      Color.Onboarding.background.color.withAlphaComponent(0),
      Color.Onboarding.background.color.withAlphaComponent(0),
    ]
    public var image = Asset.Permissions.image.image
    public var imageSize = (isPad && isPortrait)
    ? CGSize(width: 525.ui(.subs), height: 263.ui(.subs))
    : CGSize(width: 375.ui(.subs), height: 188.ui(.subs))

    public var textColor = Color.Main.text.color
    public var dotColor = Color.DotLabel.dot.color
    public var ctaTextColor = UIColor.white
    public var ctaBgColor = Color.Onboarding.continue.color

    public var title = L10n.Start.title
    public var subtitle = L10n.Start.subtitle
    public var features = [
      L10n.Start.Feature.first,
      L10n.Start.Feature.second,
    ]
    public var cta = L10n.Start.Button.continue

    public init() {}

    fileprivate func apply(to view: ViewController) {
      view.bgView.colors = bgColors
      view.imageView.image = image

      view.titleLabel.text = title
      view.titleLabel.textColor = textColor

      view.subtitleLabel.text = subtitle
      view.subtitleLabel.textColor = textColor

      zip(features, [view.dotLabel_0, view.dotLabel_1])
        .forEach { text, label in
          label.dotColor = dotColor
          label.text = text
            .withFont(DynamicFont.regular(of: isPad ? 24 : 16)
              .maxSize(to: isPad ? 40 : 28)
              .asFont())
            .withTextColor(Color.Main.text.color)
            .withParagraphStyle(NSMutableParagraphStyle {
              $0.lineSpacing = 5
              $0.alignment = isRTL ? .right : .left
            })
        }

      view.ctaButton.setTitle(cta, for: .normal)
      view.ctaButton.setTitleColor(ctaTextColor, for: .normal)
      view.ctaButton.backgroundColor = ctaBgColor

      view.reloadUI()
    }
  }

  final class ViewController: UIBase.ViewController {

    private enum Const {
      static let buttonSize = CGSize(width: isPad ? 400.ui(.subs) : 285.ui(.subs), height: isPad ? 70 : 50)
      static let dotSize: CGFloat = (isPad ? 18 : 13).ui(.subs)
      static let dotSpacing = 10.ui(.subs)
      static var contentWidth: CGFloat { (isPad && isLandscape) ? 0.6 : 0.8 }
    }

    var viewModel = ViewModel() {
      didSet { viewModel.apply(to: self) }
    }

    private var passContinuation: CheckedContinuation<Void, Never>?

    override public var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

    // MARK: UI

    fileprivate let bgView = UICommon.GradientView {
      $0.direction = .down
    }

    fileprivate let stackView = VStackView {
      $0.backgroundColor = .clear
    }

    fileprivate let imageView = UIBase.ImageView {
      $0.contentMode = .scaleAspectFit
    }
    fileprivate let titleLabel = UIBase.Label {
      $0.setDynamicFont(font: .systemFont(ofSize: isPad ? 30 : 20, weight: .medium),
                        maximumPointSize: isPad ? 60 : 40)
      $0.textAlignment = isRTL ? .right : .center
      $0.numberOfLines = 0
      $0.adjustsFontSizeToFitWidth = true
      $0.minimumScaleFactor = 0.8
    }
    fileprivate let subtitleLabel = UIBase.Label {
      $0.setDynamicFont(font: .systemFont(ofSize: isPad ? 24 : 16),
                        maximumPointSize: isPad ? 48 : 32)
      $0.textAlignment = isRTL ? .right : .center
      $0.numberOfLines = 0
      $0.adjustsFontSizeToFitWidth = true
      $0.minimumScaleFactor = 0.8
    }
    private static func dotLabelInstance() -> UICommon.DotLabel {
      UICommon.DotLabel {
        $0.dotSize = Const.dotSize
        $0.dotPadding = Const.dotSpacing
      }
    }
    fileprivate let dotLabel_0 = dotLabelInstance()
    fileprivate let dotLabel_1 = dotLabelInstance()

    fileprivate let ctaButton = UIBase.Button {
      $0.layer.cornerRadius = 12
      $0.titleLabel?.font = .systemFont(ofSize: isPad ? 30 : 20, weight: .medium)
    }.asAccessibilityElement()

    // MARK: - Lifecycle

    override func loadView() {
      super.loadView()
      view.backgroundColor = Color.Main.back.color
      view.addSubviews(bgView, stackView)
    }

    override func viewDidLoad() {
      super.viewDidLoad()
      viewModel.apply(to: self)
      view.setNeedsLayout()
      ctaButton.addAction { [weak self] _ in self?.onContinue() }
      //        reload(for: onboarding)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
      super.traitCollectionDidChange(previousTraitCollection)
      viewModel.apply(to: self)
      view.setNeedsLayout()
    }

    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()

      let safeArea = view.pin.safeArea
      let contentWidth = view.bounds.width * Const.contentWidth

      if isPad && isPortrait {
        bgView.pin.top().horizontally().height(35%)
      }
      else {
        bgView.pin.top().horizontally().height(280.ui(.subs) + safeArea.top)
      }
      stackView.pin.hCenter().width(contentWidth).vertically(safeArea)

      reloadUI()
    }

    // MARK: - Public

    func result() async {
      await withCheckedContinuation { [weak self] c in
        self?.passContinuation = c
      }
    }

    //    func reload(for onboarding: Onboarding) {
    ////        self.onboarding = onboarding
    //        UIView.transition(with: imageView, duration: 0.25, options: .transitionCrossDissolve) { [unowned self] in
    //            imageView.image = onboarding.image
    //        } completion: { _ in }
    //        view.setNeedsLayout()
    //    }


  }
}

// MARK: - Private

fileprivate extension Permissions.ViewController {

  func reloadUI() {
    stackView.reload {
      (isPad && isPortrait) ? 190.fixed : 95.fixed
      imageView.vComponent
        .size(viewModel.imageSize)
        .alignment(.center)
      isPad ? 110.fixed : 83.fixed
      titleLabel.vComponent.maxHeight(40.ui(.subs))
      isPad ? 20.floating : 20.fixed
      subtitleLabel.vComponent.maxHeight(30.ui(.subs))
      isPad ? 16.floating : 16.fixed
//        dotLabel_0.vComponent.maxHeight(120.ui(.subs))
//        10.floating
      if isPad {
        dotLabel_1.vComponent.maxHeight(120.ui(.subs))
          .width(.fixed(Const.buttonSize.width))
          .alignment(.center)
      }
      else {
        dotLabel_1.vComponent.maxHeight(120.ui(.subs))
      }
      isPad ? 160.floating : 20.floating
      ctaButton.vComponent
        .size(Const.buttonSize)
        .alignment(.center)
      60.fixed
    }
  }

}

// MARK: - Actions

private extension Permissions.ViewController {

  func onContinue() {
    Task {
      await requestPermissions()
      Stored.didPassPrepermission = true
      passContinuation?.resume(returning: Void())
      passContinuation = nil
    }
  }

  func requestPermissions() async {
    _ = await NotificationsService.shared?.fetchStatus()
  }

}
