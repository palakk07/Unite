//
//  DiscoverViewModel.swift
//  Unite
//
//  Created by Pranav Bhandari on 5/1/23.
//

import Foundation

struct UserRecommendation: Hashable {
    let user: User
    let common: Int
}

struct Groups: Hashable {
    let groupName: String
    let memberCount: String
    let imgName: String
}

class DiscoverViewModel {
    let users = Users().users
    let currentUser = UserData.shared
    let groups: [Groups] = [
        Groups(groupName: "Badminton", memberCount: "150", imgName: "discover_badminton"),
        Groups(groupName: "Swimming", memberCount: "1k", imgName: "discover_swimming"),
        Groups(groupName: "Photography", memberCount: "2569", imgName: "discover_photography"),
        Groups(groupName: "Gaming", memberCount: "3.1k", imgName: "discover_gaming")
    ]

    func getCohorts() -> [User] {
        var cohorts = [User]()
        
        for user in users {
            if user.major == currentUser.major &&
                user.department == currentUser.department &&
                user.joiningYear == currentUser.joiningYear &&
                user.email != currentUser.email {
                cohorts.append(user)
            }
        }
        
        return cohorts
    }
    
    func getRecommendations() -> [UserRecommendation] {
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
        
            
            if common > 0 && user.email != currentUser.email {
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
