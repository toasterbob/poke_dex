function fibbonaci(n) {
  if(n === 1 || n === 0){
    return [n];
  }
  let result = fibbonaci(n - 1);
 result.push(fibbonaci(n - 1).slice(-1)[0] + fibbonaci(n - 2).slice(-1)[0]);
 return result;
}

console.log(fibbonaci(8));
