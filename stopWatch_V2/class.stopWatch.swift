//
//  class.stopWatch.swift
//  stopWatch_V2
//
//  Created by Magnus Kruschwitz on 07.01.20.
//  Copyright © 2020 Magnus Kruschwitz. All rights reserved.
//

import Foundation

class stopWatch {
    private var iSeconds: Int
    private var iHours: Int
    private var iMinutes: Int
    
    init() {
        self.iSeconds = 0
        self.iHours   = 0
        self.iMinutes = 0
    }
    
    public func fctCancleStopWatch() {
        self.iSeconds = 0
        self.iMinutes = 0
        self.iHours   = 0
    }
    
    public func fctGetTimeRunning() -> Array<String> {
        self.iSeconds += 1
        self.handleTime()
        
        return [String(self.iSeconds), String(self.iMinutes), String(self.iHours)]
    }
    
    private func handleTime() {
        if self.iSeconds >= 60{
            self.iMinutes += 1
            self.iSeconds -= 60
        }
        
        if self.iMinutes >= 60{
            self.iHours += 1
            self.iMinutes -= 60
        }
    }
}
