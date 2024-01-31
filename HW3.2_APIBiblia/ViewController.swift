//
//  ViewController.swift
//  HW3.2_APIBiblia
//
//  Created by Anita Gagarina on 1/30/24.
//

import UIKit

private let versesURL = URL(string: "https://www.abibliadigital.com.br/api/verses/nvi/sl/23")!

final class ViewController: UIViewController {

    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet var bibliaVersesAPILabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.startAnimating()
        activityIndicatorView.hidesWhenStopped = true
        fetchVerses()
    }
    
    private func fetchVerses() {
        URLSession.shared.dataTask(with: versesURL) { [weak self] data, response, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            print(response)
            
            DispatchQueue.main.async {
                self?.activityIndicatorView.stopAnimating()
                self?.bibliaVersesAPILabel.text = "Successeful Fetch!"
            }
            
            do {
                let verses = try JSONDecoder().decode(Verses.self, from: data)
                print(verses)
                
            } catch {
                print(error)
            }
            
        }.resume()
        
    }


}

