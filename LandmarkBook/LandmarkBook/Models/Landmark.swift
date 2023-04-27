//
//  Landmark.swift
//  LandmarkBook
//
//  Created by Bartuğ Kaan Çelebi on 27.04.2023.
//

import Foundation
import UIKit

struct Landmark{
    let name : String
    let image : UIImage
    let country : String
    
    init(name: String, image: UIImage, country : String) {
        self.name = name
        self.image = image
        self.country = country
    }
}
