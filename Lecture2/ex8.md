Prove that the iterative process given by

$x_{n+1} = x_n (2-ax_n), \quad n = 0, 1, 2, . . . ,$

where a is a real number, converges to $\frac{1}{a}.$ 

Determine the constraints on the initial value
x0 that ensure convergence of the iterations. 

### Answer:

We need to calculate the error at each step. Let's say that the true answer is $x^*$ which will be equal to
$\frac{1}{a}$. 

The error at step n will be: $\quad e_n = x_n - x^* \quad$ or: $\quad e_n = x_n - \frac{1}{a}$

From this we get: $\quad x_n = \frac{1}{a} + e_n$

If we plug this in the given equation, we get:

$x_{n+1} = (\frac{1}{a} + e_n) (2 - a * (\frac{1}{a} + e_n)) = (\frac{1}{a} + e_n) (2 - 1 - a * e_n) = (\frac{1}{a} + e_n) (1 - a * e_n) = \frac{1}{a} - e_n + e_n - a * e_n^2 = \frac{1}{a} - a * e_n^2$

So: $\quad x_{n+1} = \frac{1}{a} - ae_n^2 \quad$ and $\quad ae_n^2 = \frac{1}{a} - x_{n+1}$ 

Since $\quad x_n - \frac{1}{a} = e_n \quad$ it must be that $\quad x_{n+1} - \frac{1}{a} = e_{n+1} \quad$

And so we get: $\quad e_{n+1} = -ae_n^2$

In order for the answer to converge, the error must approach 0, that is: $\quad |e_{n+1}| < |e_n|$

So: $\quad |-ae_n^2| < |e_n|$

This means: $\quad |a| |e_n|^2 < |e_n| \quad$ 

We devide both sides by $e_n$ : $\quad |a| |e_n| < 1 \quad$ so: $\quad |e_n| < \frac{1}{|a|}$

This must hold for $e_0$, 

$|e_0| < \frac{1}{|a|} \quad$ and since we know, that $\quad e_0 = x_0 - \frac{1}{a}$

We write: $\quad |x_0 - \frac{1}{a}| < \frac{1}{|a|}$

$ - \frac{1}{|a|} < x_0 - \frac{1}{a} < \frac{1}{|a|}$

$ - \frac{1}{|a|} + \frac{1}{a} < x_0 < \frac{1}{|a|} + \frac{1}{a}$

If $\quad a \geq 0 : |a| = a => 0 < x_0 < \frac{2}{a}$

If $\quad a \lt 0 : |a| = -a => \frac{2}{a} < x_0 < 0$

In any case, $x_0$ must be between 0 and $\frac{2}{a}$ 