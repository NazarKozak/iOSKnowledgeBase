//
//  DRY.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 18.03.2024.
//

import Foundation

/// The DRY principle suggests that code duplication should be avoided by extracting common functionality into reusable components.
/// Without DRY principle
class WithoutDRYPrinciple {
    func calculateAreaOfRectangle(length: Double, width: Double) -> Double {
        return length * width
    }

    func calculatePerimeterOfRectangle(length: Double, width: Double) -> Double {
        return 2 * (length + width)
    }

    func calculateAreaOfSquare(sideLength: Double) -> Double {
        return sideLength * sideLength
    }

    func calculatePerimeterOfSquare(sideLength: Double) -> Double {
        return 4 * sideLength
    }
}

/// In the above code, there's duplication between the functions calculating area and perimeter for rectangles and squares. Now, let's refactor using the DRY principle:
/// With DRY principle
class WithDRYPrinciple {
    func calculateAreaOfRectangle(length: Double, width: Double) -> Double {
        return length * width
    }

    func calculatePerimeterOfRectangle(length: Double, width: Double) -> Double {
        return 2 * (length + width)
    }

    func calculateAreaOfSquare(sideLength: Double) -> Double {
        return calculateAreaOfRectangle(length: sideLength, width: sideLength)
    }

    func calculatePerimeterOfSquare(sideLength: Double) -> Double {
        return calculatePerimeterOfRectangle(length: sideLength, width: sideLength)
    }
}
/// By reusing the rectangle calculations in the square calculations, we adhere to the DRY principle.
