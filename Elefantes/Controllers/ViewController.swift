//
//  ViewController.swift
//  Elefantes
//
//  Created by Wilson Baraban Filho on 10/18/21.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    
    var arrayDeElefantes: [Elefante] = []
    let api = API()
    
    let reuseIdentifier = "Celula"
    var favoritos: Bool = false
        
    lazy var uitv_Tabela: UITableView = {

        var tabela = UITableView()
        tabela.frame = self.view.bounds
        tabela.dataSource = self
        tabela.delegate = self
        //tabela.register(CelulaCustomizadaElefanteTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        let nib = UINib(nibName: "CelulaCustomizadaElefanteTableViewCell", bundle: nil)
        tabela.register(nib, forCellReuseIdentifier: reuseIdentifier)
        
        return tabela

    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Lista de Elefantes"
        self.view.addSubview(self.uitv_Tabela)
        self.createRightBarButton()
        
        self.populaArrayDeElefantesAtualizaTableView()
        //self.arrayDeElefantes = populaArrayDeElefantes()
        
        print("Quantidade de Elefantes: \(self.arrayDeElefantes.count)")
        
        //self.uitv_Tabela.reloadData()
        
    }
    
    func populaArrayDeElefantesAtualizaTableView() {
        
        if !favoritos {
            self.arrayDeElefantes = api.getElephants(urlString: api.setElephantsURL(), method: .GET)
        } else {
            let elefantes = self.getUserDefaults()
            
            for item in elefantes {
                let elef = Elefante(name: item)
                self.arrayDeElefantes.append(elef)
            }
            
        }
        
        self.uitv_Tabela.reloadData()
        
        //self.descobrirAsEspecies(elefantes: self.arrayDeElefantes)
    }
    
    func createRightBarButton() {
        let starImage = UIImage(systemName: "star.fill")
        let rightButton = UIBarButtonItem(image: starImage, style: UIBarButtonItem.Style.plain, target: self, action: #selector(getFavotiros))
        rightButton.tintColor = UIColor(red: 1.00, green: 0.80, blue: 0.14, alpha: 0.55)
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func getFavotiros() {
        let viewController = ViewController()
        viewController.favoritos = true
        self.show(viewController, sender: nil)
    }
    
//    func populaArrayDeElefantes() -> [Elefante] {
//        return api.getElephants(urlString: api.setElephantsURL(), method: .GET)
//    }
    
//    func descobrirAsEspecies(elefantes: [Elefante]) {
//
//        var species: [String] = []
//
//        for item in elefantes {
//            print(item.species)
//            // checar se item.species CONTAIN no array
//            species.append(contentsOf: item.species)
//
//        }
//
//    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayDeElefantes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CelulaCustomizadaElefanteTableViewCell
        
        cell?.uil_Titulo.text = self.arrayDeElefantes[indexPath.row].name
        cell?.uil_Note.text = self.arrayDeElefantes[indexPath.row].note
        cell?.uil_Note.adjustsFontSizeToFitWidth = false
        cell?.uil_Note.numberOfLines = 0
        
//        if let image = self.arrayDeElefantes[indexPath.row].image {
//            let url = URL(string: image)
//            let data = try? Data(contentsOf: url!)
//            cell?.uiiv_Image?.image = UIImage(data: data!)
//        }
        
        if let image = self.arrayDeElefantes[indexPath.row].image {
            let url = URL(string: image)
            cell?.uiiv_Image.kf.setImage(
                with: url,
                placeholder: UIImage(named: "elefantePelucia"),
                options: [
                    .transition(ImageTransition.fade(2.0))
                ],
                progressBlock: nil,
                completionHandler: nil)
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 146.0
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail = DetailViewController()
        detail.elefanteTocado = self.arrayDeElefantes[indexPath.row]
        
        self.show(detail, sender: nil)
//        self.performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
//        self.showDetailViewController(detail, sender: nil)
    }
    
}



