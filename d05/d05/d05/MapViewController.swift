//
//  FirstViewController.swift
//  d05
//
//  Created by Dieuson VIRGILE on 1/15/18.
//  Copyright © 2018 Dieuson VIRGILE. All rights reserved.
//

import UIKit
import MapKit

struct DataPlaces {
    static var places: [Place] = []
    static var currentIndex = 0
}

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    func createDataArray(){
        let Data = [Place(title: "42", subtitle: "Ecole trop stylé", coordinates: (48.896654, 2.318497)),
                    Place(title: "Porte de clichy", subtitle: "Porte de Clichy est une station de la ligne 13 du métro de Paris, située dans le 17ᵉ arrondissement de Paris." ,coordinates: (48.894508, 2.314186)),
                    Place(title: "Corse", subtitle: "e méditerranéenne de la Corse offre des paysages variés", coordinates: (42.154795, 9.041395))]
        for place in Data {
            DataPlaces.places.append(place)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDataArray()
        let initialLocation = DataPlaces.places.first
        let span = MKCoordinateSpanMake(0.075, 0.075)
        let region = MKCoordinateRegion(center: (initialLocation?.coordinate)!, span: span)
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(initialLocation!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

