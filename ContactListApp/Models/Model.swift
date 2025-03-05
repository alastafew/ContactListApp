//
//  Model.swift
//  ContactList
//
//  Created by Ast on 05.03.2025.
//


struct Person {
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let email: String
}

final class RandomPersonGenerator {
    
    static func generateRandomPerson(count: Int) -> [Person] {
        let dataStore = DataStore()
        
        let firstName = dataStore.firstName.shuffled()
        let lastName = dataStore.lastName.shuffled()
        let phoneNumber = dataStore.phoneNumber.shuffled()
        let email = dataStore.email.shuffled()
        
        var contactList: [Person] = []
        
        for count in 0..<min(count,firstName.count) {
            let person = Person(
                firstName: firstName[count],
                lastName: lastName[count],
                phoneNumber: phoneNumber[count],
                email: email[count]
            )
            contactList.append(person)
        }
        return contactList
    }
}


