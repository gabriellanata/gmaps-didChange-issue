import UIKit
import GoogleMaps

private let kCoordinate = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)

class ViewController: UIViewController {

    @IBOutlet var mapView: GMSMapView!
    @IBOutlet var noAutolayoutView: NoAutolayoutView!

    let projectionView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up map
        self.mapView.delegate = self
        self.mapView.camera = GMSCameraPosition.camera(withTarget: kCoordinate, zoom: 6.0)

        // Set up marker
        let marker = GMSMarker(position: kCoordinate)
        marker.map = self.mapView

        // Set up projection view
        self.projectionView.backgroundColor = .purple
        self.projectionView.layer.cornerRadius = 5
        self.noAutolayoutView.addSubview(self.projectionView)
        self.noAutolayoutView.isUserInteractionEnabled = false
    }

    @IBAction func toggleNavigationBar(_ sender: Any) {
        let navBarHidden = self.navigationController!.isNavigationBarHidden
        self.navigationController!.setNavigationBarHidden(!navBarHidden, animated: true)
    }
}

extension ViewController: GMSMapViewDelegate {
    public func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        self.projectionView.center = mapView.projection.point(for: kCoordinate)
    }

    public func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        self.projectionView.center = mapView.projection.point(for: kCoordinate)
    }
}
