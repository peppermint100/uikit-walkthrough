//
//  CompletedTodoTableViewCell.swift
//  TodoListCodeData
//
//  Created by peppermint100 on 2023/06/17.
//

import UIKit

class CompletedTodoTableViewCell: UITableViewCell {
    
    static let identifier = "CompletedTodoTableViewCell"
    
    var todo: TodoListItem? {
        didSet {
            guard let todo = todo else { return }
            titleLabel.text = todo.name
            createdAtLabel.text = todo.createdAt?.toString()
        }
    }
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        return sv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let createdAtLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
        applyConstraints()
    }
    
    private func setUpUI() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(createdAtLabel)
    }
    
    private func applyConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        createdAtLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let stackViewConstraints = [
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        
        let titleLabelConstraints = [
            titleLabel.bottomAnchor.constraint(equalTo: createdAtLabel.topAnchor, constant: -5)
        ]
        
        NSLayoutConstraint.activate(stackViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
