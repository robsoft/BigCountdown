//
//  ViewController.swift
//  BigCountdown
//
//  Created by Robert Uttley on 10/05/2019.
//  Copyright © 2019 Robsoft Systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblDays: UILabel!
    @IBOutlet weak var lblMins: UILabel!
    @IBOutlet weak var lblHours: UILabel!
    @IBOutlet weak var lblSecs: UILabel!
    
    var timer : Timer? = nil
    let dateFormatter = DateFormatter()
    var endDate : Date? = nil
    let calendar = Calendar.current
    let dateIntervalFormatter = DateIntervalFormatter()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        endDate = dateFormatter.date(from:"2019-08-26T12:00:00+0000")!

        // Configure Date Interval Formatter
        dateIntervalFormatter.dateStyle = .short
        dateIntervalFormatter.timeStyle = .medium
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        
        updateTimer()
    }

    
    @objc func fireTimer() {
        // compare dates here at some point
        
        updateTimer()
    }

    func updateTimer() {
        let dateRangeStart = Date()
        let components = calendar.dateComponents([.day, .hour, .minute, .second], from: dateRangeStart, to: endDate!)
        
        // String From Date Interval
        lblDays.text = "\(components.day ?? 0) days"
        lblHours.text = "\(components.hour ?? 0) hours"
        lblMins.text = "\(components.minute ?? 0) mins"
        lblSecs.text = "\(components.second ?? 0) secs"
    }
}

