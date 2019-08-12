import UIKit
import GoogleMaps

protocol Annotation: UIView {
    var coordinate: CLLocationCoordinate2D { get }
}

class PointAnnotation: UIView, Annotation {
    var coordinate: CLLocationCoordinate2D

    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .purple
        self.layer.cornerRadius = 5
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 10, height: 10)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
