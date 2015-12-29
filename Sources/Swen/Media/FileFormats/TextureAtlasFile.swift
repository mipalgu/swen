//
//   TextureAtlasFile.swift created on 29/12/15
//   Swen project 
//   
//   Copyright 2015 Ashley Towns <code@ashleytowns.id.au>
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//

/*
 * Support for Sparrow exported texture atlas files into groups of named textures
 */
import CSDL

public class TextureAtlasFile {
  let xmlDoc: XPathDocument

  public init(withPath path: String) {
    self.xmlDoc = XPathDocument(withPath: path)
  }
}