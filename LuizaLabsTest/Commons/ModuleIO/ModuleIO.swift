//
//  ModuleIO.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 02/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import UIKit

class ModuleIO {
    
    fileprivate final var object : Any?
    
    fileprivate final var objects : [Any?]?

    init() {
        
    }
    
    /// Inicializa o ModuleIO com um objeto
    ///
    /// - Parameter object: Objeto
    init(withObject object : Any?) {
        
        self.object = object
        
    }
    
    /// Inicia o ModuleIO com um array de objetos
    ///
    /// - Parameter objects: Array de objetos
    init(withObjects objects : [Any?]?) {
        
        self.objects = objects
    }
        
    /// Seta um objeto
    ///
    /// - Parameter object: objeto
    final func setObject(object : Any?) {
        
        self.object = object
        
    }
    
    /// Adiciona um objeto ao array de objetos
    ///
    /// - Parameter object: Objeto
    final func appendObject(object : Any?) {
        
        if (self.objects == nil) { self.objects = [Any?]() }
        self.objects?.append(object)
        
    }
    
    /// Obtem o objeto já tipado
    ///
    /// - Parameter type: Tipo do objeto
    /// - Returns: Objeto a ser retornado
    final func getObject<T>(type : T.Type) -> T {
        
        return (self.object as? T)!
    }
    
    /// Obtem objeto em um determinado index
    ///
    /// - Parameters:
    ///   - index: Index
    ///   - type: Tipo do objeto
    /// - Returns: Objeto a ser retornado
    final func getObject<T>(index : Int, type : T.Type) -> T {
        
        return (objects?[index] as? T)!
        
    }
    
    /// Obtem um array de objetos
    ///
    /// - Parameters:
    ///   - type: Tipo do objeto
    /// - Returns: Objeto a ser retornado
    final func getObjects<T>(type : T.Type) -> [T] {
        
        return (objects as? [T])!
        
    }
    
    /// Retonar o count do array de objetos
    ///
    /// - Returns: Count
    final func objectsCount() -> Int {
        
        guard let count = self.objects?.count else { return 0 }
        return count
    }
    
}
