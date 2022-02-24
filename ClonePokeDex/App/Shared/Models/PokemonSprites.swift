//
//  PokemonSprites.swift
//  ClonePokeDex
//
//  Created by Jesus Nieves on 24/02/2022.
//

import Foundation

struct Sprite: Codable {
    let other: SpritesOther?
}

struct SpritesOther: Codable {
    let home: SpritesHome?
}

struct SpritesHome: Codable {
    let frontDefault: String?
}
