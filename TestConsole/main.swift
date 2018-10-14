//
//  main.swift
//  TestConsole
//
//  Created by Pompei William - Tech Consultant on 12.10.18.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import Foundation

let performer = PerformerImpl.performerFactory()
while true {
    if let command = readLine() {
        let result = performer.perform(command: command)
        result.forEach { item in
            print("\(item)")
        }
    }
}

