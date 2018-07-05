//
//  ViewController.swift
//  RemoteAndLocalNotification
//
//  Created by Mykhailo Zabarin on 7/5/18.
//  Copyright © 2018 Selecto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var userNotificationDatePicker: UIDatePicker!
    @IBOutlet var remoteNotificationDatePicker: UIDatePicker!
    
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDatePicker(datePicker: userNotificationDatePicker)
        configureDatePicker(datePicker: remoteNotificationDatePicker)
    }

    // MARK: - Actions
    
    @IBAction func onAddUserNotificationsBtmPress(_ sender: Any) {
        setNotification(datePicker: userNotificationDatePicker)
    }
    
    @IBAction func onAddremoteNotificationsBtmPress(_ sender: Any) {
        
    }
    
    // MARK: - Private methods
    func setNotification(datePicker: UIDatePicker){
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.timeZone = NSTimeZone.default
        let date = datePicker.date
        if datePicker == userNotificationDatePicker{
            UserNotificationsManager.sharedInstance.setUserNotification(date: date) { (complete) in
                print("User notification was set")
            }
        }
        if datePicker == remoteNotificationDatePicker {
            
        }
    }
    
    
    private func configureDatePicker(datePicker: UIDatePicker){
        datePicker.timeZone = NSTimeZone.default
        let dateFormatter = DateFormatter()
        datePicker.datePickerMode = .time
        dateFormatter.dateFormat =  "hh:mm"
        dateFormatter.timeZone = NSTimeZone.default
        guard let dateString = setPickerDate(datePicker: datePicker) else {
            let aDate = dateFormatter.date(from: "12:00")
            datePicker.date = aDate!
            return
        }
        let date = dateFormatter.date(from: dateString)
        datePicker.date = date!
    }
    
    private func setPickerDate(datePicker: UIDatePicker) -> String? {
//        guard let discipline = self.discipline, let reminder = discipline.reminder else {return nil}
//        let date = Date(timeIntervalSince1970: TimeInterval(reminder.timestamp))
//        let dayTimePeriodFormatter = DateFormatter()
//        dayTimePeriodFormatter.timeZone = NSTimeZone.default
//        dayTimePeriodFormatter.dateFormat = "hh:mm a"
//        let dateString = dayTimePeriodFormatter.string(from: date)
//        return dateString
        return nil
    }
    
    // MARK: - Public methods
    
}
