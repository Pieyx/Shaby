//
//  ZoomableMapView2.swift
//  Shaby
//
//  Created by NorahAlmukhlifi on 20/07/1445 AH.
//

import SwiftUI
import InteractiveMap
import CloudKit

struct ZoomableMapView2: View {
    @State private var searchItem = ""
    @State private var isSheetPresented = false
    @State private var zoomScale: CGFloat = 1.0
    @State private var currentScale: CGFloat = 1.0
    @State private var translation: CGSize = .zero
    @State private var clickedPath = PathData()
    @State private var recipes: [RecipeWithImage] = []

    var body: some View {
        ZStack {
            Color.page.ignoresSafeArea()
            TextField("Looking for a Recipe?", text: $searchItem)
                .padding(15)
                .background(Color(.white))
                .cornerRadius(20)
                .padding(EdgeInsets(top: 10 , leading: 16, bottom: 600, trailing: 16))
            Image(systemName: "magnifyingglass")
                .padding(EdgeInsets(top: 10 , leading: 150, bottom: 600, trailing: -300))
            ScrollView([.horizontal, .vertical]) {
                VStack {
                    ZStack {
                        Image("country")
                            .resizable()
                            .scaledToFit()

                        InteractiveMap(svgName: "country") { pathData in
                            InteractiveShape(pathData)
                                .initWithAttributes(
                                    .init(
                                        strokeWidth: 0.5,
                                        strokeColor: .white,
                                        background: Color(.brown)
                                    )
                                )
                                .onTapGesture {
                                    clickedPath = pathData
                                    isSheetPresented = true
                                    fetchRecipes(for: pathData.name)
                                }
                                .scaleEffect(clickedPath == pathData ? 1.4 : 1)
                                .animation(.easeInOut(duration: 0.2), value: clickedPath)
                                .zIndex(clickedPath == pathData ? 2 : 1)
                        }
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    zoomScale = value
                                }
                                .onEnded { _ in
                                    currentScale *= zoomScale
                                    zoomScale = 0.2
                                }
                        )
                        .animation(.easeInOut(duration: 0.2))
                    }
                    .sheet(isPresented: $isSheetPresented) {
                        mydish(name: clickedPath.name, recipes: recipes)
                            .presentationDetents([.medium , .large])
                            .presentationDragIndicator(.hidden)
                    }
                }
            }.padding(.top, 150)
        }
    }

    private func fetchRecipes(for regionName: String) {
        let container = CKContainer.default()
        let publicDatabase = container.publicCloudDatabase
        let predicate = NSPredicate(format: "regionName == %@", regionName)

        let query = CKQuery(recordType: "Region", predicate: predicate)

        publicDatabase.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error {
                print("Error fetching region: \(error.localizedDescription)")
            } else if let record = records?.first {
                let region = Region(record: record)
                fetchRecipesForRegion(region)
            }
        }
    }

    private func fetchRecipesForRegion(_ region: Region?) {
        guard let regionID = region?.regionID else { return }

        let container = CKContainer.default()
        let publicDatabase = container.publicCloudDatabase
        let predicate = NSPredicate(format: "regionID == %@", regionID)

        let query = CKQuery(recordType: "Recipe", predicate: predicate)

        publicDatabase.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error {
                print("Error fetching recipes: \(error.localizedDescription)")
            } else if let records = records {
                recipes = records.compactMap { record in
                    guard let recipe = Recipe_m(record: record) else { return nil }
                    let recipeWithImage = RecipeWithImage(recipe: recipe, image: record["Image"] as? CKAsset)
                    return recipeWithImage
                }

                DispatchQueue.main.async {
                    print("Fetched recipes: \(recipes)")
                }
            }
        }
    }
}

struct RecipeWithImage {
    let recipe: Recipe_m
    let image: CKAsset?
}

struct mydish: View {
    let name: String
    let recipes: [RecipeWithImage]

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack {
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 100, height: 5)
                    .padding(8)
                    .foregroundColor(.brown)

                Text("\(name)")
                    .foregroundColor(.black)
                    .bold()
                    .font(.title2)

                ForEach(recipes, id: \.recipe.recordID) { recipeWithImage in
                    HStack {
                        if let imageData = try? Data(contentsOf: recipeWithImage.image?.fileURL ?? URL(fileURLWithPath: "")),
                           let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50) // Adjust size as needed
                        }
                        Text(recipeWithImage.recipe.name)
                        // Add other UI elements for displaying the recipes
                    }
                }

                Spacer()
            }
            .padding()
        }
    }
}

struct ZoomableMapView2_Previews: PreviewProvider {
    static var previews: some View {
        ZoomableMapView2()
    }
}
