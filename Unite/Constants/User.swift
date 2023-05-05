//
//  User.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/30/23.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    var id = UUID()
    let email: String
    let firstName: String
    let lastName: String
    let imgName: String
    let interests: [String]
    let major: String
    let department: String
    let joiningYear: String
    let languages: [String]
    let country: String
    let state: String
    let countryFlagName: String
}

class Users {
    var users = [User]()

    init() {
        
        let savedUsers = UserData.shared.getSavedUsers()
        
        users = savedUsers
        
        appendUser(email: "", firstName: "Xiqian", lastName: "Li", imgName: "default_user", interests: ["Gymnastics", "Swimming", "Painting", "Drawing", "Dancing", "DIY (Do-It-Youself) projects", "Traveling", "Volunteering", "Learning a new language", "Video Games", "Watching movies or TV shows"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2021 Fall", languages: ["English", "Mandarin Chinese"], country: "", state: "", countryFlagName: "")
        
    appendUser(email: "", firstName: "Shravan", lastName: "G", imgName: "shravan", interests: ["Football (Soccer)", "Cricket", "Volleyball", "Kabaddi", "Cycling", "Tennis", "Table Tennis", "Badminton", "Swimming", "Kabaddi", "Diving", "Bungee Jumping", "Skydiving", "Painting", "Photography", "Hiking", "Camping", "Traveling", "Rock climbing", "Scuba diving"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2021 Fall", languages: ["English", "Hindi", "Kannada", "Tamil", "Telugu"], country: "India", state: "Karnataka", countryFlagName: "india")

    appendUser(email: "", firstName: "Ferdi", lastName: "Agusta", imgName: "default_user", interests: ["Snowboarding", "Cross-fit", "Board Games", "Card Games", "Watching movies or TV shows"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2021 Fall", languages: ["English", "Hindi"], country: "", state: "", countryFlagName: "")

    appendUser(email: "", firstName: "Ayushi", lastName: "Ranjan", imgName: "ayushi", interests: ["Cycling", "Swimming", "Kitesurfing", "Scuba diving", "Rock Climbing", "Paragliding", "Reading", "Writing", "Playing a musical instrument", "Singing", "Dancing", "Cooking", "Yoga", "Meditation", "Pottery"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2021 Fall", languages: ["English", "Hindi"], country: "", state: "", countryFlagName: "")

    appendUser(email: "", firstName: "Khadija", lastName: "Badsha", imgName: "khadija", interests: ["Badminton", "Swimming", "Kickboxing", "Painting", "Drawing", "Baking", "Gardening", "Crafting", "Woodworking", "DIY (Do-It-Yourself) projects", "Board Games", "Card Games", "Puzzle-solving", "Volunteering", "Video Games"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2021 Fall", languages: ["English", "Hindi", "Gujarati"], country: "India", state: "Maharashtra", countryFlagName: "india")

    appendUser(email: "", firstName: "Jonathan", lastName: "Crescenzo", imgName: "default_user", interests: ["Table Tennis", "Golf", "Swimming", "Triathlon", "Martial Arts", "Reading", "Writing", "Watching movies or TV shows", "Collecting and caring for plants"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2022 Fall", languages: ["English"], country: "", state: "", countryFlagName: "")

    appendUser(email: "", firstName: "Divya", lastName: "Mittal", imgName: "default_user", interests: ["Badminton", "Swimming", "Singing", "Hiking", "DIY (Do-It-Yourself) projects", "Yoga", "Meditation", "Board Games", "Card Games", "Traveling"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2022 Fall", languages: ["English", "Hindi"], country: "", state: "", countryFlagName: "")

    appendUser(email: "", firstName: "Palak", lastName: "Kothari", imgName: "palak", interests: ["Cycling", "Badminton", "Swimming", "Reading", "Painting", "DIY (Do-It-Yourself) projects", "Board Games", "Card Games", "Traveling", "Pottery"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2021 Fall", languages: ["English", "Hindi"], country: "India", state: "Rajasthan", countryFlagName: "india")

    appendUser(email: "", firstName: "Harry", lastName: "Sio", imgName: "default_user", interests: ["Football (Soccer)", "Reading"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2021 Fall", languages: ["English"], country: "", state: "", countryFlagName: "")

    appendUser(email: "", firstName: "Alakananda", lastName: "Thurlapati", imgName: "alka", interests: ["Quidditch", "Martial Arts", "Bungee Jumping", "Paragliding", "Painting", "Drawing", "Gardening", "Crafting", "Yoga"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2021 Fall", languages: ["English", "Hindi", "Telugu"], country: "India", state: "", countryFlagName: "india")

    appendUser(email: "", firstName: "Shruti", lastName: "Umrotkar", imgName: "default_user", interests: ["Table Tennis", "Badminton", "Painting", "Drawing", "Singing", "Cooking", "Baking", "Watching movies or TV shows"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2021 Fall", languages: ["English", "Hindi"], country: "India", state: "Maharashtra", countryFlagName: "india")

    appendUser(email: "", firstName: "Gabriela", lastName: "Naoum", imgName: "gabi", interests: ["Football (Soccer)", "Quidditch", "Formula 1 Racing", "Drag Racing", "Ballet", "Reading", "Photography", "Dancing", "Cooking", "Traveling", "Learning a new language", "Watching movies or TV shows"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2021 Fall", languages: ["English", "Portuguese"], country: "Brazil", state: "Goiás", countryFlagName: "brazil")

    appendUser(email: "", firstName: "Pedro", lastName: "Fernando", imgName: "pedro", interests: ["Kickboxing", "NASCAR", "MotoGP", "Rally Racing", "Skateboarding", "Reading", "Drawing", "Hiking"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2021 Fall", languages: ["English", "Spanish"], country: "Colombia", state: "Cundinamarca", countryFlagName: "colombia")

    appendUser(email: "", firstName: "Akhilesh", lastName: "Palanikumar Naidu", imgName: "akhil", interests: ["Football (Soccer)", "Cricket", "Cycling", "Swimming", "Canoeing and Kayaking", "Martial Arts", "Reading", "Drawing", "Dancing", "Cooking", "Hiking", "Traveling", "Video Games", "Watching movies or TV shows"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2022 Fall", languages: ["English", "Hindi", "Tamil", "Malayalam"], country: "India", state: "Maharashtra", countryFlagName: "india")

    appendUser(email: "", firstName: "Jim", lastName: "Lin", imgName: "jim", interests: ["Football (Soccer)", "Tennis", "Table Tennis", "Badminton", "Formula 1 Racing", "Skateboarding", "Snowboarding", "Photography", "Cooking", "Traveling", "Video Games", "Watching movies or TV shows"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2021 Fall", languages: ["English", "Mandarin Chinese"], country: "Taiwan", state: "", countryFlagName: "taiwan")

    appendUser(email: "", firstName: "Chelsea", lastName: "Cresencia", imgName: "chelsea", interests: ["Basketball", "Volleyball", "Quidditch", "Badminton", "Weight Lifting", "Reading", "Writing", "Painting", "Drawing", "Photography", "Playing a musical instrument", "Cooking", "Baking", "Hiking", "Board Games", "Card Games", "Puzzle-solving", "Traveling", "Playing video games", "Watching movies or TV shows", "Collecting and caring for plants"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2021 Fall", languages: ["English", "Spanish"], country: "United States", state: "California", countryFlagName: "usa")

    appendUser(email: "", firstName: "Maryam", lastName: "Alaei", imgName: "default_user", interests: ["Swimming", "Photography", "Dancing", "Yoga", "Meditation", "Horseback riding"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2022 Fall", languages: ["English", "Persian"], country: "Iran", state: "", countryFlagName: "iran")

    appendUser(email: "", firstName: "Vishruti", lastName: "Mhatre", imgName: "vishruti", interests: ["Badminton", "Rock Climbing", "Painting", "Drawing", "Dancing", "Cooking", "Gardening", "Hiking", "Crafting"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2019 Fall", languages: ["English", "Hindi", "Marathi"], country: "India", state: "Maharashtra", countryFlagName: "india")

    appendUser(email: "", firstName: "Soumya", lastName: "Sharma", imgName: "default_user", interests: ["Volleyball", "Badminton", "Swimming", "Reading", "Painting", "Drawing", "Dancing", "Cooking", "Baking"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2020 Fall", languages: ["English", "Hindi"], country: "India", state: "Uttarakhand", countryFlagName: "india")

    appendUser(email: "", firstName: "Lynn", lastName: "Green", imgName: "lynn", interests: ["Basketball", "Ice Hockey", "Table Tennis", "Canoeing and Kayaking", "Wakeboarding", "Pickleball", "Reading", "Cooking", "Gardening", "Hiking", "Camping", "Crafting", "DIY (Do-It-Yourself) projects", "Home improvement", "Yoga", "Meditation", "Board Games", "Card Games", "Puzzle-solving", "Traveling", "Volunteering", "Learning a new language", "Watching movies or TV shows"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2020 Fall", languages: ["English"], country: "United States", state: "California", countryFlagName: "usa")

    appendUser(email: "", firstName: "Nikita", lastName: "Gokhale", imgName: "nikita", interests: ["Quidditch", "Badminton", "Swimming", "Canoeing and Kayaking", "Scuba Diving", "Kickboxing", "White-Water Rafting", "Painting", "Dancing", "Cooking", "Baking", "DIY (Do-It-Yourself) projects", "Acting"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2020 Fall", languages: ["English"], country: "India", state: "Maharashtra", countryFlagName: "india")
    }
    
    private func appendUser(email: String, firstName: String, lastName: String, imgName: String, interests: [String], major: String, department: String, joiningYear: String, languages: [String], country: String, state: String, countryFlagName: String) {
        let user = User(email: "", firstName: firstName, lastName: lastName, imgName: imgName, interests: interests, major: major, department: department, joiningYear: joiningYear, languages: languages, country: country, state: state, countryFlagName: countryFlagName)
        users.append(user)
    }
}
