//
//  ContactListViewController.swift
//  ContactList
//
//  Created by Ast on 05.03.2025.
//

import UIKit

final class ContactListViewController: UITableViewController {
    
    // MARK: - Private Properties
    private var contactList = RandomPersonGenerator.generateRandomPerson(
        count: 15
    )
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
    }
    
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
    ) {
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        let contactDetailsVC = segue.destination as? ContactDetailsViewController
        contactDetailsVC?.contact = contactList[indexPath.row]
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back")
    }
}

// MARK: - UITableViewDataSource
extension ContactListViewController {
    
    // MARK: - Override Methods
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        contactList.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "contactCell",
            for: indexPath
        )
        let contact = contactList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = "\(contact.firstName) \(contact.lastName)"
        //fullName
        
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        moveRowAt sourceIndexPath: IndexPath,
        to destinationIndexPath: IndexPath
    ) {
        let contact = contactList.remove(
            at: sourceIndexPath.row
        )
        contactList
            .insert(
                contact,
                at: destinationIndexPath.row
            )
    }
}

// MARK: - UITableViewDelegate
extension ContactListViewController {
    
    // MARK: - Override Methods
    override func tableView(
        _ tableView: UITableView,
        editingStyleForRowAt indexPath: IndexPath
    ) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(
        _ tableView: UITableView,
        shouldIndentWhileEditingRowAt indexPath: IndexPath
    ) -> Bool {
        false
    }
}
