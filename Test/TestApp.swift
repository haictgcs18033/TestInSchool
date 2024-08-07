//
//  TestApp.swift
//  Test
//
//  Created by cmStudent on 2024/07/17.
//

import SwiftUI

@main
struct TestApp: App {
    @StateObject var vm = CombineViewModel()
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            CombineView()
            TestAppStorage()
             
        }
    }
}
