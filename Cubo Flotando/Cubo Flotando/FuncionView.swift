//
//  FuncionView.swift
//  Cubo Flotando
//
//  Created by g802 DIT UPM on 20/9/18.
//  Copyright © 2018 g802 DIT UPM. All rights reserved.
//

import UIKit

struct FunctionPoint{
    var x = 0.0
    var y = 0.0
}

protocol FuncionViewDataSource: class {
    
    func startIndexFor(_ funcionView: FuncionView)-> Double
    
    func endIndexFor(_ funcionView: FuncionView)-> Double
    
    func pointFunctionView(_ funcionView: FuncionView, pointAt: Double)->FunctionPoint
    
}

@IBDesignable
class FuncionView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
    
    @IBInspectable
    var escala: Double = 1.0
    
    weak var dataSource: FuncionViewDataSource!
    
    override func draw(_ rect: CGRect) {
        
        //Pone los ejes
        drawAxis()
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y:0))
        path.addLine(to: CGPoint(x: 20, y: 50))
        
        UIColor.blue.setStroke()
        path.stroke()
    }
    
    private func drawAxis(){
        
        //Captura el ancho y el alto de la UIView
        let width = bounds.size.width
        let height = bounds.size.height
        
        //Pinta una línea que va de arriba a abajo en la mitad de la UIView
        let pathInicial = UIBezierPath()
        pathInicial.move(to: CGPoint(x: width/2, y: 0))
        pathInicial.addLine(to: CGPoint(x: width/2, y: height))
        
        //Pinta una línea que va de izquierda a derecha en la mitad de la UIView
        let pathFinal = UIBezierPath()
        pathFinal.move(to: CGPoint(x: 0, y: height/2))
        pathFinal.addLine(to: CGPoint(x: width, y: height/2))
        
        pathInicial.lineWidth = 1
        pathInicial.stroke()
        pathFinal.lineWidth = 1
        pathFinal.stroke()
    }
    

}
