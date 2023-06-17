//
//  TodoTableViewCell.swift
//  TodoListCodeData
//
//  Created by peppermint100 on 2023/06/11.
//

import UIKit

protocol TodoTableViewCellDelegate: AnyObject {
    func onTapToggle(item: TodoListItem)
}

class TodoTableViewCell: UITableViewCell {
    
    weak var delegate: TodoTableViewCellDelegate?
    static let identifier = "TodoTableViewCell"
    
    var todo: TodoListItem? {
        didSet {
            guard let todo = todo else { return }
            titleLabel.text = todo.name
            createdAtLabel.text = todo.createdAt?.toString()
        }
    }
    
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
    
    let completeButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let textLabelView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textLabelView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(createdAtLabel)
        contentView.addSubview(completeButton)

        applyConstraints()
        setUpCompleteButton()
    }
    
    func setUpCompleteButton() {
        let checkBoxConfig = UIImage.SymbolConfiguration(pointSize: 12, weight: .bold, scale: .large)
        let checkBoxImage = UIImage(systemName: "checkmark", withConfiguration: checkBoxConfig)?
            .withPadding(top: 20, leading: 20, bottom: 20, trailing: 20).withTintColor(.systemBlue)
        completeButton.setImage(checkBoxImage, for: .normal)
        completeButton.addTarget(self, action: #selector(onTapToggleButtonTarget), for: .touchUpInside)
    }
    
    func applyConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        createdAtLabel.translatesAutoresizingMaskIntoConstraints = false
        completeButton.translatesAutoresizingMaskIntoConstraints = false
        textLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        let completeButtonConstaints = [
            completeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            completeButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            completeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            completeButton.trailingAnchor.constraint(equalTo: textLabelView.leadingAnchor)
        ]
        let textLabelViewConstraints = [
            textLabelView.topAnchor.constraint(equalTo: contentView.topAnchor),
            textLabelView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textLabelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: textLabelView.topAnchor, constant: 5),
            titleLabel.bottomAnchor.constraint(equalTo: createdAtLabel.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: textLabelView.leadingAnchor)
        ]
        let createdLanelConstraints = [
            createdAtLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            createdAtLabel.bottomAnchor.constraint(equalTo: textLabelView.bottomAnchor),
            createdAtLabel.leadingAnchor.constraint(equalTo: textLabelView.leadingAnchor)
        ]
        
        NSLayoutConstraint.activate(textLabelViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(createdLanelConstraints)
        NSLayoutConstraint.activate(completeButtonConstaints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onTapToggleButtonTarget() {
        if let todo {
            delegate?.onTapToggle(item: todo)
        } else { return }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
