//
//  RandomPersonsGenerator.swift
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

func generateRandomPerson() -> [Person] {
    let dataStore = DataStore()
    
    let firstNames = dataStore.firstName.shuffled()
    let lastNames = dataStore.lastName.shuffled()
    let phoneNumbers = dataStore.phoneNumber.shuffled()
    let emails = dataStore.email.shuffled()
    
    var contactList: [Person] = []
    
    for index in 0..<firstNames.count {
        let person = Person(
            firstName: firstNames[index],
            lastName: lastNames[index],
            phoneNumber: phoneNumbers[index],
            email: emails[index]
        )
        contactList.append(person)
    }
    return contactList
}


