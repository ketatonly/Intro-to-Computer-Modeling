
### The logic

$I_n = \int_0^1 x^n e^{x-1} \, dx$

**For $ I_1 $ we have:**
$ I_1 = \int_0^1 x^1 e^{x-1}\, dx $

With integration by parts we will use: $ \int u\, dv = uv - \int v\, du $

Let $ u = x; \quad $ du = dx $

And $ dv = e^{x-1} dx; \quad v = e^{x-1} $

Now we have:

$ \int_0^1 x e^{x-1} \, dx = x e^{x-1} \Big|_0^1 - \int_0^1 e^{x-1}, dx = 1 * e^0 - 0 * e^{-1} - e^{x-1} \Big|_0^1 = 1 - e^0 + e^{-1} = 1 / e$

So, indeed $ I_1 = \frac{1}{e} $

And for $ n = 2 $ we have:

$ I_2 = \int_0^1 x^2 e^{x-1}\, dx $

And we do integration by parts again:

Let $ u = x^2; \quad du = 2xdx;$ $dx = \frac{du}{2}$

And $ dv = e^{x-1} dx; \quad v = e^{x-1} $

Now we have:

$ \int_0^1 x^2 e^{x-1} \, dx = x^2 e^{x-1} \Big|_0^1 - \int_0^1 2xe^{x-1} dx = 1 * e^0 - 2\int_0^1 e^{x-1}dx$

The integral on the right-hand side is exactly the same as $I_1$, so the we can rewrite this as:

$ = 1 - 2I_1$

**In general, for $I_n$, we find the recurrence relation:**

$I_n = 1 - n I_{n-1}$



**Since this formula is not very accurate for bigger ns, we can try to use the formula provided in the solution:**

$I_n = \sum_{k=0}^{n-2} (-1)^k A_k^n + (-1)^{n-1} n! I_1 \quad$ Where $n = 2, 3,...$

And $\quad A_k^n \equiv n(n-1)(n-2)...(n-k+1)$