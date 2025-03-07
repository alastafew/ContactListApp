//
//  SectionTableViewController.swift
//  ContactListApp
//
//  Created by Ast on 07.03.2025.
//

import UIKit

final class SectionTableViewController: UITableViewController {
    
    var persons: [Person]!
}

// MARK: - UITableViewDataSource
extension SectionTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        persons[section].name
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let person = persons[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            content.text = person.fullName
            content.image = UIImage(systemName: "person.circle")
        case 1:
            content.text = person.phoneNumber
            content.image = UIImage(systemName: "phone.circle.fill")
        default:
            content.text = person.email
            content.image = UIImage(systemName: "tray.full")
        }
        
        cell.contentConfiguration = content
                
        return cell
    }
}

// MARK: - UITableViewDelegate Отключаем выделение строк при тапе
//extension SectionTableViewController {
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//}

