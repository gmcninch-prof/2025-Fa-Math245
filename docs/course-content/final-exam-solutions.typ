#import "@preview/grape-suite:3.1.0": exercise
#import exercise: project


#import "@preview/ctheorems:1.1.3": *

#let solution(id,arg) = box(
    fill: rgb("#faebd7"),
    inset: 15pt,
    width: 100%,
    [*Solution for #id*:] +
    linebreak() + 
    arg
)


#let tf = [
  *True* #h(3mm) *\/*  #h(3mm) *False* #h(1mm) *\:* #h(3mm)
]


#let med(txt) = [
    #text(weight: "medium",txt)
  ]

#let pnum = state("pnum",0)

#let problem(points,data) = [
  #pnum.update(x => x+1)
  *Problem* #context(pnum.get()). #h(5mm) #med[(#points points)]
  #pad(left: 1em, data)
]
#show: thmrules

#let Aut = math.op("Aut")
#let mod(R) = [#R $#math.op([-mod])$]
#let GL = math.op("GL")
#let SL = math.op("SL")
#let Syl = math.op("Syl")
#let Inn = math.op("Inn")
#let Mat = math.op("Mat")
#let Hom = math.op("Hom")
#let End = math.op("End")
#let Ann = math.op("Ann")

#let mm = math.frak("m")

#let tensor = [$times.o$]

#let Cat = math.cal("C")

#show: project.with(
    title: "Math 245 Final Exam",
    university: "Tufts University",
    semester: "Fall 2025",
    seminar: "Math 245",
    faculty: "Prof. George McNinch",
    date: [2025-12-16] 
)

#set enum(numbering: "a.")

In this exam, all rings are assumed to have identity, and ring
homomorphisms preserve the identity element.


#problem[10][

    Give careful answers to the following:
    
    + What is meant by the _annihilator_ $Ann_A (x)$ of an element $x
      in M$ for an $A$-module $M$.

    
    + Give a careful statement for _Eisenstein’s criteria_ for the
      irreducibilty of a polynomial $f in K[T]$ where $K$ is the field
      of fractions of a PID $A$.

    
    + Let $A$ be a commutative ring. If $M$ is an $A$-module,
      what does it mean to say that $M$ is a _torsion_ module?

    
    + Let $G$ be a finite group, and let $p$ be a prime number. What
      does _Sylow’s theorem_ say about the number $n_p$ of $p$-Sylow
      subgroups of $G$?
    
]



#problem[10][ Let $alpha,beta, gamma in CC$ be 3 distinct complex
    numbers.  Find representatives of the $GL_5(CC)$-orbits on $5
    times 5$ matrices $M$ for which the characteristic polynomial $M$
    is $(T-alpha)(T-beta)(T-gamma)^3 in CC[T]$. Explain and justify
    your choices, briefly.

 ]

#solution[2][ Let $V = CC^5$; a matrix $M$ determines on $V$ the
    structure of a finitely generated torsion module for the PID $A =
    CC[T]$.  Thus $ V = plus.o.big_p A_(p,lambda_p) $ where for each
    prime $p$, $lambda_p$ is a partition, where $sum_p |lambda_p| =
    5.$

    Now, we have seen (it is a consequence of the Cayley-Hamilton
    Theorem) that $|lambda_p| > 0$ implies that $p$ divides the
    characteristic polynomial.

    Moreover, the matrix of the action of $T$ on $A slash (T-delta)^r
    A$ is the $r times r$ Jordan block matrix $J_(r,delta)$.

    Thus, it is a consequence of the structure theorem for finitely
    generated modules over a PID that the $GL_5$-orbits are
    represented by the following matrices:

    - $M$ with diagonal ("Jordan") blocks $J_(1,alpha)$, $J_(1,beta)$, $J_(3,gamma)$
    - $M$ with diagonal ("Jordan") blocks $J_(1,alpha)$, $J_(1,beta)$, $J_(1,gamma)$, $J_(2,gamma)$
    - $M$ with diagonal ("Jordan") blocks $J_(1,alpha)$, $J_(1,beta)$, $J_(1,gamma)$, $J_(1,gamma)$, $J_(1,gamma)$
    
]
 
#problem[10][ Prove for a prime number $p$ that $ RR tensor_QQ (QQ[T]
slash angle.l T^2 - p angle.r) tilde.eq RR times RR. $


]


