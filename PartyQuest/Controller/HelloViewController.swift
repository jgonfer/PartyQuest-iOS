//
//  HelloViewController.swift
//  PartyQuest
//
//  Created by Josep Gonzalez Fernandez on 21/2/16.
//  Copyright © 2016 Josep Gonzalez Fernandez. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var timer: NSTimer?
    var name: String?
    
    deinit {
        timer?.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Own Methods
    
    private func setupController() {
        if let name = name {
            nameLabel.text = "Hello \(name)!"
        }
        
        updateTimeLabel()
    }
    
    func updateTimeLabel() {
        guard let _ = timer else {
            self.timer = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: "updateTimeLabel", userInfo: nil, repeats: true)
            return
        }
        timeLabel.text = "Current time \(Utils.getCurrentStringDate())"
    }
}