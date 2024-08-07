//
//  CombineView.swift
//  Test
//
//  Created by cmStudent on 2024/07/22.
//

import SwiftUI

struct CombineView: View {
    static let vmq = CombineViewModel()
    @StateObject var vm = CombineViewModel()
    @State var message:String = ""
    @State var logTime:String = ""
    var soundPlayer = SoundPlayer()
    var body: some View {
        VStack{
            Button{
                Task{
                    logTime = ""
                    vm.start()
                    message = "- - -"
                    message = await getWho()
                    message += ", "
                    logTime += vm.getElappsedTime()
                    message += await getMessage()
                    message += "!"
                    logTime += "\n" + vm.getElappsedTime()
                    vm.stop()
                }
            } label:{
                Label("await TEST",systemImage: "testtube.2")
                    .background(
                        Capsule()
                            .stroke(lineWidth: 1)
                            .frame(width: 180,height: 40)
                    )
            }
            .padding(30)
            Text("\(message)").font(.title)
            Text("\(logTime)").padding()
            Button {
                soundPlayer.soundPlay()
            } label: {
                Text("Play")
            }

            Spacer()
        }
    }
}
func getWho() async -> String{
    try? await Task.sleep(nanoseconds: 5 * 1000 * 1000 * 1000)
    return "山本"
}
func getMessage() async -> String{
    try? await Task.sleep(nanoseconds: 3 * 1000 * 1000 * 1000)
    return "ハロー"
}
#Preview {
    CombineView()
        
        
}
