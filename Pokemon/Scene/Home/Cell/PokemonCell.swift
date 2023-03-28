//
//  PokemonCell.swift
//  Pokemon
//
//  Created by Baris on 28.03.2023.
//

import UIKit

protocol PokemonCellProtocol {
    var pokemonName: String { get }
    var pokemonImage: String { get }

}

class PokemonCell: UITableViewCell {

    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    


    func loadImage(from url: URL?) {
            guard let url = url else { return }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.pokemonImage.image = image
                    }
                }
            }.resume()
        }
    
}
