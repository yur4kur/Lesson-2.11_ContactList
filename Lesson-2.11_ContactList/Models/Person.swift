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
        
        var names = DataStore.shared.names.shuffled()
        var surnames = DataStore.shared.surnames.shuffled()
        var phones = DataStore.shared.phoneNumbers.shuffled()
        var emails = DataStore.shared.emails.shuffled()
        
        let iterationCount = min(names.count,
                                 surnames.count,
                                 phones.count,
                                 emails.count)
        
        for index in 0..<iterationCount {
            contactList.append(
                Person(
                name: names[index],
                surname: surnames[index],
                phoneNumber: phones[index],
                email: emails[index]))
        }
        
        return contactList
    }
}


