//
//  PokemonDetailService.swift
//  ClonePokeDex
//
//  Created by Jesus Nieves on 24/02/2022.
//

import Foundation

class PokemonDetailService {
    
    func getPokemon(urlPokemon: String,
                    onComplete: @escaping (PokemonDetail) -> Void,
                    onError: @escaping () -> Void) {
        
        ApiManager.shared.get(url: urlPokemon, completion: { response in
            
            switch response {
                case .success(let data):
                    do {
                        if let data = data {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let pokemonReponse = try decoder.decode(PokemonDetail.self, from: data)
                            onComplete(pokemonReponse)
                        } else {
                            onError()
                        }
                    } catch {
                        onError()
                    }
                case .failure(_):
                    onError()
            }
            
        })
        
    }
    
}
