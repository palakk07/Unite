//
//  PeopleDetailedViewModel.swift
//  Unite
//
//  Created by Pranav Bhandari on 5/4/23.
//

import Foundation
import SwiftUI

struct PeopleDetailModel: Hashable {
    let name: String
    let imgName: String
    let commonInterest: String
    let countryFlagImgName: String
    let status: String
    let major: String
    let year: String
    let department: String
    let country: String
    let semester: String
    let languages: [String]
    let sports: [String]
    let interests: [String]
}

class PeopleDetailedViewModel {
    let major: Majors
    private let users = Users().users
    private let currentUser = UserData.shared
    
    init(major: Majors) {
        self.major = major
    }
    
    func getFilteredUsers() -> [UserRecommendation] {
        var userArray = [UserRecommendation]()
        
        for user in users {
            if user.major == major.rawValue {
                var common = 0
                
                common += getCommonInterests(user: user)
                
                if user.state == currentUser.state {
                    common += 1
                }
                
                if user.country == currentUser.country {
                    common += 1
                }
                
                common += getCommonLanguages(user: user)
                
                
                userArray.append(UserRecommendation(user: user, common: common))
            }
        }
        
        return userArray.sorted { $0.common > $1.common }
    }
    
    private func getFilteredUsers1() -> [UserRecommendation] {
        var map = [Int: [UserRecommendation]]()
        var recos = [UserRecommendation]()
        
        for user in users {
            var common = 0
            
            common += getCommonInterests(user: user)
            
            if user.state == currentUser.state {
                common += 1
            }
            
            if user.country == currentUser.country {
                common += 1
            }
            
            common += getCommonLanguages(user: user)
            
            
            if common > 0 {
                map[common, default: []].append(UserRecommendation(user: user, common: common))
            }
        }
        
        let sortedMap = map.sorted(by: { $0.0 > $1.0 })
        
        for (_, value) in sortedMap {
            recos += value
        }
        
        return recos
    }
    
    private func getCommonInterests(user: User) -> Int {
        var count = 0
        for interest in Interests.allCases {
            if user.interests.contains(interest.rawValue) && currentUser.interests.contains(interest.rawValue) {
                count += 1
            }
        }
        
        return count
    }
    
    private func getCommonLanguages(user: User) -> Int {
        var count = 0
        for language in user.languages {
            if currentUser.languages.contains(language) {
                count += 1
            }
        }
        
        return count
    }
}
