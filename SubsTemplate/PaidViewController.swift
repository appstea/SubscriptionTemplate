import UIKit
import SnapKit

import UIBase

final class PaidViewController: UIBase.ViewController {
  
  private lazy var label: UILabel = {
    let label = UILabel()
    label.text = "Premium app experience, add your interface here."
    label.numberOfLines = 0
    label.textAlignment = .center
    label.sizeToFit()
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.cinfugureUI()
  }
}

// MARK: - UI configuration

private extension PaidViewController {
  func cinfugureUI() {
    self.view.backgroundColor = Color.Main.back.color
    
    self.view.addSubview(self.label)
    self.label.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      make.width.lessThanOrEqualToSuperview().multipliedBy(0.75)
    }
  }
}
