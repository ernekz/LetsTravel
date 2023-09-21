//
//  CallbackPublisher.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-21.
//

import Foundation
import Combine

class CallbackPublisher<Output>: ObservableObject {
    @Published var output: Output?
        
        private var cancellable: AnyCancellable?

        init() {}
        
        func send(output: Output) {
            self.output = output
        }
        
        func listen(callback: @escaping (Output) -> Void) {
            cancellable = $output
                .compactMap { $0 }
                .sink { value in
                    callback(value)
                }
        }
}
