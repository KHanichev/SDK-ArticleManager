//
//  ArticleManager.swift
//  SDK-ArticleManager
//
//  Created by Kyrylo Hanichev on 23.02.2021.
//  Copyright © 2021 CodeIt_LLC. All rights reserved.
//

import CoreData

public class ArticleManager: NSObject {
  
  //MARK: Private Properties
  
  private var managedObjectContext : NSManagedObjectContext
  private var commitPredicate: NSPredicate?
  private let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
  
  public override init() {
    guard let modelURL = Bundle.main.url(forResource: "article",
                                         withExtension: "momd") else {
      fatalError("Failed to find data model")
    }
    
    guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
      fatalError("Failed to create model from file: \(modelURL)")
    }
    
    let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
    
    managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    managedObjectContext.persistentStoreCoordinator = psc
    
    let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
    let storeURL = docURL?.appendingPathComponent("article.sqlite")
    do {
      try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
    } catch {
      fatalError("Error migrating store: \(error)")
    }
  }
  
  //MARK: Public Methods
  
  public func newArticle() -> Article {
    return NSEntityDescription.insertNewObject(forEntityName: "Article", into: managedObjectContext) as! Article
  }
  
  public func getAllArticles() -> [Article] {
    commitPredicate = NSPredicate(value: true)
    return loadData()
  }
  
  public func  getArticles(withLang lang: String) -> [Article] {
    commitPredicate = NSPredicate(format: "language == %@", lang)
    return loadData()
  }
  
  public func getArticles(containString string: String) -> [Article] {
    commitPredicate = NSPredicate(format: "title CONTAINS %@ || content CONTAINS %@", string, string)
    return loadData()
  }
  
  public func removeArticle(article: Article) {
    managedObjectContext.delete(article)
  }
  
  public func save() {
    if managedObjectContext.hasChanges {
      do {
        try managedObjectContext.save()
      }
      catch {
        fatalError("Fail to save content \(error)")
      }
    }
  }
  
  //MARK: Private Methods
  
  private func loadData() -> [Article] {
    request.predicate = commitPredicate
    do {
      let result = try managedObjectContext.fetch(request) as! [Article]
      return result
    } catch {
      fatalError("Failed to fetch arts")
    }
  }
}
