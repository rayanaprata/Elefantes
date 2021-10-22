//
//  API.swift
//  Elefantes
//
//  Created by Wilson Baraban Filho on 10/18/21.
//

import Foundation

struct API {
    
    // https://elephant-api.herokuapp.com/elephants
    
    let baseURL = "https://elephant-api.herokuapp.com"
    
    /// Returns the URL string to endpoint: /elephants
    func setElephantsURL() -> String {
        return "\(self.baseURL)/\(EndPoints.elephants)"
    }
    
    func setElephantsSexURL(sex: Sex) -> String {
        return "\(self.baseURL)/\(EndPoints.elephants)/\(EndPoints.sex)/\(sex)"
    }

    
    //closure : ( ) -> Void
    //Thread -> processamento paralelo
    
//    func getElephants(urlString: String, method: HTTPMethod, response: @escaping ([Elefante]) -> Void, errorReturned: @escaping (String) -> Void  ) {
//
//        let elefante = Elefante(_id: "", name: "", species: "", sex: "", dob: "", dod: "", wikilink: "", image: "", note: "")
//        if "quantidade de elefantes > 0" {
//            response([elefante])
//        } else {
//            errorReturned("Não retornou nada")
//        }
//
//    }
    
    
    //Alamofire
    /// Returns an array of Elefante -> If nil = []
    func getElephants(urlString: String, method: HTTPMethod) -> [Elefante] {
        
        // Criar array de elefante
        var arrayDeElefantes : [Elefante] = []
        // Config sessão
        let config: URLSessionConfiguration = .default
        // Sessão
        let session: URLSession = URLSession(configuration: config)
        // URL
        guard let url: URL = URL(string: urlString) else { return [] }
        // URL Request
        var urlRequest: URLRequest = URLRequest(url: url)
        // URL Request -> Method (GET)
        urlRequest.httpMethod = "\(method)"
        // EXEC request HTTP
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (result, urlResponse, error) in
            
            var statusCode: Int = 0
            if let response = urlResponse as? HTTPURLResponse {
                statusCode = response.statusCode
            }
            
            guard let data = result else { return } // precisa retornar o erro de DATA = nil
            
            do {
                // criar um decoder
                let decoder : JSONDecoder = JSONDecoder()
                // decodificar
                let decodeData: [Elefante] = try decoder.decode([Elefante].self, from: data)
                arrayDeElefantes = decodeData
//                arrayDeElefantes = try JSONDecoder().decode([Elefante].self, from: data)
                
            } catch {
                // error
            }
            
        }
        )
        task.resume()
        
        sleep(3)
        return arrayDeElefantes
    }
    
    
//    func executaAlgumaCoisa() {
//        // executo algo
//    }
//
//    func executaAlgumaCoisa(parametro: String) {
//        // executar algo com o parametro
//    }
//
//    func executaAlgumaCoisa() -> String {
//        return ""
//    }
//
//    func executaAlgumaCoisa(parametro: String) -> Int {
//        // executar algo com o parametro
//        return 1
//    }
//
//    func executaAlgumaCoisa(primeiro: String, segundo: Int, terceiro: Bool) {
//        // executar algo com o parametro
//    }
//
//    func executaAlgumaCoisa(primeiro: String, segundo: Int, terceiro: Bool) -> (String, Bool) { // tupla
//        // executar algo com o parametro
//
//        return ("texto", true)
//    }
//
//    func executaAlgumaCoisa(parametro: String, funcao: () -> Void ) -> Int {
//        // executar algo com o parametro
//
//        return 1
//    }
//
//    func executaAlgumaCoisa(with parametro: String, and funcaoRetorno: @escaping () -> [Elefante] ) -> Int {
//        // executar algo com o parametro
//        return 1
//    }
    
    
    
}


//Pilha -> Stack -> LIFO -> Last in First out
//Fila -> Queue -> FIFO -> First in First out


// fazer processo para pegar todas as espécies.


//"abilities": [

//        {
//            "ability": {
//                "name": "limber",
//                "url": "https://pokeapi.co/api/v2/ability/7/"
//            },
//            "is_hidden": false,
//            "slot": 1
//        },

//    ],

struct Ability {
    var name: String?
    var url: String?
}
struct Abilities {
    var ability: Ability?
    var is_hidden: Bool?
    var slot: Int?
}

struct Forms {
    var name: String?
    var url: String?
}

struct Version {
    var name: String?
    var url: String?
}

struct Pokemon {
    var abilities: [Abilities]?
    var base_experience: Int?
    var forms: [Forms]?
    
}
////////////////////////////////
///
// https://pokeapi.co/api/v2/pokemon
struct ItemPokemon {
    var name: String?
    var url: String?
}

struct ListPokemons {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [ItemPokemon]?
}

//decodable(ListPokemons.self)
//
////https://pokeapi.co/api/v2/pokemon/ArrayPokemon[indexPath.row].results.name
//decodable(Pokemon.self)
