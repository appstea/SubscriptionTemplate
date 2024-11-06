import UIKit
import SnapKit

import UIBase
import PaywallCraftCore

final class FreeViewController: UIBase.ViewController {
  
  private lazy var label: UILabel = {
    let label = UILabel()
    label.text = "Free app experience, add your interface here."
    label.numberOfLines = 0
    label.textAlignment = .center
    label.sizeToFit()
    return label
  }()
  
  private lazy var bannerView = PaywallCore.upsell(from: self)
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.configureUI()
  }
}

// MARK: - UI configure

private extension FreeViewController {
  func configureUI() {
    self.view.backgroundColor = Color.Main.back.color
    
    self.view.addSubview(self.label)
    self.label.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      make.width.lessThanOrEqualToSuperview().multipliedBy(0.75)
    }
    
    self.view.addSubview(self.bannerView)
    self.bannerView.snp.makeConstraints { make in
      make.left.right.equalToSuperview()
      make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
      make.width.equalToSuperview()
    }
  }
}
