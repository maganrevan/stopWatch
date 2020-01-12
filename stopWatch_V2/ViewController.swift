//
//  ViewController.swift
//  stopWatch_V2
//
//  Created by Magnus Kruschwitz on 10.01.20.
//  Copyright © 2020 Magnus Kruschwitz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var oStopWatch: stopWatch?
    var iClickedState: Int?
    var oTimer: Timer?
    var bUseTimerFunction: Bool?
    
    @IBOutlet weak var uiLabelHours: UILabel!
    @IBOutlet weak var uiLabelMinutes: UILabel!
    @IBOutlet weak var uiLabelSeconds: UILabel!
    @IBOutlet weak var btnStartPause: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.oStopWatch        = stopWatch()
        self.iClickedState     = 0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnHandleStopWatch(_ sender: Any) {
        if iClickedState == 0 {
            btnStartPause.setTitle("Pause", for: UIControl.State())
            iClickedState = 1
            self.fctCallStart()
            self.oTimer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(self.fctCallStart),
                userInfo: nil,
                repeats: true
            )
        }
        else{
            self.oTimer?.invalidate()
            btnStartPause.setTitle("Weiter", for: UIControl.State())
            iClickedState = 0
        }
    }
    
    @IBAction func btnCancleStopWatch(_ sender: Any) {
        self.oTimer?.invalidate()
        self.oStopWatch?.fctCancleStopWatch()
        btnStartPause.setTitle("Start", for: UIControl.State())
        uiLabelHours.text   = String(0)
        uiLabelMinutes.text = String(0)
        uiLabelSeconds.text = String(0)
    }
    
    @objc func fctCallStart (){
        let tmpTimer        = self.oStopWatch?.fctGetTimeRunning()
        uiLabelHours.text   = tmpTimer![2]
        uiLabelMinutes.text = tmpTimer![1]
        uiLabelSeconds.text = tmpTimer![0]
    }
}

