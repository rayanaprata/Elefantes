//
//  UIViewController.swift
//  Elefantes
//
//  Created by Rayana Prata Neves on 22/10/21.
//

import UIKit

extension UIViewController {
    
    func saveUserDefaults(nome: String) {
        let defaults = UserDefaults.standard
        var elefantesFavoritados = self.getUserDefaults()
        
        if !elefantesFavoritados.contains(nome) {
            elefantesFavoritados.append(nome)
            defaults.set(elefantesFavoritados, forKey: "elefantes")
        }
        
    }
    
    func getUserDefaults() -> [String] {
        let defaults = UserDefaults.standard
        guard let arrayString = defaults.object(forKey: "elefantes") as? [String] else { return [] }
        print(arrayString)
        return arrayString
    }
    
}
