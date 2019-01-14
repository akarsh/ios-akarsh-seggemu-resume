//
//  LabelHeader.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 11.12.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

protocol LabelHeader where Self: UIViewController {
    //    setting the labels of the resume schema
    var labelContentHeader: String? { get set }
    //    parsed resume data is stored in basicsContent
    var basicsContent: Resume? { get set }
}
