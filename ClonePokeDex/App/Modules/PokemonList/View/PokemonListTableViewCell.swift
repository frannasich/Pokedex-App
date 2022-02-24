//
//  PokemonListTableViewCell.swift
//  ClonePokeDex
//
//  Created by Jesus Nieves on 23/02/2022.
//

import UIKit

class PokemonListTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
