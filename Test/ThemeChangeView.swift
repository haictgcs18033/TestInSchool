//
//  ThemeChangeView.swift
//  Test
//
//  Created by cmStudent on 2024/07/17.
//

import SwiftUI

struct ThemeChangeView: View {
    var scheme:ColorScheme
    @AppStorage("userTheme") var userTheme : Theme = .systemDefault
    //For sliding effect
    @Namespace private var animation
    var body: some View {
        VStack (spacing:15){
            Circle()
                .fill(userTheme.color(scheme).gradient)
                .frame(width: 150,height: 150)
            VStack{
                Text("Choose a type ")
                Text("Testing")
            }
            HStack(spacing:15){
                ForEach(Theme.allCases,id: \.self){item in
                    Text(item.rawValue)
                        .padding(.vertical,10)
                        .frame(width: 100)
                        .background{
                            ZStack{
                                if userTheme == item {
                                    Capsule()
                                        .fill(.themeBG)
                                        .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                                }
                            }
                            .animation(.snappy, value:userTheme)
                        }
                        .contentShape(.rect)
                        .onTapGesture {
                            userTheme = item
                        }
                    
                }
            }
            .padding(3)
            .background(.primary.opacity(0.06),in: .capsule)
            .padding(.top,20)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .frame(height:410)
        .background(.themeBG)
        .clipShape(.rect(cornerRadius: 30))
        .padding(.horizontal,15)
        .environment(\.colorScheme,scheme)
    }
}
enum Theme : String , CaseIterable{
    case systemDefault = "Default"
    case light = "light"
    case dark = "dark"
    func color (_ scheme: ColorScheme) -> Color{
        switch self{
            
        case .systemDefault:
            return scheme == .dark ? Color.purple : Color.orange
        case .light:
            return Color.orange
        case .dark:
            return Color.purple
        }
    }
    var colorScheme:ColorScheme?{
        switch self{
            
        case .systemDefault:
            return nil
        case .light:
            return .light
            
        case .dark:
            return .dark
        }
    }
}
//#Preview {
//    ContentView()
//}
