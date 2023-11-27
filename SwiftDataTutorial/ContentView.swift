//
//  ContentView.swift
//  SwiftDataTutorial
//
//  Created by Bolivar Cortes on 11/27/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment (\.modelContext) private var context
    @Query(sort: \CountryModel.code, order: .forward) var countries: [CountryModel]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(countries) {country in
                        Text("\(country.code) - \(country.name)")
                    }.onDelete(perform: { indexSet in
                        let model = countries[indexSet.first!]
                        context.delete(model)
                    })
                }
                .navigationTitle("Countries")
                .toolbar {
                    Button(action: {
                        countries.forEach{country in
                            context.delete(country)
                        }
                    }, label: {
                        Image(systemName: "trash.fill").foregroundStyle(Color.red)
                    })
                    
                    Button(action: {
                        context.insert(CountryModel.getRandomCountry())
                    }, label: {
                        Image(systemName: "plus.square.fill").foregroundStyle(Color.blue)
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView().modelContainer(for: CountryModel.self, inMemory: true)
}
