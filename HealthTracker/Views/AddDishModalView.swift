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
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var viewModel: AddDishViewModel
    @Binding var isPresented: Bool
    
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
                DishImage(imageState: viewModel.imageState)
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipped()
                    .overlay(alignment: .bottomTrailing, content: {
                        PhotosPicker(selection: $viewModel.imageSelection,
                                     matching: .images,
                                     preferredItemEncoding: .automatic,
                                     photoLibrary: .shared()) {
                            EmptyView()
                        }
                    })
                TextField("Enter dish name", text: $viewModel.newName)
                HStack(spacing: 16) {
                    Text("Kcal per 100g:")
                    TextField("Kcal", value: $viewModel.kcal, formatter: numberFormatter)

                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addProduct()
                        isPresented.toggle()
                    } label: {
                        Text("Add")
                    }

                }
            }
            .navigationTitle("Add a dish")
        }
        .animation(.none)
    }
    
    private func addProduct() {
        let newDish: Dish = .init(context: viewContext)
        newDish.name = viewModel.newName
        newDish.kcal = viewModel.kcal
        if case let .success(currentImage) = viewModel.imageState {
            newDish.photo = currentImage.jpegData(compressionQuality: 0.5)
        }
        
        do {
            _ = try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct AddDishModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddDishModalView(viewModel: .init(), isPresented: .constant(true))
    }
}
