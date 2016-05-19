//
//  Annotations.swift
//  MapView
//
//  Created by Haitham Slaibi on 5/16/16.
//  Copyright © 2016 Haitham Slaibi. All rights reserved.
//

import UIKit
import MapKit

class Annotations: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate:CLLocationCoordinate2D , title:String? ,subtitle:String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }

}
