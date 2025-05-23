;; Generator Verification Contract
;; Validates renewable energy sources and their production

;; Define data variables
(define-data-var admin principal tx-sender)
(define-map generators principal {
  name: (string-utf8 100),
  energy-type: (string-utf8 20),
  capacity: uint,
  location: (string-utf8 100),
  verified: bool
})

;; Read-only functions
(define-read-only (get-generator (generator-id principal))
  (map-get? generators generator-id)
)

(define-read-only (is-verified (generator-id principal))
  (default-to false (get verified (map-get? generators generator-id)))
)

;; Public functions
(define-public (register-generator (name (string-utf8 100)) (energy-type (string-utf8 20)) (capacity uint) (location (string-utf8 100)))
  (begin
    (asserts! (is-eq tx-sender (var-get admin)) (err u403))
    (ok (map-set generators tx-sender {
      name: name,
      energy-type: energy-type,
      capacity: capacity,
      location: location,
      verified: false
    }))
  )
)

(define-public (verify-generator (generator-id principal))
  (begin
    (asserts! (is-eq tx-sender (var-get admin)) (err u403))
    (asserts! (is-some (map-get? generators generator-id)) (err u404))
    (ok (map-set generators generator-id
      (merge (unwrap-panic (map-get? generators generator-id)) { verified: true })
    ))
  )
)

(define-public (update-capacity (generator-id principal) (new-capacity uint))
  (begin
    (asserts! (is-eq tx-sender generator-id) (err u403))
    (asserts! (is-some (map-get? generators generator-id)) (err u404))
    (ok (map-set generators generator-id
      (merge (unwrap-panic (map-get? generators generator-id)) { capacity: new-capacity })
    ))
  )
)

(define-public (transfer-ownership (new-admin principal))
  (begin
    (asserts! (is-eq tx-sender (var-get admin)) (err u403))
    (ok (var-set admin new-admin))
  )
)
