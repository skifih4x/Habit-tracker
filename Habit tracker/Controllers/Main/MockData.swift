//
//  MockData.swift
//  Habit tracker
//
//  Created by Alexander Altman on 27.01.2023.
//

import UIKit

struct MockData {
    
    static let shared = MockData()
    
    private let firstSection: ListSection = {
        .first([
            .init(image: UIImage(named: "HabitIcon")!),
            .init(image: UIImage(named: "HabitIcon")!),
            .init(image: UIImage(named: "HabitIcon")!),
            .init(image: UIImage(named: "HabitIcon")!),
            .init(image: UIImage(named: "HabitIcon")!),
            .init(image: UIImage(named: "HabitIcon")!),
            .init(image: UIImage(named: "HabitIcon")!),
            .init(image: UIImage(named: "HabitIcon")!),
            .init(image: UIImage(named: "HabitIcon")!),
            .init(image: UIImage(named: "HabitIcon")!),
        ])
    }()
    
    var pageData: [ListSection] {
        [firstSection]
    }
}
