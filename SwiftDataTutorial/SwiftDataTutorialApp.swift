//
//  SwiftDataTutorialApp.swift
//  SwiftDataTutorial
//
//  Created by Bolivar Cortes on 11/27/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: CountryModel.self)
    }
}
