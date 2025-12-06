#import "@preview/grape-suite:3.1.0": exercise
#import exercise: project


#import "@preview/commute:0.3.0": node, arr, commutative-diagram

#import "@preview/ctheorems:1.1.3": *
#show: thmrules

#let problem = thmbox("problem", "Problem", base_level: 0, fill: rgb("#155DFC33"))

#show: project.with(
    title: "Extra Problems",
    university: "Tufts University",
    semester: "Fall 2025",
    seminar: "Math 245",
    faculty: "Prof. George McNinch",
    date: [2025-12-06] 
)

#set enum(numbering: "a.")  


// operators
#let tensor = [$times.o$]
#let Hom = math.op("Hom")
#let Aut = math.op("Aut")
#let End = math.op("End")
#let Gal = math.op("Gal")
#let Mat = math.op("Mat")
#let GL = math.op("GL")
#let Inn = math.op("Inn")
#let Prop = math.op("Prop")
#let Aut = math.op("Aut")
#let Stab = math.op("Stab") 
#let Syl = math.op("Syl")
#let Mat = math.op("Mat")
#let coker = math.op("coker")
#let len = math.op("len")
#let diag = math.op("diag")

#let mm = math.frak("m")

#let Cl = math.op("Cl")

#let calB = math.cal("B")

I was going to assign these problems, but decided against it. Thought I’d post them anyhow!

#problem[ Let $A$ be a PID, let $F$ be a free $A$-module, and let $phi
    : F-> F$ be an $A$-module homomorphism.

    + Use Proposition 11.1.7
      from the notes to prove that there is a basis $cal(B)$ of $F$ together with $A$-module homomorphisms
      $psi,gamma : F -> F$ such that
      - $phi = psi compose gamma$
      - $gamma$ is invertible, and
      - there are elements $a_1,a_2,dots,a_n in A$ such that 
        $ [psi]_cal(B) = diag(a_1,a_2,dots,a_n) = 
        mat(a_1,0,dots,0;
            0,a_2,dots,0;
            dots.v,dots.v,dots.down,dots.v;
            0,0,dots,a_n), $
        is the diagonal matrix with the indicated entries.
    + Conclude that for any $A$-basis $cal(C)$ of $F$, 
      $det([psi]_cal(C)) = u a_1 a_2 dots a_n$ for some unit $u in A^times$.

      *Hint:* The determinant of an invertible matrix in $Mat_n (A)$ is a unit in $A$.
]


#problem[Let $phi : ZZ ^n -> ZZ ^n $
    be a $ZZ$-linear map and suppose that $id tensor phi : QQ^n -> QQ^n$ is invertible.
    Prove that $ |coker phi| = |det phi|. $

    *Hint:* Use problem 1.
]

#problem[ Let $k$ be a field, let $k[T]$ be the polynomial ring
    over $k$ in one variable $T$ and let $F=k[T]^n$ be the free
    $k[T]$-module of rank $n$ consisting of column vectors with entries
    in $k[T]$.

    Let $M in Mat_(n times n) (k[T])$ be an $n times n$ matrix with
    entries in $k[T]$. Notice that $det M in k[T]$ is a
    polynomial. Suppose that $det M eq.not 0$.

    Consider the $k[T]$-module homomorphism $phi:F -> F$ given by
    multiplication with $M$; thus $phi(v) = M dot v$ for $v in F =
    k[T]^n$.

    Prove that the dimension as $k$-vector space of the $k[T]$-module
    $coker phi = F slash im phi$ is given by the degree $deg (det M)$
    of $det M$; i.e.  $ dim_k ( coker phi) = deg ( det M). $


    
    *Hint:* Use problem 1.
]
