//  PokemonListViewController.swift

import UIKit

protocol PokemonListDelegate {
    func toogleLoading()
    func reloadTable()
    func showError()
}

class PokemonListViewController: UIViewController {

    @IBOutlet weak var tablewView: UITableView!
    private var service = PokemonListService()
    private var viewModel: PokemonListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = PokemonListViewModel(service: self.service, delegate: self)
        self.viewModel?.getPokemons()
        setupView()
    }

    private func setupView() {
        self.title = "Pokemones"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tablewView.register(UINib(nibName: "PokemonListTableViewCell", bundle: nil), forCellReuseIdentifier: "PokemonListTableViewCell")
        self.tablewView.delegate = self
        self.tablewView.dataSource = self
    }
}

extension PokemonListViewController: PokemonListDelegate {
    
    func toogleLoading() {
    
    }
    
    func reloadTable() {
        self.tablewView.reloadData()
    }
    
    func showError() {
    
    }
}

extension PokemonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = self.viewModel?.getPokemon(at: indexPath.row)
        let vcDetail = PokemonDetailViewController()
        vcDetail.urlPokemon = pokemon?.url
        self.navigationController?.pushViewController(vcDetail, animated: true)
    }
}

extension PokemonListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.getPokemonCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonListTableViewCell", for: indexPath) as! PokemonListTableViewCell
        
        cell.pokemonName.text = self.viewModel?.getPokemon(at: indexPath.row).name
        
        return cell
    }
    
    
}
