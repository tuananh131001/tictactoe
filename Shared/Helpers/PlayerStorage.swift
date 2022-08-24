//
//  Persistence.swift
//  test core data
//
//  Created by William on 22/08/2022.
// https://betterprogramming.pub/swiftui-and-coredata-the-mvvm-way-ab9847cbff0f?gi=d8d692f00434

import Combine
import CoreData
import os

class PlayerStorage: NSObject, ObservableObject {
    var players = CurrentValueSubject<[GamePlayer], Never>([])
    private let playerFetchController: NSFetchedResultsController<GamePlayer>
    static let shared: PlayerStorage = PlayerStorage()

    private override init() {
        let playerFetchRequest: NSFetchRequest<GamePlayer> = GamePlayer.fetchRequest()
        playerFetchRequest.sortDescriptors = []
        playerFetchController = NSFetchedResultsController(
            fetchRequest: playerFetchRequest,
            managedObjectContext: PersistenceController.shared.container.viewContext,
            sectionNameKeyPath: nil, cacheName: nil
        )
        super.init()

        playerFetchController.delegate = self

        do {
            try playerFetchController.performFetch()
            players.value = playerFetchController.fetchedObjects ?? []
        } catch {
            NSLog("Error: could not fetch objects")
        }
    }
    func add(withId id: UUID, name: String, score:Int) {
        let newGamePlayer = GamePlayer(context: PersistenceController.shared.container.viewContext)
        newGamePlayer.setValue(id, forKey: "id")
        newGamePlayer.setValue(name, forKey: "name")
        newGamePlayer.setValue(score, forKey: "score")
        saveContext()
    }
    func delete(id: UUID) {
        let fetchPlayer: NSFetchRequest<GamePlayer> = GamePlayer.fetchRequest()
        do {

            guard let exam = try PersistenceController.shared.container.viewContext.fetch(fetchPlayer).first else { return }
            PersistenceController.shared.container.viewContext.delete(exam)
            saveContext()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    private func saveContext() {
        do {
            try PersistenceController.shared.container.viewContext.save()
        } catch {
            NSLog("ERROR: \(error as NSObject)")
        }
    }

}
extension PlayerStorage: NSFetchedResultsControllerDelegate {
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let players = controller.fetchedObjects as? [GamePlayer] else { return }
        self.players.value = players
    }
}
