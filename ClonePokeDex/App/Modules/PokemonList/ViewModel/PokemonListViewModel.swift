//
//  PokemonListViewModel.swift
//  ClonePokeDex
//
//  Created by Jesus Nieves on 23/02/2022.
//

import Foundation

class PokemonListViewModel {
    
    private var pokemonListService: PokemonListService
    private var pokemons = [Pokemon]()
    private var delegate: PokemonListDelegate
    
    init(service: PokemonListService, delegate: PokemonListDelegate) {
        self.pokemonListService = service
        self.delegate = delegate
    }
    
    func getPokemons() {
        pokemonListService.getPokemons { pokemons in
            self.pokemons = pokemons
            self.delegate.reloadTable()
        } onError: {
            self.delegate.showError()
        }

    }
    
    func getPokemon(at index: Int) -> Pokemon {
        return pokemons[index]
    }
    
    func getPokemonCount() -> Int {
        return pokemons.count
    }
    
    
}
