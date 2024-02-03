//
//  RatingModel.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 03.02.24.
//

import Foundation

final class Rating {
    let imageName: String
    let rating: Int
    let name: String
    let score: Int
    let gameNumber: Int
    
    init(imageName: String, rating: Int, name: String, score: Int, gameNumber: Int) {
        self.imageName = imageName
        self.rating = rating
        self.name = name
        self.score = score
        self.gameNumber = gameNumber
    }
    
    static let dummyData = [
        Rating(
            imageName: "Logo",
            rating: 1,
            name: "გიორგი ბაქრაძე",
            score: 43,
            gameNumber: 10
        ),
        Rating(
            imageName: "Logo",
            rating: 2,
            name: "ოთარ საბაშვილი",
            score: 40,
            gameNumber: 8
        ),
        Rating(
            imageName: "Logo",
            rating: 3,
            name: "დავით რაფავა",
            score: 38,
            gameNumber: 10
        ),
        Rating(
            imageName: "Logo",
            rating: 4,
            name: "ალექსანდრე ლორთქიფანიძე",
            score: 37,
            gameNumber: 9
        ),
        Rating(
            imageName: "Logo",
            rating: 5,
            name: "ანტონ ვაჭარაძე",
            score: 34,
            gameNumber: 10
        ),
        Rating(
            imageName: "Logo",
            rating: 6,
            name: "ბექა ხოჯავა",
            score: 33,
            gameNumber: 8
        ),
        Rating(
            imageName: "Logo",
            rating: 7,
            name: "შანშე ქენქაძე",
            score: 33,
            gameNumber: 9
        ),
        Rating(
            imageName: "Logo",
            rating: 8,
            name: "ქეთი დიასამიძე",
            score: 32,
            gameNumber: 10
        ),
        Rating(
            imageName: "Logo",
            rating: 9,
            name: "ლაშა ბოჟაძე",
            score: 31,
            gameNumber: 10
        ),
        Rating(
            imageName: "Logo",
            rating: 10,
            name: "დავით სიჭინავა",
            score: 30,
            gameNumber: 10
        )
    ]
}
