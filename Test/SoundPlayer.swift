//
//  SoundPlayer.swift
//  Test
//
//  Created by cmStudent on 2024/07/22.
//

import Foundation
import UIKit
import AVFoundation
class SoundPlayer:NSObject{
    //音声データの読み込み
    let soundData = NSDataAsset(name: "katana")!.data
    var soundPlayer: AVAudioPlayer!
    func soundPlay(){
        do{
            soundPlayer = try AVAudioPlayer(data: soundData)
            soundPlayer.play()
        }catch{
            print("データ")
        }
        
        
        
    }
}
