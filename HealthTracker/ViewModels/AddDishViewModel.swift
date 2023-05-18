//
//  AddDishViewModel.swift
//  HealthTracker
//
//  Created by Антон Петренко on 18/05/2023.
//

import SwiftUI
import _PhotosUI_SwiftUI

final class AddDishViewModel: ObservableObject {
    @Published var newName: String = ""
    @Published var kcal: Int16 = 0
    @Published var photo: Data?
    @Published var imageState: ImageState = .empty
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            if let imageSelection {
                let progress: Progress = loadTransferable(from: imageSelection)
                imageState = .loading(progress)
            } else {
                imageState = .empty
            }
        }
    }
    
    private func loadTransferable(from imageSelection: PhotosPickerItem) -> Progress {
        return imageSelection.loadTransferable(type: UIImage.self, completionHandler: { result in
            DispatchQueue.main.async {
                guard imageSelection == self.imageSelection else { return }
                switch result {
                case .success(let image?):
                    self.imageState = .success(image)
                case .success(nil):
                    self.imageState = .empty
                case .failure(let failure):
                    self.imageState = .failure(failure)
                }
            }
        })
    }
}
