//
//  ContactListViewController.swift
//  ContactList
//
//  Created by Ast on 05.03.2025.
//

import UIKit

final class ContactListViewController: UITableViewController {
    
    // MARK: - Private Properties
    private let contactList = generateRandomPerson()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back")
        
        let contactDetailsVC = segue.destination as? ContactDetailsViewController
        contactDetailsVC?.contact = contactList[indexPath.row]
    }
}

// MARK: - UITableViewDataSource
extension ContactListViewController {
    
    // MARK: - Override Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "contactCell",
            for: indexPath
        )
        let contact = contactList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = "\(contact.firstName) \(contact.lastName)"
        
        cell.contentConfiguration = content
        return cell
    }
}
