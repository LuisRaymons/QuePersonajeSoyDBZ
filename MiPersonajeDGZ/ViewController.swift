//
//  ViewController.swift
//  MiPersonajeDGZ
//
//  Created by Luis Ramon Valencia Aguayo on 20/08/24.
//  Copyright © 2024 Luis Ramon Valencia Aguayo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let tipoRaza = ["Seleccione el tipo de raza", "Humano","Sayayin","Androide","Namekianos","Kaios"]
    let tieneHijos = ["Seleccione si tiene hijos","Si","No"];
    let numeromuertes = ["Seleccione cuantas veces a muerto","0","1","2","3","4","5","6"];
    let planetas = ["Seleccione su planeta de origen", "Tierra", "Namek", "Kaio", "Vegeta","Sagrado","Yardrat"]
    let genero = ["Seleccione si es mujer o hombre", "Masculino","Femenino"];
    
    var pregunta1:String = "";
    var pregunta2:String = "";
    var pregunta3:String = "";
    var pregunta4:String = "";
    var pregunta5:String = "";
    
    @IBOutlet weak var Selectpregunta1: UIPickerView!;
    @IBOutlet weak var Selectpregunta2: UIPickerView!;
    @IBOutlet weak var Selectpregunta3: UIPickerView!;
    @IBOutlet weak var Selectpregunta4: UIPickerView!;
    @IBOutlet weak var Selectpregunta5: UIPickerView!;
    @IBOutlet weak var Personaje: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Selectpregunta1.delegate = self;
        Selectpregunta2.delegate = self;
        Selectpregunta3.delegate = self;
        Selectpregunta4.delegate = self;
        Selectpregunta5.delegate = self;
        
        Selectpregunta1.tag = 1;
        Selectpregunta2.tag = 2;
        Selectpregunta3.tag = 3;
        Selectpregunta4.tag = 4;
        Selectpregunta5.tag = 5;
    }


}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag {
        case 1:
            return tipoRaza.count;
        case 2:
            return tieneHijos.count;
        case 3:
            return numeromuertes.count;
        case 4:
            return planetas.count;
        case 5:
            return genero.count;
        default:
            return 1;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView.tag {
        case 1:
            return tipoRaza[row];
        case 2:
            return tieneHijos[row];
        case 3:
            return numeromuertes[row];
        case 4:
            return planetas[row];
        case 5:
            return genero[row];
        default:
            return "No se pudo cargar la informacion";
        }
    }
    
    func showalert(titulo:String,mensaje:String, incontroller:UIViewController, estilos: UIAlertController.Style)
    {
        let alertacontroller = UIAlertController(title: titulo, message: mensaje, preferredStyle: estilos);
        
        let botonok = UIAlertAction(title: "Aceptar", style: .default){
            action in
        }
        
        alertacontroller.addAction(botonok)
        incontroller.present(alertacontroller, animated:true)
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var pdgz:String = "";
        
        if(pickerView.tag == 1){
            pregunta1 = tipoRaza[row];
        } else if(pickerView.tag == 2){
            pregunta2 = tieneHijos[row];
        } else if(pickerView.tag == 3){
            pregunta3 = numeromuertes[row];
        } else if(pickerView.tag == 4){
            pregunta4 = planetas[row];
        } else if pickerView.tag == 5 {
            pregunta5 = genero[row];
            
            if(pregunta1 == "Seleccione el tipo de raza"){
                showalert(titulo: "Error en el sistema", mensaje: "Favor de seleccionar el tipo de raza", incontroller:self, estilos: .alert);
            } else if(pregunta2 == "Seleccione si tiene hijos"){
                showalert(titulo: "Error en el sistema", mensaje: "Favor de seleccionar si tienes hijos", incontroller:self, estilos: .alert);
            } else if(pregunta3 == "Seleccione cuantas veces a muerto"){
                showalert(titulo: "Error en el sistema", mensaje: "Favor de seleccionar cuantas veces murio el personaje", incontroller:self, estilos: .alert);
            } else if(pregunta4 == "Seleccione su planeta de origen"){
                showalert(titulo: "Error en el sistema", mensaje: "Seleccione el planeta de origen del personaje", incontroller:self, estilos: .alert);
            } else if(pregunta5 == "Seleccione si es mujer o hombre"){
                showalert(titulo: "Error en el sistema", mensaje: "Favor de seleccionar el genero del personaje", incontroller:self, estilos: .alert);
            } else{
                
                
                if(pregunta1 == "Humano" && pregunta2 == "Si" && pregunta3 == "4" && pregunta4 == "Tierra" && pregunta5 == "Masculino"){
                    pdgz = "Krilin";
                } else if(pregunta1 == "Humano" && pregunta2 == "No" && pregunta3 == "4" && pregunta4 == "Tierra" && pregunta5 == "Masculino"){
                    pdgz = "Yamcha";
                } else if(pregunta1 == "Sayayin" && pregunta2 == "No" && pregunta3 == "4" && pregunta4 == "Tierra" && pregunta5 == "Masculino"){
                    pdgz = "Truns";
                } else if(pregunta1 == "Sayayin" && pregunta2 == "No" && pregunta3 == "3" && pregunta4 == "Tierra" && pregunta5 == "Masculino"){
                    pdgz = "Gottens";
                } else if(pregunta1 == "Sayayin" && pregunta2 == "Si" && pregunta3 == "2" && pregunta4 == "Tierra" && pregunta5 == "Masculino"){
                    pdgz = "Gohan";
                } else if(pregunta1 == "Sayayin" && pregunta2 == "Si" && pregunta3 == "5" && pregunta4 == "Vegeta" && pregunta5 == "Masculino"){
                    pdgz = "Goku";
                } else if(pregunta1 == "Humano" && pregunta2 == "Si" && pregunta3 == "4" && pregunta4 == "Vegeta" && pregunta5 == "Masculino"){
                    pdgz = "Vegeta";
                } else if(pregunta1 == "Humano" && pregunta2 == "Si" && pregunta3 == "2" && pregunta4 == "Tierra" && pregunta5 == "Femenino"){
                    pdgz = "Milk";
                } else if(pregunta1 == "Androide" && pregunta2 == "Si" && pregunta3 == "1" && pregunta4 == "Tierra" && pregunta5 == "Femenino"){
                    pdgz = "Numero 18";
                } else if(pregunta1 == "Androide" && pregunta2 == "Si" && pregunta3 == "1" && pregunta4 == "Tierra" && pregunta5 == "Masculino"){
                    pdgz = "Numero 17";
                } else if(pregunta1 == "Humano" && pregunta2 == "Si" && pregunta3 == "4" && pregunta4 == "Tierra" && pregunta5 == "Masculino"){
                    pdgz = "Krilin";
                } else if(pregunta1 == "Namekianos" && pregunta2 == "No" && pregunta3 == "4" && pregunta4 == "Namek" && pregunta5 == "Masculino"){
                    pdgz = "Piccolo";
                } else if(pregunta1 == "Namekianos" && pregunta2 == "No" && pregunta3 == "1" && pregunta4 == "Namek" && pregunta5 == "Masculino"){
                    pdgz = "Dende";
                } else{
                    pdgz = "Personaje no encontrado";
                }
               
                
            }
            
            print(pdgz)
            
            Personaje.text = "";
            Personaje.text = pdgz;
            
        }
        
        
    }
    
    
}

