//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Owen Henley on 27/02/2023.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    
//    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums)
            }
            .onAppear {
                ScrumStore.load { data in
                    switch data {
                    case .success(let scrums):
                        store.scrums = scrums
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    }
                }
            }
        }
    }
}
