//
//  ContactDetailsViewController.swift
//  ContactList
//
//  Created by Ast on 05.03.2025.
//

import UIKit

final class ContactDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private var fullNameLabel: UILabel!
    @IBOutlet private var phoneNumberLabel: UILabel!
    @IBOutlet private var emailLabel: UILabel!
    
    // MARK: - Public Properties
    var contact: Person!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameLabel.text = "\(contact.firstName) \(contact.lastName)"
        phoneNumberLabel.text = "Phone: \(contact.phoneNumber)"
        emailLabel.text = "Email: \(contact.email)"
    }
}
