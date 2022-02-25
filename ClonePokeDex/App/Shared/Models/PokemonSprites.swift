//  PokemonSprites.swift

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
