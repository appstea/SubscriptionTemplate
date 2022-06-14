//
//  Permissions~VC.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/9/22.
//

import UIKit

public enum Permissions {}

extension UserStore {

  @Stored("didPassPrepermission", defaultValue: false)
  static var didPassPrepermission: Bool

}

public extension Permissions {

  final class ViewController: Base.ViewController { }

}

//import UIKit
//
//import SwiftyAttributes
//import PinLayout
//import Alidade
//import StackCraft
//
//protocol IOnboardingInput: AnyObject {
//
//    var finishBlock: (() -> Void)? { get set }
//
////    func reload(for onboarding: Onboarding)
//
//}
//
//class OnboardingVC: ScopedViewController<OnboardingComponent>, IOnboardingInput {
//
//    private enum Const {
//        static let buttonSize: CGSize = [isPad ? 400.ui : 285.ui, isPad ? 70 : 50]
//        static let dotSize: CGFloat = (isPad ? 18 : 13).ui
//        static let dotSpacing = 10.ui
//        static var contentWidth: CGFloat { (isPad && isLandscape) ? 0.6 : 0.8 }
//    }
//
//    let onboarding: Onboarding
//
//    var finishBlock: (() -> Void)?
//
//    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
//
//    // MARK: UI
//
//    private let bgView = GradientView {
//        $0.direction = .down
//        $0.colors = [1.cg, 0.cg]
//            .map { Color.Onboarding.background.color.withAlphaComponent($0) }
//    }
//
//    private let stackView = VStackView {
//        $0.backgroundColor = .clear
//    }
//
//    private lazy var imageView = ImageView {
//        $0.contentMode = .scaleAspectFit
//        $0.image = onboarding.image
//    }
//    private let titleLabel = Label {
//        $0.text = L10n.Start.title
//        $0.setDynamicFont(font: .systemFont(ofSize: isPad ? 30 : 20, weight: .medium),
//                          maximumPointSize: isPad ? 60 : 40)
//        $0.textColor = Color.Main.text.color
//        $0.textAlignment = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .right : .center
//        $0.numberOfLines = 0
//        $0.adjustsFontSizeToFitWidth = true
//        $0.minimumScaleFactor = 0.8
//    }
//    private let subtitleLabel = Label {
//        $0.text = L10n.Start.subtitle
//        $0.setDynamicFont(font: .systemFont(ofSize: isPad ? 24 : 16),
//                          maximumPointSize: isPad ? 48 : 32)
//        $0.textColor = Color.Main.text.color
//        $0.textAlignment = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .right : .center
//        $0.numberOfLines = 0
//        $0.adjustsFontSizeToFitWidth = true
//        $0.minimumScaleFactor = 0.8
//    }
//    private static func dotLabelInstance() -> DotLabel {
//        DotLabel {
//            $0.dotColor = Color.DotLabel.dot.color
//            $0.dotSize = Const.dotSize
//            $0.dotPadding = Const.dotSpacing
//        }
//    }
//    private let dotLabel_0 = dotLabelInstance()
//    private let dotLabel_1 = dotLabelInstance()
//
//    private let continueButton = Button {
//        $0.layer.cornerRadius = 12
//        $0.backgroundColor = Color.Onboarding.continue.color
//        $0.setTitleColor(.white, for: .normal)
//        $0.setTitle(L10n.Start.Button.continue, for: .normal)
//        $0.titleLabel?.font = .systemFont(ofSize: isPad ? 30 : 20, weight: .medium)
//    }.asAccessibilityElement()
//
//    // MARK: - Init
//
//    init(component: Component, onboarding: Onboarding) {
//        self.onboarding = onboarding
//        super.init(component)
//    }
//
//    required public init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    required public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        fatalError("init(nibName:bundle:) has not been implemented")
//    }
//
//    // MARK: - Lifecycle
//
//    override func loadView() {
//        super.loadView()
//        view.backgroundColor = Color.Main.back.color
//        view.addSubviews(bgView, stackView)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        updateTexts()
//        view.setNeedsLayout()
//        continueButton.addAction { [weak self] _ in self?.onContinue() }
////        reload(for: onboarding)
//    }
//
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        super.traitCollectionDidChange(previousTraitCollection)
//        updateTexts()
//        view.setNeedsLayout()
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        let safeArea = view.pin.safeArea
//        let contentWidth = view.bounds.width * Const.contentWidth
//
//        if isPad && isPortrait {
//            bgView.pin.top().horizontally().height(35%)
//        }
//        else {
//            bgView.pin.top().horizontally().height(280.ui + safeArea.top)
//        }
//        stackView.pin.hCenter().width(contentWidth).vertically(safeArea)
//
//        stackView.reload {
//            (isPad && isPortrait) ? 120.fixed : 60.fixed
//            imageView.vComponent
//                .size((isPad && isPortrait) ? [441.ui, 301.ui] : [315.ui, 215.ui])
//                .alignment(.center)
//            isPad ? 60.floating :  45.floating
//            titleLabel.vComponent.maxHeight(40.ui)
//            20.floating
//            subtitleLabel.vComponent.maxHeight(30.ui)
//            16.floating
//            dotLabel_0.vComponent.maxHeight(120.ui)
//            10.floating
//            dotLabel_1.vComponent.maxHeight(120.ui)
//            20.floating
//            continueButton.vComponent
//                .size(Const.buttonSize)
//                .alignment(.center)
//            60.fixed
//        }
//    }
//
//    // MARK: - Public
//
////    func reload(for onboarding: Onboarding) {
//////        self.onboarding = onboarding
////        UIView.transition(with: imageView, duration: 0.25, options: .transitionCrossDissolve) { [unowned self] in
////            imageView.image = onboarding.image
////        } completion: { _ in }
////        view.setNeedsLayout()
////    }
//
//}
//
//// MARK: - Private
//
//private extension OnboardingVC {
//
//    func updateTexts() {
//        zip([L10n.Start.Feature.first, L10n.Start.Feature.second], [dotLabel_0, dotLabel_1])
//            .forEach { text, label in
//                label.text = text
//                    .withFont(DynamicFont.regular(of: isPad ? 24 : 16)
//                                .maxSize(to: isPad ? 40 : 28)
//                                .asFont())
//                    .withTextColor(Color.Main.text.color)
//                    .withParagraphStyle(NSMutableParagraphStyle {
//                        $0.lineSpacing = 5
//                        $0.alignment = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .right : .left
//                    })
//            }
//    }
//
//}
//
//// MARK: - Actions
//
//private extension OnboardingVC {
//
//    func onContinue() {
//        component.location.requestAccess(force: true) { [weak self] in
//            let block = {
//                DispatchQueue.main.async { [weak self] in
//                    self?.finishBlock?()
//                }
//            }
//            self?.component.services.notifications?.fetchStatus { _ in block() } ?? block()
//        }
//    }
//
//}
//
//fileprivate extension Onboarding {
//
//    var image: UIImage {
//        switch self {
//        case .classic: return Asset.Onboarding.Classic.main.image
//        case .houses: return Asset.Onboarding.Houses.main.image
//        }
//    }
//
//}
