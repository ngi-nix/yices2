(set-info :source |fuzzsmt|)
(set-info :smt-lib-version 2.0)
(set-info :category "random")
(set-info :status unknown)
(set-logic QF_UFBV)
(declare-fun f0 ( (_ BitVec 15)) (_ BitVec 9))
(declare-fun f1 ( (_ BitVec 6) (_ BitVec 4)) (_ BitVec 12))
(declare-fun p0 ( (_ BitVec 16) (_ BitVec 16)) Bool)
(declare-fun p1 ( (_ BitVec 8)) Bool)
(declare-fun v0 () (_ BitVec 11))
(assert (let ((e1(_ bv52 7)))
(let ((e2 (! (f1 ((_ extract 5 0) e1) ((_ extract 4 1) e1)) :named term2)))
(let ((e3 (! (bvadd e2 e2) :named term3)))
(let ((e4 (! (bvor ((_ sign_extend 4) e1) v0) :named term4)))
(let ((e5 (! (f0 ((_ zero_extend 3) e2)) :named term5)))
(let ((e6 (! (ite (p1 ((_ extract 7 0) e4)) (_ bv1 1) (_ bv0 1)) :named term6)))
(let ((e7 (! (ite (p0 ((_ zero_extend 9) e1) ((_ zero_extend 4) e3)) (_ bv1 1) (_ bv0 1)) :named term7)))
(let ((e8 (! (p1 ((_ zero_extend 7) e6)) :named term8)))
(let ((e9 (! (p1 ((_ zero_extend 1) e1)) :named term9)))
(let ((e10 (! (p1 ((_ extract 10 3) v0)) :named term10)))
(let ((e11 (! (bvsgt ((_ sign_extend 4) e1) v0) :named term11)))
(let ((e12 (! (p1 ((_ sign_extend 1) e1)) :named term12)))
(let ((e13 (! (bvsgt ((_ zero_extend 5) e1) e2) :named term13)))
(let ((e14 (! (p0 ((_ zero_extend 15) e6) ((_ sign_extend 7) e5)) :named term14)))
(let ((e15 (! (bvsle e6 e6) :named term15)))
(let ((e16 (! (bvslt ((_ zero_extend 2) e1) e5) :named term16)))
(let ((e17 (! (bvuge e2 e2) :named term17)))
(let ((e18 (! (distinct e3 ((_ sign_extend 5) e1)) :named term18)))
(let ((e19 (! (bvsle e2 ((_ sign_extend 11) e6)) :named term19)))
(let ((e20 (! (bvult e4 ((_ sign_extend 10) e7)) :named term20)))
(let ((e21 (! (not e17) :named term21)))
(let ((e22 (! (ite e14 e14 e21) :named term22)))
(let ((e23 (! (or e10 e22) :named term23)))
(let ((e24 (! (= e12 e18) :named term24)))
(let ((e25 (! (not e8) :named term25)))
(let ((e26 (! (xor e13 e23) :named term26)))
(let ((e27 (! (and e26 e9) :named term27)))
(let ((e28 (! (ite e15 e16 e25) :named term28)))
(let ((e29 (! (not e20) :named term29)))
(let ((e30 (! (not e19) :named term30)))
(let ((e31 (! (not e11) :named term31)))
(let ((e32 (! (not e29) :named term32)))
(let ((e33 (! (not e24) :named term33)))
(let ((e34 (! (or e30 e32) :named term34)))
(let ((e35 (! (and e34 e31) :named term35)))
(let ((e36 (! (xor e28 e28) :named term36)))
(let ((e37 (! (and e27 e33) :named term37)))
(let ((e38 (! (ite e35 e36 e37) :named term38)))
e38
)))))))))))))))))))))))))))))))))))))))

(check-sat)
(set-option :regular-output-channel "/dev/null")
(get-model)
(get-value (term2))
(get-value (term3))
(get-value (term4))
(get-value (term5))
(get-value (term6))
(get-value (term7))
(get-value (term8))
(get-value (term9))
(get-value (term10))
(get-value (term11))
(get-value (term12))
(get-value (term13))
(get-value (term14))
(get-value (term15))
(get-value (term16))
(get-value (term17))
(get-value (term18))
(get-value (term19))
(get-value (term20))
(get-value (term21))
(get-value (term22))
(get-value (term23))
(get-value (term24))
(get-value (term25))
(get-value (term26))
(get-value (term27))
(get-value (term28))
(get-value (term29))
(get-value (term30))
(get-value (term31))
(get-value (term32))
(get-value (term33))
(get-value (term34))
(get-value (term35))
(get-value (term36))
(get-value (term37))
(get-value (term38))
(get-info :all-statistics)