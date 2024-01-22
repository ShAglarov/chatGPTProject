//
//  ViewController.swift
//  chatGPTProject
//
//  Created by Shamil Aglarov on 22.01.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Массив для хранения заметок
    private var notes: [String] = []
    
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
        
        // Настройка UITableView
        tableView.backgroundColor = UIColor.white // Цвет фона
        tableView.separatorColor = UIColor.gray  // Цвет разделителей
    }
    
    @objc private func addNote() {
        let addNoteVC = AddNoteViewController()
        addNoteVC.onSave = { [weak self] noteText in
            self?.notes.append(noteText)
            self?.tableView.reloadData()
        }
        navigationController?.pushViewController(addNoteVC, animated: true)
    }
    
    // Возможно, вам понадобится метод для удаления заметки
    func deleteNote(at indexPath: IndexPath) {
        notes.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }

    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count // Количество строк соответствует количеству заметок
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row] // Текст каждой ячейки - это заметка
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteNote(at: indexPath) // Вызываем метод удаления заметки
        }
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

