//
//  FetchApiApp.swift
//  FetchApi
//
//  Created by Pierric Marye on 03/01/2023.
//

import SwiftUI

@main
struct FetchApiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(PhotoViewModel())
        }
    }
}
