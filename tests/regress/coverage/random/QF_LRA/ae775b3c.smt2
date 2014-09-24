(set-info :source |fuzzsmt|)
(set-info :smt-lib-version 2.0)
(set-info :category "random")
(set-info :status unknown)
(set-logic QF_LRA)
(declare-fun v0 () Real)
(declare-fun v1 () Real)
(declare-fun v2 () Real)
(assert (let ((e3 6))
(let ((e4 1))
(let ((e5 3))
(let ((e6 (+ v1 v0)))
(let ((e7 (- v0 v2)))
(let ((e8 (- e6 v0)))
(let ((e9 (* v1 (- e5))))
(let ((e10 (- v1 e9)))
(let ((e11 (- e8 e10)))
(let ((e12 (* e3 e9)))
(let ((e13 (* e9 e5)))
(let ((e14 (/ e4 e5)))
(let ((e15 (>= v0 e13)))
(let ((e16 (= e10 e8)))
(let ((e17 (> e7 e10)))
(let ((e18 (>= e11 e8)))
(let ((e19 (distinct e12 v1)))
(let ((e20 (<= v2 e14)))
(let ((e21 (< e11 e8)))
(let ((e22 (<= v2 e13)))
(let ((e23 (>= e9 e7)))
(let ((e24 (> e6 v0)))
(let ((e25 (ite e19 v2 v1)))
(let ((e26 (ite e21 e10 e10)))
(let ((e27 (ite e16 v0 v2)))
(let ((e28 (ite e20 e8 e12)))
(let ((e29 (ite e16 e13 e25)))
(let ((e30 (ite e17 e14 e10)))
(let ((e31 (ite e16 e6 e6)))
(let ((e32 (ite e23 e28 e7)))
(let ((e33 (ite e15 e11 e32)))
(let ((e34 (ite e17 e27 e31)))
(let ((e35 (ite e15 e7 e28)))
(let ((e36 (ite e16 e9 e32)))
(let ((e37 (ite e23 v0 e28)))
(let ((e38 (ite e22 v2 e8)))
(let ((e39 (ite e20 v1 e25)))
(let ((e40 (ite e24 e37 e7)))
(let ((e41 (ite e18 e33 e40)))
(let ((e42 (>= e25 e9)))
(let ((e43 (= e32 e26)))
(let ((e44 (distinct e32 e32)))
(let ((e45 (distinct e8 e29)))
(let ((e46 (> e30 e41)))
(let ((e47 (> e25 e26)))
(let ((e48 (> e31 e11)))
(let ((e49 (>= e35 e40)))
(let ((e50 (< e35 e34)))
(let ((e51 (<= e35 e14)))
(let ((e52 (> e38 e36)))
(let ((e53 (<= e40 e27)))
(let ((e54 (distinct e10 e8)))
(let ((e55 (> e11 e40)))
(let ((e56 (<= e27 e41)))
(let ((e57 (< e26 e13)))
(let ((e58 (= e37 e25)))
(let ((e59 (<= e12 e25)))
(let ((e60 (< e31 e12)))
(let ((e61 (= e32 e41)))
(let ((e62 (< e35 e33)))
(let ((e63 (<= e14 e25)))
(let ((e64 (>= v1 e14)))
(let ((e65 (<= e8 e36)))
(let ((e66 (< e25 e13)))
(let ((e67 (<= e38 e8)))
(let ((e68 (<= e13 v0)))
(let ((e69 (distinct v0 e7)))
(let ((e70 (<= e34 e32)))
(let ((e71 (< e36 e35)))
(let ((e72 (< v0 e32)))
(let ((e73 (> e25 e36)))
(let ((e74 (< e36 e8)))
(let ((e75 (> v1 e31)))
(let ((e76 (distinct v0 e12)))
(let ((e77 (<= e11 e32)))
(let ((e78 (distinct e25 e11)))
(let ((e79 (>= e12 e41)))
(let ((e80 (= e37 e29)))
(let ((e81 (< e11 e38)))
(let ((e82 (distinct e7 e8)))
(let ((e83 (<= e26 e31)))
(let ((e84 (< e31 e7)))
(let ((e85 (= e8 e12)))
(let ((e86 (distinct e39 e41)))
(let ((e87 (< e30 e7)))
(let ((e88 (> e27 e14)))
(let ((e89 (>= v1 v1)))
(let ((e90 (>= e26 e40)))
(let ((e91 (< e13 e35)))
(let ((e92 (> e37 e34)))
(let ((e93 (> e10 e13)))
(let ((e94 (= e35 e39)))
(let ((e95 (> e36 v2)))
(let ((e96 (>= e13 e11)))
(let ((e97 (distinct e38 e30)))
(let ((e98 (< e38 e7)))
(let ((e99 (= e38 e36)))
(let ((e100 (< e28 e13)))
(let ((e101 (> e37 e34)))
(let ((e102 (distinct e34 e38)))
(let ((e103 (distinct e27 e8)))
(let ((e104 (> e34 e9)))
(let ((e105 (< e40 e14)))
(let ((e106 (>= v0 e37)))
(let ((e107 (= v1 e9)))
(let ((e108 (< e7 e39)))
(let ((e109 (> e10 e38)))
(let ((e110 (> e12 e37)))
(let ((e111 (>= e32 e36)))
(let ((e112 (<= e25 e27)))
(let ((e113 (> e37 e38)))
(let ((e114 (> e26 e40)))
(let ((e115 (<= e31 e12)))
(let ((e116 (= e39 e14)))
(let ((e117 (distinct e27 v0)))
(let ((e118 (>= e27 e29)))
(let ((e119 (<= v0 e9)))
(let ((e120 (<= v1 e37)))
(let ((e121 (>= v2 e40)))
(let ((e122 (>= e26 e37)))
(let ((e123 (>= e36 e27)))
(let ((e124 (< e8 v1)))
(let ((e125 (<= e6 e31)))
(let ((e126 (or e82 e121)))
(let ((e127 (and e22 e74)))
(let ((e128 (xor e112 e64)))
(let ((e129 (= e119 e60)))
(let ((e130 (or e53 e91)))
(let ((e131 (not e84)))
(let ((e132 (not e21)))
(let ((e133 (ite e115 e67 e52)))
(let ((e134 (and e48 e114)))
(let ((e135 (and e127 e99)))
(let ((e136 (= e108 e135)))
(let ((e137 (ite e70 e133 e73)))
(let ((e138 (ite e57 e98 e120)))
(let ((e139 (or e55 e15)))
(let ((e140 (ite e94 e101 e105)))
(let ((e141 (ite e61 e68 e81)))
(let ((e142 (=> e138 e138)))
(let ((e143 (xor e128 e100)))
(let ((e144 (ite e140 e124 e50)))
(let ((e145 (=> e90 e20)))
(let ((e146 (xor e97 e134)))
(let ((e147 (and e80 e88)))
(let ((e148 (or e49 e122)))
(let ((e149 (xor e118 e87)))
(let ((e150 (ite e86 e76 e63)))
(let ((e151 (xor e143 e125)))
(let ((e152 (= e65 e104)))
(let ((e153 (or e136 e43)))
(let ((e154 (= e79 e16)))
(let ((e155 (=> e89 e58)))
(let ((e156 (xor e154 e131)))
(let ((e157 (= e46 e156)))
(let ((e158 (xor e153 e93)))
(let ((e159 (or e95 e111)))
(let ((e160 (not e107)))
(let ((e161 (not e103)))
(let ((e162 (ite e157 e51 e66)))
(let ((e163 (= e92 e155)))
(let ((e164 (=> e132 e117)))
(let ((e165 (or e159 e160)))
(let ((e166 (= e137 e75)))
(let ((e167 (or e144 e113)))
(let ((e168 (=> e158 e126)))
(let ((e169 (= e165 e116)))
(let ((e170 (ite e56 e42 e167)))
(let ((e171 (= e47 e78)))
(let ((e172 (xor e139 e77)))
(let ((e173 (and e54 e83)))
(let ((e174 (= e173 e146)))
(let ((e175 (=> e62 e162)))
(let ((e176 (= e141 e106)))
(let ((e177 (= e161 e149)))
(let ((e178 (and e17 e110)))
(let ((e179 (or e174 e23)))
(let ((e180 (xor e145 e123)))
(let ((e181 (xor e177 e96)))
(let ((e182 (xor e151 e45)))
(let ((e183 (or e164 e72)))
(let ((e184 (xor e178 e169)))
(let ((e185 (xor e163 e170)))
(let ((e186 (=> e182 e183)))
(let ((e187 (or e181 e150)))
(let ((e188 (ite e168 e176 e179)))
(let ((e189 (not e129)))
(let ((e190 (= e189 e166)))
(let ((e191 (not e148)))
(let ((e192 (or e85 e186)))
(let ((e193 (xor e187 e71)))
(let ((e194 (= e172 e130)))
(let ((e195 (xor e152 e109)))
(let ((e196 (=> e18 e185)))
(let ((e197 (not e19)))
(let ((e198 (= e175 e195)))
(let ((e199 (or e197 e198)))
(let ((e200 (= e190 e193)))
(let ((e201 (and e191 e184)))
(let ((e202 (not e201)))
(let ((e203 (ite e200 e180 e202)))
(let ((e204 (xor e171 e196)))
(let ((e205 (= e102 e203)))
(let ((e206 (and e142 e199)))
(let ((e207 (= e44 e147)))
(let ((e208 (ite e194 e205 e69)))
(let ((e209 (xor e59 e207)))
(let ((e210 (= e209 e206)))
(let ((e211 (not e188)))
(let ((e212 (or e192 e211)))
(let ((e213 (or e24 e204)))
(let ((e214 (and e208 e210)))
(let ((e215 (not e214)))
(let ((e216 (ite e213 e215 e213)))
(let ((e217 (not e212)))
(let ((e218 (and e216 e217)))
e218
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)