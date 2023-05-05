//
//  FirstProfileViewModel.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/30/23.
//

import Foundation

final class FirstProfileViewModel {
    init() {}
    
    func getMajorsList(for studentStatus: StudentStatus, department: Departments) -> [String] {
        switch studentStatus {
        case .underGraduate:
            return getUnderGraduateMajorsList(for: department)
        case .graduate:
            return getGraduateMajorsList(for: department)
        case .alumni:
            return getAlumniMajors()
        case .needMentor, .becomeMentor:
            return []
        }
    }
    
    private func getUnderGraduateMajorsList(for department: Departments) -> [String] {
        var majors = [String]()
        for m in department.underGraduateMajors {
            majors.append(m.rawValue)
        }
        
        return majors
    }
    
    private func getGraduateMajorsList(for department: Departments) -> [String] {
        var majors = [String]()
        for m in department.graduateMajors {
            majors.append(m.rawValue)
        }
        let user = UserData.shared
        print(user.email)
        return majors
    }
    
    private func getAlumniMajors() -> [String] {
        var majors = [String]()
        
        for m in Majors.allCases {
            majors.append(m.rawValue)
        }
        
        return majors
    }
}
