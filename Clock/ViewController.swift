//
//  ViewController.swift
//  Swift_Sample_Clock
//
//  Created by Ryo Eguchi on 2014/12/31.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var hour2ImageView: UIImageView!
    @IBOutlet var hour1ImageView: UIImageView!
    @IBOutlet var minute2ImageView: UIImageView!
    @IBOutlet var minute1ImageView: UIImageView!
    @IBOutlet var second2ImageView: UIImageView!
    @IBOutlet var second1ImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self,
                                                        selector: Selector("time"),
                                                        userInfo: nil,
                                                        repeats: true)
    }
    
    func time() {
        let now = NSDate()
        //カレンダーを取得.
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        
        //取得するコンポーネントを決める.
        let myComponetns = myCalendar.components(
            [NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second],
            fromDate: now)
        
        let hour: Int = myComponetns.hour
        let minute: Int = myComponetns.minute
        let second: Int = myComponetns.second
        
        let hourDigit = calcDoubleDigits(hour)
        let minuteDigit = calcDoubleDigits(minute)
        let secondDigit = calcDoubleDigits(second)
        
        draw(hourDigit.tensDigit, hourOnes: hourDigit.onesDigit,
            minuteTens: minuteDigit.tensDigit, minuteOnes: minuteDigit.onesDigit,
            secondTens: secondDigit.tensDigit, secondOnes: minuteDigit.onesDigit)
    }
    
    func calcDoubleDigits(number: Int) -> (tensDigit: Int, onesDigit: Int) {
        if number > 9 {
            return (number / 10, number % 10)
        } else {
            return (0, number)
        }
    }
    
    func draw(hourTens: Int, hourOnes: Int, minuteTens: Int, minuteOnes: Int, secondTens: Int, secondOnes: Int) {
        hour2ImageView.image = getImage(hourTens)
        hour1ImageView.image = getImage(hourOnes)
        
        minute2ImageView.image = getImage(minuteTens)
        minute1ImageView.image = getImage(minuteOnes)
        
        second2ImageView.image = getImage(secondTens)
        second1ImageView.image = getImage(secondOnes)
    }
    
    func getImage(number: Int) -> UIImage! {
        return UIImage(named: String(number) + ".png")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

