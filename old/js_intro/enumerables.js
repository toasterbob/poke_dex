function myEach(array, fnc) {
  for (let i = 0; i < array.length; i++) {
    fnc(array[i]);
  }
}

const a = [1,2,3];

const b = function(arg) {
  console.log(arg * 2);
};
// myEach(a, b);
// console.log(myEach(a, b));

function myMap(array, fnc) {
  let result = [];
  for (var i = 0; i < array.length; i++) {
    result.push(fnc(array[i]));
  }
  return result;
}

let c = [1,2,3];
const d = function(arg) {
  return(arg * 2);
};

// console.log(myMap(c, d));

Array.prototype.myInject = function(fnc, accum) {
  let i = 0;
  if (typeof accum === 'undefined') {
    accum = this[0];
    i ++;
  }
  for (i; i < this.length; i++) {
    accum = fnc(accum, this[i]);
  }
  return accum;
};
const e = function ( x, y) {
  return x+y;
};
console.log([1,2,3].myInject(e));


function spaceship(val1, val2) {
  if ((val1 === null || val2 === null) || (typeof val1 != typeof val2)) {
    return null;
  }
  if (typeof val1 === 'string') {
    return (val1).localeCompare(val2);
  } else {
    if (val1 > val2) {
      return 1;
    } else if (val1 < val2) {
      return -1;
    }
    return 0;
  }
}
function bubblesort(array, callback) {
  let swapped = true;

  for (var k = 0; k < array.length; k++) {

    swapped = false;
    for (let i = 0; i < array.length; i++) {
      if(fnc(array[i],array[i + 1])===1){
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
