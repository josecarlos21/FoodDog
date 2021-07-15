//
//  Constants.swift
//  FoodDog
//
//  Created by José Torres Rivera on 14/07/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit


public struct Constant {
    public struct DateFormat {
        public static let Default = "dd/MM/yyyy"
    }
    
    public struct App {
        public static let Version = "CFBundleShortVersionString"
        public static let SubVersion = "CFBundleVersion"
    }
        
    public struct Text {
        public static let Buscar = "Buscar"
        public static let TitularDelAcuerdo = "Titular del acuerdo"
        public static let RespCumplimiento = "Responsable(s) del cumplimiento"
        public static let JefeResponsable = "Jefe responsable del cumplimiento"
        public static let AreaPerAcuerdo = "Área a la que pertenece el acuerdo"
        public static let Dir = "Dirección"
        public static let FechaReunion =  "Fecha de la reunión"
        public static let FechaGenAcuerd =  "Fecha generación del acuerdo"
        public static let FechaComprAtenc =  "Fecha de compromiso de atención"
        public static let FechaConclude =  "Fecha de conclución"
        public static let DescAcuerdo = "Descripción del acuerdo"
        public static let ConQuienAcuerdo =  "¿Con quién se genera el acuerdo?"
        public static let TipoDForoReunion = "Tipo de foro o reunión"
        public static let NivelImpacto = "Nivel de impacto"
        public static let Vencidas = "Vencidas"
        public static let DentroPeriodo = "Dentro del periodo"
        public static let EstatusAtencion = "Estatus de atención"
        public static let DetalleConcluicion =  "Detalle de conclución del acuerdo"
        public static let AdjuntarArchivo =  "Adjuntar archivo"
    }
    
    public struct JSON {
        public enum Catalog:String {
            case puppyCatalog = "puppyCatalog"
        }
    }
    
    public struct UD {
        public enum Key:String  {
            case Tour = "show_tour"
            case Version =  "version_short"
            case SubVersion = "version_bundle"
        }
    }
    
    public struct SB {
        public enum Name:String {
            case Tour = "PreMainTour"
            case Splash = "Splash"
            case PreMain = "PreMain"
            case Home = "Home"
            case HomeSearchTable = "FDTableViewSearch"
            case Detail = "Agreement"
            case Description = "FDDescription"
        }
        public enum Identifier:String {
            case TourPage1 = "first"
            case TourPage2 = "second"
            case TourPage3 = "thirt"
            case Selection = "SelectionTableViewController"
            case DetailConcluded = "FDConcludedTableViewController"
        }
        public enum SegueIdentifier:String {
            case HomeTableLeft = "leftTableHome"
            case HomeTableRight = "rightTableHome"
        }
    }
    
    public struct Cell {
        
        public enum EnumType {
            case Cell0
            case Cell1
            case Cell2
            case Cell3
            case Cell4
            case Cell5
            case Cell6
            init() {
                self = .Cell0
            }
        }
        
        public struct RegisterCell {
            public static let CustomCell0:String = "CustomCell0"
            public static let CustomCell1:String = "CustomCell1"
            public static let CustomCell2:String = "CustomCell2"
            public static let CustomCell3:String = "CustomCell3"
            public static let CustomCell4:String = "CustomCell4"
            public static let CustomCell5:String = "CustomCell5"
            public static let CustomCell6:String = "CustomCell6"
        }
        
        public struct ReuseIdentifier {
            public static let Cell0:String = "customcell0"
            public static let Cell1:String = "customcell1"
            public static let Cell2:String = "customcell2"
            public static let Cell3:String = "customcell3"
            public static let Cell4:String = "customcell4"
            public static let Cell5:String = "customcell5"
            public static let Cell6:String = "customcell6"
        }
        
    }
}
