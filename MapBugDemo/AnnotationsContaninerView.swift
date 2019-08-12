import UIKit
import GoogleMaps

class AnnotationsContainerView: UIView {
    var annotations = [Annotation]()

    func add(_ annotation: Annotation) {
        self.annotations.append(annotation)
        self.addSubview(annotation)
    }

    func update(for mapView: GMSMapView) {
        let projection = mapView.projection
        for annotation in self.annotations {
            annotation.layer.position = projection.point(for: annotation.coordinate)
        }
    }

    // This prevents UIKit from messing with views since they are laid out manually.
    public override func layoutSubviews() {}
    public override func layoutSublayers(of layer: CALayer) {}
}
