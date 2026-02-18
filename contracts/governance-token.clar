;; Governance Token (SIP-010)
;; Standard governance token for the DAO

(impl-trait .sip-010-trait.sip-010-trait)

(define-constant ERR-UNAUTHORIZED (err u100))
(define-constant ERR-NOT-OWNER (err u101))

(define-fungible-token gov-token)

(define-data-var token-name (string-ascii 32) "Stacks DAO Token")
(define-data-var token-symbol (string-ascii 10) "SDT")
(define-data-var token-uri (optional (string-utf8 256)) none)
(define-data-var contract-owner principal tx-sender)

;; Public functions
(define-public (transfer (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
    (begin
        (asserts! (is-eq tx-sender sender) ERR-NOT-OWNER)
        (try! (ft-transfer? gov-token amount sender recipient))
        (match memo to-print (begin (print to-print) true) true)
        (ok true)
    )
)

(define-public (mint (amount uint) (recipient principal))
    (begin
        (asserts! (is-eq tx-sender (var-get contract-owner)) ERR-UNAUTHORIZED)
        (ft-mint? gov-token amount recipient)
    )
)

;; Read-only functions
(define-read-only (get-name)
    (ok (var-get token-name))
)

(define-read-only (get-symbol)
    (ok (var-get token-symbol))
)

(define-read-only (get-decimals)
    (ok u6)
)

(define-read-only (get-balance (who principal))
    (ok (ft-get-balance gov-token who))
)

(define-read-only (get-total-supply)
    (ok (ft-get-supply gov-token))
)

(define-read-only (get-token-uri)
    (ok (var-get token-uri))
)

;; Admin functions
(define-public (set-token-uri (value (string-utf8 256)))
    (begin
        (asserts! (is-eq tx-sender (var-get contract-owner)) ERR-UNAUTHORIZED)
        (var-set token-uri (some value))
        (ok true)
    )
)
