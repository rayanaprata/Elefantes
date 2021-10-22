//
//  DetailViewController.swift
//  Elefantes
//
//  Created by Wilson Baraban Filho on 10/18/21.
//
import UIKit
import SafariServices

class DetailViewController: UIViewController {
    
    let reuseIdentifier = "cell"
    var elefanteTocado: Elefante = Elefante()
    lazy var uitv_Tabela: UITableView = {

        var tabela = UITableView()
        tabela.frame = self.view.bounds
        tabela.dataSource = self
        tabela.delegate = self
        
        //tabela.backgroundColor = .clear
        
        return tabela

    }()
    
    
    // UIImageView
    // name
    // specie
    // sex
    // note
    // botao para visualizar o link da wikipedia

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(uitv_Tabela)
        title = elefanteTocado.name
        
        view.backgroundColor = .clear
        
//        if let sex = self.elefanteTocado.sex {
//            self.setBackgroundColor(sex: sex)
//        }
        
    }
    
    func setBackgroundColor(sex: String) {
//        switch sex {
//        case "Male":
//            self.view.backgroundColor = .systemIndigo
//        case "Female":
//            self.view.backgroundColor = .systemPink
//        default:
//            self.view.backgroundColor = .white
//        }
        
        let blur = UIBlurEffect(style: .systemChromeMaterial)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = self.view.frame
        self.view.addSubview(blurView)
        self.view.sendSubviewToBack(blurView)
    }
    
}

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // retornos por linha
        // 0 imagem
        // 1 nome
        // 2 especie
        // 3 sexo
        // 4 link
        // 5 note
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 16.0)
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        
        switch indexPath.row {
        case 0:
            let cellImage = ImageViewCell()
            guard let urlString = elefanteTocado.image else { return UITableViewCell() }
            guard let url = URL(string: urlString) else { return UITableViewCell() }
            cellImage.setImageView(url: url, rounded: true)
            return cellImage
        case 1:
            if let name = elefanteTocado.name {
                cell.textLabel?.text = "Nome: "
                cell.detailTextLabel?.text = "\(name)"
            }
        case 2:
            if let specie = elefanteTocado.species {
                cell.textLabel?.text = "Espécie: "
                cell.detailTextLabel?.text = "\(specie)"
                
            }
        case 3:
            if let sex = elefanteTocado.sex {
                cell.textLabel?.text = "Sexo: "
                cell.detailTextLabel?.text = "\(sex)"
            }
        case 4:
            if let wikilink = elefanteTocado.wikilink {
                cell.textLabel?.text = "Wiki: "
                cell.detailTextLabel?.text = "\(wikilink)"
                cell.accessoryType = .disclosureIndicator
            }
        case 5:
            if let note = elefanteTocado.note {
                cell.textLabel?.text = "\(note)"
                cell.textLabel?.font = UIFont.systemFont(ofSize: 16.0)
                cell.textLabel?.numberOfLines = 0
            }
        case 6:
            cell.textLabel?.text = "Adicionar aos favoritos"
            cell.backgroundColor = UIColor(red: 1.00, green: 0.80, blue: 0.14, alpha: 0.55)
        default:
            return UITableViewCell()
        }
        return cell
        
    }
    
}

extension DetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 4 {
            guard let wikilink = elefanteTocado.wikilink else { return }
            guard let url = URL(string: wikilink) else { return }
            let safariViewController = SFSafariViewController(url: url)
//            show(safariViewController, sender: nil)
            showDetailViewController(safariViewController, sender: nil)
        }
        
        if indexPath.row == 6 {
            
            guard let nome = elefanteTocado.name else { return }
            self.saveUserDefaults(nome: nome)
            
            // defaults.synchronize()
            
//            salvar no UserDefaults = [Elefante]
//            dicionário (key, value) = (elefantes, [Elefante])
//            criar uma ViewController para mostrar os favoritos
//            criar a exclusao de um elefante favorito
        }
        
    }
    
}

