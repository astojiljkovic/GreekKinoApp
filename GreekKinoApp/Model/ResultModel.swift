//
//  ResultModel.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 13.9.22..
//

import UIKit

struct GameResultResponse: Codable {
    let content: [GameResult]
}

struct GameResult: Codable {
    let drawId: Int
    let drawTime: Int
    let winningNumbers: [WinningNumber]
}

struct WinningNumber: Codable {
    let list: [Int]
}
