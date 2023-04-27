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
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}
