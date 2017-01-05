function factors(num) {
  let result = [];

  for (let i = 2; i < num; i++) {
    if(num % i === 0){
      result.push(i);
    }
  }
  return result;
}


// console.log(factors(100));

function bubblesort(array) {
  let swapped = true;

  for (var k = 0; k < array.length; k++) {

    swapped = false;
    for (let i = 0; i < array.length; i++) {
      if(array[i] >array[i + 1]){
        swapped = true;
        let a = array[i];
        array[i] = array[i + 1];
        array[i + 1] = a;
      }
    }
    if (swapped===false) {
      break;
    }
  }

  return array;

}

// console.log(bubblesort([3,5,7,1,3,9,4]));

function substrings(string) {
  let result = [];

  for (var i = 0; i < string.length; i++) {
    for (var k = i; k < string.length; k++) {
      if(result.includes(string.slice(i,k + 1))=== false){
        result.push(string.slice(i,k + 1));
      }
    }
  }
  return result;

}

console.log(substrings("cat"));
