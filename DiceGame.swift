//
//  DiceGame.swift
//
//  Created by Roman Cernetchi
//  Created on 2021-11-18
//  Version 1.0
//  Copyright (c) 2020 Roman Cernetchi. All rights reserved.
//
//  This program generates a random number and asks the user to guess that
//  number.
//
import Foundation

// This function generates a random number
func randomNumberGenerator(lowerBound: Int, higherBound: Int) -> Int {
    return Int.random(in: lowerBound...higherBound)
}

// This function returns whether the guess was too high or too low
func higherOrLower(guess: Int, randomNumber: Int) -> String {
    return guess > randomNumber ? "Guess too high!\n" : "Guess too low!\n"
}

// Constants declaration
let lowerBound = 1
let higherBound = 6

// Decides the random number for the duration of the game
let randomNumber = randomNumberGenerator(lowerBound: lowerBound,
    higherBound: higherBound)

var numOfTries = 0

while true {

    // User prompt
    print("Guess a number between 1 and 6: ", terminator: "")

    // Gathers the user input and makes sure it isn't empty
    guard let guessString = readLine(), !guessString.isEmpty else {
        print("Please enter a correct input.")
        continue
    }

    // Tries to parse the user input into an Int
    if let guess = Int(guessString) {

        // Sees if the guess was equal to randomNumber
        if guess == randomNumber {
            numOfTries += 1
            print("It took a total of \(numOfTries) tries.")
            break
        } else {
            numOfTries += 1
            print(higherOrLower(guess: guess, randomNumber: randomNumber))
        }

    } else {
        print("Please enter a correct input\n")
    }

}

print("\nDone.")
