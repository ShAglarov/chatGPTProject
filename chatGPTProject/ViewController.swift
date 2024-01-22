//
//  ViewController.swift
//  chatGPTProject
//
//  Created by Shamil Aglarov on 22.01.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Создаем экземпляр UITableView
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Инициализируем и настраиваем tableView
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // Добавляем tableView как subview
        view.addSubview(tableView)
        
        // Настройка Auto Layout
        setupTableViewConstraints()
        
        // Настройка кнопки добавления заметок
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addNote)
        )
    }
    
    @objc private func addNote() {
        // Здесь логика добавления новой заметки
        print("Добавление новой заметки")
    }

    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Верните количество строк в вашем разделе
        return 10 // Примерное значение
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Создаем и возвращаем ячейку
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }

    // MARK: - UITableViewDelegate Methods
    // Здесь можно добавить методы, относящиеся к делегату UITableView

    // MARK: - Auto Layout Setup
    private func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}

