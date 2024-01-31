//
//  Models.swift
//  HW3.2_APIBiblia
//
//  Created by Anita Gagarina on 1/30/24.
//

import Foundation

struct Verse: Decodable {
    let number: Int
    let text: String
}

struct Abbrev: Decodable {
    let pt: String
    let en: String
}

struct Book: Decodable {
    let abbrev: Abbrev
    let name: String
    let author: String
    let group: String
    let version: String
}

struct Chapter: Decodable {
    let number: Int
    let verses: Int
}

struct Verses: Decodable {
    let book: Book
    let chapter: Chapter
    let verses: [Verse]
}
