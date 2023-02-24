//
//  MainViewController.swift
//  Habit tracker
//
//  Created by Артем Орлов on 23.01.2023.
//

import UIKit

final class MainViewController: UIViewController {

    let customAlert = TutorialAlert()
    
    
    private let testButton: UIButton = {
       let button = UIButton()
        button.setTitle("TEST ARERT", for: .normal)
        button.setBackgroundColor(color: .green, forState: .normal)
        button.addTarget(self, action: #selector(testAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    """
//    Чтобы удалить привычку, свайпните влево
//    по карточке привычки
//    """
    
    @objc private func testAlert() {
        customAlert.showAlert(title: "Test title",
                              message: "Test message",
                              viewController: self)
    }
    
    private lazy var habitLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои привычки"
        label.font = UIFont(name: Theme.fontExtraBold, size: view.frame.height * Theme.fontSize22)
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
        label.font = UIFont(name: Theme.fontName, size: view.frame.height * Theme.fontSize16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var habitTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.rowHeight = view.frame.height * 0.12095
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
        label.font = UIFont(name: Theme.fontName, size: view.frame.height * Theme.fontSize14)
        label.numberOfLines = 0
        label.textAlignment  = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var arrowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrow")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "mainColor")

        layout()
        
//        if habitTableView.visibleCells.isEmpty {
//            habitTableView.backgroundColor = .clear
//        } else {
//            habitTableView.backgroundColor = Theme.backgroundLight
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        if habitTableView.visibleCells.isEmpty {
//            habitTableView.backgroundColor = .clear
//        } else {
//            habitTableView.backgroundColor = Theme.backgroundLight
//        }
    }

    private func layout() {

        view.addSubview(habitLabel)
        view.addSubview(topImage)
        view.addSubview(currentDataLabel)
        view.addSubview(mainImage)
        view.addSubview(infoHabitLabel)
        view.addSubview(arrowImage)
        view.addSubview(habitTableView)
        
        view.addSubview(testButton) //Delete after test

        NSLayoutConstraint.activate([
            habitLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.06263),
            habitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            habitLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            topImage.topAnchor.constraint(equalTo: habitLabel.bottomAnchor, constant: view.frame.height * 0.02591),
            topImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            currentDataLabel.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: view.frame.height * 0.00539),
            currentDataLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            currentDataLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            habitTableView.topAnchor.constraint(equalTo: topImage.bottomAnchor),
            habitTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            habitTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            habitTableView.bottomAnchor.constraint(equalTo: testButton.topAnchor, constant: 0), //change back to view.bottomAnchor, constant: 0

            mainImage.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: view.frame.height * 0.04319),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainImage.heightAnchor.constraint(equalToConstant: view.frame.height / 3),
            mainImage.widthAnchor.constraint(equalToConstant: view.frame.height / 3),

            infoHabitLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: view.frame.height * 0.01727),
            infoHabitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoHabitLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            arrowImage.topAnchor.constraint(equalTo: infoHabitLabel.bottomAnchor, constant: view.frame.height * 0.00539),
            arrowImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: view.frame.height * -0.18038),
            arrowImage.heightAnchor.constraint(equalToConstant: view.frame.height * 0.16198),
            
            
            
            //test code. Delete after test
            testButton.topAnchor.constraint(equalTo: habitTableView.bottomAnchor, constant: 30),
            testButton.heightAnchor.constraint(equalToConstant: 50),
            testButton.widthAnchor.constraint(equalToConstant: 200)
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
        maskLayer.cornerRadius = 10
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding / 2)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

}

import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 12 Pro Max")
            .previewDisplayName("iPhone 12 Pro Max")
        
        ContainterView().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone SE (3rd generation)")
            .previewDisplayName("iPhone SE (3rd generation)")
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        let listVC = MainViewController()
        func makeUIViewController(context:
                                  UIViewControllerRepresentableContext<ListProvider.ContainterView>) -> MainViewController {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController:
                                    ListProvider.ContainterView.UIViewControllerType, context:
                                    UIViewControllerRepresentableContext<ListProvider.ContainterView>) {
        }
    }
}
