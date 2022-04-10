//
//  CalendarView.swift
//  FitnessProject
//
//  Created by Fedor on 06.04.2022.
//

import UIKit

class CalendarView: UIView {
    
    
    // MARK: - UI Elements
    
    // collection
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 3
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .none
        
        return collectionView
    }()
    
    let idCalendarCell = "calendarCell"
    
    
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
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - Setup, constraints

extension CalendarView {
    
    private func setViews() {
        self.backgroundColor = Constants.primaryColor
        self.layer.cornerRadius = 10
        
        self.addSubview(collectionView)
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: idCalendarCell)
    }
    
    private func setConstraints() {
        
        // collection view
        collectionView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(105)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension CalendarView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCalendarCell, for: indexPath) as? CalendarCollectionViewCell
        else { return UICollectionViewCell() }
        self.layer.cornerRadius = 10
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension CalendarView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell tapped")
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CalendarView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 8,
               height: collectionView.frame.height)
    }
}


