//
//  QuestionData.swift
//  Peronality Quiz
//
//  Created by Heriberto Mojica Santata on 4/25/23.
//

import Foundation

struct Question{
    var text: String
    var type: ResponseType
    var answers: [Answer]
}


enum ResponseType {
    case single, multiple,Range
}

struct Answer {
    var text: String
    var type: AnimalType
}
//These are the reulst or decription of the sybmols the last of the quiz
enum AnimalType:Character {
    case  hand = "✍︎", spring = "♨︎", lucky = "☘︎" , toxic = "☣︎"
    
    var definition: String {
        switch self {
        case .hand:
            return "You are really cool and you are likey to use your hand to write things."
        case .spring:
            return "Your alright i guess you must love hot baths i guess."
        case .lucky:
            return "You are really lucky you must get a lot of things for free huh."
        case .toxic:
            return "You are very toxic a somewhat less than decent person but dosent mean that everything is bad if could be good at some ponit but somwhat bad."
            
        }
    }
}

