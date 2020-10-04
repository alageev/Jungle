//
//  ImageLoader.swift
//  Jungle
//
//  Created by Алексей Агеев on 14.09.2020.
//

import Combine
import UIKit

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private(set) var isLoading = false
    
    private let url: URL
    private var cache: ImageCache?
    private var cancellable: AnyCancellable?
    
    private static let imageProcessingQueue = DispatchQueue(label: "image-processing")
    
    init(url: URL, cache: ImageCache? = nil) {
        self.url = url
        self.cache = cache
    }
    
    deinit {
        cancel()
    }
    
    func load() {
        DispatchQueue.main.async {
            guard !self.isLoading else { return }
            
            if let image = self.cache?[self.url] {
                self.image = image
                return
            }
            
            self.cancellable = URLSession.shared.dataTaskPublisher(for: self.url)
                .map { UIImage(data: $0.data) }
                .replaceError(with: nil)
                .handleEvents(receiveSubscription: { [weak self] _ in self?.onStart() },
                              receiveOutput: { [weak self] in self?.cache($0) },
                              receiveCompletion: { [weak self] _ in self?.onFinish() },
                              receiveCancel: { [weak self] in self?.onFinish() })
                .subscribe(on: Self.imageProcessingQueue)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] in self?.image = $0 }
        }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    
    private func onStart() {
        isLoading = true
    }
    
    private func onFinish() {
        isLoading = false
    }
    
    private func cache(_ image: UIImage?) {
        image.map { cache?[url] = $0 }
    }
}
