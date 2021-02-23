//
//  ViewController.swift
//  SDK-ArticleManager
//
//  Created by Kyrylo Hanichev on 02/23/2021.
//  Copyright (c) 2021 khaniche. All rights reserved.
//

import UIKit
import SDK_ArticleManager

class ViewController: UIViewController {
  
  let articleManager = ArticleManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("create article 1")
    let article1 = articleManager.newArticle()
    article1.title = "Article 1"
    article1.language = "en"
    article1.content = "First Article"
    article1.creationDate = Date()
    article1.modificationDate = Date()
    print(article1.description)
    
    print("create article 2")
    let article2 = articleManager.newArticle()
    article2.title = "Article 2"
    article2.language = "en"
    article2.content = "Second Article"
    
    print("all articles")
    let articles = articleManager.getAllArticles()
    print(articles.description)
    
    print("articles in english")
    let enArticles = articleManager.getArticles(withLang: "en")
    print(enArticles)
    
    print("get articles containing 'Article 2'")
    let articleTwoOnly = articleManager.getArticles(containString: "Article 2")
    print(articleTwoOnly.description)
    
    print("removing article 2")
    articleManager.removeArticle(article: article2)
    let allArticles = articleManager.getAllArticles()
    print("print all articles")
    print(allArticles)
    
    print("saving")
    articleManager.save()
    
    //          let allArticles = articleManager.getAllArticles()
    //          print("print all articles")
    //        print(allArticles.description)
  }
}
