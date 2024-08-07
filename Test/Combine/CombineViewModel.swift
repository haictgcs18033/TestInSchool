//
//  CombineViewModel.swift
//  Test
//
//  Created by cmStudent on 2024/07/22.
//

import Foundation

class CombineViewModel:ObservableObject{
    @Published var counter:Int = 0
    @Published var elapsed: Double = 0.0
    private var timer = Timer()
    func start(){
        guard !timer.isValid else{return}
        self.elapsed = 0.0
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
            self.elapsed += 0.01
        })
    }
    func stop(){
        timer.invalidate()
    }
}
extension CombineViewModel{
    func getElappsedTime() -> String{
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        let seconds = formatter.string(from: NSNumber(floatLiteral: self.elapsed)) ?? "0:00"
        return seconds
    }
}
