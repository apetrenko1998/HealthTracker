//
//  ImageState.swift
//  HealthTracker
//
//  Created by Антон Петренко on 18/05/2023.
//

import UIKit

enum ImageState {
    case success(UIImage)
    case loading(Progress)
    case empty
    case failure(Error)
}
