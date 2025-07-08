/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
An extension to convert a `CVPixelBuffer` to a SwiftUI `Image`.
*/

import SwiftUI

extension CVReadOnlyPixelBuffer {
    var image: Image? {
        let cgImage = self.withUnsafeBuffer { cvPixelBuffer -> CGImage? in
            let ciImage = CIImage(cvPixelBuffer: cvPixelBuffer)
            let context = CIContext(options: nil)
            
            guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else {
                return nil
            }
            return cgImage
        }
        
        guard let cgImage else {
            return nil
        }

        let uiImage = UIImage(cgImage: cgImage)

        return Image(uiImage: uiImage)
    }
}
