//
//  ContentView.swift
//  Test
//
//  Created by cmStudent on 2024/07/17.
//

import SwiftUI

struct ContentView: View {
    @State private var changeTheme:Bool = false
    @Environment(\.colorScheme) private var scheme
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    var body: some View {
                NavigationStack{
                    List{
                        Section("Appearance"){
                            Button("Change Theme"){
                                changeTheme.toggle()
                            }
                            NavigationLink{
                                ChartView()
                            }label:{
                                Text("Chart")
                            }
                        }
                    }
        
                    .navigationTitle("Setting")
                    .navigationBarTitleDisplayMode(.inline)
                }
                .preferredColorScheme(userTheme.colorScheme)
        
                .sheet(isPresented: $changeTheme,content:{
                    ThemeChangeView(scheme:scheme)
                        .presentationDetents([.height(410)])
                        .presentationBackground(.clear)
                })
            
    }
}


#Preview {
    ContentView()
}
