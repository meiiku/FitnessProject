//
//  ExercisesTableView.swift
//  FitnessProject
//
//  Created by Fedor on 11.04.2022.
//

import UIKit

class StatisticsTableView: UIView {

    // MARK: - UI Elements
    
    // table of exercises
    private let idExerciseCell = "exerciseCell"
    private var exercisesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false // отвечает за то, что таблицу можно потянуть, и увидеть за ней бэкграунд
        tableView.showsVerticalScrollIndicator = false // скрыть полосу прокрутки
        tableView.delaysContentTouches = false // отдавать приоритет нажатию на ячейку, а не прокрутке таблицы
        return tableView
    }()
    
// MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDelegates() {
        exercisesTableView.dataSource = self
        exercisesTableView.delegate = self
    }
}

// MARK: - Setup, constraints

extension StatisticsTableView {
    
    private func setViews() {
        self.addSubview(exercisesTableView)
        exercisesTableView.register(StatisticsTableViewCell.self, forCellReuseIdentifier: idExerciseCell)
    }
    
    func setConstraints() {
        exercisesTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDataSource

extension StatisticsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = exercisesTableView.dequeueReusableCell(withIdentifier: idExerciseCell, for: indexPath) as? StatisticsTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension StatisticsTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
