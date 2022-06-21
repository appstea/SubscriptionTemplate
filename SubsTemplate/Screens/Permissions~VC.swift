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

public enum Permissions {}

extension Stored {

  @StorageKey("didPassPrepermission", defaultValue: false)
  fileprivate(set) static var didPassPrepermission: Bool

}

public extension Permissions {

  final class ViewController: UIBase.ViewController {

    private enum Const {
      static let buttonSize = CGSize(width: isPad ? 400.ui : 285.ui, height: isPad ? 70 : 50)
      static let dotSize: CGFloat = (isPad ? 18 : 13).ui
      static let dotSpacing = 10.ui
      static var contentWidth: CGFloat { (isPad && isLandscape) ? 0.6 : 0.8 }
    }

    private var passContinuation: Continuation<Void>?

    override public var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

    // MARK: UI

    private let bgView = UICommon.GradientView {
      $0.direction = .down
      $0.colors = [CGFloat(0), CGFloat(0)]
        .map { Color.Onboarding.background.color.withAlphaComponent($0) }
    }

    private let stackView = VStackView {
      $0.backgroundColor = .clear
    }

    private lazy var imageView = UIBase.ImageView {
      $0.contentMode = .scaleAspectFit
      $0.image = Asset.Permissions.image.image
    }
    private let titleLabel = UIBase.Label {
      $0.text = L10n.Start.title
      $0.setDynamicFont(font: .systemFont(ofSize: isPad ? 30 : 20, weight: .medium),
                        maximumPointSize: isPad ? 60 : 40)
      $0.textColor = Color.Main.text.color
      $0.textAlignment = isRTL ? .right : .center
      $0.numberOfLines = 0
      $0.adjustsFontSizeToFitWidth = true
      $0.minimumScaleFactor = 0.8
    }
    private let subtitleLabel = UIBase.Label {
      $0.text = L10n.Start.subtitle
      $0.setDynamicFont(font: .systemFont(ofSize: isPad ? 24 : 16),
                        maximumPointSize: isPad ? 48 : 32)
      $0.textColor = Color.Main.text.color
      $0.textAlignment = isRTL ? .right : .center
      $0.numberOfLines = 0
      $0.adjustsFontSizeToFitWidth = true
      $0.minimumScaleFactor = 0.8
    }
    private static func dotLabelInstance() -> UICommon.DotLabel {
      UICommon.DotLabel {
        $0.dotColor = Color.DotLabel.dot.color
        $0.dotSize = Const.dotSize
        $0.dotPadding = Const.dotSpacing
      }
    }
    private let dotLabel_0 = dotLabelInstance()
    private let dotLabel_1 = dotLabelInstance()

    private let continueButton = UIBase.Button {
      $0.layer.cornerRadius = 12
      $0.backgroundColor = Color.Onboarding.continue.color
      $0.setTitleColor(.white, for: .normal)
      $0.setTitle(L10n.Start.Button.continue, for: .normal)
      $0.titleLabel?.font = .systemFont(ofSize: isPad ? 30 : 20, weight: .medium)
    }.asAccessibilityElement()

    // MARK: - Lifecycle

    public override func loadView() {
      super.loadView()
      view.backgroundColor = Color.Main.back.color
      view.addSubviews(bgView, stackView)
    }

    public override func viewDidLoad() {
      super.viewDidLoad()
      updateTexts()
      view.setNeedsLayout()
      continueButton.addAction { [weak self] _ in self?.onContinue() }
      //        reload(for: onboarding)
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
      super.traitCollectionDidChange(previousTraitCollection)
      updateTexts()
      view.setNeedsLayout()
    }

    public override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()

      let safeArea = view.pin.safeArea
      let contentWidth = view.bounds.width * Const.contentWidth

      if isPad && isPortrait {
        bgView.pin.top().horizontally().height(35%)
      }
      else {
        bgView.pin.top().horizontally().height(280.ui + safeArea.top)
      }
      stackView.pin.hCenter().width(contentWidth).vertically(safeArea)

      stackView.reload {
        (isPad && isPortrait) ? 190.fixed : 95.fixed
        imageView.vComponent
          .size((isPad && isPortrait)
//                ? CGSize(width: 441.ui, height: 301.ui)
                ? CGSize(width: 525.ui, height: 263.ui)
//                : CGSize(width: 315.ui, height: 215.ui))
                : CGSize(width: 375.ui, height: 188.ui))
          .alignment(.center)
        isPad ? 110.fixed : 83.fixed
        titleLabel.vComponent.maxHeight(40.ui)
        20.fixed//floating
        subtitleLabel.vComponent.maxHeight(30.ui)
        16.fixed//floating
//        dotLabel_0.vComponent.maxHeight(120.ui)
//        10.floating
        dotLabel_1.vComponent.maxHeight(120.ui)
        20.floating
        continueButton.vComponent
          .size(Const.buttonSize)
          .alignment(.center)
        60.fixed
      }
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

private extension Permissions.ViewController {

  func updateTexts() {
    zip([L10n.Start.Feature.first, L10n.Start.Feature.second], [dotLabel_0, dotLabel_1])
      .forEach { text, label in
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
    //        component.location.requestAccess(force: true) { [weak self] in
    //            let block = {
    //                DispatchQueue.main.async { [weak self] in
    //                    self?.finishBlock?()
    //                }
    //            }
    //            self?.component.services.notifications?.fetchStatus { _ in block() } ?? block()
    //        }
  }

}
