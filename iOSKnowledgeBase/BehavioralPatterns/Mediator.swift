//
//  Mediator.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 20.03.2024.
//

/// Mediator is a behavioral design pattern that reduces coupling between components of a program by making them communicate indirectly, through a special mediator object.
/// The Mediator makes it easy to modify, extend and reuse individual components because they’re no longer dependent on the dozens of other classes.
/// Usage examples: The most popular usage of the Mediator pattern in Swift code is facilitating communications between GUI components of an app. The synonym of the Mediator is the Controller part of MVC pattern.

import Foundation

class MediatorRealWorld {
    func test() {
        let newsArray = [News(id: 1, title: "News1", likesCount: 1),
                         News(id: 2, title: "News2", likesCount: 2)]

        let numberOfGivenLikes = newsArray.reduce(0, { $0 + $1.likesCount })

        let mediator = ScreenMediator()

        let feedVC = NewsFeedViewController(mediator, newsArray)
        let newsDetailVC = NewsDetailViewController(mediator, newsArray.first!)
        let profileVC = ProfileViewController(mediator, numberOfGivenLikes)

        mediator.update([feedVC, newsDetailVC, profileVC])

        feedVC.userLikedAllNews()
        feedVC.userDislikedAllNews()
    }
}

class NewsFeedViewController: ScreenUpdatable {
    private var newsArray: [News]
    private weak var mediator: ScreenUpdatable?

    init(_ mediator: ScreenUpdatable?, _ newsArray: [News]) {
        self.newsArray = newsArray
        self.mediator = mediator
    }

    func likeAdded(to news: News) {
        print("News Feed: Received a liked news model with id \(news.id)")

        for var item in newsArray {
            if item == news {
                item.likesCount += 1
            }
        }
    }

    func likeRemoved(from news: News) {
        print("News Feed: Received a disliked news model with id \(news.id)")

        for var item in newsArray {
            if item == news {
                item.likesCount -= 1
            }
        }
    }

    func userLikedAllNews() {
        print("\n\nNews Feed: User LIKED all news models")
        print("News Feed: I am telling to mediator about it...\n")
        newsArray.forEach({ mediator?.likeAdded(to: $0) })
    }

    func userDislikedAllNews() {
        print("\n\nNews Feed: User DISLIKED all news models")
        print("News Feed: I am telling to mediator about it...\n")
        newsArray.forEach({ mediator?.likeRemoved(from: $0) })
    }
}

class NewsDetailViewController: ScreenUpdatable {
    private var news: News
    private weak var mediator: ScreenUpdatable?

    init(_ mediator: ScreenUpdatable?, _ news: News) {
        self.news = news
        self.mediator = mediator
    }

    func likeAdded(to news: News) {
        print("News Detail: Received a liked news model with id \(news.id)")
        if self.news == news {
            self.news.likesCount += 1
        }
    }

    func likeRemoved(from news: News) {
        print("News Detail: Received a disliked news model with id \(news.id)")
        if self.news == news {
            self.news.likesCount -= 1
        }
    }
}

class ProfileViewController: ScreenUpdatable {
    private var numberOfGivenLikes: Int
    private weak var mediator: ScreenUpdatable?

    init(_ mediator: ScreenUpdatable?, _ numberOfGivenLikes: Int) {
        self.numberOfGivenLikes = numberOfGivenLikes
        self.mediator = mediator
    }

    func likeAdded(to news: News) {
        print("Profile: Received a liked news model with id \(news.id)")
        numberOfGivenLikes += 1
    }

    func likeRemoved(from news: News) {
        print("Profile: Received a disliked news model with id \(news.id)")
        numberOfGivenLikes -= 1
    }
}

protocol ScreenUpdatable: class {
    func likeAdded(to news: News)
    func likeRemoved(from news: News)
}

class ScreenMediator: ScreenUpdatable {
    private var screens: [ScreenUpdatable]?

    func update(_ screens: [ScreenUpdatable]) {
        self.screens = screens
    }

    func likeAdded(to news: News) {
        print("Screen Mediator: Received a liked news model with id \(news.id)")
        screens?.forEach({ $0.likeAdded(to: news) })
    }

    func likeRemoved(from news: News) {
        print("ScreenMediator: Received a disliked news model with id \(news.id)")
        screens?.forEach({ $0.likeRemoved(from: news) })
    }
}

struct News: Equatable {
    let id: Int
    let title: String
    var likesCount: Int

    /// Other properties

    static func == (left: News, right: News) -> Bool {
        return left.id == right.id
    }
}
