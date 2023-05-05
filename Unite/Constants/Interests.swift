//
//  Interests.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/28/23.
//

import Foundation

enum MainInterests: String, CaseIterable {
    case mentor = "Mentor ( Buddy System)"
    case activities = "Activities"
    case nationality = "Nationality"
    
    var imgName: String {
        switch self {
        case .mentor:
            return "mentor"
        case .activities:
            return "activities"
        case .nationality:
            return "nationality"
        }
    }
}

enum Interests: String, CaseIterable {
case photography = "Photography"
    // Activities
    case music = "Music"
    case gaming = "Gaming"
    case singing = "Singing"
    case drives = "Drives"
    case trekking = "Trekking"
    case cardGames = "Card Games"
    case boardGames = "Board Games"
    case iceSkating = "Ice Skating"
    case jewelryMaking = "Jewelry Making"
    
    // Sports
    case running = "Running"
    case weightLifting = "Weight Lifting"
    case swimming = "Swimming"
    case boxing = "Boxing"
    case tableTennis = "Table Tennis"
    case basketBall = "Basket Ball"
    case badminton = "Badminton"
    case golf = "Golf"
    case bowling = "Bowling"
    case horseRiding = "Horse Riding"
    

    case other = "Other"
    
    
    var imgName: String {
        switch self {
        case .photography:
            return "photography"
        case .music:
            return "music"
        case .gaming:
            return "gaming"
        case .singing:
            return "singing"
        case .drives:
            return "drives"
        case .trekking:
            return "trekking"
        case .cardGames:
            return "cardGames"
        case .boardGames:
            return "boardGames"
        case .iceSkating:
            return "iceSkating"
        case .jewelryMaking:
            return "jewelryMaking"
        case .running: return "running"
        case .weightLifting: return "weightLifting"
        case .swimming: return "swimming"
        case .boxing: return "boxing"
        case .tableTennis: return "tableTennis"
        case .basketBall: return "basketBall"
        case .badminton: return "badminton"
        case .golf: return "golf"
        case .bowling: return "bowling"
        case .horseRiding: return "horseRiding"
        case .other:
            return "other"
        }
    }
}
