//
//  ViewController.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//

import UIKit

final class HomeController: UIViewController {

    //MARK: - UI Elements
    @IBOutlet weak var tableView: UITableView!
    //MARK: - Properties
    let viewModel = PokemonViewModel()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.delegate = self
        viewModel.getPokemon()
        
    }
    
    //MARK: - Functions
    fileprivate func configure() {
        tableViewSetup()

       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goDetail" {
            let destination = segue.destination as? PokemonDetailController
            let indexPath = sender as? Int
            let pokemon = viewModel.pokemons[indexPath!]
        
            destination?.viewModel = PokemonDetailViewModel(pokemonId: "\(indexPath! + 1)", name: pokemon.name, imageURL: viewModel.getPokemonDetail(for: indexPath!))
        }
        
    }
    

    
    //MARK: - Actions
}

extension HomeController: PokemonViewModelProtocol {
    func didErrorList(error: String) {
        AlertMessage.alertMessageShow(title: .error, message: error, viewController: self)
    }
    
    func didSuccessList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}

//MARK: - CollectionView Extensions
extension HomeController {
    fileprivate func tableViewSetup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UINib(nibName: "PokemonCell", bundle: nil), forCellReuseIdentifier: "cell")

    }
}


extension HomeController: ConfigureTableView {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as? PokemonCell {
                 let pokemon = viewModel.pokemons[indexPath.row]
                 cell.pokemonName.text = pokemon.name
            
                 
                cell.loadImage(from: viewModel.getPokemonSprites(index: indexPath.row))
            
                 return cell
             }
             return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goDetail", sender: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
 



