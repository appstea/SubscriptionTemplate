//
//  Subs~TwoButtonsVC.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/9/22.
//

import UIKit

import RevenueCat

import PinLayout
import SwiftyAttributes
import StackCraft

extension Subs {

  final class InitialVC: ViewController {

    private enum Const {
      static let contentWidth = isPad ? 480.ui : 285.ui

      static let imageWidth = contentWidth + 50.ui
      static let additionalButtonsHeight = CGFloat(50)
      static let ctaButtonSize = CGSize(width: isPad ? 400 : 285.ui, height: isPad ? 70 : 50)

      static let additionalButtonsAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: isPad ? 16 : 13),
        .foregroundColor: Color.Subs.dopButton.color,
        .underlineStyle: NSNumber(value: NSUnderlineStyle.single.rawValue),
      ]
    }

    private var trialProduct: StoreProduct?
    private var instantProduct: StoreProduct?

    // MARK: UI

    private let contentView = Base.View {
      $0.backgroundColor = .clear
    }

    private lazy var closeButton = Base.Button {
      $0.setImage( Asset.Subs.cross.image, for: .normal)
    }.asAccessibilityElement(L10n.General.Button.close, traits: .button)

    private let vStackView = VStackView()

    private lazy var bgView = Common.GradientView {
      $0.direction = .down
      $0.colors = [
        Color.Subs.background.color,
        Color.Subs.background.color.withAlphaComponent(0),
      ]
    }

    private lazy var imageView = Base.ImageView {
      $0.image = Asset.Subs.image.image
      $0.contentMode = .scaleAspectFit
    }

    private lazy var portraitImage = imageView
      .vComponent
      .skipLayout()
      .height(.fixed(((isPad ? 768.ui : 375.ui) / imageView.image!.size.aspectRatio) * 0.8))

    private lazy var landscapeImage = imageView
      .vComponent
      .skipLayout()
      .height(.fixed((vStackView.bounds.width / imageView.image!.size.aspectRatio) * 0.8))

    private var image: VStackView.Component { isPortrait ? portraitImage : landscapeImage }

    private let titleLabel = Base.Label {
      $0.textColor = Color.Subs.title.color
      $0.setDynamicFont(font: .systemFont(ofSize: 40.ui, weight: .bold))
      $0.numberOfLines = 1
      $0.adjustsFontSizeToFitWidth = true
      $0.minimumScaleFactor = 0.7
      $0.textAlignment = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .right : .left
      $0.text = L10n.Subs.TwoButtons.title
    }
    private let subtitleLabel = Base.Label {
      $0.textColor = Color.Subs.infoTitle.color
      $0.setDynamicFont(font: .systemFont(ofSize: 17.ui, weight: .semibold))
      $0.numberOfLines = 1
      $0.textAlignment = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .right : .left
      $0.text = L10n.Subs.TwoButtons.subtitle
    }
    private let textLabel = Base.Label {
      $0.textColor = Color.Main.text.color
      $0.setDynamicFont(font: .systemFont(ofSize: 17.ui, weight: .regular))
      $0.numberOfLines = 0
      $0.textAlignment = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .right : .left
      $0.verticalAlignment = .top
    }

    private let trialButton = Base.Button {
      $0.setTitle(L10n.Subs.tryFreeAndSubscribe, for: .normal)
      $0.titleLabel?.adjustsFontSizeToFitWidth = true
      $0.titleLabel?.minimumScaleFactor = 0.75
      $0.titleLabel?.numberOfLines = 2
      $0.titleLabel?.textAlignment = .center
      $0.contentLayout = .alignByEdges(spacing: 10.ui,
                                       padding: UIEdgeInsets(top: 0, left: 10.ui, bottom: 0, right: 10.ui))
      $0.titleLabel?.setDynamicFont(font: .systemFont(ofSize: isPad ? 22 : 17, weight: .bold),
                                    maximumPointSize: isPad ? 26 : 20)
      $0.layer.cornerRadius = 13
      $0.setBackgroundImage(Color.Subs.continue.color.image(), for: .normal)
      $0.clipsToBounds = true
    }.asAccessibilityElement(traits: .button)

    private let instantButton = Base.Button {
      $0.titleLabel?.numberOfLines = 2
      $0.setBackgroundImage(Color.Main.back.color.image(), for: .normal)
      $0.layer.borderWidth = 1
      $0.layer.borderColor = Color.Subs.continue.color.cgColor
      $0.layer.cornerRadius = 13
      $0.clipsToBounds = true
    }.asAccessibilityElement(traits: .button)

    private let additionalButtonsContainer = UIView()
    private let termsButton = Base.Button {
      let text = L10n.Subs.Button.terms
      let attributed = NSAttributedString(string: text, attributes: Const.additionalButtonsAttributes)
      $0.setAttributedTitle(attributed, for: .normal)
      $0.explicitIntrinsicContentSize = CGSize(width: text.size().width, height: UIView.noIntrinsicMetric)
    }.asAccessibilityElement(traits: .link)
    private let privacyButton = Base.Button {
      let text = L10n.Subs.Button.privacy
      let attributed = NSAttributedString(string: text, attributes: Const.additionalButtonsAttributes)
      $0.setAttributedTitle(attributed, for: .normal)
      $0.explicitIntrinsicContentSize = CGSize(width: text.size().width, height: UIView.noIntrinsicMetric)
    }.asAccessibilityElement(traits: .link)
    private let restoreButton = Base.Button {
      let text = L10n.Subs.Button.restore
      let attributed = NSAttributedString(string: text, attributes: Const.additionalButtonsAttributes)
      $0.setAttributedTitle(attributed, for: .normal)
      $0.explicitIntrinsicContentSize = CGSize(width: text.size().width, height: UIView.noIntrinsicMetric)
    }.asAccessibilityElement(traits: .button)

    // MARK: - Lifecycle

    override func loadView() {
      super.loadView()
      view.backgroundColor = Color.Main.back.color
      //      if imageType == .house {
      //        view.addSubviews(bgView)
      //      }
      view.addSubviews(contentView, closeButton)

      //      if imageType == .additional {
      //        titleLabel.text = L10n.Subs.AdditionalOffer.title
      //        subtitleLabel.text = L10n.Subs.AdditionalOffer.subtitle
      //      }
      contentView.addSubviews(imageView, vStackView, textLabel, additionalButtonsContainer)
      additionalButtonsContainer.addSubviews(termsButton, privacyButton, restoreButton)
    }

    override func viewDidLoad() {
      super.viewDidLoad()

      trialButton.addAction { [weak self] _ in self?.purchase(self?.trialProduct) }
      instantButton.addAction { [weak self] _ in self?.purchase(self?.instantProduct) }

      closeButton.addAction { [weak self] _ in self?.close() }

      termsButton.addAction { [weak self] _ in self?.showTerms() }
      privacyButton.addAction { [weak self] _ in self?.showPolicy() }
      restoreButton.addAction { [weak self] _ in self?.restorePurchases() }

      updateProducts()
      reloadData()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
      super.traitCollectionDidChange(previousTraitCollection)
      reloadData()
    }

    override func didUpdateSubsStatus() {
      guard updateProducts() else { return }

      reloadData()
    }

    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      let safeArea = view.pin.safeArea
      if isPad && isPortrait {
        bgView.pin.top().horizontally().height(35%)
      }
      else {
        bgView.pin.top().horizontally().height(280.ui + safeArea.top)
      }
      _ = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
      ? closeButton.pin.start(32).size(16).top(safeArea.top + 16)
      : closeButton.pin.end(32).size(16).top(safeArea.top + 16)
      contentView.pin.top(safeArea).bottom(safeArea).hCenter().width(Const.contentWidth)

      additionalButtonsContainer.pin.bottom().start().end().height(Const.additionalButtonsHeight)
      termsButton.pin.start().top().bottom().sizeToFit()
      privacyButton.pin.top().bottom().hCenter().sizeToFit()
      restoreButton.pin.end().top().bottom().sizeToFit()

      vStackView.pin.start().end().top().bottom(to: additionalButtonsContainer.edge.top)
      vStackView.layoutIfNeeded()

      reloadUI()
      textLabel.frame.size.height += vStackView.spacing(after: textLabel.vComponent) * 0.8

      imageView.pin.hCenter()
