//
//  UIImage+Transferable.swift
//  HealthTracker
//
//  Created by Антон Петренко on 18/05/2023.
//

import UIKit
import SwiftUI

extension UIImage: Transferable {
    static public var transferRepresentation: some TransferRepresentation {
        DataRepresentation(contentType: .data) { transferable in
            transferable.jpegData(compressionQuality: 0.5)!
        } importing: { data in
            UIImage(data: data) ?? UIImage()
        }

    }
}
