//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import Foundation

enum ArticlesRepository {
    static func loadAll() async -> [Article] {
        sampleArticles
    }

    static func article(id: String) async -> Article? {
        sampleArticles.first { $0.id == id }
    }

    private static let sampleArticles: [Article] = [
        Article(
            id: "1",
            title: "The Quiet Power of Small Habits",
            summary: "Why tiny, repeatable actions reshape your life more than grand resolutions.",
            body: """
            Small habits compound. A five-minute walk after dinner sounds trivial, but performed \
            daily for a year it changes how you sleep, how you digest, and how you think about \
            movement. The same is true for writing one paragraph a day, reading ten pages, or \
            saving a few dollars.

            The trick is not motivation but friction. Make the desired habit a little easier and \
            the undesired one a little harder. Lay out your running shoes the night before. Hide \
            the snacks behind the vegetables. Over time, the environment carries you, and you \
            stop relying on willpower.

            None of this is glamorous, and that is the point. The compounding works precisely \
            because each step is small enough to survive a bad day.
            """,
            author: "Iris Calderón",
            publishedAt: Date(timeIntervalSince1970: 1_714_300_000)
        ),
        Article(
            id: "2",
            title: "What SwiftUI Got Right",
            summary: "A look at the design choices that made SwiftUI feel different from UIKit.",
            body: """
            SwiftUI bet on declarative views, value semantics, and a unidirectional data flow. \
            Each of these choices, taken alone, was familiar. Together they produced a \
            framework that feels closer to writing a spreadsheet formula than wiring up a UI.

            The state-driven model means you describe what should appear, not how to get there. \
            The framework diffs your description against the previous one and animates the \
            difference. Most of the time it just works, and when it does not, the failures are \
            usually about identity, not about layout.

            The remaining rough edges – navigation, focus, complex lists – are the places where \
            the declarative model meets the messier parts of UIKit. Apple has been steadily \
            polishing these, and each release closes the gap a little more.
            """,
            author: "Theo Marsden",
            publishedAt: Date(timeIntervalSince1970: 1_715_900_000)
        ),
        Article(
            id: "3",
            title: "Why Your Codebase Hates Friday Deploys",
            summary: "It is not superstition. It is statistics, attention, and the on-call rotation.",
            body: """
            Friday deploys fail more often, but not because the code is worse. They fail because \
            the people watching are tired, distracted, and counting down to the weekend. By the \
            time the alert fires at 6 PM, half the team has logged off and the other half is \
            making dinner.

            The cost of an outage is not just the downtime. It is the sleep your on-call engineer \
            loses on Saturday morning, the trust you spend with users, and the post-mortem you \
            write on Monday instead of building.

            Some teams ban Friday deploys outright. Others rely on feature flags and gradual \
            rollouts so that risk is decoupled from the deploy itself. Either approach beats \
            shipping into the void at 4:55 PM.
            """,
            author: "Priya Ramanathan",
            publishedAt: Date(timeIntervalSince1970: 1_717_500_000)
        ),
        Article(
            id: "4",
            title: "Reading Slowly on Purpose",
            summary: "Speed-reading sells books. Slow reading is what changes you.",
            body: """
            We have been sold the idea that reading faster is reading better. It is not. The \
            books that shape you are the ones you read with a pencil in your hand, where you \
            stop every page to argue with the author or copy a sentence into a notebook.

            Slow reading is uncomfortable at first. The mind, used to scrolling, keeps reaching \
            for the next page. But after a few sessions, something settles, and you start to \
            notice how arguments are built, where the seams are, what was left out.

            Speed is not the metric. Whether the book is still working on you a month later is.
            """,
            author: "Mara Linden",
            publishedAt: Date(timeIntervalSince1970: 1_719_100_000)
        ),
        Article(
            id: "5",
            title: "A Short Defense of Boring Tools",
            summary: "Postgres, cron, and plain text files have outlived a lot of trends.",
            body: """
            Every few years a new tool promises to replace the boring ones. Sometimes it does, \
            but more often the boring tool quietly absorbs the good ideas and keeps going. \
            Postgres is a good example. So is cron. So is a plain text file with one line per \
            entry.

            Boring tools win because they are well understood. The sharp edges are documented. \
            The failure modes have names. When something goes wrong at 2 AM, you can find an \
            answer instead of opening a GitHub issue and waiting.

            Use boring tools by default. Reach for the exciting one only when the boring tool \
            has actually failed you, not when you are bored of it.
            """,
            author: "Jonas Wexler",
            publishedAt: Date(timeIntervalSince1970: 1_720_700_000)
        ),
        Article(
            id: "6",
            title: "The Underrated Skill of Writing It Down",
            summary: "Half of clear thinking is just refusing to keep it all in your head.",
            body: """
            A surprising amount of confusion at work comes from people trying to reason about \
            something complicated without writing it down. The argument loops. Decisions are \
            forgotten. Two people walk away with different versions of the same meeting.

            Writing forces you to be specific. It exposes the steps you were skipping in your \
            head. It also leaves a record, which means future-you, or future-them, has \
            something to argue with rather than reconstruct from memory.

            You do not need a perfect system. A dated document, a paragraph long, beats a \
            spotless second-brain that you never open.
            """,
            author: "Ada Okafor",
            publishedAt: Date(timeIntervalSince1970: 1_722_300_000)
        ),
    ]
}