//        .width(isPortrait && isMap ? view.bounds.width : vStackView.bounds.width)
        .width(vStackView.bounds.width)
        .top(to: vStackView.edge.top).marginTop(vStackView.spacing(before: image))
        .height(vStackView.height(of: image))
    }

  }
}

// MARK: - Private

private extension Subs.InitialVC {

  @discardableResult
  func updateProducts() -> Bool {
    var changed = false

//    let trial = imageType == .additional ? subs?.productsList(for: .additionTrial).first : subs?.productsList(for: .none).first
    let trial = subs?.productsList().first

    changed = changed || trial != trialProduct
    trialProduct = trial

    if let instProduct = subs?.productsList(for: .none).enumerated().first(where: {$0.0 == 1})?.1 {
//      let instant = imageType == .additional ? subs?.productsList(for: .additionInstant).first : instProduct
      let instant = instProduct
      changed = changed || instant != instantProduct
      instantProduct = instant
    }

    return changed
  }

  func reloadData() {
    defer { view.setNeedsLayout() }

    if let product = trialProduct {
      let price = product.localizedPricePerPeriod()
      let trialCount = product.getTrialCount()
      var text: NSMutableAttributedString

      if trialCount == 7 {
        text = L10n.Subs.TwoButtons
          .textFormat7(trialCount, price)
          .withFont(.systemFont(ofSize: 17.ui, weight: .light))
      }
      else {
        text = L10n.Subs.TwoButtons
          .textFormat(trialCount, price)
          .withFont(.systemFont(ofSize: 17.ui, weight: .light))
      }

//      let additionalText = L10n.Subs.AdditionalOffer
//        .textFormat(price)
//        .withFont(.systemFont(ofSize: 17.ui, weight: .light))

      let priceRange = (text.string as NSString).range(of: price)
//      let additionalPriceRange = (additionalText.string as NSString).range(of: price)

      if priceRange.location != NSNotFound && priceRange.length > 0 {
//        additionalText.addAttributes([.font(.systemFont(ofSize: 17.ui, weight: .bold))], range: additionalPriceRange)
        text.addAttributes([.font(.systemFont(ofSize: 17.ui, weight: .bold))], range: priceRange)
      }
//      textLabel.attributedText = (imageType == .additional ? additionalText : text)
      textLabel.attributedText = text // (imageType == .additional ? additionalText : text)
    }
    else {
      textLabel.text = L10n.Subs.TwoButtons.text
    }

    if let product = instantProduct {
      let text =
      (((product.localizedPricePerPeriod() + "\n")
        .withFont(.systemFont(ofSize: isPad ? 24 : 18, weight: .semibold))
        .withTextColor(Color.Subs.continue.color))
       +
       (L10n.Subs.TwoButtons.infoJust(product.localizedMonthlyPriceSlashMonth())
        .withFont(.systemFont(ofSize: isPad ? 16 : 12, weight: .regular))
        .withTextColor(Color.Subs.title.color)
       ))
      .withParagraphStyle(NSMutableParagraphStyle { $0.alignment = .center })
      instantButton.setAttributedTitle(text, for: .normal)
    }
    else {
      instantButton.setTitle(nil, for: .normal)
    }
  }

  func reloadUI() {
    vStackView.reload {
//      if isPad && isMap && isPortrait {
//        44.fixed
//      }
//      else {
        6.floating
//      }
      image
      24.floating
      titleLabel.vComponent
      8.floating
      subtitleLabel.vComponent
      20.floating
      textLabel.vComponent
      40.floating
      trialButton.vComponent
        .height(.fixed(Const.ctaButtonSize.height))
        .width(.fixed(Const.ctaButtonSize.width))
        .alignment(.center)
      16.floating
      instantButton.vComponent
        .height(.fixed(Const.ctaButtonSize.height))
        .width(.fixed(Const.ctaButtonSize.width))
        .alignment(.center)
      40.floating
    }
  }

}
