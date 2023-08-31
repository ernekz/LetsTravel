//
//  KafkaMessagePublisher.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-30.
//

import Foundation
import Combine

class KafkaMessagePublisher: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var messages: [Destination] = []
    
    init(){
        
        
    }
}
