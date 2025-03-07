//
//  ContactDetailsViewController.swift
//  ContactList
//
//  Created by Ast on 05.03.2025.
//

import UIKit

final class ContactDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private var phoneNumberLabel: UILabel!
    @IBOutlet private var emailLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = person.fullName
        emailLabel.text = "Email: \(person.email)"
        phoneNumberLabel.text = "Phone: \(person.phoneNumber)"
    }

}
