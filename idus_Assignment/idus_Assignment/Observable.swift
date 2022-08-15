//
//  Observable.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/15.
//

import Foundation

final class Observable<T> {
    typealias Listener = ((T) -> Void)

    private var listener: Listener?
    private(set) var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(listener: @escaping Listener) {
        self.listener = listener
    }

    func updateValue(value: T) {
        self.value = value
    }
}
