//
//  ContactListViewController.swift
//  ContactList
//
//  Created by Ast on 05.03.2025.
//

import UIKit

final class ContactListViewController: UITableViewController {
    
    var persons: [Person]!

    // MARK: - Navigation Перехож по сигвэю на след экран Деталей
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as? ContactDetailsViewController
            detailVC?.person = persons[indexPath.row]
        }
    }
}

// MARK: - UITableViewDataSource
extension ContactListViewController {
    //Создали нужное количество строк
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    //Заполнили строки содержимым из DataStore
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let person = persons[indexPath.row]
        
        content.text = person.fullName
        cell.contentConfiguration = content
        
        return cell
    }
}

