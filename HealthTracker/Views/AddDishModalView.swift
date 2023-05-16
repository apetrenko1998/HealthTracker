//
//  AddDishModalView.swift
//  HealthTracker
//
//  Created by Антон Петренко on 08/05/2023.
//

import SwiftUI
import PhotosUI
import Photos

struct AddDishModalView: View {
    
    @State private var newName: String = ""
    @State private var kcal: Int16 = 0
    @State private var photo: Data?
    
    @State private var imageSelection: [PhotosPickerItem] = []
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimum = .init(integerLiteral: 1)
        formatter.maximum = .init(integerLiteral: Int(Int16.max))
        formatter.generatesDecimalNumbers = false
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            Form {
                Image("placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200, alignment: .center)
                    .clipped()
                    .overlay(alignment: .bottomTrailing, content: {
                        PhotosPicker(selection: $imageSelection,
                                     maxSelectionCount: 1,
                                     selectionBehavior: .default,
                                     matching: .images,
                                     preferredItemEncoding: .automatic) {
                            Image(systemName: "pencil.circle.fill")
                                .symbolRenderingMode(.multicolor)
                                .foregroundColor(.accentColor)
                        }
                        .padding()
                    })
                
                TextField(text: $newName, prompt: Text("Enter dish name")) {
                    Text("Dish")
                }
                
                HStack(spacing: 16) {
                    Text("Kcal per 100g:")
                    TextField("Kcal", value: $kcal, formatter: numberFormatter)

                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Add button was pressed")
                    } label: {
                        Text("Add")
                    }

                }
            }
            .navigationTitle("Add a dish")
        }
    }
}

struct AddDishModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddDishModalView()
    }
}
