//
//  Person.swift
//  Lesson-2.11_ContactList
//
//  Created by Юрий Куринной on 27.07.2023.
//

struct Person {
    let name: String
    let surname: String
    let phoneNumber: String
    let email: String
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPersons() -> [Person] {
        var contactList: [Person] = []
        
        var names = dataManager.names.shuffled()
        var surnames = dataManager.surnames.shuffled()
        var phones = dataManager.phoneNumbers.shuffled()
        var emails = dataManager.emails.shuffled()
        
        while !names.isEmpty {
            contactList.append(
                Person(
                name: names.removeLast(),
                surname: surnames.removeLast(),
                phoneNumber: phones.removeLast(),
                email: emails.removeLast()))
        }
        
        return contactList
    }
}

fileprivate let dataManager = DataStore()
