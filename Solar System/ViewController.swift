//
//  ViewController.swift
//  Solar System
//
//  Created by Francisco Gonzalez on 5/10/19.
//  Copyright © 2019 Francisco Gonzalez. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    let configuration = ARWorldTrackingConfiguration()

    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
    }

    override func viewDidAppear(_ animated: Bool) {
        
        let sun = SCNNode()
        let mercuryParent = SCNNode()
        let venusParent = SCNNode()
        let earthParent = SCNNode()
        let moonParent = SCNNode()
        let marsParent = SCNNode()
        let jupiterParent = SCNNode()
        let saturnParent = SCNNode()
        let uranusParent = SCNNode()
        let neptuneParent = SCNNode()
        
        sun.geometry = SCNSphere(radius: 0.6)
        sun.geometry?.firstMaterial?.diffuse.contents = "sun"
        sun.position = SCNVector3(0, 0, -1)
        
        mercuryParent.position = SCNVector3(0, 0, -1)
        venusParent.position = SCNVector3(0, 0, -1)
        earthParent.position = SCNVector3(0, 0, -1)
        moonParent.position = SCNVector3(2.6, 0, 0)
        marsParent.position = SCNVector3(0, 0, -1)
        jupiterParent.position = SCNVector3(0, 0, -1)
        saturnParent.position = SCNVector3(0, 0, -1)
        uranusParent.position = SCNVector3(0, 0, -1)
        neptuneParent.position = SCNVector3(0, 0, -1)
        
        
        self.sceneView.scene.rootNode.addChildNode(sun)
        self.sceneView.scene.rootNode.addChildNode(mercuryParent)
        self.sceneView.scene.rootNode.addChildNode(venusParent)
        self.sceneView.scene.rootNode.addChildNode(earthParent)
        self.sceneView.scene.rootNode.addChildNode(moonParent)
        self.sceneView.scene.rootNode.addChildNode(marsParent)
        self.sceneView.scene.rootNode.addChildNode(jupiterParent)
        self.sceneView.scene.rootNode.addChildNode(saturnParent)
        self.sceneView.scene.rootNode.addChildNode(uranusParent)
        self.sceneView.scene.rootNode.addChildNode(neptuneParent)
        
        
        let mercury = planet(geomerty: SCNSphere(radius: 0.01), diffuse: UIImage(named: "mercury"), specular: nil, emission: nil, normal: nil, position: SCNVector3(1, 0, 0))
        
        let venus = planet(geomerty: SCNSphere(radius: 0.02), diffuse: UIImage(named:"venusSurface"), specular: nil, emission: UIImage(named:"venusAtmoshere"), normal: nil, position: SCNVector3(1.7, 0, 0))
        
        let earth = planet(geomerty: SCNSphere(radius: 0.02), diffuse: UIImage(named: "earthDay"), specular: UIImage(named: "earthSpecular"), emission: UIImage(named: "earthEmission"), normal: UIImage(named: "earthNormal"), position: SCNVector3(2.6, 0, 0))
        
        let moon = planet(geomerty: SCNSphere(radius: 0.005), diffuse: UIImage(named: "moon"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0, 0, -0.1))
        
        let mars = planet(geomerty: SCNSphere(radius: 0.1), diffuse: UIImage(named: "mars"), specular: nil, emission: nil, normal: nil, position: SCNVector3(4, 0, 0))
        
        let jupiter = planet(geomerty: SCNSphere(radius: 0.15), diffuse: UIImage(named: "jupiter"), specular: nil, emission: nil, normal: nil, position: SCNVector3(6, 0, 0))
        
        let saturn = planet(geomerty: SCNSphere(radius: 0.1), diffuse: UIImage(named: "saturn"), specular: nil, emission: nil, normal: nil, position: SCNVector3(8.5, 0, 0))
        
        let uranus = planet(geomerty: SCNSphere(radius: 0.05), diffuse: UIImage(named: "uranus"), specular: nil, emission: nil, normal: nil, position: SCNVector3(11, 0, 0))
        
        let neptune = planet(geomerty: SCNSphere(radius: 0.05), diffuse: UIImage(named: "neptune"), specular: nil, emission: nil, normal: nil, position: SCNVector3(13, 0, 0))
        
        mercuryParent.addChildNode(mercury)
        venusParent.addChildNode(venus)
        earthParent.addChildNode(earth)
        earthParent.addChildNode(moonParent)
        earth.addChildNode(moon)
        moonParent.addChildNode(moon)
        marsParent.addChildNode(mars)
        jupiterParent.addChildNode(jupiter)
        saturnParent.addChildNode(saturn)
        uranusParent.addChildNode(uranus)
        neptuneParent.addChildNode(neptune)
        
        let sunRotation = rotation(time: 30)
        let mercuryParentRotation = rotation(time: 2)
        let mercuryRotation = rotation(time: 20)
        let venusParentRotation = rotation(time: 5)
        let venusRotation = rotation(time: 20)
        let earthParentRotation = rotation(time: 7)
        let earthRotation = rotation(time: 10)
        let moonParentRotation = rotation(time: 1)
        let moonRotation = rotation(time: 15)
        let marsParentRotation = rotation(time: 15)
        let marsRotation = rotation(time: 15)
        let jupiterParentRotation = rotation(time: 75)
        let jupiterRotation = rotation(time: 5)
        let saturnParentRotation = rotation(time: 150)
        let saturnRotation = rotation(time: 5)
        let uranusParentRotation = rotation(time: 400)
        let uranusRotation = rotation(time: 8)
        let neptuneParentRotation = rotation(time: 800)
        let neptuneRotation = rotation(time: 8)
        
        sun.runAction(sunRotation)
        mercuryParent.runAction(mercuryParentRotation)
        mercury.runAction(mercuryRotation)
        venusParent.runAction(venusParentRotation)
        venus.runAction(venusRotation)
        earth.runAction(earthRotation)
        earthParent.runAction(earthParentRotation)
        moonParent.runAction(moonParentRotation)
        moon.runAction(moonRotation)
        marsParent.runAction(marsParentRotation)
        mars.runAction(marsRotation)
        jupiterParent.runAction(jupiterParentRotation)
        jupiter.runAction(jupiterRotation)
        saturnParent.runAction(saturnParentRotation)
        saturn.runAction(saturnRotation)
        uranusParent.runAction(uranusParentRotation)
        uranus.runAction(uranusRotation)
        neptuneParent.runAction(neptuneParentRotation)
        neptune.runAction(neptuneRotation)
    
    }
    
    func planet(geomerty: SCNGeometry, diffuse: UIImage?, specular: UIImage?, emission: UIImage?, normal: UIImage?, position: SCNVector3) -> SCNNode {
        
        let planet = SCNNode(geometry: geomerty)
        planet.geometry?.firstMaterial?.diffuse.contents = diffuse
        planet.geometry?.firstMaterial?.specular.contents = specular
        planet.geometry?.firstMaterial?.normal.contents = normal
        planet.geometry?.firstMaterial?.emission.contents = emission
        
        planet.position = position
        return planet
    }
    
    func rotation(time: TimeInterval) -> SCNAction {
        let rotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: time)
        let foreverRotation = SCNAction.repeatForever(rotation)
        return foreverRotation
    }
    
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/100}
}
