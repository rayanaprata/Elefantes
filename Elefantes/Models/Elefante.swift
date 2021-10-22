//
//  Elefante.swift
//  Elefantes
//
//  Created by Wilson Baraban Filho on 10/18/21.
//
/*
{
    "_id": "5cf1d267a82e8e66cce0fe95",
    "index": 25,
    "name": "Mona",
    "affiliation": "Birmingham Zoo, Alabama",
    "species": "Asian",
    "sex": "Female",
    "fictional": "false",
    "dob": "1951",
    "dod": "2007",
    "wikilink": "https://en.wikipedia.org/wiki/Mona_(elephant)",
    "image": "https://elephant-api.herokuapp.com/pictures/025.jpg",
    "note": "Thought, at 60, to have been the oldest Asian in the United States."
},
*/

//Codable -> Encodable e Decodable
//Decodable -> Pega o JSON da API e transforma na class ou struct
//Encodable -> Pega a class ou struct e transforma em um JSON

/// Tipo de dado de retorno da API de elefantes
struct Elefante: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case name
        case species
        case sex
        case dob
        case dod
        case wikilink
        case image
        case note
    }
    
    var _id         : String?
    var name        : String?
    var species     : String?
    var sex         : String?
    var dob         : String?
    var dod         : String?
    var wikilink    : String?
    var image       : String?
    var note        : String?
    
    init(_id        : String? = nil,
        name        : String? = nil,
        species     : String? = nil,
        sex         : String? = nil,
        dob         : String? = nil,
        dod         : String? = nil,
        wikilink    : String? = nil,
        image       : String? = nil,
        note        : String? = nil
    ) {
        self._id        = _id
        self.name       = name
        self.species    = species
        self.sex        = sex
        self.dob        = dob
        self.dod        = dod
        self.wikilink   = wikilink
        self.image      = image
        self.note       = note
    }
    
    
}
