//
//  PeopleDetailViewModel.swift
//  Unite
//
//  Created by Pranav Bhandari on 3/24/23.
//

import Foundation

//struct PeopleDetailModel: Hashable {
//    let name: String
//    let imgName: String
//    let commonInterest: String
//    let countryFlagImgName: String
//    let status: String
//    let major: String
//    let year: String
//    let department: String
//    let country: String
//    let semester: String
//    let languages: [String]
//    let sports: [String]
//    let interests: [String]
//}

final class PeopleDetailViewModel {
    var namesDict = [String: [PeopleDetailModel]]()
    var namesKey = ["A", "B"]
    var selectedModel: PeopleDetailModel?
    
    init() {
//        configureNamesDict()
    }
    
    func setSelectedModel(model: PeopleDetailModel) {
        selectedModel = model
    }
    
    func getSelectedModel() -> PeopleDetailModel {
        return selectedModel ?? PeopleDetailModel(name: "Alisson Arthur", imgName: "a1", commonInterest: "3+ Common Interests", countryFlagImgName: "usa", status: "Current", major: "B.A. Anthropology", year: "1st", department: "Art and Education", country: "United States of America", semester: "2nd Semester", languages: ["English", "German", "Spanish"], sports: ["Cricket", "Football", "Squash"], interests: ["Music", "Dance", "Painting", "Singing", "Shopping"])
    }
    
//    private func configureNamesDict() {
//        let a1 = PeopleDetailModel(name: "Alisson Arthur", imgName: "a1", commonInterest: "3+ Common Interests", countryFlagImgName: "usa", status: "Current", major: "B.A. Anthropology", year: "1st", department: "Art and Education", country: "United States of America", semester: "2nd Semester", languages: ["English", "German", "Spanish"], sports: ["Cricket", "Football", "Squash"], interests: ["Music", "Dance", "Painting", "Singing", "Shopping"])
//        let a2 = PeopleDetailModel(name: "Alexander Markus", imgName: "a2", commonInterest: "1+ Common Interests", countryFlagImgName: "usa", status: "Current", major: "B.A. Anthropology", year: "1st", department: "Art and Education", country: "United States of America", semester: "2nd Semester", languages: ["English", "Spanish"], sports: ["Football", "Squash"], interests: ["Music", "Painting", "Shopping"])
//        let a3 = PeopleDetailModel(name: "Anand Bhandari", imgName: "a3", commonInterest: "2+ Common Interests", countryFlagImgName: "india", status: "Current", major: "B.A. Anthropology", year: "2nd", department: "Art and Education", country: "India", semester: "4th Semester", languages: ["English", "Hindi", "German"], sports: ["Cricket", "Football", "Squash", "Tennis"], interests: ["Music", "Dance", "Painting"])
//
//        namesDict["A"] = [a1, a2, a3]
//
//        let b1 = PeopleDetailModel(name: "Branson Moody", imgName: "a1", commonInterest: "4+ Common Interests", countryFlagImgName: "usa", status: "Current", major: "B.A. Anthropology", year: "1st", department: "Art and Education", country: "United States of America", semester: "2nd Semester", languages: ["English"], sports: ["Cricket", "Squash"], interests: ["Singing", "Shopping"])
//        let b2 = PeopleDetailModel(name: "Beyonce Thomas", imgName: "a1", commonInterest: "1+ Common Interests", countryFlagImgName: "usa", status: "Current", major: "B.A. Anthropology", year: "2nd", department: "Art and Education", country: "United States of America", semester: "2nd Semester", languages: ["English", "German"], sports: ["Cricket", "Football", "Tennis"], interests: ["Music", "Dance", "Shopping"])
//
//        namesDict["B"] = [b1, b2]
//    }
    
    func getFilteredKeys(for searchText: String) -> [String] {
        var keys = [String]()
        
        if searchText == "" {
            for (key, _) in namesDict {
                keys.append(key)
            }
        } else {
            for (key, val) in namesDict {
                for value in val {
                    if (value.name.contains(searchText) || value.year.contains(searchText)) && !keys.contains(key) {
                        keys.append(key)
                    }
                }
            }
        }
        
        return keys.sorted()
    }
    
    func getFilteredPeople(for searchText: String, section: String) -> [PeopleDetailModel] {
        var people = [PeopleDetailModel]()
        
        if searchText == "" {
            people = namesDict[section] ?? []
        } else {
            for value in namesDict[section] ?? [] {
                if (value.name.contains(searchText) || value.year.contains(searchText)) && !people.contains(value) {
                    people.append(value)
                }
            }
        }
        
        return people
    }
}