#solution[3][ There is an isomorphism $RR tensor_QQ QQ[T] tilde.eq
    RR[T]$ and a resulting isomorphism $ RR tensor_QQ QQ[T] slash
    angle.l T^2 -p angle.r tilde.eq RR[T] slash angle.l T^2 - p
    angle.r. $ Thus it will be enough to prove that $ RR[T] slash
    angle.l T^2 - p angle.r tilde.eq RR times RR. $ Now, since $p$ is
    a positive integer, there is a real square root of $p$ -
    -i.e. $sqrt(p) in RR$.

    In particular, we have a factorization
    $ T^2 - p = (T - sqrt(p)) dot (T + sqrt(p)) in RR[T]. $

    Now, the polynomials $T plus.minus sqrt(p) in RR[T]$ are
    _irreducible_ and non-associate, thus they are co-maximal. This
    can be checked directly by observing that $ 1 = (1/(2sqrt(p)))((T
    + sqrt(p)) - (T - sqrt(p))) in angle.l T+ sqrt(p) angle.r +
    angle.l T - sqrt(p) angle.r \ "so that" #h(3mm) RR[T] = angle.l T+ sqrt(p) angle.r +
    angle.l T - sqrt(p) angle.r. $

    Thus according to the Chinese Remainder Theorem, the mapping
    $ RR[T] -> RR[T] slash angle.l T + sqrt(p) angle.r times RR[T] slash angle.l T - sqrt(p)angle.r $
    given by the rule $ f |-> ( f + angle.l T + sqrt(p) angle.r, f + angle.l T - sqrt(p) angle.r ) $
    is an isomorphism.

    Finally, we note that  $RR[T] slash angle.l T plus.minus sqrt(p) angle.r tilde.eq RR$
    since the polynomials $T plus.minus sqrt(p)$ have degree 1. This completes the proof.
]

#problem[10][ Let $A$ be an integral domain and let $K$ be its field
    of fractions. Suppose that $F$ is a free $A$-module of finite rank
    and let $phi:F -> F$ be an $A$-endomorphism of $F$.

    + If $phi$ is invertible, show that $id tensor phi:K tensor_A F -> K tensor_A F$ is invertible.

    
    + If $ id tensor phi:K tensor_A F -> K tensor_A F $ is invertible, is
      $phi$ invertible? Give a proof or a counterexample.  ]

#solution[4][

    + Suppose that $phi$ is invertible, say $phi^(-1) = psi$. Thus
      $phi compose psi = id_F$ and $psi compose phi= id_F$.

      Since $K tensor_A - $ is a functor, we see that
      $ (id_K tensor phi) compose (id_K tensor psi) = id_K tensor (phi compose psi) = id_K tensor id_F $
      and
      $ (id_K tensor psi) compose (id_K tensor phi) = id_K tensor (psi compose phi) = id_K tensor id_F. $

      Since $(id_K tensor id_F)(a tensor b) = a tensor b$ for $a in K$
      and $b in F$, it follows that $ id_K tensor id_F = id_(K
       tensor_A F). $

      Thus $id_K tensor phi$ and $id_K tensor psi$ are inverse to one another, and in particular
      $id_K tensor phi$ is invertible.

    + In general, invertibility of $id_K tensor phi$ does not imply that  $phi$ is invertible.

      Here are two examples. Let $A = ZZ$ so that $K = QQ$. Put $F =
      ZZ slash 2 ZZ$ and and let $phi:F -> F$ be the 0-mapping.

      Then of course $phi$ is not invertible. But $QQ tensor_ZZ F = 0$, and
      $id_QQ tensor phi:0 -> 0$ is thus invertible.

      For the second example, again take $A = ZZ$ so that $K = QQ$. Let $F = ZZ$
      and consider the mapping $phi:ZZ -> ZZ$ given by $phi(x) = 2x$.
      Since the maping $phi$ is not surjective, $phi$ is not invertible.

      Then $QQ tensor_ZZ ZZ =  QQ$, and
      $id_QQ tensor phi : QQ -> QQ$ is given by multiplication with $2$. In particular,
      $id_QQ tensor phi$ _is_ invertible.
    

]
      

#problem[10][Let $A$ be a commutative local ring with unique maximal ideal $mm$.
    Prove for $x in A$ that $x$ is a unit if and only if $x in.not mm$. ]


