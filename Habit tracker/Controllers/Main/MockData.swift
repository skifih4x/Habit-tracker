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
            .init(label: " ", image: UIImage(named: "HabitIcon")!),
            .init(label: " ", image: UIImage(named: "HabitIcon")!),
            .init(label: " ", image: UIImage(named: "HabitIcon")!),
            .init(label: " ", image: UIImage(named: "HabitIcon")!),
            .init(label: " ", image: UIImage(named: "HabitIcon")!),
            .init(label: " ", image: UIImage(named: "HabitIcon")!),
            .init(label: " ", image: UIImage(named: "HabitIcon")!),
            .init(label: " ", image: UIImage(named: "HabitIcon")!),
            .init(label: " ", image: UIImage(named: "HabitIcon")!),
            .init(label: " ", image: UIImage(named: "HabitIcon")!),
        ])
    }()
    
    private let secondSection: ListSection = {
        .second([
            .init(label: " ", image: nil)
        ])
    }()
    
    var pageData: [ListSection] {
        [firstSection, secondSection]
    }
}
