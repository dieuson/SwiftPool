//
//  Place.swift
//  d05
//
//  Created by Dieuson VIRGILE on 1/15/18.
//  Copyright © 2018 Dieuson VIRGILE. All rights reserved.
//

import MapKit
import Foundation

class Place: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    var title: String?
    var subtitle: String?
    
    init(title: String, subtitle: String, coordinates: (Double, Double)) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = CLLocationCoordinate2DMake(coordinates.0, coordinates.1)
    }
}
