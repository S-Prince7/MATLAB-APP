# Matrix Decomposition
For the input matrices, the program uses LU Decomposition - matrix factorization technique that expresses a square matrix \( A \) as the product of two matrices:
- \( L \): A lower triangular matrix with ones on the diagonal.
- \( U \): An upper triangular matrix.

The decomposition is represented as:
\[
A = L \cdot U
\]

Functions are designed to be robust, ensuring they handle invalid inputs gracefully and avoid task-crashing. Input validation mechanisms are implemented to identify whether the provided inputs are valid before proceeding with further operations. This enhances reliability and user experience while minimizing runtime errors.
