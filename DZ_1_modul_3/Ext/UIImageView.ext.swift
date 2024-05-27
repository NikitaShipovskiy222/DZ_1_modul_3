
import UIKit

extension UIImageView {
    
    static func makeIcon(img: UIImage, x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) -> UIImageView {
        {
            $0.image = img
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            return $0
        }(UIImageView(frame: CGRect(x: x, y: y, width: w, height: h)))
        
        
    }
}

