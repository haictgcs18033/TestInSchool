//
//  TestAppStorage.swift
//  Test
//
//  Created by cmStudent on 2024/07/29.
//

import SwiftUI
import AVFoundation
struct TestAppStorage: View {
    @AppStorage("user") var userNumber = 0
    @AppStorage("userYoka") var userYoka = 0
    @AppStorage("usermama") var userMama = 0
    @State var showAnke = false
    @State var number = 0;
    var sound = TestSound()
    var body: some View {
        VStack{
            HStack{
                Button(action:{
                    UserDefaults.standard.set( 0,forKey: "usermama")
                    UserDefaults.standard.set(0,forKey: "user")
                    UserDefaults.standard.set(0,forKey: "userYoka")
                    number = 0
                },label: {
                    Text("リセットボタン")
                
                })
                .padding()
                .clipShape(Rectangle())
                .background(.white)
                .cornerRadius(10)
                Spacer()
                Button(action:{
                    showAnke = true
                },label: {
                    Text("アンケート結果")
                
                })
                .padding()
                .clipShape(Rectangle())
                .background(.white)
                .cornerRadius(10)
            }
            .padding()
            Spacer()
            Text("来場者集計アプリ")
                .font(.system(size: 40))
                .padding(.vertical,20)
            VStack{
                Text("今日までの来場者")
                Text("\(userNumber)人")
                Text("本日の来場者")
                Text("\(number)人")
            }
            .font(.system(size: 20))
            Spacer()
            VStack{
                Text("簡単アンケート")
                HStack{
                    Button(action:{
                        sound.soundPlay(soundSource: "knife")
                        UserDefaults.standard.set(userYoka + 1,forKey: "userYoka")
                        UserDefaults.standard.set(userNumber + 1,forKey: "user")
                        number = number + 1
                    },label:{
                        Text("よかった")
                    })
                    Spacer()
                    Button(action:{
                        sound.soundPlay(soundSource: "katana")
                        UserDefaults.standard.set(userMama + 1,forKey: "usermama")
                        UserDefaults.standard.set(userNumber + 1,forKey: "user")
                        number = number + 1
                    },label:{
                        Text("まぁまぁ")
                    })
                }
                .font(.system(size: 25))
                .foregroundColor(.white)
                
            }
            
        }
        .fontWeight(.bold)
        .padding(.horizontal,30)
        .background(
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
        )
        .sheet(isPresented: $showAnke){
            VStack{
                Text("アプリケーション結果")
                    .font(.system(size: 30))
                    .padding(.vertical,20)
                HStack{
                    VStack{
                        Text("よかった")
                        Text("\(userYoka)")
                    }
                    VStack{
                        Text("まぁまぁ")
                        Text("\(userMama)")
                    }
                }
            }
            .padding()
            .presentationDetents([.height(UIScreen.main
                .bounds.height / 2),.medium])
        }
        
    }
}
class TestSound : NSObject{
    var soundPlayer: AVAudioPlayer!
    func soundPlay(soundSource:String){
        do{
            switch soundSource{
            case "katana":
                let soundData = NSDataAsset(name: "katana")!.data
                soundPlayer = try AVAudioPlayer(data: soundData)
                soundPlayer.play()
            case "knife":
                let soundData = NSDataAsset(name: "knife")!.data
                soundPlayer = try AVAudioPlayer(data: soundData)
                soundPlayer.play()
            default:
                return
            }
          
           
        }catch{
            print("データ")
        }
    }
}


#Preview {
    TestAppStorage()
}
