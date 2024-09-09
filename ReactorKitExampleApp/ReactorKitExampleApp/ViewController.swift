//
//  ViewController.swift
//  ReactorKitExampleApp
//
//  Created by peppermint100 on 9/9/24.
//

import UIKit
import SnapKit
import ReactorKit
import RxCocoa

class ViewController: UIViewController, View {
    
    private let decreaseButton: UIButton = .init()
    private let increaseButton: UIButton = .init()
    private let numberLabel: UILabel = .init()
    private let myReactor = MyReactor()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind(reactor: myReactor)
    }
}

extension ViewController {
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        
        let buttonStackView = UIStackView()
        buttonStackView.spacing = 10
        buttonStackView.distribution = .fillEqually
        view.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(numberLabel).offset(20)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        buttonStackView.addArrangedSubview(decreaseButton)
        buttonStackView.addArrangedSubview(increaseButton)
        
        numberLabel.text = "\(0)"
        numberLabel.textColor = .label
        increaseButton.setImage(UIImage(systemName: "plus"), for: .normal)
        decreaseButton.setImage(UIImage(systemName: "minus"), for: .normal)
    }
    
    func bind(reactor: MyReactor) {
        reactor.state
            .map { "\($0.number)" }
            .bind(to: numberLabel.rx.text)
            .disposed(by: disposeBag)
        
        decreaseButton.rx.tap
            .map { Reactor.Action.decreaseButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        increaseButton.rx.tap
            .map { Reactor.Action.increaseButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}

final class MyReactor: Reactor {
    
    var initialState: State = State()
    
    struct State {
        var number = 0
    }
    
    enum Action {
        case increaseButtonTapped
        case decreaseButtonTapped
    }
    
    enum Mutation {
        case increaseNumber
        case decreaseNumber
    }
}

extension MyReactor {
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .increaseNumber:
            newState.number += 1
        case .decreaseNumber:
            newState.number -= 1
        }
        return newState
    }
}

extension MyReactor {
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .increaseButtonTapped:
            return Observable.just(Mutation.increaseNumber)
        case .decreaseButtonTapped:
            return Observable.just(Mutation.decreaseNumber)
        }
    }
}
