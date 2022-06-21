//
//  _PreviewUI.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/20/22.
//

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {

  let viewController: ViewController

  init(_ builder: @escaping () -> ViewController) {
    UI.setBaseWidths([.phone: 375, .pad: 768])
    viewController = builder()
  }

  // MARK: - UIViewControllerRepresentable

  func makeUIViewController(context: Context) -> ViewController {
    viewController
  }

  func updateUIViewController(_ uiViewController: ViewController, context: Context) { }

}

struct UIViewPreview<View: UIView>: UIViewRepresentable {
  let view: View

  init(_ builder: @escaping () -> View) {
    UI.setBaseWidths([.phone: 375, .pad: 768])
    view = builder()
  }

  // MARK: UIViewRepresentable
  func makeUIView(context: Context) -> UIView {
    return view
  }

  func updateUIView(_ view: UIView, context: Context) {
    view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    view.setContentHuggingPriority(.defaultHigh, for: .vertical)
  }
}

struct _PreviewUI: PreviewProvider {

  static var previews: some View {
    UIViewControllerPreview {
      TestVC()
//      Permissions.ViewController()
    }
  }

}

#endif

class TestVC: Base.ViewController {

  override func loadView() {
    super.loadView()
    view.backgroundColor = .blue
  }
}
