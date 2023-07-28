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
    
    init(name: String, surname: String, phoneNumber: String, email: String) {
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        self.email = email
    }
    
    static func getPersons() -> [Person] {
        var contactList: [Person] = []
        
        var names = DataStore().names.shuffled()
        var surnames = DataStore().surnames.shuffled()
        var phones = DataStore().phoneNumbers.shuffled()
        var emails = DataStore().emails.shuffled()
        
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

