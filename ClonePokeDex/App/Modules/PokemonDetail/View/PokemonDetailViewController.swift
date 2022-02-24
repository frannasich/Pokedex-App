//
//  PokemonDetailViewController.swift
//  ClonePokeDex
//
//  Created by Jesus Nieves on 24/02/2022.
//

import UIKit

protocol PokemonDetailDelegate {
    func toogleLoading()
    func loadPokemonData(pokemon: PokemonDetail)
    func showError()
}

class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonId: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    private let service = PokemonDetailService()
    var urlPokemon: String?
    private var viewModel: PokemonDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = urlPokemon {
            self.viewModel = PokemonDetailViewModel(urlPokemon: url, service: self.service, delegate: self)
            self.viewModel?.getPokemon()
        }
    }
    
    private func setupView (){
        self.title = "Detalles del Pokemon"
        navigationItem.largeTitleDisplayMode = .never
    }

}

extension PokemonDetailViewController: PokemonDetailDelegate {
    
    func toogleLoading() {
        let today = Date()
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "HH:mm E, d MMM y"
        print(formatter1.string(from: today))
        print("cargando")
    }
    
    func loadPokemonData(pokemon: PokemonDetail) {
        self.pokemonId.text = "\(pokemon.id)"
        self.pokemonName.text = pokemon.name
        
        if let urlString = pokemon.sprites.other?.home?.frontDefault, let url = URL(string: urlString) {
            self.pokemonImage.load(url: url)
        }
    }
    
    func showError() {
        print("ha ocurrido un error")
    }
    
    
    
    
}
