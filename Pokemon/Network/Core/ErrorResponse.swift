//
//  ErrorResponse.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//


import Foundation

enum ErrorType: String, Error {
  case invalidData = "Invalid data"
  case invalidURL = "Invalid URL"
  case generalError = "General Error"
}
