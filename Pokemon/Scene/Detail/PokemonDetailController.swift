//
//  PokemonDetailController.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//

import UIKit
import SDWebImage

final class PokemonDetailController: UIViewController {
    
    //MARK: - UI Elements
    @IBOutlet weak var viewDesing: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var defenceLabel: UILabel!
    @IBOutlet weak var swordLabel: UILabel!
    

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var firstAbilitiesLabel: UILabel!
    @IBOutlet weak var SecondAbilitiesLabel: UILabel!
    
    //MARK: - Properties
    var  viewModel : PokemonDetailViewModel?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
   
        
        
    }
    
    //MARK: - Functions
    
    fileprivate func updateUI() {
        getData()
        
        viewDesing.layer.cornerRadius = 20
        firstAbilitiesLabel.layer.cornerRadius = 15
        firstAbilitiesLabel.clipsToBounds = true
        SecondAbilitiesLabel.layer.cornerRadius = 15
        SecondAbilitiesLabel.clipsToBounds = true
        
        healthLabel.layer.cornerRadius = 5
        healthLabel.clipsToBounds = true
        defenceLabel.layer.cornerRadius = 5
        defenceLabel.clipsToBounds = true
        
        swordLabel.layer.cornerRadius = 5
        swordLabel.clipsToBounds = true
    }
    
    fileprivate func getData() {
        
        viewModel?.fetchPokemonDetails(completion: { _ in
            DispatchQueue.main.async { [self] in
                self.nameLabel.text = self.viewModel?.name ?? ""
                self.firstAbilitiesLabel.text = self.viewModel?.abilities?[0].ability?.name ?? "None"
                self.SecondAbilitiesLabel.text = self.viewModel?.abilities?[1].ability?.name ?? "None"
                self.healthLabel.text = "\(self.viewModel?.stats?[0].baseStat ?? 00)"
                self.swordLabel.text = "\(self.viewModel?.stats?[1].baseStat ?? 00)"
                self.defenceLabel.text = "\(self.viewModel?.stats?[2].baseStat ?? 00)"
                if let imageURL = self.viewModel?.imageURL {
                    self.pokemonImage.sd_setImage(with: imageURL)
                }
            }
        })
    }
    
    
    
    //MARK: - Actions
    
}
