//
//  ViewController.swift
//  NY-Times
//
//  Created by Alfoah IOS on 03/10/2019.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import UIKit
import SDWebImage

class MostPopularVC: UIViewController {

    @IBOutlet weak var articalsTableView: UITableView!
    var articals:[Articale]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        fetchArticals()
        articalsTableView.reloadData()
    }
    
    // MARK: - Get Data
    func fetchArticals(){
        let indecator = UIViewController.displaySpinner(onView: self.view)
        APIRequest.getArticals { (result) in
            switch result {
            case .success(let articals) :
                UIViewController.removeSpinner(spinner: indecator)
                self.articals = articals
                DispatchQueue.main.async {
                    self.articalsTableView.reloadData()
                }
            case .failure(let error):
                UIViewController.removeSpinner(spinner: indecator)
                let msg = showError(error: error)
                let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: okButtonTitle, style: .cancel, handler: nil)
                alert.addAction(cancelAction)
                DispatchQueue.main.async {
                    self.present(alert, animated: true)
                }
                print("Error: \(error)")
            }
        }
    }
    
    
    // MARK: - Setup SubViews
    func setupSubViews(){
        self.title = titleString
        navigationController?.navigationBar.barTintColor = tintColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
        
        articalsTableView.dataSource = self
        articalsTableView.delegate = self
    }
    
}

 // MARK: - TableView DataSource
extension MostPopularVC:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let articalsNumber = self.articals?.count {
           return articalsNumber
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCellID) as! ArticleCell
        guard let articals = self.articals else {return cell}
//        imageView.sd_setImage(with: URL(string: "http://www.domain.com/path/to/image.jpg"), placeholderImage: UIImage(named: "placeholder.png"))
        let artical = articals[indexPath.row]
        cell.titleLabel.text = artical.title
        cell.byLineLabel.text  = artical.byline
        cell.dateLabel.text = artical.published_date
        if let metadata = artical.media![0].mediaMetadata {
            cell.articleIcon.sd_setImage(with: URL(string: metadata[0].url!),placeholderImage: UIImage(named: "placeHolder"))
        } else {
            cell.articleIcon.image = UIImage(named: "placeHolder")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showDetails(aricale:articals![indexPath.row])
    }
    
    func showDetails(aricale:Articale) {
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SHOWDETAILS") as! DetailsVC
        detailVC.detailsTxt = aricale.abstract!
        detailVC.imageURL = aricale.media![0].mediaMetadata![2].url!
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
}

