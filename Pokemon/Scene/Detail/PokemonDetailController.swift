//
//  PokemonDetailController.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//

import UIKit

class PokemonDetailController: UIViewController {

    //MARK: - UI Elements
    
    @IBOutlet weak var nameLabel: UILabel!
    //MARK: - Properties
    var  viewModel : PokemonDetailViewModel?
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        getData()
        
       
    }
    
    //MARK: - Functions
    fileprivate func getData() {
        
        viewModel?.fetchPokemonDetails(completion: { _ in
           
            DispatchQueue.main.async { [self] in
                self.nameLabel.text = self.viewModel?.name ?? ""
                
            }
    })
    }
  
        
    
    //MARK: - Actions


}
