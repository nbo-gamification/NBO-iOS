//
//  PersistenceHelper.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Realm
import RealmSwift

public protocol PersistenceHelper {
    associatedtype ImmutableModel: Decodable
    associatedtype Model: RealmSwift.Object

    // Parse the Immutable model to the actual Model
    @discardableResult
    static func getModelObject(object: ImmutableModel) -> Model

}

extension PersistenceHelper {

    // Persist Model objects. Param type is an immutable model, return type is the model
    public static func insertOrUpdate(objects: [ImmutableModel]) -> [Model]? {
        let modelObjects = objects.map { getModelObject(object: $0)}
        do {
            let realm = try Realm()
            let validObjects = modelObjects.filter { !$0.isInvalidated }
            try realm.write {
                realm.add(validObjects, update: true)
            }
            return validObjects
        } catch let error {
            print("couldn't save any objects: \(error)")
        }
        return nil
    }

    // Wrapper to support getModelObject with optional parameters
    public static func getOptionalModelObject(object: ImmutableModel?) -> Model? {
        guard let actualObject = object else { return nil }
        return getModelObject(object: actualObject)
    }

    // Persist Model objects. Param type is an Object model, return type is the same model
    public static func insertOrUpdateModelObjects(_ objects: [Model]) -> [Model]? {
        do {
            let realm = try Realm()
            let validObjects = objects.filter { !$0.isInvalidated }
            try realm.write {
                realm.add(validObjects, update: true)
            }
            return validObjects
        } catch let error {
            print("couldn't save any objects: \(error)")
        }
        return nil
    }
}
