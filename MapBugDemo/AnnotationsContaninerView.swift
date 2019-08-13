import UIKit
import GoogleMaps

class NoAutolayoutView: UIView {
    // This prevents autolayout from messing with views since they are laid out manually.
    public override func layoutSubviews() {}
    public override func layoutSublayers(of layer: CALayer) {}
}