#solution[5][ First, suppose that $x$ is a unit in $A$. Then $A dot x
    = angle.l x angle.r = A$. Since $mm$ is a maximal ideal, we know that $mm
    subset.neq A$.  It follows that $x in.not mm$.

    On the other hand, suppose that $x in.not mm$. We must find an
    inverse for $x$.  Consider the ideal $I = angle.l x
    angle.r$. First of all, suppose that $I$ is a proper ideal of
    $A$. It follows that $I$ is contained in some maximal ideal. Since
    $A$ is local, $mm$ is the unique maximal ideal of $A$. Then $I
    subset.eq mm$ contradicting the assumption $x in.not mm$.

    This contradiction shows that $angle.l x angle.r = I = A$. In
    particular, there is an element $ y in A "with" x dot y = 1; $ since
    $A$ is commutative, $y = x^(-1)$ so that $x in A^times$ as
    required.  ]
    
#problem[10][Let $A$ be a commutative ring, let $M$ be an $A$-module, and suppose
    that $X,Y subset.eq M$ are $A$-submodules such that $M = X + Y$ and $X inter Y = {0}$.

    Prove that $Y tilde.eq M slash X$.

]

#solution[6][

    Let $iota:Y -> M$ be the inclusion mapping, and let $pi : M -> M slash X$ be the
    quotient mapping. Set $gamma = pi compose iota$

    We claim that $gamma:Y -> M slash X$ is an isomorphism.

    To see that $gamma$ is onto, let $alpha in M slash X$. We may
    write $alpha = m + X$ for some $m in M$. Since $M = X + Y$ by
    assumption, we may write $m = x + y$ for $x in X$ and $y in
    Y$. There is an equality of cosets $ alpha = m + X = y + X "in" M slash
    X. $ Now we see that
    $ gamma(y) = pi(y) = y + X  = alpha $
    which proves that $gamma$ is surjective.

    To see that $gamma$ is injective, suppose that $y in ker
    gamma$. Then $ pi(y) = y + X = 0 "in" M slash X. $ Thus $y in X$
    so that $y in X inter Y$. The intersection $X inter Y$ is $0$ by
    assumption; thus we have proved that $y= 0$. It follows that $ker
    gamma = 0$, so that $gamma$ is injective.

    Thus $gamma$ is an isomorphism as required.
    
]


#problem[10][ Let $K$ be a field and let $L$ be a field extension of
    $K$ (i.e. $K subset.eq L$ is a subfield). Let $V$ be a finite
    dimensional $K$-vector space, and write $V^* = Hom_K (V,K)$ for
    the _dual space_ of $V$.  Prove that $ L tensor_K V^* tilde.eq
    Hom_L (L tensor_K V, L). $
]

#solution[7][
    We note first that
    $ dim_L L tensor_K V^* = dim_K V^* = dim_K V $
    and that $ dim_L L tensor_K V = dim_K V "so that"
    dim_L Hom_L (L tensor_K V, L) = dim_k V. $

    In particular, $ L tensor_K V^* "and" Hom_L (L tensor_K V,L) $
    are $L$-vector spaces of the same dimension.

    In fact, that observation solves the problem, since any two vector
    spaces of the same dimension are isomorphic.

    To give an explicit (functorial!) map, proceed as follows:
    
    There is a map of $K$-vector spaces
    $ Phi:V^* -> Hom_L (L tensor_K V,L) $
    such that
    $ Phi(gamma) "is the map determined by" alpha tensor v |-> alpha dot gamma(v). $
    
    Since $Hom_L (L tensor_K V,L)$ is an $L$-vector space, the mapping
    property of the scalar extension gives
    a unique mapping
    $ Psi:L tensor_K V^* -> Hom_L (L tensor_K V,L) $
    such that for $gamma in V^*$, 
    $ Psi(1 tensor gamma)  = Phi(gamma). $

    We claim that $Psi$ is an isomorphism.   

    Since $Psi$ is an $L$-linear map between $L$-vector spaces of the same dimension,
    it suffices to prove that $Psi$ is surjective.

    A choice of $K$-basis $b_1,dots,b_n$ for $V$ determines an
    $L$-basis $1 tensor b_1,dots,1 tensor b_n$ for $L tensor_K V$.
    Write $delta_1,dots,delta_n$ for the $K$-basis of $V^*$ dual to
    $b_1,dots,b_n$, so that $1 tensor delta_1,dots,1 tensor delta_n$
    is an $L$-basis for $L tensor_K V^*$.

    On the other hand, let $kappa_1,dots,kappa_n$ be the $L$-basis of
    $Hom_L (L tensor_K V, L) = (L tensor_K V)^*$ dual to the basis $1
    tensor b_1,dots,1 tensor b_n$.

    A calculation shows that $Psi(1 tensor delta_i) = kappa_i$, which shows
    that $Psi$ is surjective and hence an isomorphism.

]
