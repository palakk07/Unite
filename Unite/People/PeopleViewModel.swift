//
//  PeopleViewModel.swift
//  Unite
//
//  Created by Pranav Bhandari on 3/23/23.
//

import Foundation

enum PeopleFilterCategory : String, CaseIterable {
    case byAcademic = "By Academic"
    case byInterest = "By Interest"
}

enum AcademicCategory: String, CaseIterable, Identifiable {
    var id : String { UUID().uuidString }
    
    case science = "Science"
    case businessAndEconomics = "Business & Economics"
    case lettersArtsAndSocialSciences = "Letters, Arts & Social Sciences"
    case educationAndAlliedStudies = "Education &  Allied Studies"
    
}

enum InterestCategory: String, CaseIterable, Identifiable {
    var id : String { UUID().uuidString }
    case mentorship = "Mentorship"
    case hobbies = "Hobbies"
    case nationality = "Nationality"
}

enum AcademicMajors: String, CaseIterable, Identifiable {
    var id : String { UUID().uuidString }

    case baAnthropology = "B.A. Anthropology"
    case baArt = "B.A. Art"
    case bfaArt = "B.F.A. Art"
    case baCommunication = "B.A. Communication"
    case bsCriminalJustice = "B.S. Criminal Justice"
}

enum InterestHobbies: String, CaseIterable, Identifiable {
    var id : String { UUID().uuidString }
    
    case badminton = "Badminton"
    case cricket = "Cricket"
    case football = "Football"
    case dancing = "Dancing"
    case electronicMusic = "Electronic Music"
    case graphitte = "Graphitte"
}

final class PeopleViewModel {
    
    func getCategoryItems(for searchText: String) -> [Departments] {
        var arr = [Departments]()
        
        if searchText == "" {
            for val in Departments.allCases {
                arr.append(val)
            }
        } else {
            for val in Departments.allCases {
                if val.rawValue.contains(searchText) {
                    arr.append(val)
                }
            }
        }
        
        return arr
    }
    
    func getInterestItems(for searchText: String) -> [Interests] {
        var arr = [Interests]()
        
        if searchText == "" {
            for val in Interests.allCases {
                arr.append(val)
            }
        } else {
            for val in Interests.allCases {
                if val.rawValue.contains(searchText) {
                    arr.append(val)
                }
            }
        }
        
        return arr
    }
    
    func getMainInterestItems(for searchText: String) -> [MainInterests] {
        var arr = [MainInterests]()
        
        if searchText == "" {
            for val in MainInterests.allCases {
                arr.append(val)
            }
        } else {
            for val in MainInterests.allCases {
                if val.rawValue.contains(searchText) {
                    arr.append(val)
                }
            }
        }
        
        return arr
    }
    
    func getAcademicMajorsItems(for searchText: String, department: Departments) -> [Majors] {
        var arr = [Majors]()
        
        if searchText == "" {
            for val in department.graduateMajors {
                arr.append(val)
            }
        } else {
            for val in department.graduateMajors {
                if val.rawValue.contains(searchText) {
                    arr.append(val)
                }
            }
        }
        
        if searchText == "" {
            for val in department.underGraduateMajors {
                arr.append(val)
            }
        } else {
            for val in department.underGraduateMajors {
                if val.rawValue.contains(searchText) {
                    arr.append(val)
                }
            }
        }
        
        return arr
    }
    
    func getInterestHobbiesItems(for searchText: String) -> [InterestHobbies] {
        var arr = [InterestHobbies]()
        
        if searchText == "" {
            for val in InterestHobbies.allCases {
                arr.append(val)
            }
        } else {
            for val in InterestHobbies.allCases {
                if val.rawValue.contains(searchText) {
                    arr.append(val)
                }
            }
        }
        
        return arr
    }
}
