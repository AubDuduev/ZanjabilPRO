import UIKit

extension UIApplication {
    
   func isHideKeyboard(show: Bool) {
      if show {
         sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
      } else {
         sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
   }
   var statusBarUIView: UIView? {
      let tag = 3848245
      let keyWindow = UIApplication.shared.connectedScenes.map{ $0 as? UIWindowScene }.compactMap{$0}.first?.windows.first
      
      if let statusBar = keyWindow?.viewWithTag(tag) {
         return statusBar
      } else {
         let height = keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
         let statusBarView = UIView(frame: height)
         statusBarView.tag = tag
         statusBarView.layer.zPosition = 999999
         
         keyWindow?.addSubview(statusBarView)
         return statusBarView
      }
   }
}


