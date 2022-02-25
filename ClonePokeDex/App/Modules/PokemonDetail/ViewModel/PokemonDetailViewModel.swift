//  PokemonDetailViewModel.swift

import Foundation

class PokemonDetailViewModel {
    
    private var delegate: PokemonDetailDelegate
    private var pokemonDetailService: PokemonDetailService
    private var urlPokemon: String
    
    init(urlPokemon: String, service: PokemonDetailService, delegate: PokemonDetailDelegate) {
        self.urlPokemon = urlPokemon
        self.pokemonDetailService = service
        self.delegate = delegate
    }
    
    func getPokemon() {
        self.delegate.toogleLoading()
        pokemonDetailService.getPokemon(urlPokemon: self.urlPokemon, onComplete: { pokemon in
            self.delegate.loadPokemonData(pokemon: pokemon)
            self.delegate.toogleLoading()
        }, onError: { self.delegate.showError() })
    }
}
