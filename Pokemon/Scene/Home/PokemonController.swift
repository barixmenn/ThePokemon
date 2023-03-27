//
//  ViewController.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//

import UIKit

class PokemonController: UIViewController {

    //MARK: - UI Elements
    @IBOutlet weak var tableView: UITableView!
    //MARK: - Properties
    let viewModel = PokemonViewModel()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - Functions
    fileprivate func configure() {
           //collectionSetup()
        getData()

       }
    
    fileprivate func getData() {
        self.viewModel.getPokemon { pokemon in
            DispatchQueue.main.async {
                self.tableView.reloadData()
                print(pokemon)
            }
        }
    }
    
    //MARK: - Actions
}


extension PokemonController: ConfigureTableView {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.pokemons?.results.count ?? 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let pokemon = viewModel.pokemons?.results[indexPath.row]
        cell.textLabel?.text =  pokemon?.name
        return cell
    }
    
    
}
 



