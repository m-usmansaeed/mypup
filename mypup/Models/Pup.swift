//
//  Pup.swift
//  mypup
//  Copyright (c) Muhammad Usman Saeed
//
//  Using xCode 12.3, Swift 5.0
//  Running on macOS 12.6
//  Created on 11/26/23
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//


import Foundation

struct Pup : Codable {
    
    let weight : PupWeight?
    let height : PupHeight?
    let id : Int?
    let name : String?
    let pup_description : String?
    let bred_for : String?
    let breed_group : String?
    let life_span : String?
    let history : String?
    let temperament : String?
    let reference_image_id : String?
    let image : PupImage?

    enum CodingKeys: String, CodingKey {

        case weight = "weight"
        case height = "height"
        case id = "id"
        case name = "name"
        case pup_description = "description"
        case bred_for = "bred_for"
        case breed_group = "breed_group"
        case life_span = "life_span"
        case history = "history"
        case temperament = "temperament"
        case reference_image_id = "reference_image_id"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        weight = try values.decodeIfPresent(PupWeight.self, forKey: .weight)
        height = try values.decodeIfPresent(PupHeight.self, forKey: .height)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        pup_description = try values.decodeIfPresent(String.self, forKey: .pup_description)
        bred_for = try values.decodeIfPresent(String.self, forKey: .bred_for)
        breed_group = try values.decodeIfPresent(String.self, forKey: .breed_group)
        life_span = try values.decodeIfPresent(String.self, forKey: .life_span)
        history = try values.decodeIfPresent(String.self, forKey: .history)
        temperament = try values.decodeIfPresent(String.self, forKey: .temperament)
        reference_image_id = try values.decodeIfPresent(String.self, forKey: .reference_image_id)
        image = try values.decodeIfPresent(PupImage.self, forKey: .image)
    }
    
    init(name: String,
         weight: PupWeight,
         height: PupHeight,
         id: Int,
         description: String,
         bred_for: String,
         breed_group: String,
         life_span: String,
         history: String,
         temperament: String,
         reference_image_id: String,
         image: PupImage?){
        
        self.weight = weight
        self.height = height
        self.name = name
        self.id = id
        self.pup_description = description
        self.bred_for = bred_for
        self.breed_group = breed_group
        self.life_span = life_span
        self.history = history
        self.temperament = temperament
        self.reference_image_id = reference_image_id
        self.image = image
    }
}

struct PupWeight : Codable {
    let imperial : String?
    let metric : String?

    enum CodingKeys: String, CodingKey {

        case imperial = "imperial"
        case metric = "metric"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        imperial = try values.decodeIfPresent(String.self, forKey: .imperial)
        metric = try values.decodeIfPresent(String.self, forKey: .metric)
    }
    
    init(imperial: String, metric: String) {
        self.imperial = imperial
        self.metric = metric
    }

}

struct PupHeight : Codable {
    let imperial : String?
    let metric : String?

    enum CodingKeys: String, CodingKey {

        case imperial = "imperial"
        case metric = "metric"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        imperial = try values.decodeIfPresent(String.self, forKey: .imperial)
        metric = try values.decodeIfPresent(String.self, forKey: .metric)
    }
    
    init(imperial: String, metric: String) {
        self.imperial = imperial
        self.metric = metric
    }

}

struct PupImage : Codable {
    let id : String?
    let width : Int?
    let height : Int?
    let url : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case width = "width"
        case height = "height"
        case url = "url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }

    init(id: String, width: Int, height: Int, url: String) {
        self.id = id
        self.width = width
        self.height = height
        self.url = url
    }
    
}

struct MockData {
    
    static let pup1 = Pup(name: "African Hunting Dog",
                   weight: PupWeight(imperial: "55 - 90", metric: "25 - 41"),
                   height: PupHeight(imperial: "18 - 24", metric: "46 - 61"),
                   id: 7, description: "", bred_for: "Guarding", breed_group: "Mixed", life_span: "12 - 13 years", history: "", temperament: "Wild, Hardworking, Dutiful", reference_image_id: "33mJ-V3RX",
                   image: PupImage(id: "33mJ-V3RX", width: 1828, height: 2065, url: "https://cdn2.thedogapi.com/images/33mJ-V3RX.jpg"))
    
    static let pup2 = Pup(name: "Alapaha Blue Blood Bulldog",
                   weight: PupWeight(imperial: "55 - 90", metric: "25 - 41"),
                   height: PupHeight(imperial: "18 - 24", metric: "46 - 61"),
                   id: 8, description: "The Alapaha Blue Blood Bulldog is a well-developed, exaggerated bulldog with a broad head and natural drop ears. The prominent muzzle is covered by loose upper lips. The prominent eyes are set well apart. The Alapaha's coat is relatively short and fairly stiff. Preferred colors are blue merle, brown merle, or red merle all trimmed in white or chocolate and white. Also preferred are the glass eyes (blue) or marble eyes (brown and blue mixed in a single eye). The ears and tail are never trimmed or docked. The body is sturdy and very muscular. The well-muscled hips are narrower than the chest. The straight back is as long as the dog is high at the shoulders. The dewclaws are never removed and the feet are cat-like.", bred_for: "Guarding", breed_group: "Mixed", life_span: "12 - 13 years", history: "", temperament: "Loving, Protective, Trainable, Dutiful, Responsible", reference_image_id: "33mJ-V3RX",
                   image: PupImage(id: "33mJ-V3RX", width: 1828, height: 2065, url: "https://cdn2.thedogapi.com/images/-HgpNnGXl.jpg"))
    
    
    static let pupList = [pup1, pup2]
    
}
