
import UIKit
@IBDesignable
class GradientView: UIView {

    @IBInspectable var FirstColor: UIColor = UIColor.clear {
        didSet{
            updateGradient()
        }
    }
    @IBInspectable var SecondColor: UIColor = UIColor.clear {
        didSet{
            updateGradient()
        }
    }
    @IBInspectable var FirstLocation: Float = 0.0 {
        didSet{
            updateGradient()
        }
    }
    @IBInspectable var SecondLocation: Float = 1.0 {
        didSet{
            updateGradient()
        }
    }
    
    override class var layerClass : AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateGradient() {
        guard let layer = self.layer as? CAGradientLayer else { return  }
        layer.colors = [ FirstColor.cgColor,SecondColor.cgColor ]
        layer.locations = [FirstLocation,SecondLocation] as [NSNumber]
    }
    
    static func setGradient(firstColor Fcolor : UIColor,
                            secondColor Scolor: UIColor,
                            inView view: UIView,
                            Atlocation firstPosition: NSNumber = 0, secondPosition: NSNumber = 1){
        
        let newlayer = CAGradientLayer()
        newlayer.colors = [Fcolor.cgColor,Scolor.cgColor]
        newlayer.locations = [firstPosition,secondPosition]
        
        view.layer.insertSublayer(newlayer, at: 0)
        
    }
}
