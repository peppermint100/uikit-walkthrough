//
//  UIImageUtil.swift
//  TodoListCodeData
//
//  Created by peppermint100 on 2023/06/12.
//

import UIKit

extension UIImage {
    func resize(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale

        let size = CGSize(width: newWidth, height: newHeight)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        
        return renderImage
    }
    
    func withPadding(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) -> UIImage {
        let width = size.width + leading + trailing
        let height = size.height + top + bottom
        let newSize = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        let origin = CGPoint(x: leading, y: top)
        draw(at: origin)
        let paddedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return paddedImage ?? self
    }
}
