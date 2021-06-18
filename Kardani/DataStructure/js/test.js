// const t = (a, b) => {
//     if (b == 0) return a
//     else return t(b, a % b)
// }

// console.log(t(2, 6))

const t = (x, n) => {
    if (n == 0) return x
    else if (n % 2 == 0) return t(x, n / 2);
    else return 2 * t(x, n - 1)
}

console.log(t(2, 7))
