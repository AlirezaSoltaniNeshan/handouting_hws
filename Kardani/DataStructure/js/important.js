// This function talk about factorial of a number
const fact = (a) => {
    if (a <= 1) {
        return 1
    } else {
        var factorial = a * fact(a - 1)
        return factorial
    }
}
const getFact = (n) => {
    var fact = 1
    for (let i = 1; i <= n; i++) {
        fact *= i
    }
    return fact
}

console.log(getFact(4))


// This function talk about sum of a number
const fn = (a) => {
    if (a == 0) {
        return 0
    } else {
        var getSum = a + fn(a - 1)
        return getSum
    }
}

// This function talk about Fibonacci of a number
const fib = (a) => {
    if (a == 1 || a == 2)
        return 1
    else {
        const fibonacci = fib(a - 1) + fib(a - 2)
        return fibonacci
    }
}

const MP = (a, p) => {
    if (p == 1)
        return a
    if (p == 0)
        return 1
    else {
        const getMP = a * MP(a, p - 1)
        return getMP
    }
}

const ab = (a, b) => {
    if (b == 0) return 1
    else return a * (a, b - 1)
}
console.log(ab(3, 2))

// a + b
const plus = (a = 3, b = 6) => {
    if (b == 0) return a
    else return aPlusB(a, b - 1) + 1
}
// console.log(plus(3, 6))

//a * b
const mul = (a = 3, b = 4) => {
    if (b == 0) return 0
    else return a + mul(a, b - 1)
}


module.exports = { fact, fn, fib, MP }



// a * b
const mul = (a, b) => {
    if (b == 0) return 0
    else return a + mul(a, b - 1)
  }
  // console.log(mul(100, 10))
  // a^{b}
  const pow = (a, b) => {
    if (b == 0) return 1
    else return a * pow(a, b - 1)
  }
  // console.log(pow(2, 100))
  
  const sqrt6 = (n) => {
    if (n == 0) return 0
    else return Math.sqrt(6 + sqrt6(n - 1))
  }
  console.log(sqrt6(5))
  