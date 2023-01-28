//
//  MainViewController.swift
//  Habit tracker
//
//  Created by Артем Орлов on 23.01.2023.
//

import UIKit

final class MainViewController: UIViewController {

    private lazy var habitLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои привычки"
        label.font = UIFont(name: "Manrope-ExtraBold", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var topImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image_hills")
        image.clipsToBounds = true
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var currentDataLabel: UILabel = {
        let label = UILabel()
        let date = String(DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none))
        label.text = date
        label.font = UIFont(name: "Manrope-Regular", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var habitTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.rowHeight = 112
        table.backgroundColor = .none
        table.delegate = self
        table.dataSource = self
        table.register(CellHabit.self, forCellReuseIdentifier: CellHabit.indetifer)
        table.register(DoneHabitCell.self, forCellReuseIdentifier: DoneHabitCell.indetifier)
        table.register(MissedHobitCell.self, forCellReuseIdentifier: MissedHobitCell.indetifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    private lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mainImage")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var infoHabitLabel: UILabel = {
        let label = UILabel()
        label.text =
                """
                У вас пока нет привычек.
                Чтобы добавить привычку,
                нажмите «+»
                """
        label.font = UIFont(name: "Manrope-Regular", size: 14)
        label.numberOfLines = 0
        label.textAlignment  = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var arrowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrow")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "mainColor")
        if habitTableView.visibleCells.isEmpty {
            habitTableView.backgroundColor = .clear
        } else {
            habitTableView.backgroundColor = Theme.backgroundLight
        }
        layout()

    }

    private func layout() {

        view.addSubview(habitLabel)
        view.addSubview(topImage)
        view.addSubview(currentDataLabel)
        view.addSubview(mainImage)
        view.addSubview(infoHabitLabel)
        view.addSubview(arrowImage)
        view.addSubview(habitTableView)

        NSLayoutConstraint.activate([
            habitLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            habitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            habitLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            topImage.topAnchor.constraint(equalTo: habitLabel.bottomAnchor, constant: 24),
            topImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            currentDataLabel.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 5),
            currentDataLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            currentDataLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            habitTableView.topAnchor.constraint(equalTo: topImage.bottomAnchor),
            habitTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            habitTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            habitTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),

            mainImage.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 40),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            infoHabitLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 16),
            infoHabitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoHabitLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            arrowImage.topAnchor.constraint(equalTo: infoHabitLabel.bottomAnchor, constant: 5),
            arrowImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130)
        ])
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellHabit.indetifer, for: indexPath) as? CellHabit else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DoneHabitCell.indetifier, for: indexPath) as? DoneHabitCell else { return UITableViewCell()}
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MissedHobitCell.indetifier, for: indexPath) as? MissedHobitCell else { return UITableViewCell()}
            return cell
        }
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 8

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10    //if you want round edges
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer

        switch indexPath.row {
        case 0: break
        case 1: break
        default: cell.alpha = 0.5
        }
    }


    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "") {  _, view, complete in

            tableView.deleteRows(at: [indexPath], with: .automatic)
            complete(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = Theme.deleteBackground
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

}

import SwiftUI

struct PeopleVCProvider1: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 13 Pro Max")
    }

    struct Container: UIViewControllerRepresentable {

        let tabBarVC = TabBarContoller()

        func makeUIViewController(context: Context) -> some UIViewController {
            tabBarVC
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        }
    }
}
