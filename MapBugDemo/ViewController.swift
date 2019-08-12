import UIKit
import GoogleMaps

private let kCoordinate = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)

class ViewController: UIViewController {

    @IBOutlet var mapView: GMSMapView!

    @IBOutlet var annotationsContainerView: AnnotationsContainerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.annotationsContainerView.isUserInteractionEnabled = false

        self.mapView.delegate = self
        self.mapView.camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)

        let marker = GMSMarker(position: kCoordinate)
        marker.map = self.mapView

        let annotation = PointAnnotation(coordinate: kCoordinate)
        self.annotationsContainerView.add(annotation)
    }

    @IBAction func toggleNavigationBar(_ sender: Any) {
        let navBarHidden = self.navigationController!.isNavigationBarHidden
        self.navigationController!.setNavigationBarHidden(!navBarHidden, animated: true)
    }
}

extension ViewController: GMSMapViewDelegate {
    public func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        self.annotationsContainerView.update(for: mapView)
    }

    public func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        self.annotationsContainerView.update(for: mapView)
    }
}
