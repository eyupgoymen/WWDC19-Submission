//
//  LoaderViewController.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 23.02.2019.
//

import Foundation
import UIKit


public final class LoaderViewController: UIViewController {
    
    let activityView: UIView = {
        let customView = UIView()
        customView.layer.cornerRadius = 6
        customView.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.537254902, blue: 0.8549019608, alpha: 0.9)
        customView.translatesAutoresizingMaskIntoConstraints = false
        return customView
    }()
    
    let indicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    let loadingTitle: UILabel = {
        let label = UILabel()
        label.text = "Pokeballs Loading"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        indicator.stopAnimating()
    }
    
    private func layoutViews(){
        self.view.addSubview(activityView)
        activityView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        activityView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        activityView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        activityView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.view.addSubview(indicator)
        indicator.widthAnchor.constraint(equalToConstant: 40)
        indicator.heightAnchor.constraint(equalToConstant: 40)
        indicator.centerXAnchor.constraint(equalTo: self.activityView.centerXAnchor).isActive = true
        indicator.topAnchor.constraint(equalTo: self.activityView.topAnchor, constant: 10).isActive = true
        
        self.view.addSubview(loadingTitle)
        loadingTitle.centerXAnchor.constraint(equalTo: self.activityView.centerXAnchor).isActive = true
        loadingTitle.topAnchor.constraint(equalTo: self.indicator.bottomAnchor, constant: 0).isActive = true
        loadingTitle.widthAnchor.constraint(equalToConstant: 80).isActive = true
        loadingTitle.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
