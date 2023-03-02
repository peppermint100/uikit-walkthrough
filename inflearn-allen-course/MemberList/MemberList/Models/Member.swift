//
//  Member.swift
//  MemberList
//
//  Created by peppermint100 on 2023/03/01.
//

import UIKit

// DetailViewController의 delegate의 약한 참조를 위해
// class에서만 채택을 할 수 있도록 AnyObject를 붙임
protocol MemberDelegate: AnyObject {
    func addMember(_ member: Member)
    func updateMember(index: Int, _ member: Member)
}

struct Member {
    
    // guard let name = name => 즉 두번째 나오는 name = self.name이다.
    // self.name이 nil인지 아닌지 체크한다.
    lazy var memberImage: UIImage? = {
        guard let name = name else {
            return UIImage(systemName: "person")
        }
        
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    // 타입 저장 속성, 모든 인스턴스들이 공유
    // Member의 특정 인스턴스가 아닌 Member 구조체 자체에 저장되는 구조로 보임
    static var memberNumbers: Int = 0
    
    let memberId: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    init(name: String?, age: Int?, phone: String?, address: String?) {
        self.memberId = Member.memberNumbers
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        Member.memberNumbers += 1
    }
}
