//
//  UserData.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/30/23.
//

import SwiftUI

final class UserData {
    
    static let shared = UserData()
    var email = ""
    var firstName = ""
    var lastName = ""
    var imgName = "default_user"
    var department = ""
    var major = ""
    var joiningYear = ""
    var interests = [String]()
    var country = ""
    var state = ""
    var languages = [String]()
    
    func saveUser() {
        let currentUser = CurrentUser(email: email, firstName: firstName, lastName: lastName, imgName: imgName, department: department, major: major, joiningYear: joiningYear, interests: interests, country: country, state: state, languages: languages)
        currentUser.saveUser()
    }
    
    func getSavedUsers() -> [User] {
        let userDefaults = UserDefaults.standard
        if let savedData = userDefaults.object(forKey: "savedUser") as? Data {
            
            do {
                // 2
                let savedContacts = try JSONDecoder().decode([User].self, from: savedData)
                return savedContacts
            } catch {
                // Failed to convert Data to Contact
                print(error)
            }
        }
        
        return []
    }
    
    func fetchLoginUserData() {
        let userDefaults = UserDefaults.standard
        if let savedData = userDefaults.object(forKey: "savedUser") as? Data {
            
            do {
                // 2
                let savedContacts = try JSONDecoder().decode([User].self, from: savedData)
                for user in savedContacts {
                    if user.email == email {
                        firstName = user.firstName
                        lastName = user.lastName
                        imgName = user.imgName
                        department = user.department
                        major = user.major
                        joiningYear = user.joiningYear
                        interests = user.interests
                        country = user.country
                        state = user.state
                        languages = user.languages
                    }
                }
            } catch {
                // Failed to convert Data to Contact
                print(error)
            }
        }
    }
}

struct CurrentUser: Codable {
    var email: String
    var firstName: String
    var lastName: String
    var imgName: String
    var department: String
    var major: String
    var joiningYear: String
    var interests: [String]
    var country: String
    var state: String
    var languages: [String]
    var countryFlag: String
    
    init(email: String, firstName: String, lastName: String, imgName: String, department: String, major: String, joiningYear: String, interests: [String], country: String, state: String, languages: [String]) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.imgName = imgName
        self.department = department
        self.major = major
        self.joiningYear = joiningYear
        self.interests = interests
        self.country = country
        self.state = state
        self.languages = languages
        self.countryFlag = ""
    }
    
    func saveUser() {
        var userArray = loadUsers()
        let user = User(email: email, firstName: firstName, lastName: lastName, imgName: imgName, interests: interests, major: major, department: department, joiningYear: joiningYear, languages: languages, country: country, state: state, countryFlagName: countryFlag)
        do {
            // 1
            userArray.append(user)
            let userDefaults = UserDefaults.standard
            let encodedData = try JSONEncoder().encode(userArray)
            
            // 2
            userDefaults.set(encodedData, forKey: "savedUser")
            
        } catch {
            // Failed to encode Contact to Data
        }
    }
    
    func loadUsers() -> [User] {
        let userDefaults = UserDefaults.standard
        if let savedData = userDefaults.object(forKey: "savedUser") as? Data {
            
            do {
                // 2
                let savedContacts = try JSONDecoder().decode([User].self, from: savedData)
                return savedContacts
            } catch {
                // Failed to convert Data to Contact
                print(error)
            }
        }
        
        return []
    }
}
