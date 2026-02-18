;; DAO Treasury Contract
;; Securely holds and manages funds for the DAO

(define-constant ERR-UNAUTHORIZED (err u300))

(define-data-var dao-owner principal tx-sender)

;; Public functions

(define-public (set-dao-owner (new-owner principal))
    (begin
        (asserts! (is-eq tx-sender (var-get dao-owner)) ERR-UNAUTHORIZED)
        (var-set dao-owner new-owner)
        (ok true)
    )
)

(define-public (withdraw-stx (amount uint) (recipient principal))
    (begin
        (asserts! (is-eq tx-sender (var-get dao-owner)) ERR-UNAUTHORIZED)
        (stx-transfer? amount (as-contract tx-sender) recipient)
    )
)

;; SIP-010 transfer support would be added here

;; Read-only functions
(define-read-only (get-balance)
    (stx-get-balance (as-contract tx-sender))
)
