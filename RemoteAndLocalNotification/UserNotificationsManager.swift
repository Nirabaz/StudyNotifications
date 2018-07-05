//
//  UserNotificationsManager.swift
//  RemoteAndLocalNotification
//
//  Created by Mykhailo Zabarin on 7/5/18.
//  Copyright © 2018 Selecto. All rights reserved.
//

import Foundation
import UserNotifications

final class UserNotificationsManager {
    
//    func scheduleDisciplineNotifications(date: Date, weekDayIndex: Int, disciplineName: String, disciplineId: Int64, completion: (Bool) -> ()){
//        let notificationContent = UNMutableNotificationContent()
//        notificationContent.title = "MEMORISER"
//        notificationContent.body = "Don't forget to practice discipline '\(disciplineName)'"
//        notificationContent.sound = UNNotificationSound.default()
//        notificationContent.userInfo = ["disciplineName": disciplineName, "disciplineId": disciplineId, "reminderStatus": 1]
//        notificationContent.categoryIdentifier = "alarm.category"
//
//        var dateComponents = DateComponents()
//        dateComponents.hour = Calendar.current.component(.hour, from: date)
//        dateComponents.minute = Calendar.current.component(.minute, from: date)
//        dateComponents.weekday = weekDayIndex
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//        let request = UNNotificationRequest(identifier: "\(disciplineName)_\(weekDayIndex)", content: notificationContent, trigger: trigger)
//        let center = UNUserNotificationCenter.current()
//
//        setCategories()
//        center.add(request)
//        completion(true)
//   }
    
    static var sharedInstance: UserNotificationsManager = {
        return UserNotificationsManager()
    }()
    
    private func setCategories(){
        let snoozeAction = UNNotificationAction(identifier: "snooze", title: "Snooze 10s", options: [])
        let alarmCategory = UNNotificationCategory(identifier: "alarm.category",actions: [snoozeAction],intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([alarmCategory])
    }
    
    func setUserNotification(date: Date, completion: (Bool) -> ()) {
        
        var dateComponents = DateComponents()
        dateComponents.hour = Calendar.current.component(.hour, from: date)
        dateComponents.minute = Calendar.current.component(.minute, from: date)
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "User Notification"
        notificationContent.body = "Arrival time - '\(dateComponents.hour!):\(dateComponents.minute!)'"
        notificationContent.sound = UNNotificationSound.default()
//        notificationContent.userInfo = [String: Any]
        notificationContent.categoryIdentifier = "alarm.category"
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "User_Notification_\(dateComponents.hour!)_\(dateComponents.minute!)", content: notificationContent, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        
        setCategories()
        center.add(request)
        completion(true)
    }
    
}
