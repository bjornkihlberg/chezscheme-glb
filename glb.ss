(library (glb)
  (export get-glb)
  (import (chezscheme) (json))
  (define (get-u32 bip)
    (bytevector-u32-native-ref (get-bytevector-n bip 4) 0))
  (define (get-glb-chunk bip)
    (let* ([chunk-length (get-u32 bip)]
           [chunk-type (get-u32 bip)]
           [chunk-data (get-bytevector-n bip chunk-length)])
      (case chunk-type
        [1313821514 (json->scheme (bytevector->json chunk-data))]
        [5130562 chunk-data]
        [else #f])))
  (define (get-glb bip)
    (assert
      (string=? "glTF" (utf8->string (get-bytevector-n bip 4))))
    (get-bytevector-n bip 8)
    `((glTF ,(get-glb-chunk bip)) (data ,(get-glb-chunk bip)))))
