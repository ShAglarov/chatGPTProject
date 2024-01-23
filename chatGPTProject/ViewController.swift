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
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(toggleEditingMode))
        
        // Настройка UITableView
        tableView.backgroundColor = UIColor.white // Цвет фона
        tableView.separatorColor = UIColor.gray  // Цвет разделителей
    }
    
    @objc private func toggleEditingMode() {
        tableView.setEditing(!tableView.isEditing, animated: true)
        navigationItem.leftBarButtonItem?.title = tableView.isEditing ? "Done" : "Edit"
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
            // Удалите заметку из массива и удалите соответствующую ячейку из таблицы
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true // Все ячейки могут быть отредактированы
    }

    // Если вы хотите добавить возможность перемещения ячеек
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true // Все ячейки могут быть перемещены
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.notes[sourceIndexPath.row]
        notes.remove(at: sourceIndexPath.row)
        notes.insert(movedObject, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Редактировать заметку", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.text = self.notes[indexPath.row]
        }

        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { [unowned self] _ in
            guard let updatedText = alertController.textFields?.first?.text, !updatedText.isEmpty else {
                return
            }
            self.notes[indexPath.row] = updatedText
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }

        alertController.addAction(saveAction)
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))

        present(alertController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
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

