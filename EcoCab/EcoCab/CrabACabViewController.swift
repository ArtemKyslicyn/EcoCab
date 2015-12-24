//
//  CrabACabViewController.swift
//  EcoCab
//
//  Created by Arcilite on 19.12.15.
//  Copyright © 2015 Arcilite. All rights reserved.
//

import UIKit
import MapKit
class CrabACabViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var searchView: UIView!
    let regionRadius: CLLocationDistance = 1000
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var navView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        centerMapOnLocation(initialLocation)
        addMapAnotations()
      
    }
    
    func addMapAnotations(){
        let annotation = MKPointAnnotation()
        let location = CLLocationCoordinate2D(
            latitude: 21.282778,
            longitude: -157.82944
        )
        annotation.coordinate = location
        annotation.title = "Your Position"
        self.mapView.addAnnotation(annotation)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toggleSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
   
    func mapView(mapView: MKMapView,
        viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
            
                
                let reuseId = "user"
                var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
                
                if pinView == nil
                {
                    pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                    pinView!.canShowCallout = true
                    pinView!.draggable = true
                    pinView!.image = UIImage(named:"pin")!
                   
                }else{
                    pinView!.annotation = annotation
                }
                
                return pinView
           
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, didChangeDragState newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        switch (newState) {
        case .Starting:
            view.dragState = .Dragging
           searchView.hidden = true
        case .Ending, .Canceling:
            view.dragState = .None
        default: break
        }
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        

    }
    
      func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView){
      searchView.hidden = false
    }
}
