//
//  MovieRegisterViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 09/04/18.
//  Copyright © 2018 EricBrito. All rights reserved.
//

import UIKit

class MovieRegisterViewController: UIViewController {

    
    @IBOutlet weak var lbCategories: UILabel!
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfRating: UITextField!
    @IBOutlet weak var tfDuration: UITextField!
    @IBOutlet weak var ivPostes: UIImageView!
    
    @IBOutlet weak var tvSummary: UITextView!
    
    @IBOutlet weak var btAddUpdate: UIButton!
    
    var movie: Movie!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if movie != nil {
            tfTitle.text = movie.title
            tfRating.text = "\(movie.rating)"
            tfDuration.text = movie.duracao
            tvSummary.text = movie.summary
            btAddUpdate.setTitle("Atualizar", for: .normal)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - IBActions
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addUpdateMovie(_ sender: Any) {
        
        if movie == nil {
            movie = Movie(context: context)
        }
        movie.title = tfTitle.text
        movie.rating = Double(tfRating.text!)!
        movie.duracao = tfDuration.text
        movie.summary = tvSummary.text
        
        do {
           try context.save()
            close("")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    

}
